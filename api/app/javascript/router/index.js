import Vue from "vue";
import Router from "vue-router";
import store from "../store";
import TopIndex from "../pages/top";
import TopIntroduction from "../pages/top/introduction";
import TopMindSet from "../pages/top/mindset";
import IdealBossChecks from "../pages/ideal_boss_checks";
import IdealBossChecksNotLogin from "../pages/ideal_boss_checks/not-login";
import SubordinateIndex from "../pages/subordinates";
import SubordinateDetail from "../pages/subordinate";
import RegisterIndex from "../pages/register/index";
import LoginIndex from "../pages/login/index";
import ProfileIndex from "../pages/profile";
import ProfileEdit from "../pages/profile/edit";
import EverydayBehaviorRegister from "../pages/everyday_behaviors/register";
import EverydayBehaviorIndex from "../pages/everyday_behaviors/index";
import EverydayBehaviorEditPage from "../pages/everyday_behaviors/edit";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex",
    },
    {
      path: "/introduction",
      component: TopIntroduction,
      name: "TopIntroduction",
      meta: { requiredAuth: true },
    },
    {
      path: "/mindset",
      component: TopMindSet,
      name: "TopMindSet",
      meta: { requiredAuth: true },
    },
    {
      path: "/ideal_boss_checks",
      component: IdealBossChecks,
      name: "IdealBossChecks",
    },
    {
      path: "/ideal_boss_checks/not-login",
      component: IdealBossChecksNotLogin,
      name: "IdealBossChecksNotLogin",
    },
    {
      path: "/subordinates",
      component: SubordinateIndex,
      name: "SubordinateIndex",
      meta: { requiredAuth: true },
    },
    {
      path: "/everyday_behavior_register",
      component: EverydayBehaviorRegister,
      name: "EverydayBehaviorRegister",
      meta: { requiredAuth: true },
    },
    {
      path: "/everyday_behavior_index",
      component: EverydayBehaviorIndex,
      name: "EverydayBehaviorIndex",
      meta: { requiredAuth: true },
    },
    {
      path: "/everyday_behavior_edit",
      component: EverydayBehaviorEditPage,
      name: "EverydayBehaviorEditPage",
      meta: { requiredAuth: true },
    },
    {
      path: "/register",
      component: RegisterIndex,
      name: "RegisterIndex",
    },
    {
      path: "/login",
      component: LoginIndex,
      name: "LoginIndex",
    },
    {
      path: "/profile",
      component: ProfileIndex,
      name: "ProfileIndex",
      meta: { requiredAuth: true },
    },
    {
      path: "/profile_edit",
      component: ProfileEdit,
      name: "ProfileEdit",
      meta: { requiredAuth: true },
    },
    {
      path: "/:id",
      component: SubordinateDetail,
      name: "SubordinateDetail",
      meta: { requiredAuth: true },
    },
  ],
});

router.beforeEach((to, from, next) => {
  store.dispatch("users/fetchAuthUser").then((authUser) => {
    if (to.matched.some((record) => record.meta.requiredAuth) && !authUser) {
      next({ name: "LoginIndex" });
    } else {
      next();
    }
  });
});

export default router;
