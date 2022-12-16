<template>
  <v-card>
    <ValidationObserver v-slot="{ handleSubmit }">
      <v-card-title>
        <span style="color: #094067; font-weight: 700" class="text-h5"
          >編集</span
        >
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
                <ValidationProvider v-slot="{ errors }" name="誕生日">
                  <v-menu
                    ref="menu"
                    v-model="menu"
                    :close-on-content-click="false"
                    transition="scale-transition"
                    offset-y
                    min-width="auto"
                  >
                    <template v-slot:activator="{ on, attrs }">
                      <v-text-field
                        :error-messages="errors"
                        v-model="subordinate.birthday"
                        label="誕生日"
                        prepend-icon="mdi-calendar"
                        readonly
                        v-bind="attrs"
                        v-on="on"
                      ></v-text-field>
                    </template>
                    <v-date-picker
                      v-model="subordinate.birthday"
                      :active-picker.sync="activePicker"
                      :max="
                        new Date(
                          Date.now() - new Date().getTimezoneOffset() * 60000
                        )
                          .toISOString()
                          .substr(0, 10)
                      "
                      min="1950-01-01"
                      @change="save"
                    ></v-date-picker>
                  </v-menu>
                </ValidationProvider>
              </v-col>
            </v-row>
          </v-form>
        </v-container>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="blue darken-1" text @click="handleCloseModal">
          閉じる
        </v-btn>
        <v-btn
          color="blue darken-1"
          text
          @click="handleSubmit(handleUpdateSubordinate)"
        >
          更新する
        </v-btn>
      </v-card-actions>
    </ValidationObserver>
  </v-card>
</template>

<script>
export default {
  name: "SubordinateEditModal",

  data() {
    return {
      activePicker: null,
      menu: false,
    };
  },

  props: {
    dialog: {
      type: Boolean,
    },
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

  watch: {
    menu(val) {
      val && setTimeout(() => (this.activePicker = "YEAR"));
    },
  },

  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    handleUpdateSubordinate() {
      this.$emit("update-subordinate", this.subordinate);
    },
    save(date) {
      this.$refs.menu.save(date);
    },
  },
};
</script>

<style scoped></style>
