<template>
    <el-menu :default-active="activeIndex"
    class="el-menu-demo" mode="horizontal" @select="handleSelect">
      <el-menu-item index="1">
      <router-link to="/home">
        首页
      </router-link>

      </el-menu-item>
      <el-menu-item index="2">
      <router-link to="/barrage">
        测试组件
      </router-link>

      </el-menu-item>

      <el-submenu index="3">
        <template slot="title">新闻中心</template>
        <el-menu-item index="2-1">栏目1</el-menu-item>
        <el-menu-item index="2-2">栏目2</el-menu-item>
        <el-menu-item index="2-3">栏目3</el-menu-item>
        <el-submenu index="2-4">
          <template slot="title">栏目4</template>
          <el-menu-item index="2-4-1">子栏目1</el-menu-item>
          <el-menu-item index="2-4-2">子栏目2</el-menu-item>
          <el-menu-item index="2-4-3">子栏目3</el-menu-item>
        </el-submenu>
      </el-submenu>
      <el-menu-item index="4" v-if="provider!='users' || accessToken.length==0">
      <router-link to="/user/userLogin">
        登录
      </router-link>
      </el-menu-item>
      <el-menu-item index="5" v-if="provider!='users' || accessToken.length==0">
      <router-link to="/user/userRegister">
        注册
      </router-link>
      </el-menu-item>
      <el-menu-item index="5" v-if="provider=='users' && accessToken.length>0">
      <router-link to="/user">
        {{user.name}}
      </router-link>
      </el-menu-item>
      <el-menu-item index="6" v-if="provider=='users' && accessToken.length>0"
         @click="logout()">
        退出
      </el-menu-item>


    </el-menu>

</template>

<script>
  import { mapActions } from 'vuex'
  import config from '../../config'



  export default {
    name: 'NavBar',
    props: {

    },
    data () {
      return {
        activeIndex: '1',
        activeIndex2: '1'
      };
    },
    created () {
    },
    methods: {
      ...mapActions([
        'logoutHandle'
      ]),
      handleSelect() {
      },
      logout(){
        //退出登录
        this.logoutHandle(this.$provider).then(
          this.$router.push({
            name: config[this.$provider].loginRouteName
          })
        )
      }
    },
    computed: {
      //从vuex中获取accessToken
      accessToken () {
        return this.$store.getters.accessToken
      },
      //从vuex中获取provider
      provider () {
        return this.$store.getters.provider
      },
      //
      user() {
        return this.$store.getters.user
      }

    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .container{
    height:60px;

  }

  .el-menu-vertical {
    height:100%
  }

  .logo {
    height:60px;
    line-height:60px;
    color:#42b983;
    .normal {
      padding-left:20px;
    }
    .mini {
      text-align:center;
    }
  }
</style>
