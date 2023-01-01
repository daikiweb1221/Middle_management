<template>
  <section class="mindset l-mindset">
    <div class="mindset__inner inner">
      <div class="mindset__cont">
        <div class="mindset__block">
          <div class="mindset__block-left">
            <div class="mindset__items">
              <p class="mindset__item">
                １. {{ everyday_behavior.behaviors_one }}
              </p>
              <p class="mindset__item">
                ２. {{ everyday_behavior.behaviors_two }}
              </p>
              <p class="mindset__item">
                ３. {{ everyday_behavior.behaviors_three }}
              </p>
              <p class="mindset__item">
                ４. {{ everyday_behavior.behaviors_four }}
              </p>
              <p class="mindset__item">
                ５. {{ everyday_behavior.behaviors_five }}
              </p>
            </div>
          </div>
          <div class="mindset__block-right">
            <div class="mindset__block-img-wrap mindset-img__wrap">
              <img
                src="../../../assets/images/mindset.png"
                alt="マインドセット"
                class="mindset-img"
                style="width: 90%"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="mindset__under-cont inner">
      <div class="mindset__under-title-wrap">
        <h2 class="under__title">
          <span class="under-line font-weight-bold"
            >上記の要素を<br class="sp-br" />{{
              authUser.name
            }}さんは満たしていますか？</span
          >
        </h2>
      </div>
      <div class="mindset__under-desc-cont">
        <p class="mindset__desc">
          上記の要素を満たしているか<br
            class="sp-br"
          />日々振り返ってみてください
        </p>
        <p class="mindset__desc">
          「部下の心を動かすテクニック」<br class="sp-br" />は確かに存在しますが
        </p>
        <p class="mindset__desc">
          部下の心を動かすためには、<br
            class="sp-br"
          />話を聞くに値する自身の振る舞い
        </p>
        <p class="mindset__desc">
          つまり<span style="color: #ef4565">“自身の日常の姿”</span>が<br
            class="sp-br"
          />土台になっていることを認識しましょう
        </p>
      </div>
      <div class="mindset__btn-wrap">
        <v-btn
          style="background-color: #3da9fc; color: white; font-weight: 700"
          class="mr-4 px-15 py-5"
          type="submit"
          :to="{ name: 'SubordinateIndex' }"
        >
          次へ
        </v-btn>
      </div>
    </div>
  </section>
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
.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.mindset__cont {
  margin-top: 1.25rem;
}
.mindset__block {
  display: flex;
  max-width: 1163px;
  margin: auto;
  flex-direction: column;
}
.mindset__under-desc-cont {
  width: 100%;
  margin: auto;
  font-weight: 700;
}
.mindset__block-left {
  width: 100%;
  margin-top: 3.125rem;
}
.mindset__block-right {
  width: 80%;
  margin: auto;
}

.mindset-img__wrap {
  width: 100%;
}

.mindset__item {
  font-size: 1.3rem;
  font-weight: 700;
}

.mindset__block-left {
  margin-top: initial;
}

.under-line {
  background: linear-gradient(transparent 70%, #ffff00 0%);
}

.mindset__under-cont {
  text-align: center;
  background-color: #d8eefe !important;
  padding-bottom: 2rem;
}

.mindset__under-title-wrap {
  padding: 3rem 0;
  width: 100%;
  margin: auto;
}

.under__title {
  font-size: 1.3rem;
}

.mindset__desc {
  color: #5f6c7b;
  margin: 0;
}
.mindset__desc {
  font-size: 1rem;
  margin-bottom: 2px;
}
.mindset__btn-wrap {
  padding-top: 2rem;
  text-align: center;
}

@media screen and (min-width: 768px) {
  .inner {
    padding-left: 1.25rem;
    padding-right: 1.25rem;
  }

  .mindset__cont {
    margin-top: initial;
  }
  .mindset__block {
    display: flex;
    max-width: 1163px;
    margin: auto;
    flex-direction: initial;
  }
  .mindset__block-left {
    width: 51%;
    margin-top: 3.125rem;
  }
  .mindset__block-right {
    width: 49%;
    margin: initial;
  }

  .mindset-img__wrap {
    width: 100%;
  }

  .mindset__item {
    font-size: 1.75rem;
  }

  .mindset__block-left {
    margin-top: 11rem;
  }

  .under-line {
    background: linear-gradient(transparent 70%, #ffff00 0%);
  }

  .mindset__under-cont {
    text-align: center;
    background-color: #d8eefe !important;
  }

  .mindset__under-title-wrap {
    padding: 4.375rem 0;
    width: initial;
    margin: initial;
  }

  .under__title {
    font-size: 2rem;
  }

  .mindset__desc {
    color: #5f6c7b;
    margin: initial;
  }
  .mindset__desc {
    font-size: 1.3125rem;
  }
  .mindset__btn-wrap {
    padding-top: 2rem;
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
