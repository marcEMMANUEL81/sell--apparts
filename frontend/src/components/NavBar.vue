import router from '@/router';
<template>
  <div class="z-10 bg-white dark:bg-gray-900">
    <nav
      v-if="ready"
      id="targetEl"
      class="fixed w-full bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900"
    >
      <div
        class="container flex flex-wrap items-center justify-between mx-auto"
      >
        <a href="/" class="flex items-center">
          <span
            class="ml-5 self-center text-xl font-semibold whitespace-nowrap dark:text-white"
            >BAT CI</span
          >
        </a>
        <button
          @click="collapse.expand()"
          id="triggerEl"
          data-collapse-toggle="navbar-default"
          type="button"
          class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
          aria-controls="navbar-default"
          aria-expanded="false"
        >
          <span class="sr-only">Open main menu</span>
          <svg
            class="w-6 h-6"
            aria-hidden="true"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              fill-rule="evenodd"
              d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
              clip-rule="evenodd"
            ></path>
          </svg>
        </button>
        <div class="hidden w-full md:block md:w-auto" id="navbar-default">
          <ul
            class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700"
          >
            <li>
              <router-link to="/">
                <a
                  href="#"
                  class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white"
                  aria-current="page"
                  >Accueil</a
                >
              </router-link>
            </li>
            <li v-if="userRole === 'admin'">
              <router-link to="/create">
                <a
                  href="#"
                  class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"
                  >Ajouter</a
                >
              </router-link>
            </li>
            <li v-if="userRole === 'admin'">
              <router-link to="/chart">
                <a
                  href="#"
                  class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"
                  >Statistiques</a
                >
              </router-link>
            </li>
            <li v-if="token">
              <router-link to="/signIn">
                <a
                  href="#"
                  @click="remove()"
                  class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"
                  >D??connexion</a
                >
              </router-link>
            </li>
            <li v-else>
              <router-link to="/signIn">
                <a
                  href="#"
                  @click="remove()"
                  class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent"
                  >connexion</a
                >
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
import SignInView from "@/views/SignInView.vue";
import { Collapse } from "flowbite";

export default {
  name: "NavBar",
  component: {
    // logInView,
    SignInView,
  },

  data() {
    return {
      token: String,
      userRole: String,
      ready: false,
    };
  },

  methods: {
    remove() {
      localStorage.removeItem("token");
      localStorage.removeItem("userId");
      localStorage.removeItem("userRole");
    },
  },

  created() {
    this.token = localStorage.getItem("token");
    this.userRole = localStorage.getItem("userRole");
    this.ready = true;

    /*
     * $targetEl: required
     * $triggerEl: optional
     * options: optional
     */
    const collapse = new Collapse(
      document.getElementById("targetEl"),
      document.getElementById("targetEl"),
      {
        onCollapse: () => {
          console.log("element has been collapsed");
        },
        onExpand: () => {
          console.log("element has been expanded");
        },
        onToggle: () => {
          console.log("element has been toggled");
        },
      }
    );
  },
};
</script>