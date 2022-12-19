<template>
  <section
    class="guide l-guide"
    :style="{ 'background-image': 'url(' + assetsImage + ')' }"
  >
    <div class="inner">
      <h1 class="guide__title">Guide</h1>
      <p>- ガイド -</p>

      <h2 class="guide__introduction">はじめに</h2>
      <p class="guide__intro-desc">
        ハーバード大学の研究結果によると人間の幸福度を上げる最も重要な要素は良好な人間関係と言われています
        ミドルマネジメントを活用して良好な人間関係を築けるようになり人生の幸福度を上げましょう
      </p>
      <h2 class="guide__title">使い方</h2>

      <div class="guide-container">
        <div class="guide-block">
          <div class="guide-block__text">
            <h3 class="guide-contents__title">全ての土台は日常の姿</h3>
            <p class="guide-contents__desc">
              人を動かすテクニックや法則は存在しますが、その半面で、同じテクニックやコミュニケーション方法をとっているにもかかわらず相手の心を動かせないパターンがあります
              まず知らなければならないのは人を動かすテクニックではなくあなたの言うことを聞いて動きたくなるという根本的な感情です
              人の心を動かす為の大原則とはテクニックやコミュニケーションではなく自分自身の日常の姿が全ての土台となってます
              最初に挙げていただく五つの要素を常に振り返り、まずは話を聞くに値する日常の立ち振る舞いをしましょう
              またみんなの理想ページでは各ユーザーが思う話を聞くに値する人の特徴を見ることができます
              是非、あなた以外の人が思う話を聞くに値する人の特徴を参考にしてみてください
            </p>
          </div>
          <div class="guide-block__img-wrap">
            <div class="guide-block__img">
              <img src="" alt="" />
            </div>
          </div>
        </div>

        <div class="guide-block">
          <div class="guide-block__text">
            <h3 class="guide-contents__title">上司力チェック</h3>
            <p class="guide-contents__desc">
              こちらではあなたの影響力を図るテストができます
              ここでのチェックはどれもが人に動いてもらえる人間として重要な要素になるものばかりです
              いいえを選んでしまった項目については今後はいを選べるようしっかりと改善していきましょう
              また定期的にチェックを行い日々の行動を振り返ることが重要です
            </p>
          </div>
          <div class="guide-block__img-wrap">
            <div class="guide-block__img">
              <img src="" alt="" />
            </div>
          </div>
        </div>
        <div class="guide-block">
          <div class="guide-block__text">
            <h3 class="guide-contents__title">メンバーを登録</h3>
            <p class="guide-contents__desc">
              <span class="guide-contents-head">登録したいメンバーを追加</span>
              メンバー登録することで誕生日や後述する褒めポイントなどを追加することができます
              <span class="guide-contents-head">褒めポイントを追加</span>
              日々メンバーを観察して良いところを探してください
              良いところを見つけたらすかさず褒めポイントへ追加していきましょう（ささいなことでもなんでも結構です）
              褒めポイントへ追加した内容をもとに日々メンバーを褒めてあげましょう
              褒められることで自己重要感があがります
              自己重要感を上げてくれたあなたにそのメンバーは好意を抱いてくれるはずです
              <span class="guide-contents-head"
                >コミュニケーションの見える化</span
              >
              メンバー登録をすると、そのメンバーとその日にコミュニケーションが取れたかどうかをライクボタンで管理できます
              ここでいうコミュニケーションの定義とは
              仕事内容や用事などの情報の伝達ではなく<span class="under-line"
                >相手をいい気分にできたかどうか</span
              >です
              名前を呼んであいさつしたり、褒めポイントをつたえたり、笑顔であいづちしながら世間話をしたりなど、全員にライクボタンが押せるよう努力しましょう
            </p>
          </div>
          <div class="guide-block__img-wrap">
            <div class="guide-block__img">
              <img src="" alt="" />
            </div>
          </div>
        </div>
        <div class="guide-block">
          <div class="guide-block__text">
            <h3 class="guide-contents__title">スケジュール登録機能</h3>
            <p class="guide-contents__desc">
              カレンダーに予定やメモを登録することができます
              あなたの予定や部下との約束やスケジュールやを登録することができます
            </p>
          </div>
          <div class="guide-block__img-wrap">
            <div class="guide-block__img">
              <img src="" alt="" />
            </div>
          </div>
        </div>
      </div>

      <p class="guide-end__text">
        使い方は以上です。それでは素敵なマネジメントライフを
      </p>
    </div>
  </section>
</template>

<script>
import AssetsImage from "../../../assets/images/background.jpg";

export default {
  name: "Guide",

  data() {
    return {
      assetsImage: AssetsImage,
    };
  },
};
</script>
<style scoped>
.under-line {
  background: linear-gradient(transparent 70%, #ffff00 0%);
}
.l-guide {
  width: 100%;
  background-size: cover;
  height: 100%;
  background-position: center center;
}
.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}

@media screen and (min-width: 768px) {
  .ps-br {
    display: block; /* PCを改行して */
  }

  .sp-br {
    display: none; /* SPの改行を隠す */
  }
}

/* 画面幅が560px以下の時は */
@media screen and (max-width: 767px) {
  .ps-br {
    display: none; /* PCの改行を隠して */
  }

  .sp-br {
    display: block; /* SPを改行する */
  }
}
</style>
