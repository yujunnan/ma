<?php

namespace App\Models\Article\Requests;

use App\Models\Base\BaseFormRequest;

class CreateArticleFormRequest extends BaseFormRequest
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
            'title' => ['required', 'unique:articles'],
            'cover' => ['required'],
            'article_category_id' => ['required'],
            'sequence' => ['required'],
            'body' => ['required'],
            'tags' => ['required'],

        ];
    }



    public function messages()
    {
        return [
            'title.unique' => '标题已重复',
            'title.required' => '请输入标题名称',
            'article_category_id.required' => '请输入类目',
            'sequence.required' => '请输入排序',
            'sequence.body' => '请输入内容',
            'tags.required' => '请选择标签',
            'cover.required' => '请选择缩略图',

        ];
    }
}
