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
  <p>{{ sites }}</p>
  </div>
  
</template>


<script>
import axios from 'axios' 

export default {
  name: 'slist',
  data:() =>{
    return{
      sites: [] // sites를 빈 리스트로 초기화
    }
  },

  created(){ //초기화 함수를 정의 created
    // body={ //데이터전송
    //   sitegrpno: this.$route.query.sitegrpno
    // }
    axios.get('http://127.0.0.1:8000/read',{params:{sitegrpno: this.$route.query.sitegrpno}}) //localhost:8000에 get call을 한다
     .then(response=>{
       this.sites = response.data.map(r=>r.data) //반환되는 값을 sitegrps에 저장한다 보내주는 값에 data,error이 있어 r.data만 뽑아오도록 map써준
     })
     .catch(e=>{
       console.log('error:',e) //에러가 나는 경우 콘솔에 에러를 출력
     })
  },

  
}
</script>