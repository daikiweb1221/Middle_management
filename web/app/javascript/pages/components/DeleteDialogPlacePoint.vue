<template>
  <div class="px-4">
    <v-row>
      <v-dialog
        v-model="dialog"
        persistent
        max-width="290"
        color="blue-grey darken-3"
        dark
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn color="error" fab x-small dark v-bind="attrs" v-on="on">
            <v-icon>mdi-comment-remove</v-icon>
          </v-btn>
        </template>
        <v-card>
          <v-card-title class="text-h5">
            褒めポイントを削除しますか？
          </v-card-title>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="error" text @click="handleDeletePlacePoint()">
              削除する
            </v-btn>
            <v-btn color="green" text @click="dialog = false">
              キャンセル
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
</template>

<script>
export default {
  name: "DeleteDialogPlacePoint",
  data() {
    return {
      dialog: false,
    };
  },
  methods: {
    handleDeletePlacePoint() {
      this.$emit("delete-place-point");
      this.dialog = false;
    },
  },
};
</script>
