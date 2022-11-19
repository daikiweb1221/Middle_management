<template>
  <div class="text-wrap">
    <div class="text-cont">
      <p class="intro-title mb-10">Middle Managementへようこそ</p>
      <div class="desc-cont">
        <p>
          <span class="font-weight-bold" style="color: #d3b102"
            >「部下に信頼される」</span
          ><span class="font-weight-bold" style="color: #d3b102"
            >「部下に動いてもらえる」</span
          >そんな上司とは…
        </p>
        <p>現代では科学的研究結果により、ある程度その答えが出てています</p>
        <p>そしてその方法は至ってシンプル</p>
        <p>しかし、{{ authUser.name }}さんはそれを”ちゃんと”できてますか？</p>
        <p>
          Middle Managementは<span
            class="font-weight-bold"
            style="color: #d3b102"
            >「部下に信頼されたい」</span
          ><span class="font-weight-bold" style="color: #d3b102"
            >「部下の心を動かしたい」</span
          >などの
        </p>
        <p>悩みを持つ中間管理職のみなさまへ</p>
        <p>
          自身の日々の立ち振る舞いや行動を見える化し<span
            class="font-weight-bold"
            style="color: #d3b102"
            >「理想とする自分」</span
          >へと導くサービスです
        </p>
      </div>
      <div class="mt-10">
        <v-btn
          color="primary"
          class="mr-4 font-weight-bold px-16"
          type="submit"
          :to="{ name: 'EverydayBehaviorRegister' }"
        >
          次へ
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "TopIntroduction",

  computed: {
    ...mapGetters("users", ["authUser"]),
  },
};
</script>

<style scoped>
.v-enter-active,
.v-leave-active {
  transition: opacity 0.5s;
}
.v-enter,
.v-leave-to {
  opacity: 0;
}

.text-wrap {
  text-align: center;
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
  width: 100%;
}

.intro-title {
  font-size: 3rem;
  line-height: 1.4;
}

.desc-cont {
  font-size: 1rem;
}

@media screen and (min-width: 768px) and (max-width: 1024px) {
  .desc-cont {
    font-size: 1.3rem;
  }
}
@media screen and (min-width: 1024px) {
  .desc-cont {
    font-size: 1.3rem;
  }
}
</style>
