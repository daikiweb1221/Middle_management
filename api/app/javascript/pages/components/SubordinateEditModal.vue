<template>
  <div id="subordinate-edit-modal">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="form-group">
              <label for="name">名前</label>
              <input
                type="text"
                class="form-control"
                id="name"
                v-model="subordinate.name"
              />
            </div>
            <div class="form-group">
              <label for="email">メールアドレス</label>
              <input
                type="email"
                class="form-control"
                id="email"
                v-model="subordinate.email"
              />
            </div>
            <div class="form-group">
              <label for="birthday">誕生日</label>
              <input
                type="date"
                class="form-control"
                id="birthday"
                v-model="subordinate.birthday"
              />
            </div>
            <div class="d-flex justify-content-between">
              <button class="btn btn-success" @click="handleUpdateSubordinate">
                更新する
              </button>
              <button class="btn btn-secondary" @click="handleCloseModal">
                閉じる
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal-backdrop show"></div>
  </div>
</template>

<script>
export default {
  name: "SubordinateEditModal",
  props: {
    subordinate: {
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
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    handleUpdateSubordinate() {
      this.$emit("update-subordinate", this.subordinate);
    },
  },
};
</script>

<style scoped>
.modal {
  display: block;
}
</style>
