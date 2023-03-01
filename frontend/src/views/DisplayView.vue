<template>
    <div class="flex justify-center px-5 mt-15">
        <div>
            
            <div class="flex flex-wrap items-center my-9">
                <p class="max-w-lg text-items-center text-4xl font-semibold leading-relaxed text-gray-900 dark:text-white m-5">Ajouter un appartement</p>
            </div>

            <div class="mt-6">
                <div v-if="active" class="error text-red-700">
                    le champ {{ valid[0] }} n'a pas été correctement rempli !
                </div>
                <div v-if="success" class="success text-green-700">
                    Bien modifié avec succès !
                </div>
            </div>
    
            <form class="flex flex-col mt-5" action="">
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm font-medium dark:text-white text-gray-900 text-left">Entrez l'url de votre image</label>
                    <input type="text" v-model="appart.image" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: https://images.pexels.com/photos/to" required>
                </div>
    
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 text-left dark:text-white">Entrez le titre de votre bien</label>
                    <input type="text" v-model="appart.titre" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="residence brou ..." required>
                </div>
    
                <label for="type" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Choisissez le type de bien</label>
                <select v-model="appart.type" id="type" class="bg-gray-50 border border-gray-300 mb-6 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <option value="">ex: maison ...</option>
                    <option>Maison</option>
                    <option>Appartement</option>
                    <option>Magasin</option>
                    <option>Espace Evênementiel</option>
                </select>
    
                <div class="mb-6">
                    <label for="email" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Entrez le lieu du lien</label>
                    <input type="text" v-model="appart.lieu" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: angré ..." required>
                </div>
                
                <div class="mb-6">
                    <label for="email" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Entrez le prix de location</label>
                    <input type="number" v-model="appart.prix" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: 250000" required>
                </div>

                <div class="mb-6">
                    <label for="select" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Le bien est-il loué ou à louer</label>
                    <select v-model="appart.vendu" id="select" class="bg-gray-50 border border-gray-300 mb-6 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option value="0" selected v-if="appart.vendu == 0">A louer</option>
                        <option value="1" selected v-if="appart.vendu == 1">loué</option>
                        <option value="1" v-if="appart.vendu == 0">loué</option>
                        <option value="0" v-if="appart.vendu == 1">A louer</option>>
                    </select>
                </div>

                <button @click="deleteInformations()" class="my-3 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                    <p id="set2">Supprimer</p>
                    <div id="loader2" class="loader"></div>
                </button>

                <button @click="sendInformations()" class="my-3 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                    <p id="set">Modifier</p>
                    <div id="loader" class="loader"></div>
                </button>

            </form>
        </div>
    </div>
</template>

<script>
export default {

    name: "DisplayView",

    data() {
        return {
            appart: {},
            active: false,
            valid: [],
            success: false,
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

        async deleteInformations() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3000/api/apparts/deleteApparts/' + this.appart.id_appart;
            fetch(_url, { method: 'DELETE', 'Authorization': 'Bearer ' + token })
            .then((response) => response.json())
            .then((response) => console.log(response))
            .catch((error) => {
                console.log('ERROR : ', error);
            })
            let texte = document.querySelector("#set2");
            texte.innerHTML = "";
            let loader = document.querySelector("#loader2");
            loader.style.display = "block";
            setTimeout(() => {
                this.$router.push({ name: 'home' });
            }, "2000")

        },

        async sendInformations() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3001/api/apparts/modifyOneAppart/' + this.appart.id_appart;
            let select = document.querySelector("#select").value;
            const _data = {
                image: this.appart.image,
                titre: this.appart.titre,
                type: this.appart.type,
                lieu: this.appart.lieu,
                prix: this.appart.prix,
                vendu: select,
            };

            let tab = [];
            Object.keys(_data).forEach((el) => {
                if(_data[el].length == 0){
                    tab.push(el);
                }
            })

            if (tab.length == 0){
                fetch(_url, {method: 'PUT', headers: {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*', 'Authorization': 'Bearer ' + token }, body: JSON.stringify(_data)})
                    .then((response) => response.json())
                    .catch((error) => Object.values(error))
                    this.success = true;
                    this.active = false;
                    let texte = document.querySelector("#set");
                    texte.innerHTML = "";
                    let loader = document.querySelector("#loader");
                    loader.style.display = "block";
                    setTimeout(() => {
                        this.$router.push({ name: 'home' });
                    }, "2000"
                )
            } else{
                this.active = true;
                this.success = false;
                this.valid = tab;
            }
        },

    },

    async created() {

        if (!localStorage.getItem('token')){
            this.$router.push({ name: 'signIn' });
        }

        this.appart = await this.getAppart();
        
    },
 
}
</script>

<style>

    .error
    {
        background: rgba(255, 0, 0, 0.368);
        color: red;
        display: inline-block;
        padding: 15px;
        border-radius: 5px;
    }
    .success
    {
        background: rgba(0, 255, 0, 0.368);
        color: green;
        display: inline-block;
        padding: 15px;
        border-radius: 5px;
    }

    .loader{
        display: none;
        height: 30px;
        width: 30px;
        pointer-events: none;
        border-radius: 50%;
        border-top: solid 3px transparent;
        border-top-color: #fff;
        animation: anim 1s ease infinite;
    }

    @keyframes anim {
        0%{
            transform: rotate(0turn);
        }
        100%{
            transform: rotate(1turn);
        }
    }

</style>