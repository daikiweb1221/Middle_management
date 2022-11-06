<template>
  <div class="d-flex flex-column min-vh-100">
    <h1>トップページ</h1>
    <router-link :to="{ name: 'SubordinateIndex' }" class="btn btn-dark mt-5"
      >部下一覧</router-link
    >
  </div>
</template>

<script>
export default {
  name: "TopIndex",
};
</script>

<style scoped></style>
