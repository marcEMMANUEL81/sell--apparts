<template>
  <HomeView />
</template>

<script>
import HomeView from './views/HomeView.vue';

export default {
  components: {
    HomeView,
  }
}
</script>

<style lang="scss">

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

// @import url(‘https://fonts.googleapis.com/css?family=Poppins’);

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

// body{
//     display: flex;
//     flex-direction: column;
//     justify-content: center;
//     gap: 20px;
//     align-items: center;
//     font-family: 'Poppins';
// }

html
{
    scroll-behavior: smooth;
}

::-webkit-scrollbar
{
    background-color: rgb(214, 214, 213);
    width: 10px;
}

::-webkit-scrollbar-thumb
{
    background-color: goldenrod;
}
</style>
