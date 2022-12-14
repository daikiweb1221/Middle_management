<template>
  <section
    class="subordinates l-subordinates"
    :style="{ 'background-image': 'url(' + assetsImage + ')' }"
  >
    <div class="inner">
      <div class="subordinates__title-cont">
        <h1 class="subordinates__title" style="position: relative">
          Your Subordinates<span class="subordinates-title-ja"
            >- メンバーを登録しよう -</span
          >
        </h1>
      </div>
      <div class="subordinates-cont">
        <v-card
          class="mx-auto"
          elevation="3"
          outlined
          v-for="subordinate in subordinates"
          :key="subordinate.id"
        >
          <v-list-item three-line>
            <v-list-item-content>
              <div class="text-overline mb-4">Buddy</div>
              <v-list-item-title class="subordinate__name mb-1">
                {{ subordinate.name }}
              </v-list-item-title>
              <div class="sub-title__wrap">
                <v-list-item-subtitle
                  ><v-icon class="pr-2" color="#5f6c7b">mdi-email</v-icon
                  >{{ subordinate.email }}</v-list-item-subtitle
                >
                <v-list-item-subtitle
                  ><v-icon class="pr-2" color="#5f6c7b">mdi-cake-layered</v-icon
                  >{{ subordinate.birthday }}</v-list-item-subtitle
                >
              </div>
            </v-list-item-content>

            <v-list-item-avatar tile size="80" color="white">
              <v-btn
                :to="{
                  name: 'SubordinateDetail',
                  params: { id: subordinate.id },
                }"
                color="blue darken-2"
                fab
                dark
              >
                <v-icon>mdi-account-circle</v-icon>
              </v-btn>
            </v-list-item-avatar>
          </v-list-item>

          <v-card-actions>
            <v-spacer></v-spacer>
            <div class="communication__wrap">
              <Communication
                :communication_subordinates="communications"
                :subordinate="subordinate"
                @create-communication="handleCreateCommunication(subordinate)"
                @delete-communication="
                  handleDeleteCommunication(subordinate.id)
                "
              />
            </div>
          </v-card-actions>
        </v-card>
      </div>
    </div>

    <div
      class="mt-5"
      style="position: fixed; right: 30px; z-index: 6; bottom: 75px"
    >
      <SubordinateCreateModal @create-subordinate="handleCreateSubordinate" />
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SubordinateCreateModal from "../components/SubordinateCreateModal";
import Communication from "../components/Communication";
import AssetsImage from "../../../assets/images/background.jpg";

export default {
  name: "SubordinateIndex",
  data() {
    return {
      assetsImage: AssetsImage,
    };
  },
  components: {
    SubordinateCreateModal,
    Communication,
  },

  computed: {
    ...mapGetters("subordinates", ["subordinates"]),
    ...mapGetters("users", ["authUser"]),
    ...mapGetters("communications", ["communications"]),
  },

  created() {
    this.fetchSubordinates();
    this.fetchCommunications();
  },

  methods: {
    ...mapActions("subordinates", ["fetchSubordinates", "createSubordinate"]),
    ...mapActions("communications", [
      "createCommunication",
      "fetchCommunications",
    ]),
    ...mapActions("flash_messages", ["showMessage"]),
    async handleCreateCommunication(communication_subordinate) {
      try {
        await this.createCommunication(communication_subordinate);
        this.showMessage({
          message: "コミュニケーション済に追加しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "コミュニケーション済の追加に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
    deleteCommunication(id) {
      this.$axios.delete("communications/" + id).then((res) => {
        this.$store.commit("communications/deleteCommunication", res.data);
      });
    },
    async handleDeleteCommunication(id) {
      try {
        await this.deleteCommunication(id);
        this.showMessage({
          message: "コミュニケーション済から削除しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "コミュニケーション済からの削除に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
    async handleCreateSubordinate(subordinate) {
      try {
        await this.createSubordinate(subordinate);
        this.showMessage({
          message: "メンバーを追加しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "メンバーの追加に失敗しました",
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
        inner: "メンバー一覧",
        separator: "|",
        complement: "Middle Management",
      },
    };
  },
};
</script>

<style scoped>
.l-subordinates {
  width: 100%;
  background-size: cover;
  height: 100%;
  background-position: center center;
  padding-bottom: 2rem;
}
.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}

.v-card {
  width: 500px !important;
  margin-top: 1rem !important;
}

.subordinate__name {
  font-size: 1rem;
}

.subordinates__title-cont {
  padding-top: 2.1875rem;
}

.subordinates__title {
  font-size: 2rem;
}
.subordinates-cont {
  display: flex;
  flex-wrap: wrap;
  margin-top: 4.375rem;
}

.subordinates-title-ja {
  position: absolute;
  color: #5f6c7b;
  font-size: 0.75rem;
  top: 3rem;
  left: 3.5rem;
}

.sub-title__wrap {
  margin-top: 1rem;
}
.text-overline {
  color: #5f6c7b;
}

@media screen and (max-width: 767px) {
  .subordinates__title {
    font-size: 1.3rem;
  }
  .subordinates-title-ja {
    position: absolute;
    color: #5f6c7b;
    font-size: 0.75rem;
    top: 2rem;
    left: 1.3rem;
  }
}
</style>
