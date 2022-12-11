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

  head: {
    link: [
      {
        rel: "stylesheet",
        href: "https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100;300;400;500;700;900&display=swap",
      },
    ],
  },
};
</script>

<style scoped>
.v-application {
  font-family: "Noto Sans JP", sans-serif !important;
}
.v-enter-active,
.v-leave-active {
  transition: opacity 0.5s;
}
.v-enter,
.v-leave-to {
  opacity: 0;
}
</style>
