<template>
  <div>
    <template v-if="this.$route.path === '/introduction'"></template>
    <div v-else-if="this.$route.path === '/everyday_behavior_register'"></div>
    <div v-else-if="this.$route.path === '/mindset'"></div>
    <div v-else-if="this.$route.path === '/'"></div>
    <div v-else-if="this.$route.path === '/register'"></div>
    <div v-else-if="this.$route.path === '/login'"></div>
    <div v-else-if="this.$route.path === '/ideal_boss_checks/not-login'"></div>
    <template v-else>
      <v-navigation-drawer app v-model="drawer" clipped>
        <v-container>
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title style="font-size: 1rem">
                メニューリスト
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-divider></v-divider>
          <v-list dense nav>
            <v-list-item :to="{ name: 'SubordinateIndex' }">
              <v-list-item-icon>
                <v-icon>mdi-home</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>メンバー</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
          <v-list dense nav>
            <v-list-item :to="{ name: 'ProfileIndex' }">
              <v-list-item-icon>
                <v-icon>mdi-account</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>マイページ</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
          <v-list dense nav>
            <v-list-item :to="{ name: 'IdealBossChecks' }">
              <v-list-item-icon>
                <v-icon>mdi-account-heart</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>理想の上司度チェック</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
          <v-list dense nav>
            <v-list-item :to="{ name: 'CommunicationSubordinatesIndex' }">
              <v-list-item-icon>
                <v-icon>mdi-account-heart</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>コミュニケーション済一覧</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
          <v-list dense nav>
            <v-list-item :to="{ name: 'CalendarIndex' }">
              <v-list-item-icon>
                <v-icon>mdi-account-heart</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>ToDo</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-container>
      </v-navigation-drawer>
    </template>
    <v-app-bar class="header" dark app clipped-left>
      <template v-if="this.$route.path === '/introduction'"></template>
      <div v-else-if="this.$route.path === '/everyday_behavior_register'"></div>
      <div v-else-if="this.$route.path === '/mindset'"></div>
      <div v-else-if="this.$route.path === '/'"></div>
      <div v-else-if="this.$route.path === '/register'"></div>
      <div v-else-if="this.$route.path === '/login'"></div>
      <div
        v-else-if="this.$route.path === '/ideal_boss_checks/not-login'"
      ></div>
      <template v-else>
        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      </template>
      <router-link style="text-decoration: none; color: white" to="/"
        ><v-toolbar-title>Middle Management</v-toolbar-title></router-link
      >
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <template v-if="this.$route.path === '/introduction'"></template>
        <div
          v-else-if="this.$route.path === '/everyday_behavior_register'"
        ></div>
        <div v-else-if="this.$route.path === '/mindset'"></div>

        <template v-else>
          <template v-if="!authUser">
            <v-btn class="font-weight-bold" text :to="{ name: 'RegisterIndex' }"
              >新規登録</v-btn
            >
            <v-btn class="font-weight-bold" text :to="{ name: 'LoginIndex' }"
              >ログイン</v-btn
            >
          </template>
          <template v-else>
            <v-menu offset-y>
              <template v-slot:activator="{ on }">
                <v-btn icon x-large v-on="on">
                  <v-avatar size="48">
                    <v-img
                      :src="authUser.avatar_url"
                      v-if="authUser.avatar_url"
                    ></v-img>
                    <v-icon v-else>mdi-account-circle</v-icon>
                  </v-avatar>
                </v-btn>
              </template>
              <v-list>
                <v-list-item>
                  <v-list-item-content>
                    <v-list-item>
                      <v-list-item-avatar size="36px">
                        <v-img
                          :src="authUser.avatar_url"
                          v-if="authUser.avatar_url"
                        ></v-img>
                        <v-icon v-else>mdi-account-circle</v-icon>
                      </v-list-item-avatar>
                      <v-list-item-title>{{ authUser.name }}</v-list-item-title>
                    </v-list-item>
                    <v-list-item
                      ><v-list-item-title>{{
                        authUser.email
                      }}</v-list-item-title>
                    </v-list-item>
                  </v-list-item-content>
                </v-list-item>
                <v-list-item :to="{ name: 'ProfileIndex' }">
                  <v-list-item-content>
                    <v-list-item-title
                      ><v-icon>mdi-account-edit</v-icon
                      >マイページ</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>
                <v-list-item to="#" @click.native="handleLogout">
                  <v-list-item-content>
                    <v-list-item-title
                      ><v-icon>mdi-logout</v-icon>ログアウト</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-menu>
          </template>
        </template>
      </v-toolbar-items>
    </v-app-bar>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "TheHeader",

  data() {
    return {
      drawer: null,
    };
  },

  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    ...mapActions("flash_messages", ["showMessage"]),
    async handleLogout() {
      try {
        await this.logoutUser();
        this.$router.push({ name: "TopIndex" });
        this.showMessage({
          message: "ログアウトしました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "ログアウトに失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
  },
};
</script>

<style scoped>
.header {
  background-color: #21d4fd;
  background-image: linear-gradient(19deg, #21d4fd 0%, #3a21ff 100%);
}
</style>
