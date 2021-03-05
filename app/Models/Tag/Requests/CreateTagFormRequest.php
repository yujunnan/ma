<?php

namespace App\Models\Tag\Requests;

use App\Models\Base\BaseFormRequest;

class CreateTagFormRequest extends BaseFormRequest
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
        return [
            'name' => ['required', 'unique:tags'],
            'sequence' => ['required']
        ];
    }



    public function messages()
    {
        return [
            'name.required' => '标签字段不能为空',
            'name.unique' => '标签已存在',
            'sequence.required' => '请输入排序'
        ];
    }
}
