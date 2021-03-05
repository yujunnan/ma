import qs from 'qs'
import http from '../../libs/http'

const basicRoute = '/api/system/tag'
const homeRoute = '/api/home/tags'

export const myMenu = () => {
    return http.get('/api/my-menu')
}


export const getTagList = (params) => {
  return http.get(basicRoute, {
    params
  })
}

export const addTag = (data) => {
  return http.post(basicRoute, data)
}

export const editTag = (id, data) => {
  return http.patch(`${basicRoute}/${id}`, qs.stringify(data))
}

export const deleteTag = id => {
  return http.delete(`${basicRoute}/${id}`)
}


export const getTagAllList = (params) => {
    return http.get(homeRoute, {
        params
    })
}
