<template>
  <el-container style="height:100%">
    <nav-bar :is-collapse="isCollapse" style="min-height:600px"></nav-bar>
    <el-container direction="vertical">
      <mojito-header :is-collapse="isCollapse"  v-on:menu="changeMenuStatus"></mojito-header>
      <tags-view></tags-view>
      <el-main>
        <keep-alive :include="cacheTags">
          <router-view/>
        </keep-alive>
      </el-main>
    </el-container>
    <!--
    <el-backtop  target=".page-component__scroll .el-scrollbar__wrap"></el-backtop>-->
    <el-backtop ></el-backtop>


  </el-container>
</template>

<script>
  import { MojitoHeader, NavBar, TagsView } from '../../../components/Layout'
  import { mapActions } from 'vuex'
  export default {
    data() {
      return {
        isCollapse: false
      }
    },
    components: {
      TagsView,
      MojitoHeader,
      NavBar
    },
    methods: {
      ...mapActions([
        'loadPermissions'
      ]),
      changeMenuStatus(isCollapse) {
        this.isCollapse = isCollapse
      }
    },
    created() {
      this.loadPermissions()
    },
    computed: {
      cacheTags() {
        return this.$store.getters.cacheTags
      }
    }
  }
</script>
