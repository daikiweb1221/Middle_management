<template>
  <div>
    <div style="position: relative">
      <SubordinateDetailItem :subordinate="subordinate" />
      <div style="position: absolute; right: 30px; top: 100px">
        <div style="display: flex">
          <div>
            <v-btn
              color="primary"
              fab
              small
              dark
              @click="handleShowSubordinateEditModal(subordinate)"
            >
              <v-icon>mdi-pencil</v-icon>
            </v-btn>
          </div>

          <div class="ml-2">
            <v-btn
              color="error"
              fab
              small
              dark
              @click="handleDeleteSubordinate"
            >
              <v-icon>mdi-trash-can</v-icon>
            </v-btn>
          </div>
        </div>
      </div>
    </div>
    <div>
      <SubordinateEditModal
        :subordinate="subordinateEdit"
        v-if="isVisibleSubordinateEditModal"
        @close-modal="handleCloseSubordinateEditModal"
        @update-subordinate="handleUpdateSubordinate"
      />
    </div>
  </div>
</template>

<script>
import SubordinateDetailItem from "../components/SubordinateDetailItem";
import SubordinateEditModal from "../components/SubordinateEditModal";

export default {
  components: {
    SubordinateDetailItem,
    SubordinateEditModal,
  },

  name: "SubordinateDetail",

  data() {
    return {
      subordinate: {},
      isVisibleSubordinateEditModal: false,
      subordinateEdit: {},
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
      this.isVisibleSubordinateEditModal = true;
    },
    handleCloseSubordinateEditModal() {
      this.isVisibleSubordinateEditModal = false;
      this.subordinateEdit = {};
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
      if (confirm("削除してよろしいですか?")) {
        this.$axios.delete("subordinates/" + target_subordinate).then((res) => {
          this.$store.commit("subordinates/deleteSubordinate", res.data);
          this.$router.back();
        });
      } else {
        this.$router.push({ name: "SubordinateIndex" });
      }
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
