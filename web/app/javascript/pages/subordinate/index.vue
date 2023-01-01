<template>
  <section class="subordinate l-subordinate">
    <div
      class="subordinate__top-cont"
      :style="{ 'background-image': 'url(' + assetsImage + ')' }"
    >
      <div class="inner">
        <div class="subordinate__title-cont title-cont">
          <h1 class="subordinate__title sub-title">Your Subordinate</h1>
        </div>
        <div class="subordinate__cont">
          <SubordinateDetailItem :subordinate="subordinate" />
          <div
            class="list-btn__wrap"
            style="
              height: 4.375rem;
              position: relative;
              max-width: 800px;
              margin: 0.625rem auto 0;
            "
          >
            <PlaceCreateModal
              class="create__place"
              @create-place="handleCreatePlace"
            />
            <v-btn
              class="edit__icon"
              color="primary"
              fab
              small
              dark
              @click="handleShowSubordinateEditModal(subordinate)"
              @click.stop="dialog = true"
            >
              <v-icon>mdi-pencil</v-icon>
            </v-btn>

            <DeleteDialog
              class="delete__dialog"
              @delete-subordinate="handleDeleteSubordinate"
            />
            <v-dialog v-model="dialog" persistent max-width="600px">
              <SubordinateEditModal
                :dialog="dialog"
                :subordinate="subordinateEdit"
                @close-modal="handleCloseSubordinateEditModal"
                @update-subordinate="handleUpdateSubordinate"
              />
            </v-dialog>
          </div>
        </div>
      </div>
    </div>

    <div class="palace__point-cont l-place-point">
      <div class="inner">
        <div class="place__point-title-cont">
          <h1 class="place__point-title sub-title">
            Place Point<span class="place__point-title-ja"
              >- 褒めポイント -</span
            >
          </h1>
        </div>
        <div class="place-point__wrap">
          <PlaceListItem :places="places" />
          <div class="place-point-right">
            <div class="place-point__img-wrap">
              <img
                src="../../../assets/images/place-detail.png"
                alt="褒めポイント"
                class="place-point__img"
                style="width: 100%"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SubordinateDetailItem from "../components/SubordinateDetailItem";
import SubordinateEditModal from "../components/SubordinateEditModal";
import DeleteDialog from "../components/DeleteDialog";
import PlaceCreateModal from "../components/PlaceCreateModal";
import PlaceListItem from "../components/PlaceListItem";
import AssetsImage from "../../../assets/images/background2.jpg";

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
      assetsImage: AssetsImage,
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
  head() {
    return {
      title: {
        inner: "メンバー",
        separator: "|",
        complement: "Middle Management",
      },
    };
  },
};
</script>

<style scoped>
.subordinate__top-cont {
  width: 100%;
  background-size: cover;
  height: 21.875rem;
  background-position: center center;
}

.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}
.subordinate__title-cont {
  padding-top: 2.1875rem;
  /* padding-left: 2.1875rem; */
}

.sub__title {
  font-size: 2rem;
}

.subordinate__cont {
  margin-top: 1.875rem;
}

.edit__icon {
  position: absolute;
  right: 2.8125rem;
}

.create__place {
  position: absolute;
  right: 0;
}

.place__point-title {
  position: relative;
}

.place__point-title-ja {
  position: absolute;
  color: #5f6c7b;
  font-size: 0.75rem;
  top: 1.75rem;
  left: 1.0625rem;
}
.l-place-point {
  padding-top: 0.625rem;
}

.place-point__box {
  margin-top: 2rem;
}

.place-point__wrap {
  max-width: 850px;
  margin: auto;
}
.place-point-right {
  width: 100%;
}

@media screen and (min-width: 750px) {
  .place-point__wrap {
    display: flex;
    justify-content: space-between;
    max-width: 850px;
    margin: auto;
  }
  .place-point-right {
    width: 40%;
  }
  .l-place-point {
  padding-bottom: 2rem;
}
}

.delete__dialog {
  position: absolute;
  right: 5.625rem;
}
</style>
