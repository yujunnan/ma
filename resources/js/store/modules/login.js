import { login, logout } from '../../api/login'
import { removeToken, setToken } from '../../libs/auth'

const state = {
  token: '',
  provider: ''
  
}

const getters = {
  token: state => state.token,
  accessToken : state => state.token.access_token,
  provider:state=> state.provider
}

const mutations = {
  SET_TOKEN (state, {token, provider}) {
    state.token = token
    state.provider = provider
  },
  REMOVE_TOKEN(state){
    state.token = ""
    state.provider = ""   
  }

}

const actions = {
  loginHandle ({ commit }, { username, password, clientId, clientSecret, provider }) {
    return new Promise((resolve, reject) => {
      return login(arguments[1])
        .then(response => {
          const token = {
            ...response.data,
            created_at: new Date().getTime()
          }
          commit('SET_TOKEN', {token, provider})
          resolve(setToken(token, provider))
        })
        .catch(error => {
          reject(error)
        })
    })
  },
  logoutHandle ({ commit }, provider ) {
    return new Promise((resolve, reject) => {
      commit('REMOVE_TOKEN')
      removeToken(provider)
    })
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}