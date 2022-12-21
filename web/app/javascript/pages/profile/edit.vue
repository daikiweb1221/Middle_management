<template>
  <div id="update-form" class="container text-center">
    <p class="py-2 text-h6 font-weight-bold">- プロフィール編集 -</p>

    <validation-observer ref="observer" v-slot="{ handleSubmit }">
      <validation-provider
        v-slot="{ errors }"
        name="名前"
        rules="required|max:20"
      >
        <v-text-field
          v-model="user.name"
          :counter="20"
          :error-messages="errors"
          label="名前"
          required
        ></v-text-field>
      </validation-provider>

      <v-file-input
        @change="handleChange"
        accept="image/png, image/jpeg, image/bmp"
        placeholder="Pick an avatar"
        prepend-icon="mdi-camera"
        label="プロフィール画像"
      ></v-file-input>

      <v-btn :to="{ name: 'ProfileIndex' }" class="font-weight-bold"
        >キャンセル</v-btn
      >
      <v-btn
        class="mr-4 font-weight-bold"
        color="primary"
        @click="handleSubmit(update)"
        >更新する
      </v-btn>
    </validation-observer>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "ProfileEdit",
  data() {
    return {
      user: {
        name: "",
        avatar_url: "",
      },
      uploadAvatar: "",
    };
  },

  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  created() {
    this.user = Object.assign({}, this.authUser);
  },
  methods: {
    ...mapActions("users", ["updateUser"]),
    ...mapActions("flash_messages", ["showMessage"]),
    async handleChange(event) {
      this.uploadAvatar = event;
    },
    update() {
      const formData = new FormData();
      formData.append("user[name]", this.user.name);
      if (this.uploadAvatar) formData.append("user[avatar]", this.uploadAvatar);

      try {
        this.updateUser(formData);
        this.$router.push({ name: "ProfileIndex" });
        this.showMessage({
          message: "プロフィールを更新しました",
          type: "light-blue",
          status: true,
        });
      } catch (error) {
        this.showMessage({
          message: "プロフィールの更新に失敗しました",
          type: "error",
          status: true,
        });
        console.log(error);
      }
    },
  },
};
</script>

<style scoped></style>
