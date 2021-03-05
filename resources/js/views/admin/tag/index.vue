<template>
  <div>
    <el-form :inline="true" :model="queryParams"  size="mini">
      <el-form-item :label="'标签名称'">
        <el-input v-model="queryParams.name"></el-input>

      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="requestData"  icon="el-icon-search">搜索</el-button>
        <el-button type="primary" v-if="addPermission"  @click="dialogAddFormVisible = true" icon="el-icon-plus">添加</el-button>
      </el-form-item>
    </el-form>
      <el-table
          :data="tableData"
          v-loading="loading"
          border
          style="width: 100%">
          <el-table-column
              prop="name"
              label="名称">
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
              :label="$t('actions')"
          >
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
    <el-dialog title="添加" :visible.sync="dialogAddFormVisible" width="70%">
      <el-form :model="addForm" :rules="rules" ref="addForm">
        <el-form-item label="标签名" prop="name" :label-width="formLabelWidth">
          <el-input v-model="addForm.name"></el-input>
        </el-form-item>





        <el-form-item label="排序" prop="sequence" :label-width="formLabelWidth">
          <el-input v-model.number="addForm.sequence"></el-input>
        </el-form-item>



      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogAddFormVisible = false">取消</el-button>
        <el-button type="primary" @click="handleAddTag">确认</el-button>
      </div>
    </el-dialog>

    <el-dialog title="修改" :visible.sync="dialogEditFormVisible" width="60%">
      <el-form :model="editForm" :rules="rules" ref="editForm">
        <el-form-item label="标题" prop="name" :label-width="formLabelWidth">
          <el-input v-model="editForm.name"></el-input>
        </el-form-item>




        <el-form-item label="排序" prop="sequence" :label-width="formLabelWidth">
          <el-input v-model.number="editForm.sequence"></el-input>
        </el-form-item>



      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogEditFormVisible = false">{{ $t('cancel') }}</el-button>
        <el-button type="primary" @click="handleEditTag">{{ $t('confirm') }}</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import Vue from 'vue'
  import { upload } from '../../../api/upload'
  import { getTagList, addTag, editTag, deleteTag } from
  '../../../api/system/tag'
  import {responseDataFormat, tableDefaultData, editSuccess, addSuccess, deleteSuccess } from '../../../libs/tableDataHandle'
  import { hasPermission } from '../../../libs/permission'
  import { queryParams } from "../../../mixins/queryParams"

  export default {
    name: 'TagIndex',
    components: {
    },
      mixins:[queryParams],
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
        deleteTag(row.id).then( response => {
          deleteSuccess(index, this)
          this.requestData()
        })
      },
      handleEdit (index, row) {
        this.editForm = row
        this.nowRowData = { index, row }
        this.dialogEditFormVisible = true
      },
      handleEditTag () {
        this.$refs['editForm'].validate((valid) => {
          if (valid) {
            editTag(this.nowRowData.row.id, this.editForm).then( response => {
              editSuccess(this)
              this.requestData()
            })
          } else {
            return false;
          }
        })
      },
      handleAddTag () {
        this.$refs['addForm'].validate((valid) => {
          if (valid) {
            addTag(this.addForm).then( response => {
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
        getTagList({...this.queryParams, page: this.queryPage}).then( response => {
          //this.tableListData = this.formatConversion([], response.data.data)

            responseDataFormat(response, this)
          this.loading = false
        })
      }
    },
    computed: {
      updatePermission: function() {

        return hasPermission('tag.update')
      },
      addPermission: function() {
        return hasPermission('tag.store')
      },
      deletePermission: function() {
        return hasPermission('tag.destroy')
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
