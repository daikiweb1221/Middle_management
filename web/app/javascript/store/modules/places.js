const state = {
  places: [],
};

const getters = {
  places: (state) => state.places,
};

const mutations = {
  setPlaces: (state, places) => {
    state.places = places.sort((a, b) => b.id - a.id);
  },
  addPlace: (state, place) => {
    state.places.unshift(place);
  },
  deletePlace: (state, deletePlace) => {
    state.places = state.places.filter((place) => {
      return place.id != deletePlace.id;
    });
  },
};

const actions = {};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
