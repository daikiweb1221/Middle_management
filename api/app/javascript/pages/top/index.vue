<template>
  <div class="d-flex flex-column min-vh-100">
    <header class="mb-auto">
      <nav class="navbar navbar-dark bg-dark">
        <span class="navbar-brand mb-0 h1">{{ title }}</span>
      </nav>
    </header>
    <div class="text-center">
      <h3>タスクを管理しよう！</h3>
      <div class="mt-4">生活や仕事に関するタスクを見える化して抜け漏れを防ぎましょう。</div>
      <router-link :to="{ name: 'TaskIndex' }" class="btn btn-dark mt-5">はじめる</router-link>
    </div>
    <footer class="mt-auto text-center">
      <small>Copyright &copy; 2020. RUNTEQ</small>
    </footer>
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