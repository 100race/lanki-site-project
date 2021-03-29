// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App'
import router from './router'
import BootstrapVue from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)
Vue.use(VueRouter)
Vue.config.productionTip = false

/* eslint-disable no-new */
// App.vue에 Home.vue를 라우팅함. 구조상 붙인걸로 보임
new Vue({
  el: '#app',
  router, // 애플리케이션 등록하기
  render: h => h(App)
})

// home으로 라우팅

// new Vue({
//   router: router,
//   render: h => h(Home),
// }).$mount('#app')
