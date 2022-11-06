import Vue from "vue";
import Vuex from "vuex";
import subordinates from "./modules/subordinates";
import users from "./modules/users";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    subordinates,
    users,
  },
});
