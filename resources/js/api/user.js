import http from '../libs/http'

export const userInfo = () => {
  return http.get('/api/user', {

  })
}

export const addUser = (data) => {
  //console.log(data)
  return http.post('/api/register', data)
}