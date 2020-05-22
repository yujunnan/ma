export default [
    {
      name: 'article',
      path: 'article',
      meta: {
        provider: 'admin',
        title: 'article',
        cache: false,
        permission: 'article.index'
      },

      component: resolve => void(require(['./index.vue'], resolve))
    }
  ]