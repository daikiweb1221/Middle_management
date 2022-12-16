<template>
  <div>
    <v-dialog
      v-model="dialog"
      persistent
      max-width="290"
      color="blue-grey darken-3"
      dark
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn color="error" fab small dark v-bind="attrs" v-on="on">
          <v-icon>mdi-account-off</v-icon>
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5"> 本当に削除しますか？ </v-card-title>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="error" text @click="handleDeleteSubordinate()">
            削除する
          </v-btn>
          <v-btn color="green" text @click="dialog = false"> キャンセル </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: "DeleteDialog",
  data() {
    return {
      dialog: false,
    };
  },
  methods: {
    handleDeleteSubordinate() {
      this.$emit("delete-subordinate");
    },
  },
};
</script>

<style scoped>

</style>
