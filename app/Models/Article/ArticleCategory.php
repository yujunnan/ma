<?php

namespace App\Models\Article;

use Illuminate\Database\Eloquent\Model;

class ArticleCategory extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'article_category_id', 'sequence',
    ];
}
