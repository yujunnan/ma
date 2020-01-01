(window.webpackJsonp=window.webpackJsonp||[]).push([[7],{12:function(e,t,a){"use strict";a.d(t,"d",(function(){return r})),a.d(t,"e",(function(){return i})),a.d(t,"g",(function(){return o})),a.d(t,"f",(function(){return l})),a.d(t,"a",(function(){return u})),a.d(t,"c",(function(){return s})),a.d(t,"b",(function(){return d}));var n=a(1),r=function(e){return n.a.get("/api/role",{params:e})},i=function(e){return n.a.get("/api/guard-name-roles/".concat(e))},o=function(e){return n.a.get("/api/role/".concat(e,"/permissions"))},l=function(e,t){return n.a.put("/api/role/".concat(e,"/permissions"),{permissions:t})},u=function(e){return n.a.post("/api/role",e)},s=function(e,t){return n.a.patch("".concat("/api/role","/").concat(e),t)},d=function(e){return n.a.delete("".concat("/api/role","/").concat(e))}},18:function(e,t,a){"use strict";a.d(t,"a",(function(){return n}));var n={data:function(){return{queryParamsChange:!1}},methods:{},watch:{queryParams:{handler:function(){this.queryParamsChange=!0},deep:!0}},computed:{queryPage:function(){return this.queryParamsChange?1:this.pagination.currentPage}}}},228:function(e,t,a){"use strict";a.r(t);var n=a(12),r=a(3),i=a(4),o=a(33);function l(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function u(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?l(Object(a),!0).forEach((function(t){s(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function s(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}var d={name:"roleIndex",mixins:[a(18).a],components:{GuardSelect:o.a},data:function(){return u({},Object(r.e)(),{addForm:{name:"",guard_name:"",description:""},editForm:{name:"",guard_name:"",description:""},rules:{name:[{required:!0},{min:1,max:255}],guard_name:[{required:!0},{min:1,max:255}]}})},methods:{handleEdit:function(e,t){this.editForm={name:t.name,guard_name:t.guard_name,description:t.description},this.nowRowData={index:e,row:t},this.dialogEditFormVisible=!0},handleDelete:function(e,t){var a=this;Object(n.b)(t.id).then((function(t){Object(r.b)(e,a),a.requestData()}))},requestData:function(){var e=this;this.loading=!0,Object(n.d)(u({},this.queryParams,{page:this.queryPage})).then((function(t){Object(r.d)(t,e)}))},handleAddRole:function(){var e=this;this.$refs.addForm.validate((function(t){if(!t)return!1;Object(n.a)(e.addForm).then((function(t){Object(r.a)(e),e.requestData()}))}))},handleEditRole:function(){var e=this;this.$refs.editForm.validate((function(t){if(!t)return!1;Object(n.c)(e.nowRowData.row.id,e.editForm).then((function(t){Object(r.c)(e)}))}))}},computed:{updatePermission:function(){return Object(i.a)("role.update")},addPermission:function(){return Object(i.a)("role.store")},deletePermission:function(){return Object(i.a)("role.destroy")},assignPermission:function(){return Object(i.a)("role.assign-permissions")}},created:function(){this.requestData()}},c=a(0),m=Object(c.a)(d,(function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("el-form",{attrs:{inline:!0,model:e.queryParams,size:"mini"}},[a("el-form-item",{attrs:{label:e.$t("name")}},[a("el-input",{model:{value:e.queryParams.name,callback:function(t){e.$set(e.queryParams,"name",t)},expression:"queryParams.name"}})],1),e._v(" "),a("el-form-item",[a("el-button",{attrs:{type:"primary",icon:"el-icon-search"},on:{click:e.requestData}},[e._v(e._s(e.$t("search")))]),e._v(" "),e.addPermission?a("el-button",{attrs:{type:"primary",icon:"el-icon-plus"},on:{click:function(t){e.dialogAddFormVisible=!0}}},[e._v(e._s(e.$t("add")))]):e._e()],1)],1),e._v(" "),a("el-table",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticStyle:{width:"100%"},attrs:{data:e.tableData,border:""}},[a("el-table-column",{attrs:{prop:"name",label:e.$t("name")}}),e._v(" "),a("el-table-column",{attrs:{prop:"guard_name",label:e.$t("guardName")}}),e._v(" "),a("el-table-column",{attrs:{prop:"description",label:e.$t("description")}}),e._v(" "),a("el-table-column",{attrs:{prop:"created_at",label:e.$t("createdAt")}}),e._v(" "),a("el-table-column",{attrs:{prop:"updated_at",label:e.$t("updatedAt")}}),e._v(" "),a("el-table-column",{attrs:{fixed:"right",width:"300px",label:e.$t("actions")},scopedSlots:e._u([{key:"default",fn:function(t){return[e.updatePermission?a("el-button",{attrs:{size:"mini"},on:{click:function(a){return e.handleEdit(t.$index,t.row)}}},[e._v(e._s(e.$t("edit")))]):e._e(),e._v(" "),a("router-link",{attrs:{to:{name:"rolePermission",params:{id:t.row.id,guardName:t.row.guard_name}}}},[e.assignPermission?a("el-button",{attrs:{size:"mini"}},[e._v(e._s(e.$t("assignPermission")))]):e._e()],1),e._v(" "),e.deletePermission?a("el-button",{attrs:{size:"mini",type:"danger"},on:{click:function(a){return e.handleDelete(t.$index,t.row)}}},[e._v(e._s(e.$t("delete")))]):e._e()]}}])})],1),e._v(" "),a("el-pagination",{staticClass:"mo-page",attrs:{"current-page":e.pagination.currentPage,"page-size":e.pagination.pageSize,layout:"total, prev, pager, next, jumper",total:e.pagination.total},on:{"current-change":e.requestData,"update:currentPage":function(t){return e.$set(e.pagination,"currentPage",t)},"update:current-page":function(t){return e.$set(e.pagination,"currentPage",t)}}}),e._v(" "),a("el-dialog",{attrs:{title:e.$t("add"),visible:e.dialogAddFormVisible,width:"30%"},on:{"update:visible":function(t){e.dialogAddFormVisible=t}}},[a("el-form",{ref:"addForm",attrs:{model:e.addForm,rules:e.rules}},[a("el-form-item",{attrs:{label:e.$t("name"),prop:"name","label-width":e.formLabelWidth}},[a("el-input",{model:{value:e.addForm.name,callback:function(t){e.$set(e.addForm,"name",t)},expression:"addForm.name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:e.$t("guardName"),prop:"guard_name","label-width":e.formLabelWidth}},[a("guard-select",{attrs:{nowValue:e.addForm.guard_name},on:{"update:nowValue":function(t){return e.$set(e.addForm,"guard_name",t)},"update:now-value":function(t){return e.$set(e.addForm,"guard_name",t)}}})],1),e._v(" "),a("el-form-item",{attrs:{label:e.$t("description"),prop:"description","label-width":e.formLabelWidth}},[a("el-input",{model:{value:e.addForm.description,callback:function(t){e.$set(e.addForm,"description",t)},expression:"addForm.description"}})],1)],1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.dialogAddFormVisible=!1}}},[e._v(e._s(e.$t("cancel")))]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:e.handleAddRole}},[e._v(e._s(e.$t("confirm")))])],1)],1),e._v(" "),a("el-dialog",{attrs:{title:e.$t("edit"),visible:e.dialogEditFormVisible,width:"30%"},on:{"update:visible":function(t){e.dialogEditFormVisible=t}}},[a("el-form",{ref:"editForm",attrs:{model:e.editForm,rules:e.rules}},[a("el-form-item",{attrs:{label:e.$t("name"),prop:"name","label-width":e.formLabelWidth}},[a("el-input",{model:{value:e.editForm.name,callback:function(t){e.$set(e.editForm,"name",t)},expression:"editForm.name"}})],1),e._v(" "),a("el-form-item",{attrs:{label:e.$t("guardName"),prop:"guard_name","label-width":e.formLabelWidth}},[a("guard-select",{attrs:{nowValue:e.editForm.guard_name},on:{"update:nowValue":function(t){return e.$set(e.editForm,"guard_name",t)},"update:now-value":function(t){return e.$set(e.editForm,"guard_name",t)}}})],1),e._v(" "),a("el-form-item",{attrs:{label:e.$t("description"),prop:"description","label-width":e.formLabelWidth}},[a("el-input",{model:{value:e.editForm.description,callback:function(t){e.$set(e.editForm,"description",t)},expression:"editForm.description"}})],1)],1),e._v(" "),a("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.dialogEditFormVisible=!1}}},[e._v(e._s(e.$t("cancel")))]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:e.handleEditRole}},[e._v(e._s(e.$t("confirm")))])],1)],1)],1)}),[],!1,null,null,null);t.default=m.exports},3:function(e,t,a){"use strict";a.d(t,"d",(function(){return r})),a.d(t,"c",(function(){return i})),a.d(t,"a",(function(){return o})),a.d(t,"b",(function(){return l})),a.d(t,"e",(function(){return u}));var n=a(11);function r(e,t){t.tableData=e.data.data;var a=e.data.meta;t.pagination={currentPage:a.current_page,pageSize:a.per_page,total:a.total,from:a.from,lastPage:a.last_page,to:a.to},t.loading=!1,t.queryParamsChange=!1}var i=function(e){n.a.editSuccess(e),e.dialogEditFormVisible=!1,Object.assign(e.nowRowData.row,e.editForm),e.tableData[e.nowRowData.index]=e.nowRowData.row,e.$refs.editForm.resetFields()},o=function(e){e.dialogAddFormVisible=!1,n.a.createSuccess(e),e.$refs.addForm.resetFields()},l=function(e,t){t.tableData.splice(e,1),n.a.deleteSuccess(t)},u=function(){return{queryParams:{},tableData:[],pagination:{currentPage:1,pageSize:15,total:0,from:1,lastPage:1,to:1},nowRowData:{index:0,row:{}},dialogAddFormVisible:!1,dialogEditFormVisible:!1,formLabelWidth:"120px",loading:!1}}},33:function(e,t,a){"use strict";var n=a(5),r={name:"GuardSelect",props:["nowValue"],data:function(){return{optionValue:this.nowValue,items:n.a.guardNames}},created:function(){},watch:{optionValue:function(e,t){this.$emit("update:nowValue",e)},nowValue:function(e){this.optionValue=e}}},i=a(0),o=Object(i.a)(r,(function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-select",{attrs:{clearable:"",placeholder:e.$t("guardName")},model:{value:e.optionValue,callback:function(t){e.optionValue=t},expression:"optionValue"}},e._l(e.items,(function(e){return a("el-option",{key:e.label,attrs:{label:e.label,value:e.value}})})),1)}),[],!1,null,null,null);t.a=o.exports},4:function(e,t,a){"use strict";a.d(t,"a",(function(){return r}));var n=a(22),r=function(e){return n.a.getters.permissions.indexOf(e)>=0}}}]);