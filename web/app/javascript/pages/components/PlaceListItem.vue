<template>
  <div style="width: 50%">
    <v-card v-for="place in places" :key="place.id" outline>
      <v-card-title style="justify-content: space-between">
        <div>
          <p>
            <v-icon class="pr-2">mdi-head-heart</v-icon>{{ place.place_point }}
          </p>
          <p class="mb-0">
            <small>{{ place.created_at }}</small>
          </p>
        </div>
        <DeleteDialogPlacePoint
          @delete-place-point="handleDeletePlacePoint(place.id)"
        />
      </v-card-title>
    </v-card>
  </div>
</template>

<script>
import DeleteDialogPlacePoint from "../components/DeleteDialogPlacePoint";
import { mapActions } from "vuex";

export default {
  components: {
    DeleteDialogPlacePoint,
  },
  name: "PlaceListItem",
  props: {
    places: Array,
    require: true,
  },
  methods: {
    ...mapActions("flash_messages", ["showMessage"]),
    deletePlace(id) {
      this.$axios.delete("places/" + id).then((res) => {
        this.$store.commit("places/deletePlace", res.data);
      });
    },
    async handleDeletePlacePoint(id) {
      try {
        await this.deletePlace(id);
        this.showMessage({
          message: "褒めポイントを削除しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "削除に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
  },
};
</script>
