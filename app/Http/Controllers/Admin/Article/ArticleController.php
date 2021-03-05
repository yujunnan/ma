<?php

namespace App\Http\Controllers\Admin\Article;

use App\Http\Controllers\Controller;
use App\Models\Article\Article;
use App\Resources\DataCollection;
use Illuminate\Http\Request;
use App\Models\Article\Requests\CreateArticleFormRequest;
use Illuminate\Support\Facades\DB;


class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $menus = Article::query()->select(['id','title','sequence','article_category_id','body','updated_at','created_at','cover'])
        ->where('title','like','%'.$request->input('title').'%')
            ->orderBy('sequence', 'desc')
            ->with(['tags'=>function($query){
                $query->get(['tags.id']);
            },'article_category'=>function($query){
                $query->select(['id','name','sequence']);
            }])->paginate();

        return new DataCollection($menus);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateArticleFormRequest $request)
    {
       //return $request->all();
        DB::transaction(function ()use($request) {
            $article =Article::create($request->all());
            $article->tags()->attach($request->input(['tags']));
        });

        return $this->created();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Article\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function show(Article $article)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Article\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function edit(Article $article)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Article\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $article = Article::query()->findOrFail($id);
        $article->tags()->sync($request->input(['tags']));

        $article->update($request->toArray());
        return $this->noContent();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Article\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $article = Article::query()->findOrFail($id);


        $article->tags()->detach();

        $article->delete();

        return $this->noContent();
    }
}
