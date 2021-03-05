import Vue from 'vue'
import ElementUI from 'element-ui'
import i18n from './lang'
//样式

import 'element-ui/lib/theme-chalk/index.css'
import './assets/ali-icon/iconfont.css'
import './assets/ali-icon/ali.css'
import './assets/css/mojito.css'
import App from './Admin.vue';

import router from './router'
import store from './store'
import config from './config'
// 富文本插件
import VueQuillEditor from 'vue-quill-editor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
Vue.use(VueQuillEditor)

// markdown插件
import { mavonEditor } from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'

Vue.component('mavon-editor',mavonEditor);


Vue.use(ElementUI, {
  i18n: (key, value) => i18n.t(key, value)
})

Vue.prototype.$config = config
Vue.prototype.$provider = 'admin'
i18n.locale = config[Vue.prototype.$provider].locale ? config[Vue.prototype.$provider].locale : 'en'
/* eslint-disable no-new */
const app = new Vue({
  el: '#app',
  router,
  store,
  i18n,
  render: h => h(App)
})
