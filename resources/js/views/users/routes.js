import User from './main/index'
export default [
        {
        name: 'userMain',
        path: '/user',
        meta: {
          provider: 'users',
          title: 'home',
        },
        component: User,
          children: [
            {
              name: 'userLogin',
              path: 'userLogin',
              meta: {
                provider: 'users',
                title: '登录',

              },
              component: resolve => void(require(['../../views/users/auth/userLogin.vue'], resolve))
            },
            {
              name: 'userRegister',
              path: 'userRegister',
              meta: {
                title: '注册',

              },
              component: resolve => void(require(['../../views/users/auth/userRegister.vue'], resolve))
            }


        ]
      }
  ]