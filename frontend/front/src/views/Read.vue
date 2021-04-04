<template>
  <div class="siteread">
    <h1>사이트 정보</h1>
	 <p>이 페이지는 ID.{{ $route.query.sitegrpno }}의 상세를 출력합니다.</p>

              <p v-if="sites == null || sites.length == 0">등록된 사이트가 없습니다!</p>
                 <div v-for="site of sites" :key="site.seqno" class="col-md-4">
                  <div class="card mb-4 box-shadow">
                    <img class="card-img-top" :src="require('../assets/siteThumbnail/'+site.filename)" alt="image loading failed">
                      <div class="card-body">
                       <p class="card-text">{{site.sname}}</p>
                        <div class="d-flex justify-content-between align-items-center">
                         <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                         </div>
                        </div>
                    </div>
                  </div>
                </div>

  <p>{{ $route.query.sitegrpno }}</p>
  <p>{{ sitegrp }}</p>
  </div>
  
</template>


<script>
import axios from 'axios' 

let SITE_API_URL = 'http://127.0.0.1:8000/api'

export default {
  name: 'slist',
  data:() =>{
    return{
      sites: [],
      sitegrp: [] 
    }
  },

  methods: {
    initSites: function(){
      axios.get(SITE_API_URL+'/site/read',{params:{sitegrpno: this.$route.query.sitegrpno}}) //localhost:8000에 get call을 한다
     .then(response=>{
       this.sites = response.data.map(r=>r.data) //반환되는 값을 sitegrps에 저장한다 보내주는 값에 data,error이 있어 r.data만 뽑아오도록 map써준
     })
     .catch(e=>{
       console.log('error:',e) 
     })
    },

    initSitegrp: function(){
      axios.get(SITE_API_URL+'/sitegrp/get',{params:{sitegrpno: this.$route.query.sitegrpno}}) 
     .then(response=>{
       this.sitegrp = response.data.data //response의 data에서 data(error빼고)만 호출(sitegrpResponse구조 확인 : data,error)
     })
     .catch(e=>{
       console.log('error:',e)
     })
    }

  },

  created(){ 
     this.initSites()
     this.initSitegrp()
  }

  
}
</script>