<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Model\ClassName\ClassName;
use DB;

class ClassNameController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = ClassName::all();

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $btn = '<button onclick="btnUbah('.$row->id.')" class="btn btn-info"><i class="glyphicon glyphicon-edit"></i></button>';
                    $delete = '<button onclick="btnDel('.$row->id.')" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></button>';
                    return $btn . '&nbsp;' . $delete;
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        if($this->getUserPermission('index class name')) {
            return view('class-name.index', [
                'active' => 'class_name'
            ]);
        } else {
            return view('error.unauthorized', ['active' => 'class_name']);
        }
    }

    public function create()
    {
        if($this->getUserPermission('create class name')) {
            return view('class-name.store', [
                'active' => 'class_name'
            ]);
        } else {
            return view('error.unauthorized', ['active' => 'class_name']);
        }
    }

    public function store(Request $request)
    {
        $request->validate([
            'class_name' => 'required|string|max:255|unique:class_names,class_name'
        ]);

        DB::beginTransaction();

        $className = new ClassName();
        $className->class_name = $request->class_name;

        if (!$className->save()) {
            DB::rollBack();
            return redirect('class-name')->with('alert_error', 'Gagal disimpan');
        }

        DB::commit();
        return redirect('class-name')->with('alert_success', 'Berhasil disimpan');
    }

    public function update(Request $request)
    {
        if ($request->ajax()) {
            $request->validate([
                'name' => 'required|string|max:255'
            ]);

            DB::beginTransaction();

            $className = ClassName::findOrFail($request->id);
            $className->class_name = $request->name;

            if (!$className->save()) {
                DB::rollBack();
                return response()->json(['status' => false, 'message' => 'Gagal diupdate']);
            }

            DB::commit();
            return response()->json(['status' => true, 'message' => 'Berhasil diupdate']);
        }
    }

    public function show(Request $request)
    {
        if ($request->ajax()) {
            $className = ClassName::findOrFail($request->id);
            return response()->json(['data' => $className]);
        }
    }

    public function delete(Request $request)
    {
        if ($request->ajax()) {
            DB::beginTransaction();

            $className = ClassName::findOrFail($request->id);

            if (!$className->delete()) {
                DB::rollBack();
                return response()->json(['status' => false, 'message' => 'Gagal dihapus']);
            }

            DB::commit();
            return response()->json(['status' => true, 'message' => 'Berhasil dihapus']);
        }
    }
}