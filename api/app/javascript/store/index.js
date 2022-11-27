import Vue from "vue";
import Vuex from "vuex";
import subordinates from "./modules/subordinates";
import users from "./modules/users";
import everyday_behaviors from "./modules/everyday_behaviors";
import places from "./modules/places";
import communications from "./modules/communications";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    subordinates,
    users,
    everyday_behaviors,
    places,
    communications,
  },
});
