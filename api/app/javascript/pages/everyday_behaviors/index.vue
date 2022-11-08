<template>
  <div>
    <h1>日々の立ち振る舞い</h1>
    <div>{{ authUser.name }}さんこんにちは</div>
      <div>{{ everyday_behaviors.behaviors_one }}</div>
      <div>{{ everyday_behaviors.behaviors_two }}</div>
      <div>{{ everyday_behaviors.behaviors_three }}</div>
      <div>{{ everyday_behaviors.behaviors_four }}</div>
      <div>{{ everyday_behaviors.behaviors_five }}</div>
    </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "EverydayBehaviorIndex",

  computed: {
    ...mapGetters("everyday_behaviors", ["everyday_behaviors"]),
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
