<template>
  <div class="pr-3 pl-3">
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
        <router-link
          :to="{ name: 'SubordinateDetail', params: { id: subordinate.id } }"
          ><v-btn><v-icon>mdi-account-edit</v-icon></v-btn></router-link
        >
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
      </div>
      <button
        class="btn btn-secondary"
        @click="handleShowSubordinateCreateModal"
      >
        部下を追加
      </button>
      <transition name="fade">
        <SubordinateCreateModal
          v-if="isVisibleSubordinateCreateModal"
          @close-modal="handleCloseSubordinateCreateModal"
          @create-subordinate="handleCreateSubordinate"
        />
      </transition>
    </div> -->
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
  data() {
    return {
      isVisibleSubordinateCreateModal: false,
    };
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
    handleShowSubordinateCreateModal() {
      this.isVisibleSubordinateCreateModal = true;
    },
    handleCloseSubordinateCreateModal() {
      this.isVisibleSubordinateCreateModal = false;
    },
    async handleCreateSubordinate(subordinate) {
      try {
        await this.createSubordinate(subordinate);
        this.handleCloseSubordinateCreateModal();
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
