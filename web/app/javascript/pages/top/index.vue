<template>
  <div>
    <div class="sub-header">
      <div class="sub-header__btn-wrap">
        <v-btn class="top-btn" text :to="{ name: 'LoginIndex' }"
          >ログイン</v-btn
        >
      </div>
    </div>
    <section class="main l-main">
      <div class="main__cont">
        <div class="main__left">
          <div class="main__title-cont">
            <h1 class="main__title">Middle<br />Management</h1>
          </div>
          <div class="main__desc-cont">
            <p class="main__desc">人に信頼される</p>
            <p class="main__desc two">人に動いてもらえる</p>
            <p class="main__desc three">そんな"理想とする自分"へ</p>
          </div>
          <div class="main__btn-wrap">
            <v-btn
              class="main-btn main_btn__one"
              :to="{ name: 'RegisterIndex' }"
              >さっそく始める</v-btn
            >
            <v-btn
              class="main-btn main_btn__two"
              :to="{ name: 'IdealBossChecksNotLogin' }"
              >上司力をチェックする</v-btn
            >
          </div>
        </div>
        <div class="main__right">
          <img
            src="../../../assets/images/top.png"
            alt="メインビジュアル"
            class="main__visual"
          />
        </div>
      </div>
    </section>
    <section class="service-overview l-service-overview">
      <div class="service-overview__inner inner">
        <div class="service-overview__title-cont sub-title-cont">
          <h2 class="service-overview__title sub-title">Service overview</h2>
          <p class="service-overview__title-j sub-title-j">- サービス概要 -</p>
        </div>
        <div class="service-overview__desc-cont">
          <p class="service-overview__desc service-overview__desc-one">
            部下に信頼されたい 部下の心を動かしたいなど
          </p>
          <p class="service-overview__desc service-overview__desc-two">
            お悩みを持つ中間管理職のみなさまへ
          </p>
          <p class="service-overview__desc service-overview__desc-three">
            自身の日々の立ち振る舞いや行動を見える化し
          </p>
          <p class="service-overview__desc service-overview__desc-four">
            理想とする自分へと導くサービスです
          </p>
        </div>
      </div>
    </section>
    <section class="contents l-contents">
      <div class="contents__inner inner">
        <div class="contents__title-cont sub-title-cont">
          <h2 class="contents__title sub-title">Contents</h2>
          <p class="contents__title-j sub-title-j">- サービス内容 -</p>
        </div>
        <div class="contents__desc-cont">
          <div class="contents__block">
            <div class="contents__block-left">
              <h3 class="contents__block-title">メンバーを登録しよう</h3>
              <div class="contents__block-desc-cont">
                <p class="contents__block-desc">
                  まずは管理したい部下を登録してみましょう<br />そうすることでコミュニケーションの見える化や部下ごとに褒めポイントを追加できるようになります
                </p>
              </div>
            </div>
            <div class="contents__block-right">
              <div class="contents__block-img-wrap contents-img__wrap">
                <img
                  src="../../../assets/images/contents1.png"
                  alt="メンバー登録"
                  class="contents-img"
                  style="width: 100%"
                />
              </div>
            </div>
          </div>
        </div>
        <div class="contents__desc-cont">
          <div class="contents__block">
            <div class="contents__block-right">
              <div class="contents__block-img-wrap contents-img__wrap">
                <img
                  src="../../../assets/images/contents2.png"
                  alt="コミュニケーションの見える化"
                  class="contents-img"
                  style="width: 70%"
                />
              </div>
            </div>
            <div class="contents__block-left">
              <h3 class="contents__block-title">
                コミュニケーションを<br />見える化しよう
              </h3>
              <div class="contents__block-desc-cont">
                <p class="contents__block-desc">
                  部下1人1人としっかりコミュニケーション取れていますか？<br />ハートマークをチェックしてコミュニケーションを見える化しましょう！
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="contents__desc-cont">
          <div class="contents__block">
            <div class="contents__block-left">
              <h3 class="contents__block-title">褒めポイントを集めよう</h3>
              <div class="contents__block-desc-cont">
                <p class="contents__block-desc">
                  部下ごとに褒めポイントを追加しましょう<br />部下をしっかりと観察して褒めポイントがあればすかさず追加！みんなの前で褒めましょう！
                </p>
              </div>
            </div>
            <div class="contents__block-right">
              <div class="contents__block-img-wrap contents-img__wrap">
                <img
                  src="../../../assets/images/contents3.png"
                  alt="褒めポイント"
                  class="contents-img"
                  style="width: 70%"
                />
              </div>
            </div>
          </div>
        </div>
        <div class="contents__desc-cont">
          <div class="contents__block">
            <div class="contents__block-right">
              <div class="contents__block-img-wrap contents-img__wrap">
                <img
                  src="../../../assets/images/contents4.png"
                  alt="立ち振る舞いチェッっく"
                  class="contents-img"
                  style="width: 70%"
                />
              </div>
            </div>
            <div class="contents__block-left">
              <h3 class="contents__block-title">
                立ち振る舞いをチェックしよう
              </h3>
              <div class="contents__block-desc-cont">
                <p class="contents__block-desc">
                  ご自身の日常の姿こそが全ての土台となります<br />立ち振る舞いチェックを行うことで日々の行動を定期的に振り返りましょう
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="contents-btn-cont">
          <v-btn class="main-btn main_btn__one" :to="{ name: 'RegisterIndex' }"
            >さっそく始める</v-btn
          >
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "TopIndex",
};
</script>

<style scoped>
.sub-header__btn-wrap {
  text-align: right;
  padding-right: 4rem;
  padding-top: 1.5625rem;
}
.v-btn {
  font-size: 1.5625rem !important;
  font-weight: 700 !important;
  color: #094067 !important;
}

.inner {
  padding-left: 1.25rem !important;
  padding-right: 1.25rem !important;
}

.sub-title-cont {
  text-align: center;
  padding-top: 4rem;
}

.sub-title {
  font-size: 4rem;
}
.sub-title-j {
  font-size: 1.3rem;
  color: #5f6c7b !important;
}

/* ------------------メインビジュアル------------------ */
.l-main {
  margin-bottom: 9.875rem;
}

.main__cont {
  position: relative;
  max-width: 1440px;
  margin: auto;
}
.main__left {
  position: absolute;
  left: 6.0625rem;
}

.main__title-cont {
  margin-top: 7.625rem;
  margin-left: 1.875rem;
}

.main__desc-cont {
  margin-top: 2.5625rem;
  margin-left: 1.4375rem;
  letter-spacing: 0;
}

.main__title {
  font-size: 4.75rem;
  line-height: 1 !important;
  letter-spacing: 0.25rem;
}

.main__desc {
  font-size: 2.5625rem;
  margin-bottom: initial !important;
}
.two {
  margin-top: -0.5625rem !important;
}
.three {
  margin-top: -0.4375rem !important;
}

.main__right {
  text-align: right;
}
.main__visual {
  width: 53%;
  margin-top: 9.375rem;
}

.main__btn-wrap {
  margin-top: 5.25rem;
  margin-left: 1.6875rem;
}

.main-btn {
  height: initial !important;
  min-width: 4rem !important;
  padding: 1.5rem 1.25rem !important;
  color: white !important;
}

.main_btn__one {
  background-color: #3da9fc !important;
}

.main_btn__two {
  display: inline-block;
  margin-left: 1.25rem;
  background-color: #ef4565 !important;
}

/* ------------------メインビジュアル------------------ */

/* ------------------サービス概要------------------ */

.l-service-overview {
  padding-bottom: 8.5625rem;
}

.service-overview {
  background-color: #d8eefe;
}

.service-overview__desc-cont {
  text-align: center;
  margin-top: 4.4375rem;
}
.service-overview__desc {
  font-size: 1.7rem;
  color: #5f6c7b !important;
}

/* ------------------サービス概要------------------ */

/* ------------------サービス内容------------------ */

.l-contents {
  margin-bottom: 8.125rem;
}
.contents__block {
  display: flex;
  max-width: 1163px;
  margin: auto;
}

.contents__desc-cont {
  margin-top: 4.375rem;
}

.contents__block-left {
  width: 51%;
  margin-top: 3.125rem;
}
.contents__block-right {
  width: 49%;
}

.contents-img__wrap {
  width: 100%;
}

contents-img {
  width: 100%;
}

.contents__block-title {
  font-size: 2.1875rem;
}

.contents__block-desc-cont {
  margin-top: 1.5625rem;
}

.contents__block-desc {
  font-size: 1.3rem;
  color: #5f6c7b !important;
  line-height: 1.8 !important;
}
.contents-btn-cont {
  text-align: center;
  margin-top: 5rem;
}

/* .mv {
  position: relative;
  width: 100%;
  background-size: cover;
  height: 100%;
  background-position: center center;
}

.mt-cont {
  text-align: center;
  padding: 0 25px;
  width: 100%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.desc-title {
  font-size: 1rem;
  text-shadow: 1px 2px 2px #000;
}

.mt-title {
  color: white;
  max-width: 100%;
  font-size: 2rem;
  text-shadow: 2px 1px 7px white;
}

.ideal {
  text-shadow: 1px 1px 2px white, 0 0 1em rgb(255, 255, 255),
    0 0 0.1px rgb(224, 224, 224);
}

.mt-btn-wrap {
  padding: 0 25px;
  width: 100%;
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.ideal-btn {
  color: white !important;
  font-size: 10px !important;
  text-shadow: 1px 2px 2px rgb(94, 94, 94);
  background-color: #fbab7e;
  background-image: linear-gradient(62deg, #fbab7e 0%, #f7ce68 100%);
}

@media screen and (min-width: 480px) {
  .mt-title {
    font-size: 3rem;
  }
  .desc-title {
    font-size: 1rem;
  }
  .ideal-btn {
    font-size: 1rem !important;
  }
}
@media screen and (min-width: 768px) and (max-width: 1024px) {
  .mt-title {
    font-size: 4rem;
  }
  .desc-title {
    font-size: 1.5rem;
  }
}
@media screen and (min-width: 1024px) {
  .mt-title {
    font-size: 6rem;
  }
  .desc-title {
    font-size: 1.5rem;
  }
} */
</style>
