<template>

    <div class="flex justify-center px-5 mt-9">
        <div>
            <div class="mt-9">
                <div v-if="active" class="error text-red-700">
                    le champ {{ valid[0] }} n'a pas été correctement rempli !
                </div>
                <div v-if="success" class="success text-green-700">
                    Bien ajouté avec succès !
                </div>
            </div>

            <div class="flex flex-wrap items-center my-9">
                <button @click="getBack" type="button" class="text-white my-5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">retour</button>
                <p class="max-w-lg text-items-center text-4xl font-semibold leading-relaxed text-gray-900 dark:text-white m-5">Ajouter un appartement</p>
            </div>
    
            <form class="flex flex-col mt-5" action="">
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm font-medium dark:text-white text-gray-900 text-left">Entrez l'url de votre image</label>
                    <input type="text" v-model="imageUrl" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: https://images.pexels.com/photos/to" required>
                </div>
    
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 text-left dark:text-white">Entrez le titre de votre bien</label>
                    <input type="text" v-model="name" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="residence brou ..." required>
                </div>
    
                <label for="type" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Choisissez le type de bien</label>
                <select v-model="type" id="type" class="bg-gray-50 border text-gray-900 border-gray-300 mb-6  text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                    <option value="">ex: maison ...</option>
                    <option>Maison</option>
                    <option>Appartement</option>
                    <option>Magasin</option>
                    <option>Espace Evênementiel</option>
                </select>
    
                <div class="mb-6">
                    <label for="email" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Entrez le lieu du lien</label>
                    <input type="text" v-model="place" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: angré ..." required>
                </div>
                
                <div class="mb-6">
                    <label for="email" class="dark:text-white block mb-2 text-sm font-medium text-gray-900 text-left">Entrez le prix de location</label>
                    <input type="number" v-model="price" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: 250000" required>
                </div>

                <button @click="sendInformations()" class="my-3 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
                    <p id="set">Valider</p>
                    <div id="loader" class="loader"></div>
                </button>
            </form>
        </div>
    </div>
    
</template>

<script>
export default{
    name: "CreateView",
    data() {
        return{
            imageUrl: "",
            name: "",
            type: "",
            place: "",
            price: 0,
            sell: 0,
            idProprio: 2,
            active: false,
            valid: [],
            success: false,
        }
    },
    methods: {

        getBack() {
            this.$router.push({ name: 'home' });
            return true
        },

        sendInformations() {
            let token = localStorage.getItem('token');
            const _url = 'http://192.168.252.170:3000/api/apparts/addApparts';
            const _data = {
                image: this.imageUrl,
                titre: this.name,
                type: this.type,
                lieu: this.place,
                prix: this.price,
                vendu: this.sell,
                id_proprio: this.idProprio,
            };

            let tab = [];
            Object.keys(_data).forEach((el) => {
                if(_data[el].length == 0){
                    tab.push(el);
                }
            })

            if (tab.length == 0){
                fetch(_url, {method: 'POST', headers: {'Content-Type': 'application/json',}, body: JSON.stringify(_data), 'Authorization': 'Bearer ' + token })
                    .then((response) => response.json())
                    .catch((error) => Object.values(error))
                    this.imageUrl = ""; this.name = ""; this.type = ""; this.place = ""; this.price = "";
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
            } else {
                this.active = true;
                this.success = false;
                this.valid = tab;
            }
        }
    },

    created() {

        if (!localStorage.getItem('token')){
            this.$router.push({ name: 'signIn' });
        } else if (localStorage.getItem('userRole') == "user"){
            this.$router.push({ name: 'home' });
        }
        
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