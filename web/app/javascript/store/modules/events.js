import axios from "../../plugins/axios";

const state = {
  events: [],
};

const getters = {
  events: (state) => state.events,
};

const mutations = {
  setEvents: (state, events) => (state.events = events),
};

const actions = {
  async fetchEvents({ commit }) {
    const res = await axios.get("events");
    commit("setEvents", res.data);
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
