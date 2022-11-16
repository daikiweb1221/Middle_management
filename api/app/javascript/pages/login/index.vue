<template>
  <div id="login-form" class="container text-center" style="margin-top: 140px">
    <p class="text-h4">Middle Managementへログインする</p>
    <div style="max-width: 600px" class="mx-auto mt-15">
      <validation-observer ref="observer" v-slot="{ handleSubmit }">
        <form @submit.prevent="submit">
          <validation-provider
            v-slot="{ errors }"
            name="メールアドレス"
            rules="required|email"
          >
            <v-text-field
              v-model="user.email"
              :error-messages="errors"
              label="メールアドレス"
              required
              outlined
              dense
            ></v-text-field>
          </validation-provider>

          <validation-provider
            v-slot="{ errors }"
            name="パスワード"
            rules="required|min:3"
          >
            <v-text-field
              v-model="user.password"
              :error-messages="errors"
              label="パスワード"
              required
              :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
              :type="show1 ? 'text' : 'password'"
              name="input-10-1"
              counter
              @click:append="show1 = !show1"
              outlined
              dense
            ></v-text-field>
          </validation-provider>

          <v-btn
            color="primary"
            class="mr-4 font-weight-bold px-10"
            type="submit"
            @click="handleSubmit(login)"
          >
            ログイン
          </v-btn>
        </form>
      </validation-observer>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "LoginIndex",
  data() {
    return {
      user: {
        email: "",
        password: "",
      },
      show1: false,
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
    submit() {
      this.$refs.observer.validate();
    },
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: "SubordinateIndex" });
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped></style>
