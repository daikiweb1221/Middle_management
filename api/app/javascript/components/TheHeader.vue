<template>
  <div>
    <template v-if="this.$route.path === '/introduction'"></template>
    <div v-else-if="this.$route.path === '/everyday_behavior_register'"></div>
    <template v-else>
      <v-navigation-drawer app v-model="drawer" clipped>
        <v-container>
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title class="title">
                Navigation lists
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
                <v-list-item-title>Home</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-container>
      </v-navigation-drawer>
    </template>
    <v-app-bar color="#4B90B9" dark app clipped-left>
      <template v-if="this.$route.path === '/introduction'"></template>
      <div v-else-if="this.$route.path === '/everyday_behavior_register'"></div>
      <template v-else>
        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      </template>
      <v-toolbar-title>Middle Management</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <template v-if="this.$route.path === '/introduction'"></template>
        <div v-else-if="this.$route.path === '/everyday_behavior_register'"></div>
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
    async handleLogout() {
      try {
        await this.logoutUser();
        this.$router.push({ name: "TopIndex" });
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
