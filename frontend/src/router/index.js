import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AboutViewVue from '../views/AboutView.vue'
import CreateViewVue from '@/views/CreateView.vue'
import DisplayViewVue from '@/views/DisplayView.vue'
import ChartViewVue from '@/views/ChartView.vue'
import logInViewVue from '@/views/logInView.vue'
import signInViewVue from '@/views/SignInView.vue'

const routes = [{
        path: '/',
        name: 'home',
        component: HomeView
    },
    {
        path: '/shop/:id',
        name: 'shop',
        component: AboutViewVue
    },
    {
        path: '/create',
        name: 'create',
        component: CreateViewVue
    },
    {
        path: '/display/:id',
        name: 'display',
        component: DisplayViewVue
    },
    {
        path: '/chart',
        name: 'chart',
        component: ChartViewVue
    },
    {
        path: '/logIn',
        name: 'logIn',
        component: logInViewVue
    },
    {
        path: '/signIn',
        name: 'signIn',
        component: signInViewVue
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router