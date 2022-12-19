<template>
  <div class="place-point__box">
    <v-card class="place-point__card" v-for="place in places" :key="place.id">
      <v-timeline align-top dense class="place-card-inner">
        <v-timeline-item color="pink" small>
          <v-row class="pt-1">
            <v-col cols="3">
              <span class="place-point__date">{{
                formatDateToJa(place.created_at)
              }}</span>
            </v-col>
            <v-col>
              <strong style="color: #094067">{{ place.place_point }}</strong>
              <div class="text-caption">
                <DeleteDialogPlacePoint
                  @delete-place-point="handleDeletePlacePoint(place.id)"
                />
              </div>
            </v-col>
          </v-row>
        </v-timeline-item>
      </v-timeline>
    </v-card>
  </div>
</template>

<script>
import DeleteDialogPlacePoint from "../components/DeleteDialogPlacePoint";
import { mapActions } from "vuex";
import { formatDateToJa } from "../../src/functions/datetime";

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
    formatDateToJa,
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
<style scoped>
.place-point__box {
  width: 100%;
}
.place-card-inner {
  padding-right: 0.75rem !important;
}

@media screen and (min-width: 750px) {
  .place-point__box {
    width: 50%;
  }
}

.place-point__date {
  color: #5f6c7b;
  font-size: 0.625rem;
}
</style>
