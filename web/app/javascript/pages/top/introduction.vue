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
                現代では科学的研究結果によりある程度その答えが出てています。<br />
                そしてその方法は至ってシンプル。<br />
                しかし{{
                  authUser.name
                }}さんはそれを”ちゃんと”できていますか？<br />
                「部下に信頼されたい」<br
                  class="sp-br"
                />「部下の心を動かしたい」<br />
                そんな悩みを持つ<br class="sp-br" />中間管理職のみなさまへ<br />
                <span class="under-line"
                  >日々の立ち振る舞いや行動を見える化し</span
                ><br />
                理想とする自分を手に入れましょう。
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
.under-line {
  background: linear-gradient(transparent 70%, #ffff00 0%);
}
.l-introduction {
  padding-bottom: 2rem;
}
.introduction__inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.introduction__title-cont {
  margin-top: 2rem;
}
.introduction__title {
  text-align: center;
  font-size: 2rem;
}
.introduction__block {
  display: flex;
  max-width: 1160px;
  margin: auto;
  flex-direction: column-reverse;
}

.introduction__desc-cont {
  margin-top: 2.5rem;
}

.introduction__block-left {
  width: 90%;
  margin: auto;
}
.introduction__block-right {
  width: 75%;
}

.introduction-img__wrap {
  width: 100%;
}

introduction-img {
  width: 100%;
}

.introduction__block-title {
  font-size: 1.2rem;
}

.introduction__block-desc-cont {
  margin-top: 1.5625rem;
}

.introduction__block-desc {
  font-size: 1rem;
  font-weight: 700;
  color: #5f6c7b !important;
  line-height: 1.8 !important;
}

.introduction__btn-cont {
  text-align: center;
  margin-top: 2rem;
}

@media screen and (min-width: 768px) {
  .introduction__inner {
    padding-left: 1.25rem;
    padding-right: 1.25rem;
  }
  .introduction__title-cont {
    margin-top: 4.6875rem;
  }
  .introduction__title {
    text-align: center;
    font-size: 3.5rem;
  }
  .introduction__block {
    display: flex;
    max-width: 1160px;
    margin: auto;
    flex-direction: initial;
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
}
@media screen and (min-width: 768px) {
  .ps-br {
    display: block; /* PCを改行して */
  }

  .sp-br {
    display: none; /* SPの改行を隠す */
  }
}

@media screen and (max-width: 767px) {
  .ps-br {
    display: none; /* PCの改行を隠して */
  }

  .sp-br {
    display: block; /* SPを改行する */
  }
}
</style>
