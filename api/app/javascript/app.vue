<template>
  <v-app>
    <TheHeader />
    <v-main>
      <transition mode="out-in">
        <router-view />
      </transition>
    </v-main>
    <TheFooter />
  </v-app>
</template>

<script>
import TheHeader from "components/TheHeader";
import TheFooter from "components/TheFooter";

export default {
  components: {
    TheHeader,
    TheFooter,
  },
};
</script>

<style scoped>
.v-enter-active,
.v-leave-active {
  transition: opacity 0.5s;
}
.v-enter,
.v-leave-to {
  opacity: 0;
}
</style>
