<template>
  <div>
    <div class="px-3">
      <v-card
        v-for="communication_subordinate in communications"
        :key="communication_subordinate.id"
        elevation="3"
        class="b-color mt-2 d-flex align-end"
      >
        <div>
          <v-card-title
            ><v-icon class="pr-2">mdi-account</v-icon
            >{{ communication_subordinate.name }}</v-card-title
          >
          <v-card-text class="pb-0"
            ><v-icon class="pr-2">mdi-email</v-icon
            >{{ communication_subordinate.email }}</v-card-text
          >
          <v-card-text
            ><v-icon class="pr-2">mdi-cake-layered</v-icon
            >{{ communication_subordinate.birthday }}</v-card-text
          >
        </div>
      </v-card>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "CommunicationSubordinatesIndex",
  components: {},

  computed: {
    ...mapGetters("communications", ["communications"]),
    ...mapGetters("users", ["authUser"]),
    ...mapGetters("subordinates", ["subordinates"]),
  },

  created() {
    this.fetchSubordinates();
    this.fetchCommunications();
  },

  methods: {
    ...mapActions("communications", ["fetchCommunications"]),
    ...mapActions("subordinates", ["fetchSubordinates"]),
  },
};
</script>

<style scoped></style>
