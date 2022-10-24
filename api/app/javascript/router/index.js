import Vue from "vue";
import Router from "vue-router";

import TopIndex from "../pages/top";
import  SignUpIndex from "../pages/signup";
import  SubordinateIndex from "../pages/subordinate";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex",
    },
    {
      path: "/signup",
      component: SignUpIndex,
      name: "SignUpIndex"
    },
    {
      path: "/subordinate",
      component: SubordinateIndex,
      name: "SubordinateIndex"
    },
  ],
})

export default router