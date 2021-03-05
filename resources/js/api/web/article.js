import qs from 'qs'
import http from '../../libs/http'

const basicRoute = '/api/web/article'



export const getArticleList = (params) => {
  return http.get(basicRoute+"/list", {
    params
  })
}
