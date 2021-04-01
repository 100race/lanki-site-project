<template>
<div>

    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">The Lanki.site</h1>
          <p class="lead text-muted">당신에게 필요한 사이트 랭킹</p>
        
            <label for="search">Search for</label>
            <div class="input-group">
          <input type="text" class="form-control" placeholder="검색 키워드를 입력하세요!">
        <span class="input-group-btn">
      <button class="btn btn-secondary" type="button">찾기</button>
      </span>
      </div>
          
        </div>
      </section>

      <div class="album py-5 bg-light">
        <div class="container">
          
          <div class="row">

            <!---->
              <p v-if="sitegrps == null || sitegrps.length == 0">게시글이 없습니다!</p>

                 <div v-for="sitegrp of sitegrps" :key="sitegrp.seqno" class="col-md-4">
                  <div class="card mb-4 box-shadow">
                    <img class="card-img-top" :src="require('@/assets/siteThumbnail/'+sitegrp.thumbname)" alt="image loading failed">
                      <div class="card-body">
                       <p class="card-text">{{sitegrp.title}}</p>
                        <div class="d-flex justify-content-between align-items-center">
                         <div class="btn-group">
                          <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                          <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                         </div>
                        <small class="text-muted">1 mins</small>
                        </div>
                    </div>
                  </div>
                
              </div>
            
          </div>
        </div>
      </div>

    </main>

  </div> 
</template>

<script>
import axios from 'axios' //API 호출을 위한 패키지
//api를 받아서 데이터가 있으면 template에 뿌려주는식으로 가야할듯

export default {
  name: 'list',
  data:() =>{
    return{
      sitegrps: [] //sitegrps를 빈 리스트로 초기화
    }
  },

  created(){ //초기화 함수를 정의
    axios.get('http://127.0.0.1:8000/') //localhost:8000에 get call을 한다
     .then(response=>{
       this.sitegrps = response.data.map(r=>r.data) //반환되는 값을 sitegrps에 저장한다
     })
     .catch(e=>{
       console.log('error:',e) //에러가 나는 경우 콘솔에 에러를 출력
     })
  }
}
</script>