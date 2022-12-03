import axios from "../../plugins/axios";

const state = {
  everyday_behaviors: [],
  everyday_behavior: {},
};

const getters = {
  everyday_behaviors: (state) => state.everyday_behaviors,
  everyday_behavior: (state) => state.everyday_behavior,
};

const mutations = {
  setEverydayBehaviors: (state, everyday_behaviors) => {
    state.everyday_behaviors = everyday_behaviors;
    return (state.everyday_behavior = state.everyday_behaviors[0]);
  },
  addEverydayBehavior: (state, everyday_behavior) => {
    state.everyday_behaviors.push(everyday_behavior);
  },
  updateEverydayBehavior: (state, updateEverydayBehavior) => {
    const index = state.everyday_behaviors.findIndex((everyday_behavior) => {
      return everyday_behavior.id == updateEverydayBehavior.id;
    });
    state.everyday_behaviors.splice(index, 1, updateEverydayBehavior);
  },
};

const actions = {
  fetchEverydayBehaviors({ commit }) {
    axios
      .get("everyday_behaviors")
      .then((res) => {
        commit("setEverydayBehaviors", res.data);
      })
      .catch((err) => console.log(err.response));
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
