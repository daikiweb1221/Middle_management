<template>
  <div class="container">
    <p class="pt-5 pb-1 text-h6">マイページ</p>
    <v-card elevation="3">
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

    <div class="mt-16">
      <p class="text-h4 mb-12 font-weight-bold">
        {{ authUser.name }}さんが日常で目指すべき姿【五ヶ条】
      </p>
      <p class="text-h5 mb-6">１.{{ everyday_behavior.behaviors_one }}</p>
      <p class="text-h5 mb-6">２.{{ everyday_behavior.behaviors_two }}</p>
      <p class="text-h5 mb-6">３.{{ everyday_behavior.behaviors_three }}</p>
      <p class="text-h5 mb-6">４.{{ everyday_behavior.behaviors_four }}</p>
      <p class="text-h5 mb-6">５.{{ everyday_behavior.behaviors_five }}</p>
    </div>
    <div class="text-right">
      <v-btn
        :to="{ name: 'EverydayBehaviorEditPage' }"
        outlined
        small
        fab
        color="indigo"
      >
        <v-icon>mdi-pencil</v-icon>
      </v-btn>
    </div>
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

<style scoped></style>
