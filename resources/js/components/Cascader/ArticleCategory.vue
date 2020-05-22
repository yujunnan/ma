<template>
  <el-cascader
          v-model="optionValue"
          placeholder="Please choose"
          change-on-select
          clearable
          :options="options"
          :props = "defaultProps">
  </el-cascader>
</template> 
<script>
  import { getNodeParentPath } from '../../libs/util'
  import { getArticleCategoryList } from '../../api/article/article_category'

  export default {
    name: 'ArticleCategoryCascader',
    props: {
      menuId: {
        type: Number,
        default: 0,
      },
    },
    data () {
      return {
        options:[],
        optionValue: [],
        defaultProps: {
          children: 'children',
          label: 'name',
          value: "id"
        }
      }
    },
    methods: {
      setDefault(menuId) {
        let path = {}
        getNodeParentPath(menuId, this.options, path)
        this.optionValue = [...path.ids, menuId]
      },
      requestData() {

          getArticleCategoryList().then( response => {
            this.options = response.data.data
          })

      }
    },
    created() {

      this.requestData()
    },
    watch: {
      optionValue (ids) {

        let id = ids[ids.length - 1]

        let menuId = id > 0 ? id : 0

        this.$emit("update:menuId", menuId);
      },
      menuId(val) {
        //console.log("menuId");
        //if (val > 0) {
          this.setDefault(this.menuId)
        //}
      },
      options() {
               
    
        if (this.menuId) {
          
          this.setDefault(this.menuId)
        }
    
      }
    }
  }
</script>