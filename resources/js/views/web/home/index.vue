<template>


<el-row>
  <el-col :span="24">
    <el-carousel height="150px">
      <el-carousel-item v-for="item in 4" :key="item">
        <h3 class="small">{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>
  </el-col>
  <el-col :span="24">
  <div class="ql-editor" v-html="data.body"> </div>

  </el-col>

</el-row>


</template>
<script>
  import { getArticleList } from '../../../api/web/article'
  export default {
    data() {
      return {
        data:{
          body:""
        }
      };
    },
    methods: {


    },
    created() {
          getArticleList({...this.queryParams, page: this.queryPage}).then( response => {
            this.data.body=response.data.data.body;

          })

    }

  }
</script>
<style>

    p:before{
        content: "H"  /*:before和:after必带技能，重要性为满5颗星*/
    }
    p:after{
        content: "d"  /*:before和:after必带技能，重要性为满5颗星*/
    }

  .el-carousel__item:nth-child(2n) {
     background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
     background-color: #d3dce6;
  }


</style>
