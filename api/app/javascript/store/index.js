import Vue from "vue";
import Vuex from "vuex";
import subordinates from "./modules/subordinates";
import users from "./modules/users";
import everyday_behaviors from "./modules/everyday_behaviors";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    subordinates,
    users,
    everyday_behaviors,
  },
});
