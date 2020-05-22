<template>
  <div>
    <el-form :inline="true" :model="queryParams"  size="mini">
      <el-form-item :label="'类别名称'">
        <el-input v-model="queryParams.title"></el-input>

      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="requestData"  icon="el-icon-search">{{ $t('search') }}</el-button>
        <el-button type="primary" v-if="addPermission"  @click="dialogAddFormVisible = true" icon="el-icon-plus">{{ $t('add') }}</el-button>
      </el-form-item>
    </el-form>

    <el-table
            :data="tableListData"
            v-loading="loading"
            :row-style="toggleDisplayTr"
            border stripe
            class="init_table">
      <el-table-column
              :label="$t('title')"
              min-width="200"
              show-overflow-tooltip
              align="left">
        <template slot-scope="scope">
          <p :style="`margin-left: ${scope.row.__level * 20}px;margin-top:0;margin-bottom:0`"><i  @click="toggleFoldingStatus(scope.row)" class="permission_toggleFold" :class="toggleFoldingClass(scope.row)"></i>{{scope.row.title}}</p>
        </template>
      </el-table-column>

      <el-table-column
              prop="sequence"
              :label="$t('sequence')">
      </el-table-column>


      <el-table-column
              align="center"
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
        <el-form-item :label="$t('body')" prop="sequence" :label-width="formLabelWidth">
          <mavon-editor 
              v-model="addForm.body" 
              ref="md" 
              @change="change"
              @imgAdd="$imgAdd" 
              style="min-height: 500px"
          />


        </el-form-item>


      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogAddFormVisible = false">{{ $t('cancel') }}</el-button>
        <el-button type="primary" @click="handleAddArticle">{{ $t('confirm') }}</el-button>
      </div>
    </el-dialog>

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
        <el-form-item :label="$t('body')" prop="sequence" :label-width="formLabelWidth">
          <mavon-editor 
              v-model="editForm.body" 
              ref="md" 
              @change="change"
              @imgAdd="$imgAdd" 
              style="min-height: 500px"
          />


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
  import Vue from 'vue'
  import { upload } from '../../../api/upload'
  import { getArticleList, addArticle, editArticle, deleteArticle } from 
  '../../../api/article/article'
  import { tableDefaultData, editSuccess, addSuccess, deleteSuccess } from '../../../libs/tableDataHandle'
  import ArticleCategoryCascader from '../../../components/Cascader/ArticleCategory'
  import { hasPermission } from '../../../libs/permission'

  export default {
    name: 'ArticleIndex',
    components: {
      ArticleCategoryCascader
    },
    data: () => ({
      ...tableDefaultData(),
      tableListData: [],
      foldList: [],
      addForm: {},
      editForm: {},
      rules: {
        name: [
          { required: true },
          { min: 1, max: 255 }
        ],
        parent_id: [
          { type: 'number' }
        ],
        sequence: [
          {type: 'number' }
        ]
      },
    }),
    methods: {
      // 所有操作都会被解析重新渲染
      change(value, render){
         
          // render 为 markdown 解析后的结果[html]
          this.html = render;
      },
      // 将图片上传到服务器，返回地址替换到md中
      $imgAdd(pos, $file){
          let formdata = new FormData();
          formdata.append('file', $file); 
            upload(formdata).then( response => {
              this.$refs.md.$img2Url(pos,response.data);
            }).catch(err => {
                console.log(err)
            })
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
      },
      handleEditArticle () {
        this.$refs['editForm'].validate((valid) => {
          if (valid) {
            console.log(this.editForm);
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
        this.$refs['addForm'].validate((valid) => {
          if (valid) {
            addArticle(this.addForm).then( response => {
              addSuccess(this)
              this.requestData()
            })
          } else {
            return false;
          }
        })
      },
      //Author: zyx <https://github.com/no-simple/vue-tree-table>
      toggleFoldingStatus (params) {
        this.foldList.includes(params.__identity) ? this.foldList.splice(this.foldList.indexOf(params.__identity), 1) : this.foldList.push(params.__identity)
      },

      //Author: zyx <https://github.com/no-simple/vue-tree-table>
      toggleDisplayTr ({row, index}) {
        for (let i = 0; i < this.foldList.length; i++) {
          let item = this.foldList[i]
          if (row.__family.includes(item) && row.__identity !== item) return 'display:none;'
        }
        return ''
      },

      //Author: zyx <https://github.com/no-simple/vue-tree-table>
      toggleFoldingClass (params) {
        return params.children.length === 0 ? 'permission_placeholder' : (this.foldList.indexOf(params.__identity) === -1 ? 'iconfont el-icon-minus' : 'iconfont el-icon-plus')
      },

      //Author: zyx <https://github.com/no-simple/vue-tree-table>
      formatConversion (parent, children, index = 0, family = [], elderIdentity = 'x') {
        if (children.length > 0) {
          children.map((x, i) => {
            Vue.set(x, '__level', index)
            Vue.set(x, '__family', [...family, elderIdentity + '_' + i])
            Vue.set(x, '__identity', elderIdentity + '_' + i)
            parent.push(x)
            if (!x.hasOwnProperty('children')) {
              x.children = []
            }
            if (x.children.length > 0) this.formatConversion(parent, x.children, index + 1, [...family, elderIdentity + '_' + i], elderIdentity + '_' + i)
          })
        } return parent
      },
      requestData () {
        this.loading = true
        getArticleList(this.queryParams).then( response => {
          this.tableListData = this.formatConversion([], response.data.data)
          this.loading = false
        })
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
      }
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

</style>
