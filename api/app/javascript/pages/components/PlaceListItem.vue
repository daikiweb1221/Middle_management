<template>
  <div>
    表示テスト
    <v-card elevation="1">
      <v-card-title v-for="place in places" :key="place.id"
        ><v-icon class="pr-2">mdi-account</v-icon
        >{{ place.place_point }}</v-card-title
      >
    </v-card>
  </div>
</template>

<script>
export default {
  name: "PlaceListItem",
  props: {
    places: Array,
    require: true,
  },
};
</script>
