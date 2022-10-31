<template>
  <div>
    <h1>部下詳細ページ</h1>
    <div>
      <router-link :to="{ name: 'SubordinateIndex' }" class="btn btn-dark mt-5"
        >部下一覧へ</router-link
      >
    </div>
    <!-- <subordinate-detail-item
      :subordinate="subordinate"
    ></subordinate-detail-item> -->
    <div>{{ subordinates }}</div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import SubordinateDetailItem from "./components/SubordinateDetailItem";

export default {
  components: { SubordinateDetailItem },
  name: "SubordinateDetail",

  computed: {
    ...mapGetters(["subordinates", "subordinate"]),
  },

  created() {
    this.fetchSubordinates();
  },

  methods: {
    ...mapActions(["fetchSubordinates"]),
  },
};
</script>

<style scoped></style>
