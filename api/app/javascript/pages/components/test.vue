<template>
  <v-row justify="center">
    <!-- <v-dialog v-model="dialog" persistent max-width="600px"> -->
      <div :id="'subordinate-edit-modal-' + subordinate.id">
        <div class="modal" @click.self="handleCloseModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-body">
                <v-card>
                  <ValidationObserver v-slot="{ handleSubmit }">
                    <v-card-title>
                      <span class="text-h5">Subordinate Edit</span>
                    </v-card-title>
                    <v-card-text>
                      <v-container>
                        <v-form>
                          <v-row>
                            <v-col cols="12">
                              <ValidationProvider
                                v-slot="{ errors }"
                                rules="required|max:20"
                                name="名前"
                              >
                                <v-text-field
                                  label="名前"
                                  type="text"
                                  id="name"
                                  name="name"
                                  clearable
                                  v-model="subordinate.name"
                                  :error-messages="errors"
                                ></v-text-field>
                              </ValidationProvider>
                            </v-col>
                            <v-col cols="12">
                              <ValidationProvider
                                v-slot="{ errors }"
                                rules="email"
                                name="メールアドレス"
                              >
                                <v-text-field
                                  label="メールアドレス"
                                  type="email"
                                  id="email"
                                  name="email"
                                  clearable
                                  v-model="subordinate.email"
                                  :error-messages="errors"
                                ></v-text-field>
                              </ValidationProvider>
                            </v-col>
                            <v-col cols="12">
                              <ValidationProvider
                                v-slot="{ errors }"
                                rules="date"
                                name="誕生日"
                              >
                                <v-text-field
                                  label="誕生日"
                                  type="date"
                                  id="birthday"
                                  name="birthday"
                                  clearable
                                  v-model="subordinate.birthday"
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
                      <v-btn
                        color="blue darken-1"
                        text
                        @click="handleSubmit(handleUpdateSubordinate)"
                      >
                        更新する
                      </v-btn>
                      <v-btn
                        color="blue darken-1"
                        text
                        @click="handleCloseModal"
                      >
                        閉じる
                      </v-btn>
                    </v-card-actions>
                  </ValidationObserver>
                </v-card>
              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- </v-dialog> -->
  </v-row>
</template>

<script>
export default {
  name: "SubordinateEditModal",

  data() {
    return {
      dialog: false,
    };
  },

  props: {
    subordinate: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true,
      },
      name: {
        type: String,
        required: true,
      },
      email: {
        type: String,
      },
      birthday: {
        type: Date,
      },
    },
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    handleUpdateSubordinate() {
      this.$emit("update-subordinate", this.subordinate);
    },
  },
};
</script>

<style scoped></style>
