<template>
  <div id="app">
    <router-view/>
  </div>
</template>
<script>
  // 引入公共的common，来做为中间传达的工具
  import common from './common.js'
  import { mapActions } from 'vuex'
  import { routeFormatTag } from './libs/util'
  import { getToken } from './libs/auth'
  import { getUser } from './libs/user'
  import { setHttpToken } from './libs/http'

  export default {
    name: 'App',
    data() {
      return {
        websock: null,
        name:[]

      }
    },  
    created() {
    },
    destroyed() {
    },   
    methods: {
      


    },
    watch: {

    },
    mounted: function () {
    
    },

    
  }
</script>

<style>
  html,body{width:100%;height:100%;}
  body {
    margin:0;
  }
  #app {
    height:100%;
  }
</style>