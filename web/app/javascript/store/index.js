import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";
import subordinates from "./modules/subordinates";
import users from "./modules/users";
import everyday_behaviors from "./modules/everyday_behaviors";
import places from "./modules/places";
import communications from "./modules/communications";
import events from "./modules/events";
import flash_messages from "./modules/flash_messages";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    subordinates,
    users,
    everyday_behaviors,
    places,
    communications,
    events,
    flash_messages,
  },

  // `createPersistedState()`でインスタンス作成。引数に設定を書く
  plugins: [
    createPersistedState({
      // ストレージのキーを指定。デフォルトではvuex
      key: "MiddleManagementApp",

      // 管理対象のステートを指定。pathsを書かない時は`modules`に書いたモジュールに含まれるステート全て。`[]`の時はどれも保存されない
      paths: ["communications.communications"],

      // ストレージの種類を指定する。デフォルトではローカルストレージ
      storage: window.localStorage,
    }),
  ],
});
