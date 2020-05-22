<?php

namespace App\Http\Controllers\Admin\Article;

use App\Http\Controllers\Controller;
use App\Models\Article\ArticleCategory;
use Illuminate\Http\Request;

class ArticleCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $menus = ArticleCategory::query()
            ->where('name','like','%'.$request->input('name').'%')
            ->orderBy('sequence', 'desc')
            ->get();

        return response()->json(['data' => make_tree($menus->toArray())]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return "create";
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        ArticleCategory::create($request->all());

        return $this->created();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Article\ArticleCategory  $articleCategory
     * @return \Illuminate\Http\Response
     */
    public function show(ArticleCategory $articleCategory)
    {
        return "show";
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Article\ArticleCategory  $articleCategory
     * @return \Illuminate\Http\Response
     */
    public function edit(ArticleCategory $articleCategory)
    {
        return "edit";

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Article\ArticleCategory  $articleCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $article_category = ArticleCategory::query()->findOrFail($id);

        $article_category->update($request->toArray());

        return $this->noContent();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Article\ArticleCategory  $articleCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $articleCategory = ArticleCategory::query()->findOrFail($id);

        if (ArticleCategory::query()->where('parent_id', $articleCategory->id)->count()) {
            return $this->unprocesableEtity([
                'parent_id' => 'Please delete the submenu first.'
            ]);
        }

        $articleCategory->delete();

        return $this->noContent();

    }
}
