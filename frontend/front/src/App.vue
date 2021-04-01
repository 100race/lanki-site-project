<template>
  <div id="app">
    <!-- 부트스트랩 Navbar UI 표시 -->
    <!-- https://getbootstrap.com/docs/4.1/components/navbar/ -->

    
    <!--헤더-->
    <header>
      <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
          <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
              <h4 class="text-white">About</h4>
              <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
            </div>
            <div class="col-sm-4 offset-md-1 py-4">
              <h4 class="text-white">Contact</h4>
              <ul class="list-unstyled">
                <li><a href="#" class="text-white">Follow on Twitter</a></li>
                <li><a href="#" class="text-white">Like on Facebook</a></li>
                <li><a href="#" class="text-white">Email me</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar navbar-dark bg-dark box-shadow">
        <div class="container d-flex justify-content-between">
          <a href="#" class="navbar-brand d-flex align-items-center">
            <strong>Lanki</strong>
          </a>
          <router-link class="nav-item nav-link" to="/create">새글쓰기</router-link>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </div>
    </header>

    <!--라우터로 연결된 main vue 부분-->
    <router-view></router-view>

    <!--푸터-->
    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>Lanki.site is &copy; Kyoungju Baek</p>
        <p>github <a href="https://github.com/100race">100race</a> or blog <a href="https://blog.naver.com/100race">laki programming</a></p>
      </div>
    </footer>
    </div>


  
</template>

<script>
export default {
  name: "App",
};
</script>
