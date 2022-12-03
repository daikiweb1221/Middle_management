<template>
  <div class="position-center container">
    <v-card class="mb-5">
      <v-list-item three-line>
        <v-list-item-avatar size="80">
          <v-img :src="authUser.avatar_url" v-if="authUser.avatar_url"></v-img>
          <v-icon v-else size="80">mdi-account-circle</v-icon>
        </v-list-item-avatar>
        <v-list-item-content>
          <div class="text-overline mb-1">Profile</div>
          <v-list-item-title class="text-h5 mb-1">
            {{ authUser.name }}
          </v-list-item-title>
          <v-list-item-subtitle>{{ authUser.email }}</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>

      <v-card-actions style="justify-content: end">
        <v-btn :to="{ name: 'ProfileEdit' }" color="primary" fab small dark>
          <v-icon>mdi-account-edit</v-icon>
        </v-btn>
      </v-card-actions>
    </v-card>
    <v-card>
      <v-card-title
        >{{ authUser.name }}さんが日常で目指すべき姿【五ヶ条】</v-card-title
      >
      <v-card-text>
        <p class="mb-3 text--primary">
          １.{{ everyday_behavior.behaviors_one }}
        </p>
        <p class="mb-3 text--primary">
          ２.{{ everyday_behavior.behaviors_two }}
        </p>
        <p class="mb-3 text--primary">
          ３.{{ everyday_behavior.behaviors_three }}
        </p>
        <p class="mb-3 text--primary">
          ４.{{ everyday_behavior.behaviors_four }}
        </p>
        <p class="mb-3 text--primary">
          ５.{{ everyday_behavior.behaviors_five }}
        </p>
      </v-card-text>
      <v-card-actions style="justify-content: end">
        <v-btn
          :to="{ name: 'EverydayBehaviorEditPage' }"
          outlined
          small
          fab
          color="indigo"
        >
          <v-icon>mdi-pencil</v-icon>
        </v-btn>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "ProfileIndex",
  computed: {
    ...mapGetters("everyday_behaviors", ["everyday_behavior"]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchEverydayBehaviors();
  },

  methods: {
    ...mapActions("everyday_behaviors", ["fetchEverydayBehaviors"]),
  },
};
</script>

<style scoped>
.position-center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 0 25px;
  width: 100%;
}
</style>
