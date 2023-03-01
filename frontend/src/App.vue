<template class="">
  <NavBar/>
</template>

<script>
import NavBar from './components/NavBar.vue';
export default {
  components: {
    NavBar,
  }
}
</script>

<style lang="scss">

@import url('https://fonts.cdnfonts.com/css/poppins');

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  overflow-x: hidden;
}

html
{
    scroll-behavior: smooth;
}

</style>
