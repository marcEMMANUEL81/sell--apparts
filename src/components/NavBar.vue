<template>
  <header>
        <div class="nav__container">
            <div class="nav__logo">BAT <span>CI.</span> </div>
            <div class="nav__item">
                <nav>
                    <a class="item__nav" href="#">Accueil</a>
                    <a class="item__nav" href="#nos__cartes">Qui sommes nous ?</a>
                    <a class="item__nav" href="#shop">Ajouter</a>
                    <a class="item__nav" href="#footer">A propos</a>
                </nav>
            </div>  
        </div>
    </header>
</template>

<script>
export default {
  name: 'NavBar',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}

/*----------< Barre de navigation >------------*/

header{
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 999;
    background-color: #111;
    padding: 30px 5px;
}

.nav__container{
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    max-width: 60vw;
}

.nav__logo{
    font-size: 20px;
    font-weight: 600;
    color: white;
}

.nav__logo span{
    color: crimson;
    margin-left: 5px;
}

.item__nav{
    position: relative;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    color: white;
    margin-left: 50px;
    cursor: pointer;
    transition: ease-in-out .3s;
}

.item__nav:hover{
    color: crimson !important;
}

.item__nav::before{
    content: '';
    position: absolute;
    left: 0;
    bottom: -7px;
    background-color: crimson;
    height: 4px;
    border-radius: 4px;
    transition: ease-in-out .3s;
    width: 0%;
}

.item__nav:hover::before{
    width: 100%;
}

/*----------< Barre de navigation >------------*/
</style>
