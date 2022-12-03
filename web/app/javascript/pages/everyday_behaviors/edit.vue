<template>
  <div>
    <p class="pt-5 pb-1 text-h6 text-center font-weight-bold">五ヶ条編集</p>

    <EverydayBehaviorEdit
      :everyday_behavior="this.everyday_behavior"
      @update-everyday_behavior="handleUpdateEverydayBehavior"
    />
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import EverydayBehaviorEdit from "../components/EverydayBehaviorEdit";

export default {
  name: "EverydayBehaviorEditPage",

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
          this.$router.push({ name: "ProfileIndex" });
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

<style scoped></style>
