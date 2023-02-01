import { createStore } from 'vuex'

export default createStore({
  state: {
    apparts: [
      {
        image: 'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'white appart, abatta',
        type: 'Appartement',
        prix: '250000 Fcfa'
      },
      {
        image: 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Maison jaune',
        type: 'Maison',
        prix: '170000 Fcfa'
      },
      {
        image: 'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Magasin blanc',
        type: 'Magasin',
        prix: '320000 Fcfa'
      },
      {
        image: 'https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        name: 'Appartement jaune',
        type: 'Appartement',
        prix: '450000 Fcfa'
      },
    ]
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
  }
})
