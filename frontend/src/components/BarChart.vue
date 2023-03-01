<template>
    <Bar
      id="my-chart-id"
      :options="chartOptions"
      :data="chartData"
    />
</template>
  
<script>
  import { Bar } from 'vue-chartjs'
  import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
  
  ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

  export default {

    name: "BarChart",
    components: {
         Bar 
    },

    props: {
      data1: Number, 
      data2: Number
    },

    data() {
      return {
        chartData: {
          labels: [ 'A louer', 'Vendu' ],
          datasets: [
            { 
              data: [this.data1, this.data2],
              backgroundColor: ['#f87979', '#567'],
            } 
          ],
        },
        chartOptions: {
          responsive: true
        },
      }
    },

    created() {
      this.chartData['datasets'][0]['data'][0] = this.data1;
      this.chartData['datasets'][0]['data'][1] = this.data2;
    },

    mounted() {
      this.chartData['datasets'][0]['data'][0] = this.data1;
      this.chartData['datasets'][0]['data'][1] = this.data2;
    }

  }
</script>