import User from '../users/main/index'
export default [
        {
        name: 'web',
        path: '/',
        redirect: '/home',
        meta: {
          provider: 'user',
          title: 'web',
        },
        component: User,
        children: [
            {
              name: 'home',
              path: 'home',
              meta: {
                
              },
              component: resolve => void(require(['../../views/web/home/index.vue'], resolve))
            },
            {
              name: 'barrage',
              path: 'barrage',
              meta: {
              },
              component: resolve => void(require(['../../views/web/home/barrage.vue'], resolve))
            }

        ]
      }
  ]