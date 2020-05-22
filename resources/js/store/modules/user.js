import { userInfo } from '../../api/user'
import { removeUser, setUser } from '../../libs/user'
const state = {
    user:[],
}
const getters = {
    user: state => state.user,
}
const mutations = {
    SET_USER (state,{ user}) {
      state.user = user
    },
 }
 const actions = {
    userInfoHandle ({ commit }, {provider}) {
        return new Promise((resolve, reject) => {
          return userInfo(arguments[1])
            .then(response => {
                const user = response.data
                commit('SET_USER',{user})
              resolve(setUser(user,provider))
            })
            .catch(error => {
              reject(error)
            })
        })
    },
}


 export default {
    state,
    getters,
    mutations,
    actions
  }