<template>

  <NavBar />
  <!-- <div class="carte__box"> -->
    <!-- <div class="container--carte--box">
      <div class="part1 reveal-1">
        <h1>Rien de mieux que son havre de <span>paix ...</span></h1>
      </div>
      <div class="part2 reveal-2">
        <img src="../assets/bann.png" alt="">
      </div>
    </div> -->
  <!-- </div> -->

  <section id="nos__cartes" class="nos__cartes">
    <div class="nos__cartes__part1 max-width">
      <div class="nos__cartes__part1__title">
        <h1>Qui sommes nous ?</h1>
      </div>
      <div class="nos__cartes__part1__container">
        <div class="cartes__box reveal-3">
          <h3>Web Design</h3>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem quia sunt, quasi quo illo enim.</p>
        </div>
        <div class="cartes__box reveal-3">
          <h3>Advertising</h3>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem quia sunt, quasi quo illo enim.</p>
        </div>
        <div class="cartes__box reveal-3">
          <h3>Apps Design</h3>
          <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem quia sunt, quasi quo illo enim.</p>
        </div>
      </div>
    </div>
    
    <section id="shop" class="card">
      <div class="card__title">
        <h1>Shop</h1>
      </div>
      <div class="card__search">
        <div class="card__search__container">
          <input type="search" placeholder="Cherchez une carte ici ...">
          <button type="submit">Chercher</button>
        </div>
        <div class="tri">
          <input type="text" placeholder="min"> -
          <input type="text" placeholder="max">
          <button>Valider</button>
        </div>
      </div>
      

      <div class="card__container">
        <div v-for= "appart in apparts" :key="appart" class="card__item reveal-4">
          <div class="card__item__card">
            <img :src="appart.image" alt="">
          </div>
          <div class="card__item__texte">
            <div>
              <p>{{appart.name}}</p>
              <h4>{{appart.type}}</h4>
              <span>{{appart.prix}}</span>
            </div>
            <div class="card__item__shop">
              <i class="fa-solid fa-heart love"></i>
            </div>
          </div>
          <div class="card__item__button__container">
            <a href="appart.html">
              <button class="card__item__button" type="button"> <p>Louer</p> </button>
            </a>
          </div>
        </div>        
    </div>

</section>

<div class="compteur reveal-4">
  + <h1 class id="timer"> </h1> <span> </span> <span>Clients</span>
</div>

    <footer id="footer">
        By m@rc__emm@nuel the best
        I'm the gre@test m@n in the world 
    </footer>

</section>

</template>

<script>
// @ is an alias to /src
import NavBar from '@/components/NavBar.vue';
import { mapState } from 'vuex';

export default {
  name: 'HomeView',
  components: {
    NavBar
  },
  computed: {
    ...mapState(['apparts'])
  }
}
</script>

<style>
/*----------< Accueil >------------*/

.part1 h1{
  font-size: 46px;
  font-family: 'Courier New', Courier, monospace;
  text-transform: uppercase;
}

.part1 h1 span{
  color: crimson;
}

.carte__box{
  position: fixed;
  top: 0px;
  width: 100vw;
  display: flex;
  margin: 90px 0;
  justify-content: center;
  height: 90vh;
}

.container--carte--box
{
  display: flex;
  justify-content: space-between;
  width: 80vw;
}

.part1{
  width: 40%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.part2{
    width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.part2 img{
    width: 100%;
    animation: ease-in-out 5s jiggle infinite;
}

@keyframes jiggle
{
    0%
    {
        transform: translateY(0px);
    }

    50%
    {
        transform: translateY(30px);
    }

    100%
    {
        transform: translateY(-0px);
    }
}

/*----------< Accueil >------------*/

/*----------< section1 >------------*/

.nos__cartes{
    margin-top: 100vh;
    width: 100%;
    background-color: white;
    box-shadow: 0 4px 12px #111;
    z-index: 999 ;
}

.max-width{
    max-width: 1300px;
    margin: 0 auto;
    padding: 80px 40px;
}

.nos__cartes__part1 div h1{
    text-align: center;
    font-size: 36px;
}

.nos__cartes__part1__title{
    position: relative;
    margin-bottom: 120px;
}

.nos__cartes__part1__title::before{
    content: '';
    position: absolute;
    top: 50%;
    left: 30%;
    transform: translate(-50%);
    height: 5px;
    width: 60px;
    background-color: crimson;
}

.nos__cartes__part1__title::after{
    content: '';
    position: absolute;
    top: 50%;
    right: 25%;
    transform: translate(-50%);
    height: 5px;
    width: 60px;
    background-color: crimson;
}

.nos__cartes__part1__container{
    display: flex;
    gap: 0 60px;
    height: 250px;
}

.cartes__box{
    background-color: #111;
    color: white;
    padding: 40px 15px 20px;
    border-radius: 5px;
    cursor: pointer;
    flex: 1;
    display: grid;
    place-items: center;
    transition: all 1.5s !important;
}

.cartes__box:hover{
    background-color: crimson;
    color: white;
}

.cartes__box h3{
    font-size: 22px;
    font-weight: 600;
    text-align: center;
    margin-bottom: 10px;
}

.cartes__box p{
    font-size: 16px;
    text-align: center;
    margin-bottom: 25px;
}

/*----------< section1 >-----------*/

.card
{
    width: 100%;
    background-color: #111;
    margin: 120px 0 0;
    padding-bottom: 40px;
}

.card__search
{
    max-width: 800px;
    margin: 0 auto;
    padding: 20px 0 60px;
    width: 60%;
}

.card__search__container
{
    display: flex;
    justify-content: space-between;
}

.card__search__container input
{
    width: 70%;
    height: 50px;
    padding: 0 20px;
    border-radius: 5px;
    border: none;
    font-size: 16px;
    outline: goldenrod;
}

.card__search__container button
{
    width: 120px;
    border-radius: 5px;
    border: none;
    font-size: 16px;
    background-color: goldenrod;
    color: white;
    cursor: pointer;
    transition: ease-in-out .3s;
}

.card__search__container button:hover
{
    width: 140px;
}

.card__container
{
    display: grid;
    place-items: center;
    grid-template-columns: auto auto auto auto;
}

.card__title{
    padding: 40px 0;
}

.card__title h1{
    text-align: center;
    color: white;
    font-size: 36px;
}

.card__item
{
    height: 400px;
    width: 300px;
    background-color: rgb(28, 28, 28);
    margin: 20px;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    cursor: pointer;
    overflow: hidden;
}

.card__item__card
{
    background-color: white;
    height: 170px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 25px;
    font-weight: 600;
    cursor: pointer;
    transition: all ease-in-out .3s;
}

.card__item__card:hover
{
    -webkit-transform: scale(1.2);
    -ms-transform: scale(1.2);
    transform: scale(1.2);
}

.card__item__card img{
    height: 100%;
    width: 100%;
    object-fit: cover;
}

.card__item__texte
{
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 90%;
    padding-left: 20px;
    margin-top: 40px;
}



.card__item__texte div h4
{
    font-size: 16px;
    color: crimson;
    margin-top: 5px;
    margin-bottom: 5px;
    font-family: 'Poppins';
    text-align: left;
}


.card__item__texte div p
{
    font-size: 16px;
    font-family: 'Poppins';
    color: white;
    text-align: left;
}

.card__item__texte div span
{
  font-size: 16px;
  display: flex;
  color: goldenrod;
  font-family: 'Poppins';
  text-align: left;
}

.card__item__shop
{
    height: 20px;
    width: 20px;
}

.card__item__shop i
{
    font-size: 20px;
    color: rgb(66, 66, 66);
    transition: ease-in .3s;
}

.card__item__button__container{
    margin-top: 30px;
    width: 100%;
}

.card__item__button__container a{
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
}

.card__item__button
{
    width: 70%;
    height: 40px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    background-color: goldenrod;
    color: white;
    font-size: 16px;
    transition: ease-in-out .3s;
}

.card__item__button p
{
    font-weight: 700;
}

.card__item__button:hover
{
    width: 80%;
}

.tri
{
    margin: 50px auto 0;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 20px;
    color: white;
}

.tri input
{
    width: 130px;
    padding: 15px;
    border-radius: 5px;
    font-size: 16px;
    outline: none;
    border: none;
    color: #111;
}

.tri button
{
    padding: 15px 25px;
    margin-left: 20px;
    font-size: 16px;
    background-color: goldenrod;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    color: white;
    transition: .3s ease-in;
}

.tri button:hover
{
    padding: 15px 35px;
}

footer
{
    padding: 30px 0 30px;
    color: white;
    font-size: 16px;
    background-color: rgb(28, 28, 28);
    width: 100%;
    text-align: center;
}
/*Sigl@2022_2023*/

.compteur
{
    width: 100%;
    padding: 120px 0;
    text-align: center;
    font-size: 100px;
    font-weight: 600;
    color: white;
    background-color: #111;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: ease-in-out;
}

#timer
{
    width: 400px;
}

.color{
    color: goldenrod !important;
}

.gold{
    color: goldenrod;
}

@media screen and (max-width: 415px) {
    .nav__item 
    {
        display: none;
    }
    .carte__box{
        display: flex;
        flex-direction: column;
    }
    .card__container
    {
        max-width: 1300px;
        margin: 0 auto;
        display: grid;
        grid-template-columns: auto;
        justify-content: center;
        align-items: center;
        gap: 40px 0;
    }
    .nav__container
    {
        width: 70%;
    }
    .part1 h1{
        font-size: 26px;
        width: 80%;
    }
    .part1{
        width: 100%;
    }
}

/* .reveal-1{
    opacity: 0;
    transform: translateX(-90px);
    transition: transform 4s cubic-bezier(.5, 0, 0, 1) 0s;
}

.reveal-2{
    opacity: 0;
    transform: translateX(90px);
    transition: transform 4s cubic-bezier(.5, 0, 0, 1) 0s;
}

.reveal-3{
    opacity: 0;
    transform: translateY(-90px);
    transition: transform 4s cubic-bezier(.5, 0, 0, 1) 0s;
}

.reveal-4{
    opacity: 0;
    transform: translateY(-30px);
    transition: transform 4s cubic-bezier(.5, 0, 0, 1) 0s;
}

.reveal-5{
    opacity: 0;
    transform: translateY(-30px);
    
}

.reveal-6{
    opacity: 0;
    transform: translateY(-30px);
    transition: transform 4s cubic-bezier(.5, 0, 0, 1) .8s;
}

.reveal-visible{
    opacity: 1;
    transform: translateY(0);
    transition:  4s cubic-bezier(.5, 0, 0, 1) ;
} */
</style>
