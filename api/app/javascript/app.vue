<template>
  <v-app>
    <TheHeader />
    <v-main>
      <router-view />
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
