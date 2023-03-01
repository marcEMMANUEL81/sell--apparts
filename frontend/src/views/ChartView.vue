<template class="px-5 mt-30">
    <div class="">
        <p class="text-items-center text-4xl font-semibold leading-relaxed text-gray-900 dark:text-white ml-5 mt-20 ">Graphiques</p>
        <div class="my-9 flex justify-center items-center">
            <div class="w-1/3">
                <Bar 
                    v-if="isReady"
                    id="my-chart-id"
                    :options="chartOptions"
                    :data="chartData"
                />
            </div>
            <div class="w-1/3">
                <Doughnut 
                    v-if="isReadyDoughnut"
                    id="my-chart-id"
                    :options="chartOptionsDoughnut"
                    :data="chartDataDoughnut"
                />
            </div>
        </div>
    
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg p-5">
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                Type
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Date
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Id du bien
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Type de bien
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="event in events" :key="event" class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                {{ event.action }}
                            </th>
                            <td class="px-6 py-4">
                                {{ event.date }}
                            </td>
                            <td v-if="event.idAppart < 10" class="px-6 py-4">
                                0{{ event.idAppart }}
                            </td>
                            <td v-else class="px-6 py-4">
                                {{ event.idAppart }}
                            </td>
                            <td class="px-6 py-4">
                                {{ event.nomApart }}
                            </td>
                            <!-- <td class="px-6 py-4">
                                <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                            </td> -->
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
    </div>




</template>

<script>

import { Bar } from 'vue-chartjs'
import { Doughnut } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)
import {Chart, ArcElement} from 'chart.js'
Chart.register(ArcElement);

export default{

    components: { Bar, Doughnut },

    data() {
        return {
            events: [],
            isReady: false,
            isReadyDoughnut: false,
            chartData: {
                labels: [ 'A louer', 'loué' ],
                datasets: [
                    { 
                        backgroundColor: ['#FFB100', '#9D3C72'],
                        data: null,
                    } 
                ],
            },
            chartOptions: {
                responsive: true
            },

            chartDataDoughnut: {
                labels: [ 'Proprio 1', 'Proprio 2' ],
                datasets: [
                    { 
                        backgroundColor: ['#5B8FB9', '#F94A29'],
                        data: null,
                    } 
                ],
            },
            chartOptionsDoughnut: {
                responsive: true
            },
        }
    },

    methods: {

        async getFreeApparts() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3002/getFreeApparts.php';
            let _datas = {};
            await fetch(_url)
            .then((response) => response.json())
            .then((response) => {
                _datas = response.nbrAppartsLibre;
            })
            .catch((error) => {
                console.log('ERROR : ', error);
            })
            return _datas;
        },

        async getEvents() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3001/api/apparts/getEvents';
            let _datas = {};
            await fetch(_url, {method: 'GET', headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*', 'Authorization': 'Bearer ' + token }})
            .then((response) => response.json())
            .then((response) => {
                _datas = response.results;
            })
            .catch((error) => {
                console.log('ERROR : ', error);
            })
            return _datas;
        },

        async getBuyApparts() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3002/getSellsApparts.php';
            let _datas = {};
            await fetch(_url)
            .then((response) => response.json())
            .then((response) => {
                _datas = response.nombreVente;
            })
            .catch((error) => {
                console.log('ERROR : ', error);
            })
            return _datas;
        },

        async proprioStats() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3002/appartByProprio.php';
            let _datas = {};
            await fetch(_url)
            .then((response) => response.json())
            .then((response) => {
                _datas = [response[0]["totalBiens"], response[1]["totalBiens"]]
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
        } else if (localStorage.getItem('userRole') == "user"){
            this.$router.push({ name: 'home' });
        }

        this.events = await this.getEvents();

        this.chartData["datasets"][0]["data"] = [parseInt(await this.getFreeApparts()), parseInt(await this.getBuyApparts())]
        this.isReady = true;

        this.chartDataDoughnut["datasets"][0]["data"] = Object.values(await this.proprioStats())
        this.isReadyDoughnut = true;
        
    },

}

</script>