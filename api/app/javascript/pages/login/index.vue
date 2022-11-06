<template>
  <div id="login-form" class="container w-50 text-center">
    <div class="h3 mb-3">ログイン</div>
    <ValidationObserver v-slot="{ handleSubmit }">
      <div class="form-group text-left">
        <ValidationProvider v-slot="{ errors }" rules="required|email">
          <label for="email">メールアドレス</label>
          <input
            id="email"
            v-model="user.email"
            type="email"
            class="form-control"
            placeholder="test@example.com"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
      <div class="form-group text-left">
        <ValidationProvider v-slot="{ errors }" rules="required|min:3">
          <label for="password">パスワード</label>
          <input
            id="password"
            v-model="user.password"
            type="password"
            class="form-control"
            placeholder="password"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
      <button
        type="submit"
        class="btn btn-primary"
        @click="handleSubmit(login)"
      >
        ログイン
      </button>
    </ValidationObserver>
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
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
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
