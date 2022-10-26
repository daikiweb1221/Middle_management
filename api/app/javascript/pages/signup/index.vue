<template>
  <div class="d-flex flex-column min-vh-100">
    <div>サインアップ</div>
    <div class="text-center">
      <router-link :to="{ name: 'TopIndex' }" class="btn btn-dark mt-5">戻る</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "SignUpIndex",
  data() {
    return {
      title: "タスク管理アプリ"
    }
  }
}
</script>

<style scoped>
</style>