<?php

namespace App\Models\Article;

use Illuminate\Database\Eloquent\Model;
use App\Models\Tag\Tag;
use App\Models\Article\ArticleCategory;
class Article extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title','cover','article_category_id','body','sequence',
    ];

    public function tags()
    {
        return $this->morphToMany(Tag::class, 'taggable','taggables','taggable_id','tag_id','id','id');
    }
    public function article_category()
    {
        return $this->belongsTo(ArticleCategory::class,'article_category_id','id');
    }

}
