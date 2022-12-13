<template>
  <div>
    <div class="sub-header">
      <div class="sub-header__btn-wrap">
        <v-btn class="top-btn" text :to="{ name: 'LoginIndex' }"
          >ログイン</v-btn
        >
      </div>
      <div class="main">
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
      </div>
    </div>
  </div>
  <!-- <div class="mv" :style="{ 'background-image': 'url(' + assetsImage + ')' }">
    <div class="px-6 pt-15">
      <p style="color: white" class="desc-title font-weight-bold">
        "人に信頼される"、"人に動いてもらえる"そんな上司とは...
      </p>
      <p style="color: white" class="desc-title font-weight-bold">
        Middle Managementはあなたを「<span
          class="ideal font-weight-bold"
          style="color: #d3b102"
        >
          理想とする自分 </span
        >」へと導きます
      </p>
    </div>
    <div class="mt-cont">
      <h1 class="mt-title font-weight-bold">Middle Management</h1>
      <div class="mt-btn-wrap mt-15">
        <v-btn
          class="ideal-btn font-weight-bold py-1"
          :to="{ name: 'IdealBossChecksNotLogin' }"
          >今すぐ自分の上司力をチェックする</v-btn
        >
      </div>
    </div>
  </div> -->
</template>

<script>
// import AssetsImage from "../../../assets/images/middlemanagement-top.jpg";

export default {
  name: "TopIndex",
  // data() {
  //   return {
  //     assetsImage: AssetsImage,
  //   };
  // },
};
</script>

<style scoped>
.sub-header__btn-wrap {
  text-align: right;
  padding-right: 4rem;
  padding-top: 1.5625rem;
}
.v-btn__content {
}
.v-btn {
  font-size: 1.5625rem !important;
  font-weight: 700 !important;
  color: #094067 !important;
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
