import Vue from "vue";
import Vuex from "vuex";
import axios from "../plugins/axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    subordinates: [],
    subordinate: {
    },
  },

  getters: {
    subordinates: (state) => state.subordinates,
    subordinate: (state) => state.subordinate,
  },

  mutations: {
    setSubordinates: (state, subordinates) => {
      state.subordinates = subordinates;
    },
    addSubordinate: (state, subordinate) => {
      state.subordinates.push(subordinate);
    },
  },

  actions: {
    fetchSubordinates({ commit }) {
      axios
        .get("subordinates")
        .then((res) => {
          commit("setSubordinates", res.data);
        })
        .catch((err) => console.log(err.response));
    },
    createSubordinate({ commit }, subordinate) {
      return axios.post("subordinates", subordinate).then((res) => {
        commit("addSubordinate", res.data);
      });
    },
  },
});
