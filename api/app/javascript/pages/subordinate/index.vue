<template>
  <div>
    <h1>部下詳細ページ</h1>
    <div>
      <router-link :to="{ name: 'SubordinateIndex' }" class="btn btn-dark mt-5"
        >部下一覧へ</router-link
      >
    </div>
    <div>
      <SubordinateDetailItem :subordinate="subordinate" />
    </div>
    <button
      type="button"
      class="btn btn-success"
      @click="handleShowSubordinateEditModal"
    >
      編集
    </button>
    <button
      type="button"
      class="btn btn-danger"
      @click="handleDeleteSubordinate"
    >
      削除
    </button>
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
      this.$axios.delete("subordinates/" + target_subordinate).then((res) => {
        this.$store.commit("subordinates/deleteSubordinate", res.data);
        this.$router.back();
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
