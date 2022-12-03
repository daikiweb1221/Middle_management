import axios from "../../plugins/axios";

const state = {
  communications: [],
};

const getters = {
  communications: (state) => state.communications,
};

const mutations = {
  setCommunications: (state, communications) => {
    state.communications = communications;
  },
  addCommunication: (state, communication) => {
    state.communications.push(communication);
  },
  deleteCommunication: (state, deleteCommunication) => {
    state.communications = state.communications.filter((communication) => {
      return communication.id != deleteCommunication.id;
    });
  },
  deleteCommunicationSubordinates: (state, communicationSubordinates) => {
    state.communications = communicationSubordinates.splice(0);
  },
};

const actions = {
  fetchCommunications({ commit }) {
    axios
      .get("subordinates/communications")
      .then((res) => {
        commit("setCommunications", res.data);
      })
      .catch((err) => console.log(err.response));
  },
  createCommunication({ commit }, communication) {
    return axios.post("communications", communication).then((res) => {
      commit("addCommunication", res.data);
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
