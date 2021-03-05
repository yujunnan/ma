export default [
  {
    name: 'adminDashboard',
    path: 'dashboard',
    meta: {
      provider: 'admin',
      title: '标题',
      cache: true,
      notClosable: true
    },
    component: resolve => void(require(['./index.vue'], resolve))
  },
]
