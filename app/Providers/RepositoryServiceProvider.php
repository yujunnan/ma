<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
//接口与实现类的两种绑定模式
        //单例模式（个人推荐）
        $this->app->singleton('App\Models\Tag\Repositories\Contracts\TagInterface',function ($app){
            return new \App\Models\Tag\Repositories\Eloquent\TagServiceRepository();
        });
    }
}
