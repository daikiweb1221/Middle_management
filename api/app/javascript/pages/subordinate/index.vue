<template>
  <div>
    <h1>部下詳細ページ</h1>
    <div>
      <router-link :to="{ name: 'SubordinateIndex' }" class="btn btn-dark mt-5"
        >部下一覧へ</router-link
      >
    </div>
    <subordinate-detail-item
      :subordinate="subordinate"
    ></subordinate-detail-item>
  </div>
</template>

<script>
import SubordinateDetailItem from "../components/SubordinateDetailItem";

export default {
  components: { SubordinateDetailItem },
  name: "SubordinateDetail",

  data() {
    return {
      subordinate: {},
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
  },
};
</script>

<style scoped></style>
