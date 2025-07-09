<?php

namespace App\Model\ClassName;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ClassName extends Model
{
    protected $table = 'class_names'; // Nama tabel di DB
    protected $guard_name = 'web';

    protected $fillable = [
        'name',
    ];

    public static $rules = [
        'name' => 'required|string|max:255',
    ];

    protected $hidden = [];

    /**
     * Validasi nama tidak boleh duplikat
     */
    public static function validateName($name, $id = null)
    {
        $query = self::where('name', $name);

        if ($id !== null) {
            $query->where('id', '!=', $id);
        }

        return $query->exists();
    }

    /**
     * Get all class names (optional: search keyword)
     */
    public static function getAll($search = null)
    {
        if ($search) {
            return self::where('name', 'like', '%' . $search . '%')->get();
        }
        return self::all();
    }

    /**
     * Relationship ke student-class jika dibutuhkan
     * Misal:
     */
    // public function studentClasses()
    // {
    //     return $this->hasMany('App\Model\StudentClass\StudentClass', 'class_name_id');
    // }
}