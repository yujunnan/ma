export default [
    {
      name: 'articleCategory',
      path: 'article-category',
      meta: {
        provider: 'admin',
        title: 'category',
        cache: false,
        permission: 'article-category.index'
      },

      component: resolve => void(require(['./index.vue'], resolve))
    }
  ]
  