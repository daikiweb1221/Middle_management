<template>
  <div :id="'subordinate-edit-modal-' + subordinate.id">
    <div class="modal" @click.self="handleCloseModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <ValidationObserver v-slot="{ handleSubmit }">
              <div class="form-group">
                <ValidationProvider v-slot="{ errors }" rules="required|max:20">
                  <label for="name">名前</label>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    v-model="subordinate.name"
                  />
                  <span class="text-danger">{{ errors[0] }}</span>
                </ValidationProvider>
              </div>
              <div class="form-group">
                <ValidationProvider v-slot="{ errors }" rules="email">
                  <label for="email">メールアドレス</label>
                  <input
                    type="email"
                    class="form-control"
                    id="email"
                    v-model="subordinate.email"
                  />
                  <span class="text-danger">{{ errors[0] }}</span>
                </ValidationProvider>
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
                <button
                  class="btn btn-success"
                  @click="handleSubmit(handleUpdateSubordinate)"
                >
                  更新する
                </button>
                <button class="btn btn-secondary" @click="handleCloseModal">
                  閉じる
                </button>
              </div>
            </ValidationObserver>
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
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true,
      },
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
