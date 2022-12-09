<template>
  <div>
    <DeleteDialogCommunicationSubordinates
      @delete-communication-subordinates="handleDeleteCommunicationSubordinates"
    />
    <div class="px-3">
      <v-card
        v-for="communication_subordinate in communications"
        :key="communication_subordinate.id"
        elevation="3"
        class="b-color mt-2 d-flex align-end"
      >
        <div>
          <v-card-title
            ><v-icon class="pr-2">mdi-account</v-icon
            >{{ communication_subordinate.name }}</v-card-title
          >
          <v-card-text class="pb-0"
            ><v-icon class="pr-2">mdi-email</v-icon
            >{{ communication_subordinate.email }}</v-card-text
          >
          <v-card-text
            ><v-icon class="pr-2">mdi-cake-layered</v-icon
            >{{ communication_subordinate.birthday }}</v-card-text
          >
        </div>
      </v-card>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import DeleteDialogCommunicationSubordinates from "../components/DeleteDialogCommunicationSubordinates.vue";

export default {
  name: "CommunicationSubordinatesIndex",
  components: {
    DeleteDialogCommunicationSubordinates,
  },

  computed: {
    ...mapGetters("communications", ["communications"]),
    ...mapGetters("users", ["authUser"]),
    ...mapGetters("subordinates", ["subordinates"]),
  },

  created() {
    this.fetchSubordinates();
    this.fetchCommunications();
  },

  methods: {
    ...mapActions("communications", ["fetchCommunications"]),
    ...mapActions("subordinates", ["fetchSubordinates"]),
    ...mapActions("flash_messages", ["showMessage"]),

    deleteCommunicationSubordinates() {
      this.$axios.delete("communications/destroy_all").then((res) => {
        this.$store.commit(
          "communications/deleteCommunicationSubordinates",
          res.data
        );
        this.$router.push({ name: "SubordinateIndex" });
      });
    },
    async handleDeleteCommunicationSubordinates() {
      try {
        await this.deleteCommunicationSubordinates();
        this.showMessage({
          message: "コミュニケーション済メンバーを削除しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "削除に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
  },
};
</script>

<style scoped></style>
