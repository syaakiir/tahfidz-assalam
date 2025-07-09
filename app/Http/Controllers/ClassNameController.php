<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ClassName;
use Illuminate\Support\Facades\Validator;

class ClassNameController extends Controller
{
    public function index()
    {
        $classNames = ClassName::orderBy('name')->get();
        return view('class-name.index', compact('classNames'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), ClassName::$rules);

        if ($validator->fails()) {
            return redirect()->back()->with('alert_error', $validator->errors()->first());
        }

        ClassName::create(['name' => $request->name]);

        return redirect()->back()->with('alert_success', 'Nama kelas berhasil ditambahkan.');
    }

    public function update(Request $request, $id)
    {
        $className = ClassName::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:100|unique:class_names,name,' . $id
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('alert_error', $validator->errors()->first());
        }

        $className->update(['name' => $request->name]);

        return redirect()->back()->with('alert_success', 'Nama kelas berhasil diperbarui.');
    }

    public function destroy($id)
    {
        $className = ClassName::findOrFail($id);
        $className->delete();

        return redirect()->back()->with('alert_success', 'Nama kelas berhasil dihapus.');
    }
}