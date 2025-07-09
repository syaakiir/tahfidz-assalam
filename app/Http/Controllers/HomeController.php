<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Model\Siswa\Siswa;
use App\Model\User\User;
use App\Model\StudentClass\StudentClass;
use App\Model\AssessmentLog\AssessmentLog;
use App\Model\User\UserLoginHistory;
use App\Model\SiswaHasSurah\SiswaHasSurah;

use Carbon\Carbon;
use DB;

class HomeController extends Controller
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
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if($this->getUserPermission('index home'))
        {
            if($this->getUserLogin()->account_type == User::ACCOUNT_TYPE_TEACHER)
            {
                $siswa = Siswa::where('teacher_id',$this->getUserLogin()->id)
                            ->join('tbl_class', 'tbl_siswa.class_id', '=', 'tbl_class.id')
                            ->count();
                $class = StudentClass::where('teacher_id',$this->getUserLogin()->id)->count();
            }
            else
            {
                $siswa = Siswa::count();
                $class = StudentClass::count();
            }           

            $hafalan    = AssessmentLog::whereDate('date', date("Y-m-d"))->count();
            $last_login = UserLoginHistory::findLastlogin();

            if($last_login != null)
            {
                $last_login = Carbon::parse($last_login->date);
                $last_login = $last_login->format('d M Y');
            }

            // Get all santri with total and latest hafalan
            $santri_hafalan = Siswa::select(
                'tbl_siswa.id',
                'tbl_siswa.siswa_name',
                DB::raw('COUNT(tbl_siswa_has_surah.id) as total_hafalan'),
                DB::raw('MAX(tbl_siswa_has_surah.date) as terakhir_hafalan')
            )
            ->leftJoin('tbl_siswa_has_surah', 'tbl_siswa.id', '=', 'tbl_siswa_has_surah.siswa_id')
            ->groupBy('tbl_siswa.id', 'tbl_siswa.siswa_name')
            ->orderByDesc('total_hafalan')
            ->get();

            $this->systemLog(false,'Mengakses Halaman Home');

            return view('home.index', [
                'last_login' => $last_login,
                'active'=>'home',
                'siswa'=>$siswa,
                'class'=>$class,
                'hafalan'=>$hafalan,
                'santri_hafalan' => $santri_hafalan
            ]);
        }
        else
        {
            $this->systemLog(true,'Gagal Mengakses Halaman Home');
            return view('error.unauthorized', ['active'=>'home']);
        }
    }
}