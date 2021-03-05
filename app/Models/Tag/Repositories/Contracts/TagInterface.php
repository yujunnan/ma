<?php
namespace App\Models\Tag\Repositories\Contracts;
use App\Models\Tag\Tag;
interface TagInterface{
    public function findBy(int $id);

    public function listTags();

    public function createTag(array $data);

    public function findTagById(int $id);

    public function deleteTag(Tag $tag);
    public function updateTag(Tag $tag,array $data);

}

?>
