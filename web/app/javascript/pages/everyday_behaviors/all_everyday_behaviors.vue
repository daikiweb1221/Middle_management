<template>
  <div>
    <h1>みんなの日々の立ち振る舞い</h1>
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5"
        >戻る</router-link
      >
    </div>
    <div>{{ authUser.name }}さんこんにちは</div>

    <div style="display: flex">
      <div v-for="all in all_everyday_behaviors" :key="all.id">
        <div class="mt-3">
          <div>{{ all.behaviors_one }}</div>
          <div>{{ all.behaviors_two }}</div>
          <div>{{ all.behaviors_three }}</div>
          <div>{{ all.behaviors_four }}</div>
          <div>{{ all.behaviors_five }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "AllEverydayBehaviorIndex",

  computed: {
    ...mapGetters("everyday_behaviors", ["all_everyday_behaviors"]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchAllEverydayBehaviors();
  },

  methods: {
    ...mapActions("everyday_behaviors", ["fetchAllEverydayBehaviors"]),
  },
};
</script>

<style scoped>
.edit-form {
  margin-top: 30px;
}
</style>
