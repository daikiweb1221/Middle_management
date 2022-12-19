<template>
  <div>
    <v-dialog v-model="dialog" persistent max-width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn fab dark small color="green" v-bind="attrs" v-on="on">
          <v-icon dark> mdi-comment-edit </v-icon>
        </v-btn>
      </template>
      <v-card>
        <ValidationObserver v-slot="{ handleSubmit }" ref="observer">
          <v-card-title style="color: #094067; font-weight: 700">
            褒めポイントを追加する
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-form>
                <v-row>
                  <v-col cols="12">
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:100"
                      name="褒めポイント"
                    >
                      <v-text-field
                        label="褒めポイント"
                        type="text"
                        id="place-point"
                        name="place-point"
                        clearable
                        v-model="place.place_point"
                        :error-messages="errors"
                      ></v-text-field>
                    </ValidationProvider>
                  </v-col>
                </v-row>
              </v-form>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="closeForm()">
              閉じる
            </v-btn>
            <v-btn
              color="blue darken-1"
              text
              @click="handleSubmit(handleCreatePlace)"
            >
              追加する
            </v-btn>
          </v-card-actions>
        </ValidationObserver>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: "PlaceCreateModal",
  data() {
    return {
      place: {
        place_point: "",
      },
      dialog: false,
    };
  },

  methods: {
    clear() {
      this.place.place_point = "";
      this.$refs.observer.reset();
    },
    handleCreatePlace() {
      this.$emit("create-place", this.place);
      this.dialog = false;
      this.clear();
    },
    closeForm() {
      this.dialog = false;
      this.clear();
    },
  },
};
</script>

<style scoped></style>
