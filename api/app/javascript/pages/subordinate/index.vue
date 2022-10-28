<template>
  <div>
    <div v-for="subordinate in subordinates" :key="subordinate.id">
      <span>{{ subordinate.name }}</span>
      <span>{{ subordinate.email }}</span>
      <span>{{ subordinate.birthday }}</span>
    </div>
    <div class="text-center">
      <p>部下一覧</p>
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5"
        >戻る</router-link
      >
    </div>
    <button class="btn btn-secondary" @click="handleShowSubordinateCreateModal">
      部下を追加
    </button>
    <transition name="fade">
      <SubordinateCreateModal
        v-if="isVisibleSubordinateCreateModal"
        @close-modal="handleCloseSubordinateCreateModal"
        @create-subordinate="handleCreateSubordinate"
      />
    </transition>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SubordinateCreateModal from "./components/SubordinateCreateModal";

export default {
  name: "SubordinateIndex",
  components: {
    // SubordinateDetailModal,
    SubordinateCreateModal,
  },
  data() {
    return {
      // isVisibleSubordinateDetailModal: false,
      isVisibleSubordinateCreateModal: false,
    };
  },
  computed: {
    ...mapGetters(["subordinates"]),
  },

  created() {
    this.fetchSubordinates();
  },

  methods: {
    ...mapActions(["fetchSubordinates", "createSubordinate"]),
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
