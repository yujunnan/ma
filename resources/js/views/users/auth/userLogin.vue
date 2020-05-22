<template>
  <div id="login">
    <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="login-container">
      <h2>会员登录</h2>
      <el-form-item label="账号" prop="username">
        <el-input  v-model="ruleForm.username" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input type="Password" v-model="ruleForm.password" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" plain @click="submitForm('ruleForm')">登录</el-button>
        <el-button plain @click="resetForm('ruleForm')">重值</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
  import { mapActions } from 'vuex'

  export default {
    data() {
      return {
        ruleForm: {
          username: '1804905923@qq.com',
          password: '64647728'
        },
        rules: {
          username: [
            { required: true, trigger: 'blur' }
          ],
          password: [
            { required: true, trigger: 'blur' }
          ]
        },

      };
    },
    methods: {
      ...mapActions([
        'loginHandle',
        'userInfoHandle'        
      ]),
      submitForm(formName) {
        self=this;
        this.$refs[formName].validate((valid) => {
          if (valid) {


            self.loginHandle({
              ...this.ruleForm,
              ...this.$config[this.$provider].authorize,
              provider: this.$provider
            }).then(result => {
              //获取登录用户信息
              this.userInfoHandle({
                provider: this.$provider
              }).then(result => {
                this.$router.push({
                    name: 'userMain'
                })                     
              })
                  
            })
          }
        });



      },
      resetForm() {

      }
    }
  }
</script>
<style scoped>
  h2 {
    text-align: center;
    color: #409EFF;
  }
  #login {
    height:100%;
  }
  .login-container {
    width: 350px;
    padding: 20px;
    background: #fff;
    position: absolute;
    top:50%;
    left:50%;
    margin-top:-200px;
    margin-left:-195px;
    border: 1px solid #eaeaea;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-border-radius: 5px;
  }
</style>