<?php

namespace App\Models\Base;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
class BaseFormRequest extends FormRequest
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

    protected function failedValidation(Validator $validator)
    {
      throw (new HttpResponseException(response()->json([
        'status_code' => 500,
        'message' => $validator->errors()->first(),
        'data' => $validator->errors(),
      ], 200)));
    }
    
}
