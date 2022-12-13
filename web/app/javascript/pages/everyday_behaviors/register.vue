<template>
  <div class="question-wrap">
    <div class="question-cont l-question-cont">
      <div class="question-text-cont">
        <p>まずはじめに質問させてください</p>
        <p>
          {{ authUser.name }}さんは<span class="under-line font-weight-bold"
            >どんな上司のアドバイス</span
          >なら素直に聞けますか？
        </p>
        <p>その要素を5つ入力してください</p>
      </div>

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
          <div class="example-cont">
            <p class="mb-0">例</p>
            <ul>
              <li>正直な人</li>
              <li>人の悪口を言わない人</li>
              <li>誤りがあった際、素直に認め謝ることができる人</li>
              <li>思いやりがある人</li>
              <li>言動と行動が一致している人</li>
              <li>言い訳をしない人</li>
            </ul>
          </div>
          <div class="btn-wrap">
            <v-btn
              style="background-color: #3da9fc; color: white; font-weight: 700"
              class="mr-4 px-15 py-5"
              @click="handleSubmit(CreateEverydayBehavior)"
            >
              次へ
            </v-btn>
          </div>
        </form>
      </validation-observer>
    </div>
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
          this.$router.push({ name: "TopMindSet" });
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped>
.l-question-cont {
  padding: 7rem 1.25rem;
}
.question-wrap {
  /* text-align: center; */
  position: relative;
  width: 100%;
  height: 100%;
}
.question-cont {
  max-width: 750px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
}

.example-cont {
  color: #5f6c7b !important;
  font-size: 0.75rem !important;
}

.btn-wrap {
  text-align: center;
  margin-top: 1rem;
}

.under-line {
  background: linear-gradient(transparent 70%, #ffff00 0%);
}

.question-text-cont {
  font-size: 1.3rem;
}
</style>
