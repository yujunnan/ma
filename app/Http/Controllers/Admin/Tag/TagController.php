<?php

namespace App\Http\Controllers\Admin\Tag;

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


        return new DataCollection(Tag::orderBy('sequence','DESC')->where(request_intersect(['name']))->paginate());
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateTagFormRequest $request)
    {
        $result=$this->tagRepo->createTag($request->all());
        if($result){
            return $this->created();
        }


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tag\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $tag = $this->tagRepo->findTagById($id);

        return $tag;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Tag\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function edit(Tag $tag)
    {
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tag\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function update(CreateTagFormRequest $request,$id)
    {
        $tag = $this->tagRepo->findTagById($id);
        $this->tagRepo->updateTag($tag,$request->all());
        return $this->noContent();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tag\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $tag = $this->tagRepo->findTagById($id);
        $result=$tag =$this->tagRepo->deleteTag($tag);
        return $this->noContent();
    }
}
