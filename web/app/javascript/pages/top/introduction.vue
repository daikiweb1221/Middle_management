<template>
  <section class="introduction l-introduction">
    <div class="introduction__inner">
      <div class="introduction__title-cont">
        <h1 class="introduction__title">Middle Managementへようこそ</h1>
      </div>
      <div class="introduction__desc-cont">
        <div class="introduction__block">
          <div class="introduction__block-left">
            <h3 class="introduction__block-title">部下に信頼される</h3>
            <h3 class="introduction__block-title">
              部下に動いてもらえる上司とは
            </h3>
            <div class="introduction__block-desc-cont">
              <p class="introduction__block-desc">
                現代では科学的研究結果によりある程度その答えが出てています<br />
                そしてその方法は至ってシンプル<br />
                しかし{{
                  authUser.name
                }}さんはそれを”ちゃんと”できてますか？<br />
                「部下に信頼されたい」「部下の心を動かしたい」<br />
                そんな悩みを持つ中間管理職のみなさまへ<br />
                日々の立ち振る舞いや行動を見える化し<br />
                理想とする自分を手に入れましょう
              </p>
            </div>
          </div>
          <div class="introduction__block-right">
            <div class="introduction__block-img-wrap introduction-img__wrap">
              <img
                src="../../../assets/images/introduction1.png"
                alt="メンバー登録"
                class="introduction-img"
                style="width: 100%"
              />
            </div>
          </div>
        </div>
      </div>
      <div class="introduction__btn-cont">
        <v-btn
          style="background-color: #3da9fc; color: white; font-weight: 700"
          class="mr-4 px-15 py-5"
          type="submit"
          :to="{ name: 'EverydayBehaviorRegister' }"
        >
          次へ
        </v-btn>
      </div>
    </div>
  </section>
  <!-- <div class="text-wrap">
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
          style="background-color: #3da9fc; color: white; font-weight: 700"
          class="mr-4 px-10"
          type="submit"
          :to="{ name: 'EverydayBehaviorRegister' }"
        >
          次へ
        </v-btn>
      </div>
    </div>
  </div> -->
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
.l-introduction {
  padding-bottom: 7.25rem;
}
.introduction__inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.introduction__title-cont {
  margin-top: 4.6875rem;
}
.introduction__title {
  text-align: center;
  font-size: 4.0625rem;
}
.introduction__block {
  display: flex;
  max-width: 1160px;
  margin: auto;
}

.introduction__desc-cont {
  margin-top: 2.5rem;
}

.introduction__block-left {
  width: 55%;
  margin-top: 5rem;
}
.introduction__block-right {
  width: 45%;
}

.introduction-img__wrap {
  width: 100%;
}

introduction-img {
  width: 100%;
}

.introduction__block-title {
  font-size: 2.1875rem;
}

.introduction__block-desc-cont {
  margin-top: 1.5625rem;
}

.introduction__block-desc {
  font-size: 1.3rem;
  color: #5f6c7b !important;
  line-height: 1.8 !important;
}

.introduction__btn-cont {
  text-align: center;
  margin-top: 2rem;
}
/* .v-enter-active,
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
} */
</style>
