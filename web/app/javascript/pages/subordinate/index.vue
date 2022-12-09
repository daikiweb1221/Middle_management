<template>
  <div>
    <div style="position: relative">
      <SubordinateDetailItem :subordinate="subordinate" />
      <div style="position: absolute; right: 50px; top: 100px">
        <div style="display: flex">
          <PlaceCreateModal @create-place="handleCreatePlace" />
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
    <v-dialog v-model="dialog" persistent max-width="600px">
      <SubordinateEditModal
        :dialog="dialog"
        :subordinate="subordinateEdit"
        @close-modal="handleCloseSubordinateEditModal"
        @update-subordinate="handleUpdateSubordinate"
      />
    </v-dialog>
    <div body-container style="display: flex">
      <PlaceListItem :places="places" />
      <div>aaaaaaaaaa</div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SubordinateDetailItem from "../components/SubordinateDetailItem";
import SubordinateEditModal from "../components/SubordinateEditModal";
import DeleteDialog from "../components/DeleteDialog";
import PlaceCreateModal from "../components/PlaceCreateModal";
import PlaceListItem from "../components/PlaceListItem";

export default {
  components: {
    SubordinateDetailItem,
    SubordinateEditModal,
    DeleteDialog,
    PlaceCreateModal,
    PlaceListItem,
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
    this.showPlaces();
  },

  computed: {
    ...mapGetters("places", ["places"]),
    ...mapGetters("users", ["authUser"]),
  },

  methods: {
    // コメントエリア
    ...mapActions("flash_messages", ["showMessage"]),
    createPlace(place) {
      const id = parseInt(this.$route.params.id, 10);
      const array = ["subordinates/", id, "/places"];
      const path = array.join("");
      this.$axios.post(path, place).then((res) => {
        this.$store.commit("places/addPlace", res.data);
      });
    },
    async handleCreatePlace(place) {
      try {
        await this.createPlace(place);
        this.showMessage({
          message: "褒めポイントを追加追加しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "褒めポイントの追加に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
    showPlaces() {
      const id = parseInt(this.$route.params.id, 10);
      const array = ["subordinates/", id, "/places"];
      const path = array.join("");
      this.$axios.get(path).then((res) => {
        let result = res.data.filter((target) => {
          return target.subordinate_id == id;
        });
        this.$store.commit("places/setPlaces", result);
      });
    },
    // コメントエリアここまで
    showSubordinate() {
      const id = parseInt(this.$route.params.id, 10);
      const array = ["subordinates/", id];
      const path = array.join("");
      this.$axios
        .get(path)
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
          // this.$router.go({
          //   path: this.$router.currentRoute.path,
          //   force: true,
          // });
          this.$router.push({ name: "SubordinateIndex" });
        });
    },
    async handleUpdateSubordinate(subordinate) {
      try {
        await this.updateSubordinate(subordinate);
        this.handleCloseSubordinateEditModal();
        this.showMessage({
          message: "メンバーを更新しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "メンバーの更新に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
    deleteSubordinate() {
      const target_subordinate = this.subordinate.id;
      this.$axios.delete("subordinates/" + target_subordinate).then((res) => {
        this.$store.commit("subordinates/deleteSubordinate", res.data);
        this.$router.push({ name: "SubordinateIndex" });
        this.showMessage({
          message: "メンバーを削除しました",
          type: "light-blue",
          status: true,
        });
      });
    },
    async handleDeleteSubordinate() {
      try {
        await this.deleteSubordinate();
      } catch (error) {
        this.showMessage({
          message: "メンバーの削除に失敗しました",
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
