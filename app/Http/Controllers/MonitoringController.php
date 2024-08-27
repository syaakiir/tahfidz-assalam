<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Yajra\Datatables\Datatables;

use App\Model\Siswa\Siswa;
use App\Model\StudentClass\StudentClass;
use App\Model\User\User;



use App\Model\Surah\Surah;
use App\Model\SiswaHasSurah\SiswaHasSurah;


use App\Model\AssessmentLog\AssessmentLog;

use App\Http\Resources\Siswa\SiswaResource;

use App\Http\Requests\Monitoring\MonitoringRequest;

use Carbon\Carbon;

use DB;

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
     * Show the application index.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

     public function index(Request $request)
{
    if ($request->ajax()) {
        if($this->getUserLogin()->account_type == User::ACCOUNT_TYPE_PARENT)
        {
            $data = Siswa::join('tbl_siswa_has_parent', 'tbl_siswa.id', '=', 'tbl_siswa_has_parent.siswa_id')
                          ->where('tbl_siswa_has_parent.parent_id', $this->getUserLogin()->id)
                          ->join('tbl_class', 'tbl_siswa.class_id', '=', 'tbl_class.id')
                          ->get(['tbl_siswa.id','siswa_name','memorization_type','class_id']);
        }
        else
        {
            $data = Siswa::all();
        }

        return Datatables::of($data)
            ->addIndexColumn()
            ->addColumn('action', function($row){  
                $btn = '<button name="btnMonitoring" onclick="btnAss('.$row->id.')" type="button" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span></button>';
                return $btn; 
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

    if($this->getUserPermission('index monitoring'))
    {
        $this->systemLog(false,'Mengakses Halaman Monitoring');
        return view('monitoring.index', ['active'=>'monitoring']);
    }
    else
    {
        $this->systemLog(true,'Gagal Mengakses Halaman Monitoring');
        return view('error.unauthorized', ['active'=>'monitoring']);
    }
}

    public function monitoring($id_siswa, Request $request)
    {
    	$data_siswa = Siswa::findOrFail($id_siswa);

        if ($request->ajax()) 
        {

            $data = AssessmentLog::where('siswa_id',$id_siswa)->orderBy('created_at', 'desc')->get();

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('monitoring', function(AssessmentLog $data) {
                    return $data->monitoring;
                })
                ->addColumn('date', function(AssessmentLog $date) {
                    $date =  Carbon::parse($date->date);
                    return $date->format('d M Y h:i');
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        if($this->getUserPermission('create monitoring'))
        {
            if($data_siswa->memorization_type == Siswa::TYPE_MURAJAAH || $data_siswa->memorization_type == Siswa::TYPE_HAFALAN)
{
                $this->systemLog(false,'Mengakses Halaman Monitoring');           
                return view('monitoring.monitoring_quran',[
                    'active'=>'monitoring',
                    'data_siswa'=>$data_siswa
                ]);
            }
        }
        else
        {
            $this->systemLog(true,'Gagal Mengakses Halaman Monitoring');
            return view('error.unauthorized', ['active'=>'monitoring']);
        } 
    }

    /**
     * @return void
     */


        

     public function doMonitoring(MonitoringRequest $request)
     {
         DB::beginTransaction();
 
         $status_monitoring = null;
 
         if(Siswa::findOrFail($request->get('id_siswa'))->memorization_type == Siswa::TYPE_MURAJAAH || 
         Siswa::findOrFail($request->get('id_siswa'))->memorization_type == Siswa::TYPE_HAFALAN)
      {
             $monitoring_log = new AssessmentLog();
             $monitoring_log->siswa_id = $request->get('id_siswa');
             $monitoring_log->range = $request->get('begin').'-'.$request->get('end');
             $monitoring_log->date = Carbon::now();
             $monitoring_log->monitoring = 'Surat '.Surah::findOrFail($request->get('surah_id'))->surah_name;
             $monitoring_log->note = $request->get('not');
 
 
             for ($ayat = $request->get('begin'); $ayat <= $request->get('end'); $ayat++) 
             {
                 $monitoring = new SiswaHasSurah();
                 $monitoring->siswa_id = $request->get('id_siswa');
                 $monitoring->surah_id = $request->get('surah_id');
                 $monitoring->ayat = $ayat;
                 $monitoring->date = Carbon::now();
                 $monitoring->note = $request->get('note');
                 $monitoring->group_ayat = $request->get('begin').'-'.$request->get('end');
 
                 $old_data = SiswaHasSurah::MonitoringValidation($monitoring->siswa_id,$monitoring->surah_id,$monitoring->ayat);
 

             }
         }
        
         if($this->getUserPermission('create monitoring'))
         {            
             $this->systemLog(false,'Melakukan Monitoring Kepada : '.$monitoring->siswa_id.'');
             DB::commit();
 
             if($status_monitoring == 'RENEW')
             {
                 return redirect()->route('create-monitoring', [ 'type'=> $request->get('id_siswa') ])->with('alert_success', 'Penilaian telah berhasil diperbaharui');
             }
             else
             {
                 return redirect()->route('create-monitoring', [ 'type'=> $request->get('id_siswa') ])->with('alert_success', 'Berhasil Disimpan');
             }  
         }
         else
         {
             DB::rollBack();
             return redirect()->route('create-monitoring', [ 'type'=> $request->get('id_siswa') ])->with('alert_error', 'Gagal Disimpan');
         }
     }
    /**
     * @return void
     */
    public function getAyat(Request $request)
    {
        if ($request->ajax()) {
            $data_surah = Surah::findOrFail($request->get('id_ayat'));
            $this->systemLog(false,'Menarik data Ayat');
            return json_encode($data_surah->total_ayat);
        }
    }

    /**
     * @return void
     */


    /**
     * @return void
     */
    public function getSurah(Request $request)
    {
        if ($request->ajax()) {
            
            if($request->has('search'))
            {
                $data_surah = Surah::getSurah($request->get('search'));
            }
            else
            {
                $data_surah = Surah::getSurah();
            }

            $arr_data  = array();

            if($data_surah)
            {
                $key = 0;

                foreach ($data_surah as $data) {
                    $arr_data[$key]['id'] = $data->id;
                    $arr_data[$key]['text'] = $data->surah_name;
                    $key++;
                }
            }

            $this->systemLog(false,'Menarik data Surah');
            return json_encode($arr_data);
        }
    }
}