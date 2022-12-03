<template>
  <div>
    <div class="px-3">
      <v-card
        v-for="subordinate in subordinates"
        :key="subordinate.id"
        elevation="3"
        class="b-color mt-2 d-flex align-end"
      >
        <div>
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
        </div>
        <div>
          <Communication
            :communication_subordinates="communications"
            :subordinate="subordinate"
            @create-communication="handleCreateCommunication(subordinate)"
            @delete-communication="handleDeleteCommunication(subordinate.id)"
          />
        </div>
        <v-spacer></v-spacer>
        <div class="pa-4">
          <v-btn
            :to="{ name: 'SubordinateDetail', params: { id: subordinate.id } }"
            color="warning"
            fab
            small
            dark
          >
            <v-icon>mdi-account-circle</v-icon>
          </v-btn>
        </div>
      </v-card>
    </div>
    <div
      class="mt-5"
      style="position: fixed; right: 30px; z-index: 6; bottom: 52px"
    >
      <SubordinateCreateModal @create-subordinate="handleCreateSubordinate" />
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import SubordinateCreateModal from "../components/SubordinateCreateModal";
import Communication from "../components/Communication";

export default {
  name: "SubordinateIndex",
  components: {
    SubordinateCreateModal,
    Communication,
  },

  computed: {
    ...mapGetters("subordinates", ["subordinates"]),
    ...mapGetters("users", ["authUser"]),
    ...mapGetters("communications", ["communications"]),
  },

  created() {
    this.fetchSubordinates();
    this.fetchCommunications();
  },

  methods: {
    ...mapActions("subordinates", ["fetchSubordinates", "createSubordinate"]),
    ...mapActions("communications", [
      "createCommunication",
      "fetchCommunications",
    ]),
    async handleCreateCommunication(communication_subordinate) {
      try {
        await this.createCommunication(communication_subordinate);
      } catch (error) {
        console.log(error);
      }
    },
    deleteCommunication(id) {
      this.$axios.delete("communications/" + id).then((res) => {
        this.$store.commit("communications/deleteCommunication", res.data);
      });
    },
    async handleDeleteCommunication(id) {
      try {
        await this.deleteCommunication(id);
      } catch (error) {
        console.log(error);
      }
    },
    async handleCreateSubordinate(subordinate) {
      try {
        await this.createSubordinate(subordinate);
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped></style>
