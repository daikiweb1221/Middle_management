<template>
  <div id="register-form" class="container w-50 text-center">
    <div class="h3 mb-3">ユーザー登録</div>
    <ValidationObserver v-slot="{ handleSubmit }">
      <div class="form-group text-left">
        <ValidationProvider v-slot="{ errors }" rules="required">
          <label for="name">ユーザー名</label>
          <input
            id="name"
            v-model="user.name"
            type="text"
            class="form-control"
            placeholder="username"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
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
        <ValidationProvider v-slot="{ errors }" rules="required" vid="password">
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
      <div class="form-group text-left">
        <ValidationProvider
          v-slot="{ errors }"
          rules="required|min:3|password_confirmed:@password"
        >
          <label for="password_confirmation">パスワード（確認）</label>
          <input
            id="password_confirmation"
            v-model="user.password_confirmation"
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
        @click="handleSubmit(register)"
      >
        登録
      </button>
    </ValidationObserver>
  </div>
</template>

<script>
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
    };
  },
  methods: {
    register() {
      this.$axios
        .post("users", { user: this.user })
        .then((res) => {
          this.$router.push({ name: "LoginIndex" });
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped></style>
