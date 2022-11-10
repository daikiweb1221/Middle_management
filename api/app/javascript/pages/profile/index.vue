<template>
  <div>
    <h1>プロフィール</h1>
    <li class="nav-item active avatar-image-wrapper">
      <img :src="authUser.avatar_url" class="rounded avatar-image" />
    </li>
    <p>{{ authUser.name }}</p>
    <p>{{ authUser.email }}</p>
    <p></p>
    <p></p>
    <div>
      <router-link :to="{ name: 'ProfileEdit' }" class="btn btn-dark mt-5"
        >プロフィール編集</router-link
      >
    </div>
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5"
        >戻る</router-link
      >
    </div>

    <div class="everyday_behavior_wrap">
      <div>{{ everyday_behavior.behaviors_one }}</div>
      <div>{{ everyday_behavior.behaviors_two }}</div>
      <div>{{ everyday_behavior.behaviors_three }}</div>
      <div>{{ everyday_behavior.behaviors_four }}</div>
      <div>{{ everyday_behavior.behaviors_five }}</div>
    </div>
    <div>
      <router-link :to="{ name: 'EverydayBehaviorEditPage' }" class="btn btn-dark mt-5"
        >5ヶ条編集</router-link
      >
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "ProfileIndex",
  // components: {
  //   SubordinateCreateModal,
  // },
  // data() {
  //   return {
  //     isVisibleSubordinateCreateModal: false,
  //   };
  // },
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
.avatar-image-wrapper {
  line-height: 40px;
}
.avatar-image {
  width: 50px;
  border-radius: 50%;
}
.everyday_behavior_wrap {
  margin-top: 30px;
}
</style>
