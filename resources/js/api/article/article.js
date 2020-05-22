import qs from 'qs'
import http from '../../libs/http'

const basicRoute = '/api/article/article'

export const myMenu = () => {
    return http.get('/api/my-menu')
}
  

export const getArticleList = (params) => {
  return http.get(basicRoute, {
    params
  })
}

export const addArticle = (data) => {
  return http.post(basicRoute, data)
}

export const editArticle = (id, data) => {
  return http.patch(`${basicRoute}/${id}`, qs.stringify(data))
}

export const deleteArticle = id => {
  return http.delete(`${basicRoute}/${id}`)
}