<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn class="mx-2" fab dark color="primary" v-bind="attrs" v-on="on">
          <v-icon dark> mdi-plus </v-icon>
        </v-btn>
      </template>
      <v-card>
        <ValidationObserver v-slot="{ handleSubmit }" ref="observer">
          <v-card-title>
            <span class="text-h5">Subordinate Profile</span>
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
            <v-btn color="blue darken-1" text @click="closeForm()">
              閉じる
            </v-btn>
            <v-btn
              color="blue darken-1"
              text
              @click="handleSubmit(handleCreateSubordinate)"
            >
              追加する
            </v-btn>
          </v-card-actions>
        </ValidationObserver>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
export default {
  name: "SubordinateCreateModal",
  data() {
    return {
      subordinate: {
        name: "",
        email: "",
        birthday: "",
      },
      dialog: false,
    };
  },
  methods: {
    clear() {
      this.subordinate.name = "";
      this.subordinate.email = "";
      this.subordinate.birthday = "";
      this.$refs.observer.reset();
    },
    handleCreateSubordinate() {
      this.$emit("create-subordinate", this.subordinate);
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
