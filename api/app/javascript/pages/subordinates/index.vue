<template>
  <div>
    <div class="px-3">
      <v-card
        v-for="subordinate in subordinates"
        :key="subordinate.id"
        elevation="3"
        class="mt-2 d-flex align-end"
      >
        <div>
          <v-card-title
            ><v-icon class="pr-2">mdi-account</v-icon
            >{{ subordinate.name }}</v-card-title
          >
          <v-card-text class="pb-0"
            ><v-icon class="pr-2">mdi-email</v-icon
            >{{ subordinate.email }}</v-card-text
          >
          <v-card-text
            ><v-icon class="pr-2">mdi-cake-layered</v-icon
            >{{ subordinate.birthday }}</v-card-text
          >
        </div>
        <v-spacer></v-spacer>
        <div class="pa-4">
          <v-btn
            :to="{ name: 'SubordinateDetail', params: { id: subordinate.id } }"
            color="warning"
            fab
            small
            dark
          >
            <v-icon>mdi-account-circle</v-icon>
          </v-btn>
        </div>
      </v-card>
      <!-- <div>
      <h1>部下一覧ページ</h1>
      <div>
        <router-link
          :to="{ name: 'EverydayBehaviorIndex' }"
          class="btn btn-dark mt-5"
          >日々の立ち振る舞い</router-link
        >
      </div>
      <div v-for="subordinate in subordinates" :key="subordinate.id">
        <router-link
          :to="{ name: 'SubordinateDetail', params: { id: subordinate.id } }"
          class="btn btn-dark mt-5"
          >{{ subordinate.name }}</router-link
        >
      </div>
      <div class="text-center">
        <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5"
          >戻る</router-link
        >
      </div> -->
    </div>
    <div
      class="mt-5"
      style="position: fixed; right: 30px; z-index: 6; bottom: 52px"
    >
      <SubordinateCreateModal @create-subordinate="handleCreateSubordinate" />
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SubordinateCreateModal from "../components/SubordinateCreateModal";

export default {
  name: "SubordinateIndex",
  components: {
    SubordinateCreateModal,
  },

  computed: {
    ...mapGetters("subordinates", ["subordinates"]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchSubordinates();
  },

  methods: {
    ...mapActions("subordinates", ["fetchSubordinates", "createSubordinate"]),
    async handleCreateSubordinate(subordinate) {
      try {
        await this.createSubordinate(subordinate);
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
