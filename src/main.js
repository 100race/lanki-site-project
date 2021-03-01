import Vue from 'vue'
import VueRouter from 'vue-router'
import BootstrapVue from 'bootstrap-vue'

//vue 컴포넌트 임포트
//메인화면을 바로 home으로 보내줌.
//import App from './App.vue'
import Home from '@/views/Home.vue'

Vue.config.productionTip = false
Vue.use(VueRouter);
Vue.use(BootstrapVue)

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: Home
    }
  ]
});

new Vue({
  router: router,
  render: h => h(Home),
}).$mount('#app')

