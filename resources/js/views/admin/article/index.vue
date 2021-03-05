<template>
  <div>
    <el-form :inline="true" :model="queryParams"  size="mini">
      <el-form-item :label="'类别名称'">
        <el-input v-model="queryParams.title"></el-input>

      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="requestData"  icon="el-icon-search">{{ $t('search') }}</el-button>
        <el-button type="primary" v-if="addPermission"  @click="dialogAddFormVisible = true" icon="el-icon-plus">
            {{ $t('add') }}</el-button>
      </el-form-item>
    </el-form>

      <el-table
          :data="tableData"
          v-loading="loading"
          border
          style="width: 100%">
          <el-table-column
              prop="title"
              label="标题">
          </el-table-column>
          <el-table-column
              prop="sequence"
              label="排序">
          </el-table-column>

          <el-table-column
              prop="created_at"
              label="创建时间">
          </el-table-column>
          <el-table-column
              prop="updated_at"
              label="更新时间">
          </el-table-column>
          <el-table-column
              fixed="right"
              width="300px"
              :label="$t('actions')">
              <template slot-scope="scope">
                  <el-button
                      v-if="updatePermission"
                      size="mini"
                      @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                  <el-button
                      v-if="deletePermission"
                      type="danger"
                      size="mini"
                      @click="handleDelete(scope.$index, scope.row)">删除</el-button>
              </template>
          </el-table-column>
      </el-table>
      <el-pagination class="mo-page"
                     @current-change="requestData"
                     :current-page.sync="pagination.currentPage"
                     :page-size="pagination.pageSize"
                     layout="total, prev, pager, next, jumper"
                     :total="pagination.total">
      </el-pagination>
  <!--添加-->
    <el-dialog :title="$t('add')" :visible.sync="dialogAddFormVisible" width="70%">
      <el-form :model="addForm" :rules="rules" ref="addForm">
        <el-form-item :label="$t('title')" prop="title" :label-width="formLabelWidth">
          <el-input v-model="addForm.title"></el-input>
        </el-form-item>


        <el-form-item :label="$t('parentMenu')" prop="article_category_id" :label-width="formLabelWidth">
          <article-category-cascader :menu-id.sync="addForm.article_category_id" ></article-category-cascader>
        </el-form-item>


        <el-form-item :label="$t('sequence')" prop="sequence" :label-width="formLabelWidth">
          <el-input v-model.number="addForm.sequence"></el-input>
        </el-form-item>
        <el-form-item label="头像" prop="sequence" :label-width="formLabelWidth">
          <el-upload
            class="avatar-uploader"
            action="/api/upload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
            <img v-if="imageUrl" :src="imageUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>        
        </el-form-item>
          <el-form-item label="标签" prop="type" :label-width="formLabelWidth">
              <el-checkbox-group v-model="addForm.tags">
                  <el-col
                      class="permission-item"
                      :span="6"
                      v-for="tag in tags"
                      :key="tag.id">
                  <el-checkbox  :label="tag.id">{{tag.name}}</el-checkbox>
                  </el-col>

              </el-checkbox-group>
          </el-form-item>
        <el-form-item :label="$t('body')" prop="body" :label-width="formLabelWidth">
          <quill-editor ref="myTextEditor"
                    v-model="addForm.body" :options="quillOption">
          </quill-editor>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogAddFormVisible = false">{{ $t('cancel') }}</el-button>
        <el-button type="primary" @click="handleAddArticle">{{ $t('confirm') }}</el-button>
      </div>
    </el-dialog>
    <!--修改-->

    <el-dialog :title="$t('edit')" :visible.sync="dialogEditFormVisible" width="60%">
      <el-form :model="editForm" :rules="rules" ref="editForm">
        <el-form-item :label="$t('title')" prop="title" :label-width="formLabelWidth">
          <el-input v-model="editForm.title"></el-input>
        </el-form-item>


        <el-form-item :label="$t('parentMenu')" prop="article_category_id" :label-width="formLabelWidth">

          <article-category-cascader :menu-id.sync="editForm.article_category_id"></article-category-cascader>


        </el-form-item>

        <el-form-item :label="$t('sequence')" prop="sequence" :label-width="formLabelWidth">
          <el-input v-model.number="editForm.sequence"></el-input>
        </el-form-item>
          <el-form-item label="标签" prop="type" :label-width="formLabelWidth">
              <el-checkbox-group v-model="editForm.tags">
                  <el-col
                      class="permission-item"
                      :span="6"
                      v-for="tag in tags"
                      :key="tag.id">
                      <el-checkbox  :label="tag.id">{{tag.name}}</el-checkbox>
                  </el-col>

              </el-checkbox-group>
          </el-form-item>

        <el-form-item :label="$t('body')" prop="sequence" :label-width="formLabelWidth">

    <quill-editor ref="myTextEditor"
              v-model="editForm.body" :options="quillOption">
    </quill-editor>

        </el-form-item>


      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogEditFormVisible = false">{{ $t('cancel') }}</el-button>
        <el-button type="primary" @click="handleEditArticle">{{ $t('confirm') }}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { getArticleList, addArticle, editArticle, deleteArticle } from
  '../../../api/article/article'
  import { getTagAllList } from
          '../../../api/system/tag'
  import {responseDataFormat, tableDefaultData, editSuccess, addSuccess, deleteSuccess } from '../../../libs/tableDataHandle'
  import ArticleCategoryCascader from '../../../components/Cascader/ArticleCategory'
  import { hasPermission } from '../../../libs/permission'
  import { quillEditor } from 'vue-quill-editor'
  import quillConfig from '../../../mixins/quillConfig'

  export default {
    name: 'ArticleIndex',
    components: {
      ArticleCategoryCascader,
      quillEditor
    },
    data: () => ({
      imageUrl:"",
      quillOption: quillConfig,
      ...tableDefaultData(),
      tableListData: [],
      editorOption: {
        theme:'snow'
      },
      foldList: [],
      addForm: {
            tags:[]
      },
      tags:[],
      editForm: {},
      rules: {
        title: [
            { required: true },
            { min: 1, max: 255 }
        ],
        article_category_id: [
            { required: true },
            { type: 'number' }
        ],
        sequence: [
            { required: true },
            {type: 'number' }
        ],
        body: [
            { required: true },
            { type: 'string' }
        ],       
        cover: [
            { required: true },
            { type: 'string' }
        ],         
      },
    }),
    methods: {
      // 所有操作都会被解析重新渲染
      change(value, render){

          // render 为 markdown 解析后的结果[html]
          this.html = render;
      },
      handleDelete (index, row) {
        deleteArticle(row.id).then( response => {
          deleteSuccess(index, this)
          this.requestData()
        })
      },
      handleEdit (index, row) {
        this.editForm = row
        this.nowRowData = { index, row }
        this.dialogEditFormVisible = true
        let newArray = this.editForm.tags.map((item) => {

            return item.id;
        })
        this.editForm.tags=newArray;

      },
      handleEditArticle () {
        this.editForm.cover =this.imageUrl;
       
        this.$refs['editForm'].validate((valid) => {
          if (valid) {
            editArticle(this.nowRowData.row.id, this.editForm).then( response => {
              editSuccess(this)
              this.requestData()
            })
          } else {
            return false;
          }
        })
      },
      handleAddArticle () {
        this.addForm.cover =this.imageUrl;

        this.$refs['addForm'].validate((valid) => {
          if (valid) {
            //console.log(this.addForm); return;

            addArticle(this.addForm).then( response => {
                if(response.data.status_code==500){

                }else{
                    addSuccess(this)
                    this.requestData()

                }
            })
          } else {
            return false;
          }
        })
      },
      requestData () {
        var that=this;
        this.loading = true
        getArticleList({...this.queryParams, page: this.queryPage}).then( response => {
            responseDataFormat(response, this)
            this.loading = false
        })
        getTagAllList({}).then( response => {
            that.tags=response.data;
            this.loading = false
        })
      },
      handleAvatarSuccess(res, file) {
        
        this.imageUrl = res;
      },
      beforeAvatarUpload(file) {
       
        const isLt2M = file.size / 1024 / 1024 < 2;
        /*
         const isJPG = file.type === 'image/jpeg';
        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        */
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isLt2M;
      }



    },
    computed: {
      updatePermission: function() {

        return hasPermission('article.update')
      },
      addPermission: function() {
        return hasPermission('article.store')
      },
      deletePermission: function() {
        return hasPermission('article.destroy')
      },
      editor() {
      return this.$refs.myQuillEditor.quill;
      },      
    },
    created() {
      this.requestData()
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .app_title {
    display:block;
    width:100%;
    font-size:24px;
    line-height:60px;
    color:#41dae4;
    text-align:center;
  }
  .permission_toggleFold {
    vertical-align:middle;
    padding-right:5px;
    font-size:16px;
    cursor:pointer;
  }
  .permission_placeholder {
    content:' ';
    display:inline-block;
    width:16px;
    font-size:16px;
  }

  .init_table {
    th {
      background-color: #edf6ff;
      text-align: center !important;
      color: #066cd4;
      font-weight:bold;
      .cell {
        padding:0 !important;
      }
    }
    td, th {
      font-size:12px;
      padding:0 !important;
      height:40px !important;
    }
    .el-table--border, .el-table--group {
      border: 1px solid #dde2ef;
    }

    td, th.is-leaf {
      border-bottom: 1px solid #dde2ef
    }

    .el-table--border td, .el-table--border th, .el-table__body-wrapper .el-table--border.is-scrolling-left~.el-table__fixed {
      border-right: 1px solid #dde2ef
    }

    .el-table--striped .el-table__body tr.el-table__row--striped td {
      background-color:#f7f9fa;
    }
  }
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
