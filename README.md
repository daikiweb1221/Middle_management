# Middle Management

![rails](https://img.shields.io/badge/Rails-v6.1.7-red)
![rails](https://img.shields.io/badge/Vue-v2.6.11-brightgreen)

##サービス概要
「人に信頼される」、「人に動いてもらえる」そんな上司とは…
このアプリは、「部下に信頼されたい」、「部下の心を動かしたい」などの悩みを持つ中間管理職のみなさまへ
自身の日々の立ち振る舞いや行動を見える化し、「理想とする自分」へと導くサービスです。

###メインのターゲットユーザー
「部下に信頼されたい」、「部下の心を動かしたい」などの悩みを持つ中間管理職のみなさま

###ユーザーが抱える課題
「部下が言うことを聞いてくれない」、「部下に信頼してもらえてないように感じる」など職場の人間関係に何かしらの不安を感じているが何をどうしたらいいかわからない

###解決方法
現代では科学的研究結果により、ある程度答えが出ており、そしてその方法は至ってシンプルです。
しかし、あなたはそれを”ちゃんと”できていますか？自身の日々の立ち振る舞いや行動を見える化し「自分が理想とする姿」へと導きます。

##実装機能 ###未ログインユーザー
*ユーザー登録
*上司力チェック \*ガイド

###ログインユーザー
*ログイン機能
*パスワードリセット機能
*土台となる日常の姿登録
上記で入力した内容を「土台となる日常の姿 5」としてマイページでいつでも確認ができます。
*上司力チェック
「影響力のある人間」になるためへのクイズ形式のチェック機能。<br>
A~G までのランク評価を受けることができます。
*メンバー登録・編集・削除
*褒めポイント作成・削除
*プロフィール編集・プロフィール画像アップロード
*各ユーザーの理想の上司像閲覧機能
*コミュニケーション見える化機能
ハートマーク（コミュニケーションの見える化）
*スケジュール登録機能

##なぜこのサービスを作りたいのか？
現在私自身が中間管理職をしており、部下の動かし方や良いアドバイスの仕方に悩んでいました。
そして世の中には様々な業種で多くの管理職の方々いて、私と同じような悩みを持つ人もいるのではないかと考えました。
人間の悩みのほとんどは対人関係であり、人間の幸福度を上げる最も重要な要素は良好な人間関係だと言われています。
中間管理職として人間関係に悩みを持つ人が、このサービスを使うことで課題解決をし、充実した毎日を過ごせるような手助けになればという思いを込めております。

## 使用技術

**フロントエンド**

<ul>
  <li>Vue.js 2.6.11</li>
  <details>
    <summary>主要npmパッケージ</summary>
    <ul>
      <li><a href="https://github.com/vuetifyjs/vuetify">vuetify</a></li>
      <li><a href="https://github.com/vuejs/vue-router">vue-router</a></li>
      <li><a href="https://github.com/vuejs/vuex/tree/3.x">vuex</a></li>
      <li><a href="https://github.com/logaretm/vee-validate">vee-validate</a></li>
      <li><a href="https://github.com/eslint/eslint">eslint</a></li>
    </ul>
  </deatails>
</ul>

**バックエンド**

<ul>
  <li>Ruby 3.0.5</li>
  <li>Rails 6.1.7</li>
  <details>
    <summary>主要gem</summary>
    <ul>
      <li><a href="https://github.com/rails/webpacker">webpacker</a></li>
      <li><a href="https://github.com/fgrehm/letter_opener_web">letter_opener_web</a></li>
      <li><a href="https://github.com/Sorcery/sorcery">sorcery</a></li>
      <li><a href="https://github.com/rubyconfig/config">config</a></li>
      <li><a href="https://github.com/rubocop/rubocop">rubocop</a></li>
    </ul>
  </deatails>
</ul>

【画面遷移図 URL】
・スマホ
https://www.figma.com/file/Q3IMKs1x5m5yrYaX7aaytE/Middle-Management%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3(%E3%82%B9%E3%83%9E%E3%83%9B)

・PC
https://www.figma.com/file/7TwJSRukq9qBRwOKNFlakm/Middle-Management%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3(PC)

【ER 図】
https://drive.google.com/file/d/1NTRkf9m4Mc5rh_h9QC9J6aFrLiBpLUJY/view?usp=sharing
