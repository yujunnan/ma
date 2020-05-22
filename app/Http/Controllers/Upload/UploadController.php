<?php

namespace App\Http\Controllers\Upload;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
class UploadController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $file=$request->file('file');
        $folder = 'article_bodys';
        if ($file->isValid()) {
            // get extension of the file
            $extension = $file->getClientOriginalExtension();
            // get name of the file
            $fileName = $file->getClientOriginalName();
            $realPath = $file->getRealPath();   //临时文件的绝对路径
            // custom file name 
            $newFileName =  md5($fileName . time() . mt_rand(1, 10000)). '.' . $extension;
            // path of file preservation,dir:current for format Y-m-d
            $savePath = $folder.'/'.date('Ymd',time()).'/'.$newFileName;
             // 将文件保存到本地 storage/app/public/images 目录下，先判断同名文件是否已经存在，如果存在直接返回
            if (Storage::disk('public')->has($savePath)) {
                return response()->json(['path' => $webPath]);
            }   
            Storage::disk('public')->put($savePath,file_get_contents($realPath));    
            return Storage::url($savePath);
        }
    }
}
