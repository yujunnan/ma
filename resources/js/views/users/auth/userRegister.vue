<template>
    <div id="register">
        <el-form ref="ruleForm" status-icon :rules="rules"  :model="ruleForm" class="grid-content" label-width="80px">
            <h2>注册账号</h2>
            <el-form-item label="姓名" prop="name"> 
                <el-input v-model="ruleForm.name" auto-complete="off"></el-input>
            </el-form-item>            
            <el-form-item label="邮箱" prop="email"> 
                <el-input v-model="ruleForm.email" auto-complete="off"></el-input>
            </el-form-item>
           <el-form-item label="密码" prop="password">
                <el-input type="password" v-model="ruleForm.password" auto-complete="off" ></el-input>
            </el-form-item>
           <el-form-item label="确认密码" prop="password_confirmation">
                <el-input type="password" v-model="ruleForm.password_confirmation" auto-complete="off" ></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
            </el-form-item>
        </el-form>        
    </div>
</template>
<script>
import { mapActions } from 'vuex'
import { addUser } from '../../../api/user'
export default {
     data() {
      return {
        ruleForm: {
          name: '于鋆南',          
          email: '1804905925@qq.com',
          password:'64647728aa',
          password_confirmation:'64647728aa'        
        },
        rules:{
          name: [
            { required: true, trigger: 'blur', }
          ],          
          email: [
            { required: true, trigger: 'blur' }
          ],
          password: [
            { required: true, trigger: 'blur' }
          ],          
          password_confirmation: [
            { required: true, trigger: 'blur' }
          ]          
        },
        loginForm:{
          username:"",
          password:""
        }

      };
    },
    methods:{
      ...mapActions([
        'loginHandle',
        'userInfoHandle'        
      ]),
      submitForm(formName){
          this.$refs[formName].validate((valid) => {
              if (valid) {
                //发送注册数据和注册请求
                addUser(this.ruleForm).then( response => {
                  if(response.data.err_code==0){
                    //注册成功后进行验证登录操作
                    this.loginForm.username=this.ruleForm.email;
                    this.loginForm.password=this.ruleForm.password;
                    this.loginHandle({
                      ...this.loginForm,
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

                })
              }
          });
      }
    } 
      
}
</script>
<style scoped>
h2{
    text-align:center;
    color: #409EFF;
}
.grid-content{
    width:350px;
    position:absolute;
    left:50%;
    top:50%;
    padding: 20px;
    margin-left:-175px;
    margin-top:-175px;
    border:1px solid #eaeaea;

}
</style>