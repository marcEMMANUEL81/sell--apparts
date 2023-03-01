import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import Flickity from "vue-flickity";
import "./index.css";

createApp(App).use(store).use(Flickity).use(router).mount("#app");