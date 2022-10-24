import Vue from "vue";
import Router from "vue-router";

import TopIndex from "../pages/top/index";
// import TaskIndex from "../pages/task/index";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex",
    }
  ],
})

export default router