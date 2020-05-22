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
      this.initWebSocket();
    },
    destroyed() {
      this.websock.close() //离开路由之后断开websocket连接
    },   
    methods: {
      initWebSocket(){ //初始化weosocket
        const wsuri = "ws://mojito.skt/ws";
        this.websock = new WebSocket(wsuri);
        this.websock.onmessage = this.websocketonmessage;
        this.websock.onopen = this.websocketonopen;
        this.websock.onerror = this.websocketonerror;
        this.websock.onclose = this.websocketclose;
      },
      websocketonopen(){ //连接建立之后执行send方法发送数据
        //let actions = {"test":"12345"};
        //this.websocketsend(JSON.stringify(actions));
      },
      websocketonerror(){//连接建立失败重连
        this.initWebSocket();
      },
      websocketonmessage(event){ //数据接收
       
        //const redata = JSON.parse(e.data);
        // 接收到 WebSocket 服务器返回消息时触发
        
        let data = JSON.parse(event.data);
        //console.log(data.position);
        //that.addToList(data.position, data.message);
        common.$emit('message',data)


      },
      websocketsend(Data){//数据发送
        this.websock.send(Data);
      },
      websocketclose(e){  //关闭
        console.log('断开连接',e);
      },


    },
    watch: {

    },
    mounted: function () {
      var vm = this
      // 用$on事件来接收参数
      common.$on('msg', (data) => {
        //vm.name = data
        this.websock.send(data);
      })
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