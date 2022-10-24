<template>
  <div class="d-flex flex-column min-vh-100">
    <div class="text-center">
      <router-link :to="{ name: 'SignUpIndex' }" class="btn btn-dark mt-5">Middle Managementに登録する</router-link>
      <router-link :to="{ name: 'SubordinateIndex' }" class="btn btn-dark mt-5">部下一覧</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopIndex",
  data() {
    return {
      title: "タスク管理アプリ"
    }
  }
}
</script>

<style scoped>
</style>