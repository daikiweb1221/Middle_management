<template>
  <section
    class="communication l-communication"
    :style="{ 'background-image': 'url(' + assetsImage + ')' }"
  >
    <div class="inner">
      <div class="communication__title-cont">
        <h1 class="communication__title" style="position: relative">
          Communicated<span class="communication-title-ja"
            >- コミュニケーション済 -</span
          >
        </h1>
      </div>

      <div class="subordinates-cont">
        <v-card
          class="mx-auto"
          elevation="3"
          outlined
          v-for="communication_subordinate in communications"
          :key="communication_subordinate.id"
        >
          <v-list-item three-line>
            <v-list-item-content>
              <div class="text-overline mb-4">Communicated</div>
              <v-list-item-title class="subordinate__name mb-1">
                {{ communication_subordinate.name }}
              </v-list-item-title>
              <div class="sub-title__wrap">
                <v-list-item-subtitle
                  ><v-icon class="pr-2" color="#5f6c7b">mdi-email</v-icon
                  >{{ communication_subordinate.email }}</v-list-item-subtitle
                >
                <v-list-item-subtitle
                  ><v-icon class="pr-2" color="#5f6c7b">mdi-cake-layered</v-icon
                  >{{
                    communication_subordinate.birthday
                  }}</v-list-item-subtitle
                >
              </div>
            </v-list-item-content>
          </v-list-item>
        </v-card>
        <div class="all-reset-btn">
          <DeleteDialogCommunicationSubordinates
            @delete-communication-subordinates="
              handleDeleteCommunicationSubordinates
            "
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import DeleteDialogCommunicationSubordinates from "../components/DeleteDialogCommunicationSubordinates.vue";
import AssetsImage from "../../../assets/images/background.jpg";

export default {
  name: "CommunicationSubordinatesIndex",
  components: {
    DeleteDialogCommunicationSubordinates,
  },

  data() {
    return {
      assetsImage: AssetsImage,
    };
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

<style scoped>
.l-communication {
  width: 100%;
  background-size: cover;
  height: 100%;
  background-position: center center;
}
.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}

.communication__title-cont {
  padding-top: 2.1875rem;
  /* padding-left: 2.1875rem; */
}

.communication__title {
  font-size: 2rem;
}
.communication-title-ja {
  position: absolute;
  color: #5f6c7b;
  font-size: 0.75rem;
  top: 3rem;
  left: 2rem;
}

.subordinates-cont {
  display: flex;
  flex-wrap: wrap;
  margin-top: 4.375rem;
  padding-bottom: 10rem;
}

.sub-title__wrap {
  margin-top: 1rem;
}

.v-card {
  width: 500px !important;
  margin-top: 1rem !important;
}

.all-reset-btn {
  width: 100%;
  text-align: center;
  margin-top: 2.5rem;
}

.text-overline {
  color: #5f6c7b;
}

@media screen and (max-width: 767px) {
  .communication__title {
    font-size: 1.3rem;
  }
  .communication-title-ja {
    position: absolute;
    color: #5f6c7b;
    font-size: 0.75rem;
    top: 1.7rem;
    left: 0.3rem;
  }
}
</style>
