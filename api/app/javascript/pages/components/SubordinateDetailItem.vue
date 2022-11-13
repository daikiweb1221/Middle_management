<template>
  <div>
    <v-card elevation="1">
      <v-card-title
        ><v-icon class="pr-2">mdi-account</v-icon
        >{{ subordinate.name }}</v-card-title
      >
      <v-card-text class="pb-0"
        ><v-icon class="pr-2">mdi-email</v-icon
        >{{ subordinate.email }}</v-card-text
      >
      <v-card-text
        ><v-icon class="pr-2">mdi-cake-layered</v-icon
        >{{ subordinate.birthday }}</v-card-text
      >
    </v-card>
  </div>
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
