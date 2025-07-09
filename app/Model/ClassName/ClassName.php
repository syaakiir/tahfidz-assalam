<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\StudentClass\StudentClass;

class ClassName extends Model
{
    protected $table = 'class_names';

    protected $fillable = [
        'name'
    ];

    protected $hidden = [];

    public static $rules = [
        'name' => 'required|string|max:100|unique:class_names,name'
    ];

    /**
     * Relasi: Satu nama kelas bisa digunakan di banyak kelas (tbl_class)
     */
    public function getClassList()
    {
        return $this->hasMany(StudentClass::class, 'class_name_id');
    }

    /**
     * Validasi apakah nama kelas sudah ada
     */
    public static function validateName($name, $id = null)
    {
        $query = self::where('name', $name);
        
        if ($id !== null) {
            $query->where('id', '!=', $id);
        }

        return $query->exists();
    }
}