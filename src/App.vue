<template>
  <div id="app">
    <!-- <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div> -->
    <router-view />
  </div>
</template>

<style lang="scss">
// html, body {
//   // margin: 0;
//   margin: 0mm 0mm 0mm 0mm;
// }
header, footer, aside, nav, form, iframe, .menu, .hero, .adslot {
  display: none;
}
@page {
  size: auto;   /* auto is the initial value */
  /* this affects the margin in the printer settings */
  margin: 0mm 0mm 0mm 0mm;
}
body {
  /* this affects the margin on the content before sending to printer */
  margin: 0px;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 30px;
  a {
    font-weight: bold;
    color: #2c3e50;
    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
