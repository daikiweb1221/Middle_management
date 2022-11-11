<template>
  <div>
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
      </v-container>
    </v-navigation-drawer>
    <v-app-bar color="#4B90B9" dark app clipped-left>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Middle Management</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <template v-if="!authUser">
          <v-btn text :to="{ name: 'LoginIndex' }">ログイン</v-btn>
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
                    ><v-list-item-title>{{ authUser.email }}</v-list-item-title>
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
