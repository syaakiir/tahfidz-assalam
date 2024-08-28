<?php

namespace App\Http\Controllers;

use DB;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Model\User\User;
use App\Model\Siswa\Siswa;
use App\Model\Surah\Surah;
use App\Model\AssessmentLog\AssessmentLog;
use App\Http\Resources\Assessment\AssessmentResource;
use App\Http\Requests\Monitoring\MonitoringRequest;
use App\Http\Requests\Assessment\UpdateAssessmentRequest;

class MonitoringController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the monitoring index.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            if ($this->getUserLogin()->account_type == User::ACCOUNT_TYPE_PARENT) {
                $data = Siswa::join('tbl_siswa_has_parent', 'tbl_siswa.id', '=', 'tbl_siswa_has_parent.siswa_id')
                              ->where('tbl_siswa_has_parent.parent_id', $this->getUserLogin()->id)
                              ->join('tbl_class', 'tbl_siswa.class_id', '=', 'tbl_class.id')
                              ->get(['tbl_siswa.id', 'siswa_name', 'memorization_type', 'class_id']);
            } else {
                $data = Siswa::all();
            }

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row) {  
                    return '<button name="btnMonitoring" onclick="btnAss('.$row->id.')" type="button" class="btn btn-info">
                                <span class="glyphicon glyphicon-edit"></span>
                            </button>';
                })
                ->addColumn('memorization_type', function(Siswa $value) {
                    return Siswa::getHafalanMeaning($value->memorization_type);
                })
                ->addColumn('class_id', function(Siswa $class) {
                    return $class->getClass->class_name.' ('.$class->getClass->angkatan.')';
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        if ($this->getUserPermission('index monitoring')) {
            $this->systemLog(false, 'Mengakses Halaman Monitoring');
            return view('monitoring.index', ['active' => 'monitoring']);
        } else {
            $this->systemLog(true, 'Gagal Mengakses Halaman Monitoring');
            return view('error.unauthorized', ['active' => 'monitoring']);
        }
    }

    /**
     * Monitor specific student.
     *
     * @param int $id_siswa
     * @param Request $request
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function monitoring($id_siswa, Request $request)
    {
        $data_siswa = Siswa::findOrFail($id_siswa);

        if ($request->ajax()) {
            $data = AssessmentLog::where('siswa_id', $id_siswa)->orderBy('created_at', 'desc')->get();

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('monitoring', function(AssessmentLog $data) {
                    return $data->monitoring;
                })
                ->addColumn('date', function(AssessmentLog $date) {
                    return Carbon::parse($date->date)->format('d M Y h:i');
                })
                ->addColumn('action', function($row) {
                    return '<button onclick="btnUbah('.$row->id.')" name="btnUbah" type="button" class="btn btn-info">
                                <span class="glyphicon glyphicon-edit"></span>
                            </button>';
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        if ($this->getUserPermission('create monitoring')) {
            return view('monitoring.monitoring_quran', ['active' => 'monitoring', 'data_siswa' => $data_siswa]);
        } else {
            return view('error.unauthorized', ['active' => 'monitoring']);
        }
    }

    /**
     * Update assessment.
     *
     * @param UpdateAssessmentRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();
            
            try {
                // Find the assessment log by its ID
                $monitoring = AssessmentLog::findOrFail($request->get('idassessment'));
                
                // Update the feedback
                $monitoring->feedback = $request->get('feedback');
    
                if ($monitoring->save()) {
                    DB::commit();
                    return response()->json(['status' => true, 'message' => 'Feedback successfully updated']);
                } else {
                    DB::rollBack();
                    return response()->json(['status' => false, 'message' => 'Failed to update feedback']);
                }
            } catch (ModelNotFoundException $e) {
                DB::rollBack();
                return response()->json(['status' => false, 'message' => 'Record not found']);
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json(['status' => false, 'message' => 'An error occurred']);
            }
        }
    }
    

    /**
     * Get Surah list.
     *
     * @param Request $request
     * @return string
     */
    public function getSurah(Request $request)
    {
        if ($request->ajax()) {
            $data_surah = $request->has('search') ? Surah::getSurah($request->get('search')) : Surah::getSurah();
            $arr_data = [];

            if ($data_surah) {
                foreach ($data_surah as $key => $data) {
                    $arr_data[$key]['id'] = $data->id;
                    $arr_data[$key]['text'] = $data->surah_name;
                }
            }

            $this->systemLog(false, 'Menarik data Surah');
            return json_encode($arr_data);
        }
    }

    /**
     * Get specific assessment.
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Request $request)
    {
        if ($request->ajax()) {
            $assessment = AssessmentLog::findOrFail($request->get('idassessment'));
            return new AssessmentResource($assessment);
        }
    }
}