<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" persistent max-width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn color="primary" dark v-bind="attrs" v-on="on">
          Open Dialog
        </v-btn>
      </template>
      <v-card>
        <ValidationObserver v-slot="{ handleSubmit }">
          <v-card-title>
            <span class="text-h5">Subordinate Profile</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <ValidationProvider
                    v-slot="{ errors }"
                    rules="required|max:20"
                  >
                    <v-text-field
                      label="名前"
                      type="text"
                      v-model="subordinate.name"
                      :error-messages="errors"
                    ></v-text-field>
                  </ValidationProvider>
                </v-col>
                <v-col cols="12">
                  <ValidationProvider v-slot="{ errors }" rules="email">
                    <v-text-field
                      label="メールアドレス"
                      type="email"
                      v-model="subordinate.email"
                      :error-messages="errors"
                    ></v-text-field>
                  </ValidationProvider>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    label="誕生日"
                    type="date"
                    v-model="subordinate.birthday"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="dialog = false">
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
  data: () => ({
    dialog: false,
  }),
};
</script>
