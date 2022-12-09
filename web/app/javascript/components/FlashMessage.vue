<template>
  <v-snackbar
    v-model="status"
    transition="slide-x-reverse-transition"
    left
    top
    :color="type"
    rounded="pill"
  >
    <div class="ml-5 font-weight-bold white--text">
      {{ message }}
    </div>
  </v-snackbar>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "FlashMessage",
  computed: {
    ...mapGetters("flash_messages", ["message", "type", "status"]),
  },
};
</script>
