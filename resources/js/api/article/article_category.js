import qs from 'qs'
import http from '../../libs/http'

const basicRoute = '/api/article/article-category'

export const myMenu = () => {
    return http.get('/api/my-menu')
}
  

export const getArticleCategoryList = (params) => {
  return http.get(basicRoute, {
    params
  })
}

export const addArticleCategory = (data) => {
  return http.post(basicRoute, data)
}

export const editArticleCategory = (id, data) => {
  return http.patch(`${basicRoute}/${id}`, qs.stringify(data))
}

export const deleteArticleCategory = id => {
  return http.delete(`${basicRoute}/${id}`)
}