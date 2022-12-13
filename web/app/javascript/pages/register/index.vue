<template>
  <div id="register-form" class="register-form-wrap">
    <div class="register-cont">
      <p class="register-title mb-16">Middle Managementをはじめる</p>
      <div class="register-form-cont">
        <validation-observer ref="observer" v-slot="{ handleSubmit }">
          <form @submit.prevent="submit">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required|max:20"
              name="ニックネーム"
            >
              <v-text-field
                label="ニックネーム"
                type="text"
                id="name"
                name="name"
                clearable
                outlined
                dense
                v-model="user.name"
                :error-messages="errors"
              ></v-text-field>
            </ValidationProvider>

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

            <validation-provider v-slot="{ errors }" name="パスワード再入力">
              <v-text-field
                :rules="[required, min3, matchingPasswords]"
                v-model="user.password_confirmation"
                :error-messages="errors"
                label="パスワード再入力"
                required
                :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                :type="show2 ? 'text' : 'password'"
                name="input-10-1"
                counter
                @click:append="show2 = !show2"
                outlined
                dense
              ></v-text-field>
            </validation-provider>

            <v-btn
              style="background-color: #3da9fc; color: white; font-weight: 700"
              class="mr-4 px-10"
              type="submit"
              @click="handleSubmit(register)"
            >
              新規登録
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
  name: "RegisterIndex",
  data() {
    return {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: "",
      },
      show1: false,
      show2: false,
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
    submit() {
      this.$refs.observer.validate();
    },
    required(value) {
      if (value) {
        return true;
      } else {
        return "パスワード再入力は必須項目です";
      }
    },
    min3(value) {
      if (value.length >= 3) {
        return true;
      } else {
        return "パスワード再入力は3文字以上で入力してください";
      }
    },
    matchingPasswords() {
      if (this.user.password === this.user.password_confirmation) {
        return true;
      } else {
        return "パスワードが一致しません";
      }
    },
    async register() {
      await this.$axios
        .post("users", { user: this.user })
        .then((res) => {})
        .catch((err) => {
          console.log(err);
        });
      await this.loginUser(this.user);
      this.$router.push({ name: "TopIntroduction" });
    },
  },
};
</script>

<style scoped>
.register-title {
  font-size: 1.9rem;
}
@media screen and (min-width: 480px) {
  .register-title {
    font-size: 3rem;
  }
}

.register-form-wrap {
  text-align: center;
  position: relative;
  width: 100%;
  height: 100%;
}
.register-cont {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 0 25px;
  width: 100%;
}

.register-form-cont {
  max-width: 600px;
  margin: auto;
}
</style>
