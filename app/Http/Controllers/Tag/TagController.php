<?php

namespace App\Http\Controllers\Tag;

use App\Http\Controllers\Controller;
use App\Models\Tag\Tag;
use App\Resources\DataCollection;

use App\Models\Tag\Repositories\Contracts\TagInterface;
use App\Models\Tag\Requests\CreateTagFormRequest;
use Illuminate\Http\Request;

class TagController extends Controller
{


    private $tag;   //定义一个私有的变量
    public function __construct(TagInterface $tag){
        $this->tagRepo = $tag;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return Tag::orderBy('sequence','DESC')->where(request_intersect(['name']))->get();
    }





}
