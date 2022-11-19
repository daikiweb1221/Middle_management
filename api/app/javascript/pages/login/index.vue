<template>
  <div id="login-form" class="login-form-wrap">
    <div class="login-cont">
      <p class="login-title mb-16">Middle Managementへログインする</p>
      <div class="login-form-cont">
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

<style scoped>
.login-title {
  font-size: 1.9rem;
}
@media screen and (min-width: 480px) {
  .login-title {
    font-size: 3rem;
  }
}

.login-form-wrap {
  text-align: center;
  position: relative;
  width: 100%;
  height: 100%;
}
.login-cont {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 0 25px;
  width: 100%;
}

.login-form-cont {
  max-width: 600px;
  margin: auto;
}
</style>
