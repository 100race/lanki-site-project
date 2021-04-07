<template>
	<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">사이트그룹 생성</h1>
<form >

  <div class="form-group">
    <label class="control-label col-sm-2" for="title">사이트그룹 제목</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" v-model="sitegrptitle" plcaeholder="ex)여행갈 때 참고하기 좋은 사이트 TOP 10" required = "true" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">사이트 그룹 설명</label>
    <div class="col-sm-8">
    <textarea rows="5" cols="7" id="content" v-model="sitegrpcontent" required = "true" name="content" class="form-control"></textarea>
    </div>
  </div> 
  <hr>
 

<div id="demo">
  <h1 class="col-sm-offset-2 col-sm-10">사이트 추가</h1>
  <div v-for="(siteinput, index) in siteinputs">
  <h4 class="col-sm-offset-2 col-sm-10">사이트 {{siteinputs[index]}}</h4>
    <div class="form-group">
    <label class="control-label col-sm-2" for="title">사이트 Url</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" v-model="siteurl[index]" class="form-control">
    </div>
  </div>

    <div class="form-group">
    <label class="control-label col-sm-2" for="title">사이트명</label>
    <div class="col-sm-8">
      <input type="text" name="title" id="title" v-model="sitetitle[index]" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">사이트설명</label>
    <div class="col-sm-8">
    <textarea rows="5" cols="7" id="content" name="content" v-model="sitecontent[index]" class="form-control"></textarea>
    </div>
  </div>
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">사이트 썸네일</label>
    <div class="col-sm-6">
      <input type="file" name="filenameMF" id="filenameMF" class="form-control">
    </div>
  </div>
   <button class="add" @click="delInput(siteinput,index)">사이트 제거</button>
  <hr>
  </div>
  <p>
    First value: {{ sitetitle[0] }}<br />
    Second value: {{ sitetitle[1] }}
    Third value title: {{ sitetitle[2] }}
    Third value Url: {{ siteurl[2] }}
  </p>
</div>

  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
 <button class="add" @click="addInput">사이트추가</button>

</div>
</template>


<script>
import axios from 'axios' 

let SITE_API_URL = 'http://127.0.0.1:8000/api'

export default {
  name: 'create',
  data:() =>{
    return{
      sites: [],
      sitegrp: [],
      sitegrpcontent:'',
      sitegrptitle:'',
      grpinputs:[],
      siteinputs:[],

      siteurl: [],
      sitetitle:[],
      sitecontent:[]
    }
  },

  methods: {
    createSitegrp: function(){
      axios.put()
    },

    addInput: function(){ //클릭시 사이트 추가폼 추가
      if(this.siteinputs.length >=15 ){
        alert('사이트는 최대 15개까지 추가할 수 있습니다.');
      }
      this.siteinputs.push(this.siteinputs.length+1);
      // siteurl
      // sname(사이트명)
      // content(내용)
      // filename
    },

    delInput: function(siteinput,index){ //클릭시 사이트 추가폼,데이터 제거 
      this.siteinputs.splice(this.siteinputs.indexOf(siteinput),1);
      this.siteurl.splice(this.siteurl.indexOf(siteurl),1);
      this.sitetitle.splice(this.sitetitle.indexOf(sitetitle),1);
      this.sitecontent.splice(this.sitecontent.indexOf(sitecontent),1);
      
      //this.siteinputs.$remove(siteinput);
    }
  }

}
</script>
