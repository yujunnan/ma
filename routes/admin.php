<?php

//后台管理路由
Route::middleware(['api', config('mojito.super_admin.auth'), 'mojito.permission'])
    ->group(function ($router) {
        Route::resource('/article/article-category',  'Admin\Article\ArticleCategoryController', ['only' =>
        ['index', 'show', 'store', 'update', 'destroy']
        ]);
        Route::resource('/article/article',  'Admin\Article\ArticleController', ['only' =>
        ['index', 'show', 'store', 'update', 'destroy']
        ]);

});

?>