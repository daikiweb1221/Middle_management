<template>
  <v-app>
    <TheHeader />
    <FlashMessage />
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
import FlashMessage from "components/FlashMessage";

export default {
  components: {
    TheHeader,
    TheFooter,
    FlashMessage,
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
