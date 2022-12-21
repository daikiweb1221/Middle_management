<template>
  <v-container class="white rounded-lg">
    <p class="reset-title pt-2 mb-3 font-weight-bold text-center">
      登録済のメールアドレスを<br class="sp-br" />入力してください
    </p>
    <v-divider class="mb-4" style="max-width: 1200px; margin: auto" />
    <ValidationObserver v-slot="{ invalid }">
      <ValidationProvider
        v-slot="{ errors }"
        name="メールアドレス"
        rules="required|email"
      >
        <v-text-field
          v-model="email"
          label="メールアドレス"
          type="email"
          prepend-icon="mdi-email"
          :error-messages="errors"
          placeholder="メールアドレスを入力してください"
        />
      </ValidationProvider>

      <v-btn
        class="mr-4 font-weight-bold"
        type="submit"
        color="success"
        :disabled="invalid"
        @click="createPasswordReset"
      >
        送信
      </v-btn>
      <v-btn
        class="mr-4 font-weight-bold"
        type="submit"
        @click="handleCloseModal"
      >
        キャンセル
      </v-btn>
    </ValidationObserver>
  </v-container>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "ResetPasswordModal",
  data() {
    return {
      email: "",
    };
  },
  methods: {
    ...mapActions("flash_messages", ["showMessage"]),
    createPasswordReset() {
      this.$axios
        .post("/password_resets", { email: this.email })
        .then((res) => {
          this.$router.push({ name: "TopIndex" });
          this.showMessage({
            message: "パスワード再設定メールを送信しました",
            type: "light-blue",
            status: true,
          });
        });
    },
    handleCloseModal() {
      this.$emit("close-modal");
    },
  },
};
</script>

<style scoped>
.reset-title {
  font-size: 1rem;
}
@media screen and (min-width: 768px) {
  .ps-br {
    display: block; /* PCを改行して */
  }

  .sp-br {
    display: none; /* SPの改行を隠す */
  }
}

@media screen and (max-width: 767px) {
  .ps-br {
    display: none; /* PCの改行を隠して */
  }

  .sp-br {
    display: block; /* SPを改行する */
  }
}
</style>
