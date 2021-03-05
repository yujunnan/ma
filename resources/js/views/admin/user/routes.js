export default [
  {
    name: 'adminUserIndex',
    path: 'admin-user',
    meta: {
      provider: 'admin',
      title: '管理员用户',
      cache: true,
      permission: 'admin-user.index'
    },
    component: resolve => void(require(['./index.vue'], resolve))
  },
]
