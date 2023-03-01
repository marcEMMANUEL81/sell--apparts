<template>
  <div class="flex flex-col items-center mt-20 px-3">
    
    <div id="controls-carousel" class="relative w-full mt-9 z-auto" data-carousel="static">
        <!-- Carousel wrapper -->
        <div class="relative h-96 overflow-hidden rounded-lg">
            <!-- Item 1 -->
            <div id="carousel-item-1" class="hidden duration-700 ease-in-out w-full h-full" data-carousel-item>
                <img src="https://images.pexels.com/photos/1115804/pexels-photo-1115804.jpeg?auto=compress&cs=tinysrgb&w=1600" class="absolute block w-full h-full object-cover -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
            <!-- Item 2 -->
            <div id="carousel-item-2" class="hidden duration-700 ease-in-out w-full h-full" data-carousel-item="active">
                <img src="https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&w=1600" class="absolute block w-full h-full object-cover -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
            <!-- Item 3 -->
            <div id="carousel-item-3" class="hidden duration-700 ease-in-out w-full h-full" data-carousel-item>
                <img src="https://images.pexels.com/photos/1612351/pexels-photo-1612351.jpeg?auto=compress&cs=tinysrgb&w=1600" class="absolute block w-full h-full object-cover -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
            <!-- Item 4 -->
            <div id="carousel-item-4" class="hidden duration-700 ease-in-out w-full h-full" data-carousel-item>
                <img src="https://images.pexels.com/photos/1876045/pexels-photo-1876045.jpeg?auto=compress&cs=tinysrgb&w=1600" class="absolute block w-full h-full object-cover -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
            <!-- Item 5 -->
            <div id="carousel-item-5" class="hidden duration-700 ease-in-out w-full h-full" data-carousel-item>
                <img src="https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?auto=compress&cs=tinysrgb&w=1600" class="absolute block w-full h-full object-cover -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2" alt="...">
            </div>
        </div>
        <!-- Slider controls -->
        <button id="data-carousel-prev" type="button" class="absolute top-0 left-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-prev>
            <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                <svg aria-hidden="true" class="w-6 h-6 text-white dark:text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
                <span class="sr-only">Previous</span>
            </span>
        </button>
        <button id="data-carousel-next" type="button" class="absolute top-0 right-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-next>
            <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 dark:bg-gray-800/30 group-hover:bg-white/50 dark:group-hover:bg-gray-800/60 group-focus:ring-4 group-focus:ring-white dark:group-focus:ring-gray-800/70 group-focus:outline-none">
                <svg aria-hidden="true" class="w-6 h-6 text-white dark:text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                <span class="sr-only">Next</span>
            </span>
        </button>
    </div>
    
    <div class="w-full mt-20 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
        <ul class="flex flex-wrap text-sm font-medium text-center text-gray-500 border-b border-gray-200 rounded-t-lg bg-gray-50 dark:border-gray-700 dark:text-gray-400 dark:bg-gray-800" id="defaultTab" data-tabs-toggle="#defaultTabContent" role="tablist">
            <li class="mr-2">
                <button id="about-tab" data-tabs-target="#about" type="button" role="tab" aria-controls="about" aria-selected="true" class="inline-block p-4 text-blue-600 rounded-tl-lg hover:bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-700 dark:text-blue-500">About</button>
            </li>
            <li class="mr-2">
                <button id="services-tab" data-tabs-target="#services" type="button" role="tab" aria-controls="services" aria-selected="false" class="inline-block p-4 hover:text-gray-600 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-gray-300">Services</button>
            </li>
            <li class="mr-2">
                <button id="statistics-tab" data-tabs-target="#statistics" type="button" role="tab" aria-controls="statistics" aria-selected="false" class="inline-block p-4 hover:text-gray-600 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-gray-300">Facts</button>
            </li>
        </ul>
        <div id="defaultTabContent h-1/2">
            <div class="hidden p-4 bg-white rounded-lg md:p-8 dark:bg-gray-800" id="about" role="tabpanel" aria-labelledby="about-tab">
                <h2 class="mb-3 text-3xl font-extrabold tracking-tight text-gray-900 overflow-hidden dark:text-white">Information sur le bien immobilier</h2>
                <img class="object-cover w-24 h-24 mb-3 rounded-full shadow-lg my-3" :src="appart.image"/>
                <div class="flex mt-6">
                  <h2 class="mb-3 text-xl font-extrabold tracking-tight text-gray-500 overflow-hidden dark:text-white">{{ appart.type }}</h2>
                  <p class="mb-3 text-xl font-extrabold tracking-tight text-gray-500 overflow-hidden dark:text-white">__{{ appart.titre }}</p>
                </div>
                <p class="mb-3 text-gray-500 dark:text-gray-400 text-left">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quasi non placeat sint alias incidunt perferendis harum. Qui nostrum tenetur suscipit, repudiandae eius ut maiores sequi officiis doloremque rem deserunt ratione..</p>
                <p class="mb-3 text-gray-500 dark:text-gray-100 text-left">Localisation: {{ appart.lieu }}..</p>
                <div class="flex items-center">
                  <p class="mb-3 text-gray-500 dark:text-gray-100 text-left">Prix de la location: </p>
                  <p class="mb-3 dark:text-gray-100 text-green-600 font-normal bg-gray-100 text-left ml-3 py-1 px-2 dark:bg-gray-700 rounded">{{ appart.prix }} Fcfa</p>
                </div>
                <button type="button" class="text-white my-5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center mr-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                  <svg aria-hidden="true" class="w-5 h-5 mr-2 -ml-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"></path></svg>
                  Louer
                </button>
            </div>
            <div class="hidden p-4 bg-white rounded-lg md:p-8 dark:bg-gray-800" id="services" role="tabpanel" aria-labelledby="services-tab">
                <h2 class="mb-5 text-2xl font-extrabold tracking-tight text-gray-900 dark:text-white">Certifications du propriétaire</h2>
                <!-- List -->
                <ul role="list" class="space-y-4 text-gray-500 dark:text-gray-400">
                    <li class="flex space-x-2">
                        <!-- Icon -->
                        <svg class="flex-shrink-0 w-4 h-4 text-blue-600 dark:text-blue-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        <span class="font-light leading-tight">Entretien régulier de la maison</span>
                    </li>
                    <li class="flex space-x-2">
                        <!-- Icon -->
                        <svg class="flex-shrink-0 w-4 h-4 text-blue-600 dark:text-blue-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        <span class="font-light leading-tight">Chauffage intégré</span>
                    </li>
                    <li class="flex space-x-2">
                        <!-- Icon -->
                        <svg class="flex-shrink-0 w-4 h-4 text-blue-600 dark:text-blue-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        <span class="font-light leading-tight">Sécurité</span>
                    </li>
                    <li class="flex space-x-2">
                        <!-- Icon -->
                        <svg class="flex-shrink-0 w-4 h-4 text-blue-600 dark:text-blue-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                        <span class="font-light leading-tight">dernier truc ...</span>
                    </li>
                </ul>
            </div>
            <div class="hidden p-4 bg-white rounded-lg md:p-8 dark:bg-gray-800" id="statistics" role="tabpanel" aria-labelledby="statistics-tab">
                <dl class="grid max-w-screen-xl grid-cols-2 gap-8 p-4 mx-auto text-gray-900 dark:text-white sm:p-8">
                    <div class="flex flex-col">
                        <dt class="mb-2 text-3xl font-extrabold">5k+</dt>
                        <dd class="font-light text-gray-500 dark:text-gray-400">Avis</dd>
                    </div>
                    <div class="flex flex-col">
                        <dt class="mb-2 text-3xl font-extrabold">100+</dt>
                        <dd class="font-light text-gray-500 dark:text-gray-400">Likes</dd>
                    </div>
                </dl>
            </div>
        </div>
    </div>

    <div class="w-full max-w-sm bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 mt-9">
      <div class="flex justify-end px-4 pt-4">
        <!-- <button id="dropdownButton" data-dropdown-toggle="dropdown" class="inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5" type="button">
          <span class="sr-only">Open dropdown</span>
          <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M6 10a2 2 0 11-4 0 2 2 0 014 0zM12 10a2 2 0 11-4 0 2 2 0 014 0zM16 12a2 2 0 100-4 2 2 0 000 4z"></path></svg>
        </button> -->
          <!-- Dropdown menu -->
        <!-- <div id="dropdown" class="z-10 hidden text-base list-none bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
          <ul class="py-2" aria-labelledby="dropdownButton">
          <li>
              <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Ecrire</a>
          </li>
          <li>
              <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Appeler</a>
          </li>
          </ul>
        </div> -->
      </div>
      <div class="flex flex-col items-center pb-10">
        <img class="w-24 h-24 mb-3 rounded-full shadow-lg object-cover" :src="proprio.pic" alt="Bonnie image"/>
        <h5 class="mb-1 text-xl font-medium text-gray-900 dark:text-white"> {{ proprio.nom }} </h5>
        <span class="text-sm text-gray-500 dark:text-gray-400">Propriétaire du bien</span>
        <div class="flex mt-4 space-x-3 md:mt-6">
          <a href="#" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Ecrire</a>
          <a href="#" class="inline-flex items-center px-4 py-2 text-sm font-medium text-center text-gray-900 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-700 dark:focus:ring-gray-700">Appeler</a>
        </div>
      </div>
    </div>

    <router-link v-if="userRole === 'admin'" :to="'/display/' + appart.id_appart">
      <button type="submit" class="mt-9 inline-flex items-center py-2.5 px-4 text-2xs font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
        Modifier le bien
      </button>
    </router-link>
    

    <form class="mt-9 max-w-7xl mx-auto w-full">
      <div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-700 dark:border-gray-600">
          <div class="px-4 py-2 bg-white rounded-t-lg dark:bg-gray-800">
              <label for="comment" class="sr-only">Your comment</label>
              <textarea v-model="content" id="comment" rows="4" class="w-full px-0 text-sm text-gray-900 bg-white border-0 dark:bg-gray-800 focus:ring-0 dark:text-white dark:placeholder-gray-400" placeholder="Write a comment..." required></textarea>
          </div>
          <div class="flex items-center justify-between px-3 py-2 border-t dark:border-gray-600">
              <button @click="createComment" type="submit" class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 dark:focus:ring-blue-900 hover:bg-blue-800">
                  Post comment
              </button>
              <div class="flex pl-0 space-x-1 sm:pl-2">
                  <button type="button" class="inline-flex justify-center p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                      <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z" clip-rule="evenodd"></path></svg>
                      <span class="sr-only">Attach file</span>
                  </button>
                  <button type="button" class="inline-flex justify-center p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                      <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path></svg>
                      <span class="sr-only">Set location</span>
                  </button>
                  <button type="button" class="inline-flex justify-center p-2 text-gray-500 rounded cursor-pointer hover:text-gray-900 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600">
                      <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path></svg>
                      <span class="sr-only">Upload image</span>
                  </button>
              </div>
          </div>
      </div>
    </form>


    <div class="p-5 w-full mb-4 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700">
      <time class="text-lg font-semibold text-gray-900 dark:text-white">Commentaires</time>
        <ol class="mt-3 divide-y divider-gray-200 dark:divide-gray-700">
            <li v-for="comment in comments" :key="comment">
                <a href="#" class="text-left items-center block p-3 sm:flex hover:bg-gray-100 dark:hover:bg-gray-700">
                    <img class="object-cover w-12 h-12 mb-3 mr-3 rounded-full sm:mb-0" :src="comment.pic" :alt="comment.nom_commentateur"/>
                    <div class="text-gray-600 dark:text-gray-400">
                        <div class="text-base font-normal"><span class="font-medium text-gray-900 dark:text-white">{{ comment.user_name }}</span> a commenté <span class="font-medium text-gray-900 dark:text-white"> le {{ comment.date }}</span></div>
                        <div class="text-sm font-normal">" {{ comment.content }} "</div>
                        <span class="inline-flex items-center text-xs font-normal text-gray-500 dark:text-gray-400">
                            <svg aria-hidden="true" class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.083 9h1.946c.089-1.546.383-2.97.837-4.118A6.004 6.004 0 004.083 9zM10 2a8 8 0 100 16 8 8 0 000-16zm0 2c-.076 0-.232.032-.465.262-.238.234-.497.623-.737 1.182-.389.907-.673 2.142-.766 3.556h3.936c-.093-1.414-.377-2.649-.766-3.556-.24-.56-.5-.948-.737-1.182C10.232 4.032 10.076 4 10 4zm3.971 5c-.089-1.546-.383-2.97-.837-4.118A6.004 6.004 0 0115.917 9h-1.946zm-2.003 2H8.032c.093 1.414.377 2.649.766 3.556.24.56.5.948.737 1.182.233.23.389.262.465.262.076 0 .232-.032.465-.262.238-.234.498-.623.737-1.182.389-.907.673-2.142.766-3.556zm1.166 4.118c.454-1.147.748-2.572.837-4.118h1.946a6.004 6.004 0 01-2.783 4.118zm-6.268 0C6.412 13.97 6.118 12.546 6.03 11H4.083a6.004 6.004 0 002.783 4.118z" clip-rule="evenodd"></path></svg>
                            Public
                        </span> 
                    </div>
                </a>
            </li>

        </ol>
    </div>


    <footer class="p-4 mt-5 w-full bg-white rounded-lg shadow md:flex md:items-center md:justify-between md:p-6 dark:bg-gray-800 overflow-hidden">
      <span class="text-sm text-gray-500 sm:text-center dark:text-gray-400">© 2023 <a href="https://flowbite.com/" class="hover:underline">Marc-Emmanuel™</a>. All Rights Reserved.
      </span>
      <ul class="flex flex-wrap items-center mt-3 text-sm text-gray-500 dark:text-gray-400 sm:mt-0">
          <li>
              <a href="#" class="mr-4 hover:underline md:mr-6 ">Accueil</a>
          </li>
          <li>
              <a href="#" class="mr-4 hover:underline md:mr-6">Ajouter</a>
          </li>
          <li>
              <a href="#" class="mr-4 hover:underline md:mr-6">Statistiques</a>
          </li>
          <li>
              <a href="#" class="hover:underline">Contact</a>
          </li>
      </ul>
  </footer>

</div>
</template>

<script>

  import { Carousel } from 'flowbite';

  export default {

    data(){
      return {
        appart: [],
        proprio: {},
        userRole: String,
        content: "",
        comments: [],
      }
    },

    methods: {

      async getAppart() {
        let token = localStorage.getItem('token');
        const _url = 'http://192.168.252.170:3001/api/apparts/getOneAppart/' + this.$route.params.id;
        let _datas = {};
        await fetch(_url, {method: 'GET', headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*', 'Authorization': 'Bearer ' + token }})
        .then((response) => response.json())
        .then((response) => {
            _datas = response.results[0];
        })
        .catch((error) => {
            console.log('ERROR : ', error);
        })
        return _datas;
      },

      async getComments() {
        let token = localStorage.getItem('token');
        const _url = 'http://192.168.252.170:3000/api/apparts/getComments/' + this.$route.params.id;
        let _datas = {};
        await fetch(_url, {method: 'GET', headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ' + token }})
        .then((response) => response.json())
        .then((response) => {
            _datas = response.resultat;
        })
        .catch((error) => {
            console.log('ERROR : ', error);
        })
        return _datas;
      },

      async createComment() {
        let token = localStorage.getItem('token');
        const _url = 'http://192.168.252.170:3000/api/apparts/createComment';
        let _data = {
          idUser: localStorage.getItem('userId'),
          idBien: this.$route.params.id,
          content: this.content,
          likes: 0
        };
        console.log(_data)
        if (this.content && this.content != ""){
          fetch(_url, {method: 'POST', headers: {'Content-Type': 'application/json',}, body: JSON.stringify(_data), 'Authorization': 'Bearer ' + token })
          .then((response) => response.json())
          .catch((error) => {
              console.log('ERROR : ', error);
          })
        }
      },

      async getProprio() {
        let token = localStorage.getItem('token');
        const _url = 'http://192.168.252.170:3000/api/apparts/getProprio/' + this.appart.id_proprio;
        let _datas = {};
        await fetch(_url, {method: 'GET', headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer ' + token }})
        .then((response) => response.json())
        .then((response) => {
            _datas = response.resultat;
        })
        .catch((error) => {
            console.log('ERROR : ', error);
        })
        return _datas;
      },

    },

    async created() {

      if (!localStorage.getItem('token')){
          this.$router.push({ name: 'signIn' });
      };

      this.appart = await this.getAppart();

      this.userRole = localStorage.getItem("userRole");

    },

    async mounted() {

      this.comments = await this.getComments();
      this.proprio = await this.getProprio();
      this.proprio = this.proprio[0]
      
      const items = [
        {
          position: 0,
          el: document.getElementById("carousel-item-1")
        },
        {
          position: 1,
          el: document.getElementById("carousel-item-2")
        },
        {
          position: 2,
          el: document.getElementById("carousel-item-3")
        },
        {
          position: 3,
          el: document.getElementById("carousel-item-4")
        },
        {
          position: 4,
          el: document.getElementById("carousel-item-5")
        },
      ];

      const options = {
        defaultPosition: 1,
        interval: 3000,
          
        indicators: {
          activeClasses: 'bg-white dark:bg-gray-800',
          inactiveClasses: 'bg-white/50 dark:bg-gray-800/50 hover:bg-white dark:hover:bg-gray-800',
          items: [
            {
              position: 0,
              el: document.getElementById("carousel-item-1"),
            },
            {
              position: 1,
              el: document.getElementById("carousel-item-2"),
            },
            {
              position: 2,
              el: document.getElementById("carousel-item-3"),
            },
            {
              position: 3,
              el: document.getElementById("carousel-item-4"),
            },
            {
              position: 4,
              el: document.getElementById("carousel-item-5"),
            },
          ]
        },
        // callback functions
        onNext: () => {
          // console.log('next slider item is shown');
        },
        onPrev: ( ) => {
          // console.log('previous slider item is shown');
        },
        onChange: ( ) => {
          // console.log('new slider item has been shown');
        }
      };

      const carousel = new Carousel(items, options);
      carousel.cycle()

      const $prevButton = document.getElementById("data-carousel-prev");
      const $nextButton = document.getElementById("data-carousel-next");

      $prevButton.addEventListener('click', () => {
          carousel.prev();
      });

      $nextButton.addEventListener('click', () => {
          carousel.next();
      });

  },

};


</script>

