<template>
  <v-card elevation="3" outlined>
    <div class="text-overline text-center" style="color: #5f6c7b">Buddy</div>
    <v-card-title class="subordinate__name">
      {{ subordinate.name }}
    </v-card-title>
    <div class="sub-title__wrap">
      <v-list-item-subtitle
        ><v-icon class="pr-2" color="#5f6c7b">mdi-email</v-icon
        >{{ subordinate.email }}</v-list-item-subtitle
      >
      <v-list-item-subtitle
        ><v-icon class="pr-2" color="#5f6c7b">mdi-cake-layered</v-icon
        >{{ subordinate.birthday }}</v-list-item-subtitle
      >
    </div>
  </v-card>
</template>

<script>
export default {
  name: "SubordinateDetailItem",
  props: {
    subordinate: Object,
    require: true,
  },
};
</script>
<style scoped>
.sub-title__wrap {
  margin: auto;
  color: #5f6c7b !important;
  max-width: 275px;
}
.v-card {
  max-width: 800px;
  height: 10rem;
  margin: auto;
}

.subordinate__name {
  display: block;
  text-align: center;
  font-size: 1rem;
  font-weight: initial !important;
}

@media screen and (max-width: 767px) {
  .subordinate__name {
    font-size: 1rem;
  }
}
</style>
