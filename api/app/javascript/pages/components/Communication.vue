<template>
  <v-btn icon @click="handleCreateCommunication(communication_subordinate)">
    <v-icon>mdi-heart</v-icon>
  </v-btn>
</template>

<script>
export default {
  name: "Communication",
  components: {},

  props: {
    communication_subordinate: {
      type: Object,
      required: true,
    },
  },

  computed: {},

  created() {},

  methods: {
    handleCreateCommunication(communication_subordinate) {
      this.$emit("create-communication",communication_subordinate)
    }
  },
};
</script>

<style scoped></style>
