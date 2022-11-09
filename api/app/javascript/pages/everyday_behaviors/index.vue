<template>
  <div>
    <h1>日々の立ち振る舞い</h1>
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5"
        >戻る</router-link
      >
    </div>

    <div>{{ authUser.name }}さんこんにちは</div>
    <div>{{ everyday_behavior.behaviors_one }}</div>
    <div>{{ everyday_behavior.behaviors_two }}</div>
    <div>{{ everyday_behavior.behaviors_three }}</div>
    <div>{{ everyday_behavior.behaviors_four }}</div>
    <div>{{ everyday_behavior.behaviors_five }}</div>

    <div class="edit-form">
      <EverydayBehaviorEdit
        :everyday_behavior="this.everyday_behavior"
        @update-everyday_behavior="handleUpdateEverydayBehavior"
      />
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import EverydayBehaviorEdit from "../components/EverydayBehaviorEdit";

export default {
  name: "EverydayBehaviorIndex",

  data() {
    return {
      everyday_behaviorEdit: {},
    };
  },

  components: {
    EverydayBehaviorEdit,
  },

  computed: {
    ...mapGetters("everyday_behaviors", [
      "everyday_behaviors",
      "everyday_behavior",
    ]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchEverydayBehaviors();
    this.fetchEverydayBehaviorEdit();
  },

  methods: {
    ...mapActions("everyday_behaviors", ["fetchEverydayBehaviors"]),
    fetchEverydayBehaviorEdit() {
      this.everyday_behaviorEdit = Object.assign({}, this.everyday_behavior);
    },
    updateEverydayBehavior(everyday_behavior) {
      const target_everyday_behavior = this.everyday_behavior.id;
      this.$axios
        .patch(
          "everyday_behaviors/" + target_everyday_behavior,
          everyday_behavior
        )
        .then((res) => {
          this.$store.commit(
            "everyday_behaviors/updateEverydayBehavior",
            res.data
          );
          this.$router.go({
            path: this.$router.currentRoute.path,
            force: true,
          });
        });
    },
    async handleUpdateEverydayBehavior(everyday_behavior) {
      try {
        await this.updateEverydayBehavior(everyday_behavior);
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped>
.edit-form {
  margin-top: 30px;
}
</style>
