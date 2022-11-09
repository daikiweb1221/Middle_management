<template>
  <div id="everyday_behavior-edit-container">
    <ValidationObserver v-slot="{ handleSubmit }">
      <div class="form-group">
        <ValidationProvider v-slot="{ errors }" rules="required|max:30">
          <label for="behaviors_one">1</label>
          <input
            type="text"
            class="form-control"
            id="behaviors_one"
            v-model="everyday_behavior.behaviors_one"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>

      <div class="form-group">
        <ValidationProvider v-slot="{ errors }" rules="required|max:30">
          <label for="behaviors_two">2</label>
          <input
            type="text"
            class="form-control"
            id="behaviors_two"
            v-model="everyday_behavior.behaviors_two"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>

      <div class="form-group">
        <ValidationProvider v-slot="{ errors }" rules="required|max:30">
          <label for="behaviors_three">3</label>
          <input
            type="text"
            class="form-control"
            id="behaviors_three"
            v-model="everyday_behavior.behaviors_three"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>

      <div class="form-group">
        <ValidationProvider v-slot="{ errors }" rules="required|max:30">
          <label for="behaviors_four">4</label>
          <input
            type="text"
            class="form-control"
            id="behaviors_four"
            v-model="everyday_behavior.behaviors_four"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>

      <div class="form-group">
        <ValidationProvider v-slot="{ errors }" rules="required|max:30">
          <label for="behaviors_five">5</label>
          <input
            type="text"
            class="form-control"
            id="behaviors_five"
            v-model="everyday_behavior.behaviors_five"
          />
          <span class="text-danger">{{ errors[0] }}</span>
        </ValidationProvider>
      </div>
      <div class="d-flex justify-content-between">
        <button
          class="btn btn-success"
          @click="handleSubmit(handleUpdateEverydayBehavior)"
        >
          更新する
        </button>
      </div>
    </ValidationObserver>
  </div>
</template>

<script>
export default {
  name: "EverydayBehaviorEdit",
  props: {
    everyday_behavior: {
      type: Object,
      required: true,
      id: {
        type: Number,
        required: true,
      },
      behaviors_one: {
        type: String,
        required: true,
      },
      behaviors_two: {
        type: String,
        required: true,
      },
      behaviors_three: {
        type: String,
        required: true,
      },
      behaviors_four: {
        type: String,
        required: true,
      },
      behaviors_five: {
        type: String,
        required: true,
      },
    },
  },
  methods: {
    handleUpdateEverydayBehavior() {
      this.$emit("update-everyday_behavior", this.everyday_behavior);
    },
  },
};
</script>

<style scoped></style>
