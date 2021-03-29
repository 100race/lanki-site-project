import Vue from 'vue'
import VueRouter from 'vue-router'
import BootstrapVue from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// vue 컴포넌트 임포트
// 메인화면을 바로 home으로 보내줌.
import Home from '@/views/Home.vue'

Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    }
  ]
})

// new Vue({
//   router: router,
//   render: h => h(Home),
// }).$mount('#app')

// 생성한 router 인스턴스 익스포트하기
export default router
