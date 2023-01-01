<template>
  <section class="privacy l-privacy">
    <div class="privacy__block">
      <div class="inner">
        <h2 class="privacy__title">- プライバシーポリシー -</h2>
        <h3 class="privacy__heading">お客様から取得する情報</h3>
        <p>当社は、お客様から以下の情報を取得します。</p>
        <ul class="privacy__desc-list">
          <li>氏名(ニックネームやペンネームも含む)</li>
          <li>年齢または生年月日</li>
          <li>性別</li>
          <li>メールアドレス</li>
          <li>写真</li>
        </ul>
        <h3 class="privacy__heading">お客様の情報を利用する目的</h3>
        <p>当社は、お客様から取得した情報を、以下の目的のために利用します。</p>
        <ul class="privacy__desc-list">
          <li>当社サービスに関する登録の受付、お客様の本人確認、認証のため</li>
          <li>お客様の当社サービスの利用履歴を管理するため</li>
          <li>
            当社サービスにおけるお客様の行動履歴を分析し、当社サービスの維持改善に役立てるため
          </li>
          <li>お客様からのお問い合わせに対応するため</li>
          <li>当社の規約や法令に違反する行為に対応するため</li>
          <li>当社サービスの変更、提供中止、終了、契約解除をご連絡するため</li>
          <li>当社規約の変更等を通知するため</li>
          <li>以上の他、当社サービスの提供、維持、保護及び改善のため</li>
        </ul>
        <h3 class="privacy__heading">安全管理のために講じた措置</h3>
        <p>
          当社が、お客様から取得した情報に関して安全管理のために講じた措置につきましては、末尾記載のお問い合わせ先にご連絡をいただきましたら、法令の定めに従い個別にご回答させていただきます。
        </p>
        <h3 class="privacy__heading">第三者提供</h3>
        <p>
          当社は、お客様から取得する情報のうち、個人データ（個人情報保護法第２条第６項）に該当するものついては、あらかじめお客様の同意を得ずに、第三者（日本国外にある者を含みます。）に提供しません。<br />
          但し、次の場合は除きます。
        </p>
        <ul class="privacy__desc-list">
          <li>個人データの取扱いを外部に委託する場合</li>
          <li>当社や当社サービスが買収された場合</li>
          <li>
            事業パートナーと共同利用する場合（具体的な共同利用がある場合は、その内容を別途公表します。）
          </li>
          <li>その他、法律によって合法的に第三者提供が許されている場合</li>
        </ul>
        <h3 class="privacy__heading">アクセス解析ツール</h3>
        <p>
          当社は、お客様のアクセス解析のために、「Googleアナリティクス」を利用しています。Googleアナリティクスは、トラフィックデータの収集のためにCookieを使用しています。トラフィックデータは匿名で収集されており、個人を特定するものではありません。Cookieを無効にすれば、これらの情報の収集を拒否することができます。詳しくはお使いのブラウザの設定をご確認ください。Googleアナリティクスについて、詳しくは以下からご確認ください。<br />
        </p>
        <p class="url-font">
          https://marketingplatform.google.com/about/analytics/terms/jp/
        </p>
        <h3 class="privacy__heading">プライバシーポリシーの変更</h3>
        <p>
          当社は、必要に応じて、このプライバシーポリシーの内容を変更します。この場合、変更後のプライバシーポリシーの施行時期と内容を適切な方法により周知または通知します。
        </p>
        <h3 class="privacy__heading">お問い合わせ</h3>
        <p>
          お客様の情報の開示、情報の訂正、利用停止、削除をご希望の場合は、以下のメールアドレスにご連絡ください。
        </p>
        <p>e-mail middlemanagement.app@gmail.com</p>
        <p>
          この場合、必ず、運転免許証のご提示等当社が指定する方法により、ご本人からのご請求であることの確認をさせていただきます。なお、情報の開示請求については、開示の有無に関わらず、ご申請時に一件あたり1,000円の事務手数料を申し受けます。
        </p>
        <h3 class="privacy__heading">事業者の氏名</h3>
        <p>大関 太喜</p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "Privacy",

  head() {
    return {
      title: {
        inner: "プライバシーポリシー",
        separator: "|",
        complement: "Middle Management",
      },
    };
  },
};
</script>

<style scoped>
.l-privacy {
  background-color: #d8eefe;
  color: #094067;
  padding-bottom: 2rem;
}

.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.privacy__block {
  max-width: 1163px;
  margin: auto;
}

.url-font {
  font-size: 0.625rem;
}

.privacy__title {
  padding: 1.5rem 0;
  text-align: center;
  font-size: 1rem;
}
.privacy__heading {
  margin-top: 1rem;
  font-size: 0.75rem;
}
p {
  font-size: 0.75rem;
}
.privacy__desc-list {
  font-size: 0.75rem;
}

.privacy__heading,
.privacy__title {
  font-weight: bold;
}

@media screen and (min-width: 768px) {
  .ps-br {
    display: block; /* PCを改行して */
  }

  .sp-br {
    display: none; /* SPの改行を隠す */
  }
  .privacy__title {
    font-size: 1.25rem;
  }
  .privacy__heading {
    font-size: initial;
  }
  p {
    font-size: initial;
  }
  .privacy__desc-list {
    font-size: initial;
  }

  .url-font {
    font-size: initial;
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
