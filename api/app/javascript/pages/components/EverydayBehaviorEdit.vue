<template>
  <div class="container">
    <validation-observer ref="observer" v-slot="{ handleSubmit }">
      <form @submit.prevent="submit">
        <validation-provider
          v-slot="{ errors }"
          name="1"
          rules="required|max:30"
        >
          <v-text-field
            v-model="everyday_behavior.behaviors_one"
            :counter="30"
            :error-messages="errors"
            label="1"
            required
          ></v-text-field>
        </validation-provider>
        <validation-provider
          v-slot="{ errors }"
          name="2"
          rules="required|max:30"
        >
          <v-text-field
            v-model="everyday_behavior.behaviors_two"
            :counter="30"
            :error-messages="errors"
            label="2"
            required
          ></v-text-field>
        </validation-provider>
        <validation-provider
          v-slot="{ errors }"
          name="3"
          rules="required|max:30"
        >
          <v-text-field
            v-model="everyday_behavior.behaviors_three"
            :counter="30"
            :error-messages="errors"
            label="3"
            required
          ></v-text-field>
        </validation-provider>
        <validation-provider
          v-slot="{ errors }"
          name="4"
          rules="required|max:30"
        >
          <v-text-field
            v-model="everyday_behavior.behaviors_four"
            :counter="30"
            :error-messages="errors"
            label="4"
            required
          ></v-text-field>
        </validation-provider>
        <validation-provider
          v-slot="{ errors }"
          name="5"
          rules="required|max:30"
        >
          <v-text-field
            v-model="everyday_behavior.behaviors_five"
            :counter="30"
            :error-messages="errors"
            label="5"
            required
          ></v-text-field>
        </validation-provider>

        <v-btn
          class="mr-4 font-weight-bold"
          color="primary"
          @click="handleSubmit(handleUpdateEverydayBehavior)"
        >
          更新する
        </v-btn>
        <v-btn :to="{ name: 'ProfileIndex' }" class="font-weight-bold"
          >キャンセル</v-btn
        >
      </form>
    </validation-observer>
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
