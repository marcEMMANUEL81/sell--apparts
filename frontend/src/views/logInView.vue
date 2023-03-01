<template>
    <div class="m-5 mt-20">
		<form class="max-w-2xl mx-auto mt-20">
			<div v-if="active" class="error">
				le champ {{ valid[0] }} n'a pas été correctement rempli !
			</div>
			<div v-if="success" class="success">
				Inscription reussie !
			</div>
			<p class="text-items-center text-4xl font-semibold leading-relaxed text-gray-900 dark:text-white mb-9">Inscription</p>
			<div class="mb-10">
				<label for="nom" class="block mb-2 text-sm font-medium dark:text-white text-gray-900 text-left">Entrez votre nom</label>
				<input type="text" v-model="name" id="nom" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: marcemmanuel81@gmail.com" required>
			</div>
			<div class="mb-10">
				<label for="number" class="block mb-2 text-sm font-medium dark:text-white text-gray-900 text-left">Entrez votre numéro</label>
				<input type="tel" v-model="number" id="number" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: Emmanuel2003" required>
			</div>
			<div class="mb-10">
				<label for="email" class="block mb-2 text-sm font-medium dark:text-white text-gray-900 text-left">Entrez votre email</label>
				<input type="email" v-model="email" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: Emmanuel2003" required>
			</div>
			<div class="mb-10">
				<label for="password" class="block mb-2 text-sm font-medium dark:text-white text-gray-900 text-left">Entrez votre mot de passe</label>
				<input type="password" v-model="password" id="password" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="ex: Emmanuel2003" required>
			</div>
			<button @click="createUser()" class="my-3 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
        		<p id="set">S'nscrire</p>
        		<div id="loader" class="loader"></div>
            </button>
			<p class="my-9">
				Vous n'avez pas de compte ? <router-link class="text-blue-700" to="/signIn">cliquez ici !</router-link>
			</p>
        </form>
    </div>
</template>

<script>								

	export default {
		name: "logIn",
		data(){
			return {
				name: "",
				number: "",
				email: "",
				password: "",
				active: false,
				valid: [],
				success: false,
			}
		},
		methods: {
			createUser() {
				console.log('hello');
				const _url = 'http://192.168.252.170:3000/api/apparts/createUser';
				const _data = {
					nom: this.name,
					numero: this.number,
					email: this.email,
					password: this.password,
				};

				console.log(_data)

				let tab = [];
				Object.keys(_data).forEach((el) => {
					if(_data[el].length == 0){
						tab.push(el);
					}
				})

				if (tab.length == 0){
					fetch(_url, {method: 'POST', headers: {'Content-Type': 'application/json',}, body: JSON.stringify(_data)})
						.then((response) => {
							response.json();
							this.success = true;
							this.active = false;
							let texte = document.querySelector("#set");
							texte.innerHTML = "";
							let loader = document.querySelector("#loader");
							loader.style.display = "block";
							setTimeout(() => {
								this.$router.push({ name: 'signIn' });
							}, "2000",
							)
						})
						.catch((error) => Console.log(error)
					)
				} else {
					this.active = true;
					this.success = false;
					this.valid = tab;
				}
			}
		},
		mounted() {
			const inputs = document.querySelectorAll(".input");

			function addcl(){
				let parent = this.parentNode.parentNode;
				parent.classList.add("focus");
			}

			function remcl(){
				let parent = this.parentNode.parentNode;
				if(this.value == ""){
					parent.classList.remove("focus");
				}
			}

			inputs.forEach(input => {
				input.addEventListener("focus", addcl);
				input.addEventListener("blur", remcl);
			});
		}
	}

</script>

<style scoped>

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