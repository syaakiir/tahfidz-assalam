<?php

namespace App\Http\Requests\Assessment;

use Illuminate\Foundation\Http\FormRequest;

use App\Model\Siswa\Siswa;

class UpdateAssessmentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        // Tentukan siswa dalam mode hafalan apa, untuk pemilihan rule yang sesuai
        $memorization_type = Siswa::findOrFail($this->request->get('id_siswa'))->memorization_type;

        if($memorization_type == Siswa::TYPE_MURAJAAH || $memorization_type == Siswa::TYPE_HAFALAN)
        {
            return [
                'id_siswa'      => 'integer',
                'surah_id'      => 'integer',
                'ayat'          => 'integer',
                'note'          => 'string | nullable',
                'begin'         => 'integer',
                'end'           => 'integer',
                'feedback'          => 'string | nullable',
            ];
        }
    }

    /**
     * Get the validation messages that apply to the request.
     *
     * @return array
     */
    public function messages()
    {
        return [
            
        ];
    }
}