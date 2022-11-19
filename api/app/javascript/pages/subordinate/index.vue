<template>
  <div>
    <div style="position: relative">
      <SubordinateDetailItem :subordinate="subordinate" />
      <div style="position: absolute; right: 50px; top: 100px">
        <div style="display: flex">
          <v-btn
            color="primary"
            fab
            small
            dark
            @click="handleShowSubordinateEditModal(subordinate)"
            @click.stop="dialog = true"
          >
            <v-icon>mdi-pencil</v-icon>
          </v-btn>

          <DeleteDialog @delete-subordinate="handleDeleteSubordinate" />
        </div>
      </div>
    </div>
    <div>
      <v-row justify="center">
        <v-dialog v-model="dialog" persistent max-width="600px">
          <SubordinateEditModal
            :dialog="dialog"
            :subordinate="subordinateEdit"
            @close-modal="handleCloseSubordinateEditModal"
            @update-subordinate="handleUpdateSubordinate"
          />
        </v-dialog>
      </v-row>
    </div>
  </div>
</template>

<script>
import SubordinateDetailItem from "../components/SubordinateDetailItem";
import SubordinateEditModal from "../components/SubordinateEditModal";
import DeleteDialog from "../components/DeleteDialog";

export default {
  components: {
    SubordinateDetailItem,
    SubordinateEditModal,
    DeleteDialog,
  },

  name: "SubordinateDetail",

  data() {
    return {
      subordinate: {},
      subordinateEdit: {},
      dialog: false,
    };
  },

  created() {
    this.showSubordinate();
  },

  methods: {
    showSubordinate() {
      const id = parseInt(this.$route.params.id, 10);
      this.$axios
        .get("subordinates/" + id)
        .then((res) => (this.subordinate = res.data))
        .catch((err) => console.log(err.status));
    },
    handleShowSubordinateEditModal(subordinate) {
      this.subordinateEdit = Object.assign({}, subordinate);
    },
    handleCloseSubordinateEditModal() {
      this.subordinateEdit = {};
      this.dialog = false;
    },
    updateSubordinate(subordinate) {
      const target_subordinate = this.subordinate.id;
      this.$axios
        .patch("subordinates/" + target_subordinate, subordinate)
        .then((res) => {
          this.$store.commit("subordinates/updateSubordinate", res.data);
          this.$router.go({
            path: this.$router.currentRoute.path,
            force: true,
          });
        });
    },
    async handleUpdateSubordinate(subordinate) {
      try {
        await this.updateSubordinate(subordinate);
        this.handleCloseSubordinateEditModal();
      } catch (error) {
        console.log(error);
      }
    },
    deleteSubordinate() {
      const target_subordinate = this.subordinate.id;
      this.$axios.delete("subordinates/" + target_subordinate).then((res) => {
        this.$store.commit("subordinates/deleteSubordinate", res.data);
        this.$router.push({ name: "SubordinateIndex" });
      });
    },
    async handleDeleteSubordinate() {
      try {
        await this.deleteSubordinate();
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped></style>
