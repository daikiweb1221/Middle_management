<template>
  <div class="text-wrap">
    <div class="text-cont">
      <p class="fs-1 mb-3 font-weight-bold">
        １.{{ everyday_behavior.behaviors_one }}
      </p>
      <p class="fs-1 mb-3 font-weight-bold">
        ２.{{ everyday_behavior.behaviors_two }}
      </p>
      <p class="fs-1 mb-3 font-weight-bold">
        ３.{{ everyday_behavior.behaviors_three }}
      </p>
      <p class="fs-1 mb-3 font-weight-bold">
        ４.{{ everyday_behavior.behaviors_four }}
      </p>
      <p class="fs-1 mb-3 font-weight-bold">
        ５.{{ everyday_behavior.behaviors_five }}
      </p>
      <div class="mt-10 fs-1">
        <p>ではもう一つ質問いたします</p>
        <p>
          上記の要素を<span class="under-line font-weight-bold"
            >{{ authUser.name }}さんは満たしていますか？</span
          >
        </p>
      </div>
      <div class="mt-10 fs-1">
        <p class="mb-0">部下の心を動かす「テクニック」は存在しますが</p>
        <p class="mb-0">部下の心を動かすためにはテクニックだけでなく</p>
        <p class="mb-0">話を聞くに値する自分自身の振る舞い</p>
        <p class="mb-0">
          つまり"<span class="font-weight-bold" style="color: #d3b102"
            >自身の日常の姿</span
          >"が土台になっていることを認識しましょう
        </p>
      </div>
      <div class="btn-cont mt-10">
        <v-btn
          color="primary"
          class="mr-4 font-weight-bold px-16"
          type="submit"
          :to="{ name: 'SubordinateIndex' }"
        >
          次へ
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "TopMindSet",

  computed: {
    ...mapGetters("everyday_behaviors", ["everyday_behavior"]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchEverydayBehaviors();
  },

  methods: {
    ...mapActions("everyday_behaviors", ["fetchEverydayBehaviors"]),
  },
};
</script>

<style scoped>
.text-wrap {
  /* text-align: center; */
  position: relative;
  width: 100%;
  height: 100%;
}
.text-cont {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 0 25px;
  max-width: 600px;
  width: 100%;
}

.btn-cont {
  text-align: center;
}

.under-line {
  background: linear-gradient(transparent 70%, #ffff00 0%);
}

.fs-1 {
  font-size: 1rem;
}

@media screen and (min-width: 480px) {
  .fs-1 {
    font-size: 1.5rem;
  }
}
</style>
