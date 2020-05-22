/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
//弹幕
import {vueBaberrage} from 'vue-baberrage';
Vue.use(vueBaberrage);
import ElementUI from 'element-ui'
import i18n from './lang'
import 'element-ui/lib/theme-chalk/index.css'
import './assets/ali-icon/iconfont.css'
import './assets/ali-icon/ali.css'
import App from './Web.vue'
import router from './router'
import store from './store'
import config from './config'

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);
/*语言设置*/
Vue.use(ElementUI, {
    i18n: (key, value) => i18n.t(key, value)
  })
  
  Vue.prototype.$config = config
  Vue.prototype.$provider = 'users'
  //console.log(Vue.prototype.$provider);
  i18n.locale = config[Vue.prototype.$provider].locale ? config[Vue.prototype.$provider].locale : 'en'
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    store,
    i18n,
    render: h => h(App)
});
