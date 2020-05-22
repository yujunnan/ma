import { setPermissions } from '../libs/auth'
import { setHttpToken } from '../libs/http'
import { setUser } from '../libs/user'
const subscribe = (store) => {
  store.subscribe((mutation, state) => {
    switch (mutation.type) {
      case 'SET_TOKEN':
        setHttpToken(state.login.token.access_token)
        break;
      case 'SET_PERMISSIONS':
        setPermissions(state.permission.permissions, state.login.provider)
        break;
      case 'SET_USER':
        setUser(state.user.user, state.login.provider)
        break;

    }
  })
}

export default (store) => {
  subscribe(store)
};