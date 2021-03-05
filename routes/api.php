<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});




    Route::resource('/home/tags',  'Tag\TagController', ['only' =>
    ['index', 'show', 'store', 'update', 'destroy']
    ]);


    Route::post('/upload','Upload\UploadController@store');
    Route::resource('/goods',  'Goods\GoodController', 
    ['only' => ['index', 'show', 'store', 'update', 'destroy']
    ]);


    Route::get('web/article/list','Article\ArticleController@index');


//认证路由
Auth::routes();

