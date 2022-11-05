import Vue from "vue";
import Vuex from "vuex";
import axios from "../plugins/axios";
import users from './modules/users'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    users,
  },

  state: {
    subordinates: [],
  },

  getters: {
    subordinates: (state) => state.subordinates,
  },

  mutations: {
    setSubordinates: (state, subordinates) => {
      state.subordinates = subordinates;
    },
    addSubordinate: (state, subordinate) => {
      state.subordinates.push(subordinate);
    },
    updateSubordinate: (state, updateSubordinate) => {
      const index = state.subordinates.findIndex((subordinate) => {
        return subordinate.id == updateSubordinate.id;
      });
      state.subordinates.splice(index, 1, updateSubordinate);
    },
    deleteSubordinate: (state, deleteSubordinate) => {
      state.subordinates = state.subordinates.filter((subordinate) => {
        return subordinate.id != deleteSubordinate.id;
      });
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
