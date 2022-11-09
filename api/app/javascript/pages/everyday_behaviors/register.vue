<template>
  <div id="subordinate-create-container">
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
          @click="handleSubmit(CreateEverydayBehavior)"
        >
          追加
        </button>
      </div>
    </ValidationObserver>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "EverydayBehaviorRegister",
  data() {
    return {
      everyday_behavior: {
        behaviors_one: "",
        behaviors_two: "",
        behaviors_three: "",
        behaviors_four: "",
        behaviors_five: "",
      },
    };
  },

  computed: {
    ...mapGetters("users", ["authUser"]),
  },

  methods: {
    CreateEverydayBehavior() {
      this.$axios
        .post("everyday_behaviors", {
          everyday_behavior: this.everyday_behavior,
        })
        .then((res) => {
          this.$router.push({ name: "EverydayBehaviorIndex" });
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped></style>
