<template>
  <div id="app">
    <!-- 부트스트랩 Navbar UI 표시 -->
    <!-- https://getbootstrap.com/docs/4.1/components/navbar/ -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <!-- 페이지 이동 설정 -->
          <router-link class="nav-item nav-link" to="/">HOME</router-link>

        </div>
      </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
</style>
