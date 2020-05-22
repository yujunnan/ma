import http from '../libs/http'
export const upload = (data) => {
  return http.post('/api/upload', data)
}