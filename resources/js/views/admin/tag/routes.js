export default [
    {
      name: 'tag',
      path: 'tag',
      meta: {
        provider: 'admin',
        title: 'tag',
        cache: false,
        permission: 'tag.index'
      },

      component: resolve => void(require(['./index.vue'], resolve))
    }
  ]
