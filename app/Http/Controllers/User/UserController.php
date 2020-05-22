<?php

namespace App\Http\Controllers\User;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request; 
class UserController extends Controller
{
    public function  index(){


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        User::create($request->all());

        return response()->json([
            'error_code' => 0,
            'message'=>"注册成功"

        ]);
    }

}
