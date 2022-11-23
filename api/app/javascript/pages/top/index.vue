<template>
  <div class="mv" :style="{ 'background-image': 'url(' + assetsImage + ')' }">
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
  </div>
</template>

<script>
import AssetsImage from "../../../assets/images/middlemanagement-top.jpg";

export default {
  name: "TopIndex",
  data() {
    return {
      assetsImage: AssetsImage,
    };
  },
};
</script>

<style scoped>
.mv {
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
}
</style>
