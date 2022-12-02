<template>
  <div>
    <v-btn
      v-if="communicate"
      icon
      color="pink"
      @click="handleDeleteCommunication(subordinate)"
    >
      <v-icon>mdi-heart</v-icon>
    </v-btn>
    <v-btn v-else icon @click="handleCreateCommunication(subordinate)">
      <v-icon>mdi-heart</v-icon>
    </v-btn>
  </div>
</template>

<script>
export default {
  name: "Communication",

  props: {
    communication_subordinates: {
      type: Array,
      required: true,
    },
    subordinate: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      communicate: this.communication_subordinates.some((obj) => {
        return obj.id === this.subordinate.id;
      }),
    };
  },

  methods: {
    handleCreateCommunication(communication_subordinate) {
      this.$emit("create-communication", communication_subordinate);
      this.communicate = true;
    },
    handleDeleteCommunication(communication_subordinate) {
      this.$emit("delete-communication", communication_subordinate);
      this.communicate = false;
    },
  },
};
</script>

<style scoped></style>
