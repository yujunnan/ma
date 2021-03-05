<template>
  <el-container style="height:100%;">
      <el-header>
        <nav-bar :is-collapse="isCollapse"></nav-bar>
      </el-header>
      <el-main>
        <keep-alive>
          <router-view/>
        </keep-alive>
      </el-main>
      <el-footer>
      </el-footer>
      <el-aside>
      </el-aside>
  </el-container>
</template>

<script>

    import { NavBar } from '../../../components/WebLayout'

    import { mapActions } from 'vuex'
    export default {
        data() {
            return {
                isCollapse:Boolean
            }
        },
        components: {
            NavBar
        },
        methods: {

        },
        created() {

        },
        computed: {

        }
    }
</script>
