import axios from "../../plugins/axios";

const state = {
  subordinates: [],
};

const getters = {
  subordinates: (state) => state.subordinates,
};

const mutations = {
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
};

const actions = {
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
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
