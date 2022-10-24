<template>
  <div>
    <!-- <div v-for="subordinate in subordinates" :key="subordinate.id">
      <span>{{ subordinate.name }}</span>
      <span>{{ subordinate.email }}</span>
      <span>{{ subordinate.birthday }}</span>
    </div> -->
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5"
        >ここは部下一覧ページです：戻る</router-link
      >
    </div>
  </div>
</template>

<script>
export default {
  name: "SubordinateIndex",
  data() {
    return {
      subordinates: [],
    };
  },

  created() {
    this.fetchSubordinates();
  },

  methods: {
    fetchSubordinates() {
      this.$axios
        .get("subordinates")

        .then((res) => (this.subordinates = res.data))
        .catch((err) => console.log(err.status));
    },
  },
};
</script>
