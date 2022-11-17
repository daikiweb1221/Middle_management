<template>
  <div>
    <div>導入ページです</div>
    <v-btn
      color="primary"
      class="mr-4 font-weight-bold px-10"
      type="submit"
      :to="{ name: 'EverydayBehaviorRegister' }"
    >
      次へ
    </v-btn>
  </div>
</template>

<script>
export default {
  name: "TopIntroduction",
};
</script>

<style scoped></style>
