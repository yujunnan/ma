<?php
    namespace App\Models\Tag\Repositories\Eloquent;
    use App\Models\Tag\Repositories\Contracts\TagInterface;
    use App\Models\Tag\Tag;
    //服务模式
    class TagServiceRepository implements TagInterface{

        public function findBy(int $id)
        {
            try {
                return Tag::find($id);
            } catch (QueryException $e) {
                throw new Exception($e);
            }
        }

        public function listTags(){

            try {
                return Tag::orderBy('sequence','DESC')->get();
            } catch (QueryException $e) {
                throw new Exception($e);
            }

        }

        public function createTag(array $data){
            try {
                return Tag::create($data);
            } catch (QueryException $e) {
                throw new Exception($e);
            }
        }

        public function findTagById(int $id){
            try {
                return Tag::findOrFail($id);
            } catch (ModelNotFoundException $e) {
                throw new Exception($e);
            }
        }
        public function deleteTag(Tag $tag){
            try {
                $result=$tag->delete();

            } catch (ModelNotFoundException $e) {
                throw new Exception($e);
            }
        }
        public function updateTag(Tag $tag,array $data){
            try {
                $tag->update($data);

            } catch (ModelNotFoundException $e) {
                throw new Exception($e);
            }
        }
    }
