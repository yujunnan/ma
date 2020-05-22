import localforage from 'localforage'

const USER = 'user:'


export const setUser = (user, provider) => {
  return localforage.setItem(getUserKey(provider), user)
}
export const getUser = (provider) => {
  return localforage.getItem(getUserKey(provider))
}

export const removeUser = (provider) => {
  return localforage.removeItem(getUserKey(provider))
}

export const getUserKey = (provider) => {
  return USER + provider
}