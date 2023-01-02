<template>
  <div
    class="app l-ideal"
    :style="{ 'background-image': 'url(' + assetsImage + ')' }"
  >
    <div class="inner">
      <div class="ideal__title-cont">
        <h1 class="ideal__title">Let's Check!!</h1>
      </div>
      <div class="position-center">
        <h3 class="ideal-sub-title text-center">
          - あなたの影響力をチェックしてみましょう -
        </h3>
        <!-- クイズを表示する部分 -->
        <div v-if="!completed" id="quiz">
          <v-card loading elevation="2" shaped>
            <v-card-text class="text-center">
              <p class="card-header-title quiz-font">
                第 {{ questionIndex + 1 }} 問
              </p>
              <div class="card-content">
                <div class="content">
                  <p class="quiz-font question-font">
                    {{ currentQuestion.question }}
                  </p>
                </div>
              </div>
            </v-card-text>

            <v-card-actions
              class="text-center"
              style="max-width: 300px; margin: auto; display: block"
            >
              <v-btn
                type="submit"
                v-for="(answer, index) in currentQuestion.answers"
                v-bind:key="index"
                @click="addAnswer(index)"
              >
                {{ answer }}
              </v-btn>
            </v-card-actions>
          </v-card>
        </div>

        <!-- 結果表示する部分 -->
        <div v-if="completed">
          <v-card elevation="14" class="text-center">
            <p class="rank-heading text-center">あなたの影響力は・・・</p>
            <div v-if="rankA">
              <p class="rank-text"><span class="rank class-a">A</span>ランク</p>
              <p class="rank-description">
                素晴らしい！あなたの日々の行動や立ち振る舞いは部下から話を聞くに値すると思われています。<br />さらに上司力を上げるためにMiddle
                Managementをはじめてみましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
            <div v-if="rankB">
              <p class="rank-text"><span class="rank class-b">B</span>ランク</p>
              <p class="rank-description">
                良いですね！信頼される上司まであと少し。<br />さらに上司力を上げるためにMiddle
                Managementをはじめてみましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
            <div v-if="rankC">
              <p class="rank-text"><span class="rank class-c">C</span>ランク</p>
              <p class="rank-description">
                まずまずです！ですが、まだまだできることはあるはず。<br />さらに上司力を上げるためにMiddle
                Managementをはじめてみましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
            <div v-if="rankD">
              <p class="rank-text"><span class="rank class-d">D</span>ランク</p>
              <p class="rank-description">
                まだまだできることはあるはず。<br />さらに上司力を上げるためにMiddle
                Managementをはじめてみましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
            <div v-if="rankE">
              <p class="rank-text"><span class="rank class-e">E</span>ランク</p>
              <p class="rank-description">
                もしかすると部下から信頼を得られていない可能性があります。<br />上司力を上げるために今すぐMiddle
                Managementをはじめてみましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
            <div v-if="rankF">
              <p class="rank-text"><span class="rank class-f">F</span>ランク</p>
              <p class="rank-description">
                もしかすると部下から信頼を得られていない可能性があります。<br />上司力を上げるために今すぐMiddle
                Managementをはじめてみましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
            <div v-if="rankG">
              <p class="rank-text"><span class="rank class-g">G</span>ランク</p>
              <p class="rank-description">
                残念ながらあなたは部下から信頼を得られていません。<br />今すぐMiddle
                Managementをはじめて信頼される上司を目指しましょう!
              </p>
              <div class="register-btn-wrap">
                <v-btn
                  color="#3da9fc"
                  class="mr-4 font-weight-bold px-16"
                  dark
                  type="submit"
                  :to="{ name: 'RegisterIndex' }"
                >
                  さっそく始める
                </v-btn>
              </div>
            </div>
          </v-card>
        </div>
        <div class="btn-wrap">
          <v-btn
            color="#3da9fc"
            class="mr-4 font-weight-bold px-16"
            dark
            type="submit"
            @click="reload()"
          >
            もう一度チェックする
          </v-btn>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import AssetsImage from "../../../assets/images/ideal-back.jpg";

export default {
  name: "IdealBossChecks",
  data() {
    return {
      assetsImage: AssetsImage,
      answers: [],
      questionIndex: 0,
      correctCount: 0,
      questions: [
        {
          question: "部下に自分から挨拶していますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question: "部下と話している時に腕や足を組まないようにしていますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "部下の意見に対しどんなことでも否定から入らないようにしていますか？（受け入れるではなく受け止める）",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "部下への感情表現が豊かにできていますか？（リアクションが取れているか）",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question: "部下の話を遮らず最後まで聞いていますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question: "部下の目を見て相槌しながら話を聞けてますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "部下への挨拶や感謝をするとき、また会話中に部下の名前を呼んでいますか？　例「おはようございます」→「〇〇さんおはようございます」「ありがとうございます」→「〇〇さん、ありがとうございます」",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question: "部下へ反射レベルでありがとうと言えていますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "部下を褒めるときはあえて「大勢の前で」、逆に指摘するときは「1人の時に」していますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "指示や命令ではなく部下からのアドバイスを求められていますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "部下の変化に気づいて一言かけられていますか？（髪型や髪色を変えた時、新しい服を着ている時、スリムになった時、ネイルが変わった時、悩み事がある時、体調が悪い、いつもより元気がない時など）",
          answers: ["Yes", "No"],
          answer: 0,
        },
        {
          question:
            "部下の誕生日を一人一人把握していますか？またお祝いの言葉を贈れていますか？",
          answers: ["Yes", "No"],
          answer: 0,
        },
      ],
    };
  },
  methods: {
    addAnswer(index) {
      this.answers.push(index);
      if (this.questions.length == this.answers.length) {
        for (var i in this.answers) {
          var answer = this.answers[i];

          if (answer == this.questions[i].answer) {
            this.correctCount++;
          }
        }
      } else {
        this.questionIndex++;
      }
      return console.log(this.correctCount);
    },
    reload() {
      this.$router.go({ path: this.$router.currentRoute.path, force: true });
    },
  },
  computed: {
    currentQuestion() {
      return this.questions[this.questionIndex];
    },
    completed() {
      return this.questions.length == this.answers.length;
    },
    rankA() {
      return this.correctCount >= 11;
    },
    rankB() {
      return this.correctCount === 10;
    },
    rankC() {
      return this.correctCount === 9;
    },
    rankD() {
      return this.correctCount === 8;
    },
    rankE() {
      return this.correctCount === 7;
    },
    rankF() {
      return this.correctCount === 6;
    },
    rankG() {
      return this.correctCount <= 5;
    },
  },
  head() {
    return {
      title: {
        inner: "上司力チェック",
        separator: "|",
        complement: "Middle Management",
      },
    };
  },
};
</script>

<style scoped>
.l-ideal {
  width: 100%;
  background-size: cover;
  height: 100%;
  background-position: center center;
}

.position-center {
  padding-top: 5rem;
  width: 100%;
}

.quiz-font {
  color: #094067;
}

.question-font {
  font-size: 1.25rem;
}
.btn-wrap {
  max-width: 300px;
  margin: 40px auto;
}

.register-btn-wrap {
  max-width: 300px;
  margin: 0.725rem auto 0;
  padding-bottom: 1rem;
}

.rank {
  font-size: 10rem;
  font-weight: 900;
  line-height: initial;
}
.class-a {
  color: #d3b102;
}
.class-b {
  color: #b16722;
}
.class-c {
  color: orange;
}
.class-d {
  color: #c5c500;
}
.class-e {
  color: green;
}
.class-f {
  color: #343490;
}
.class-g {
  color: gray;
}

.rank-heading {
  font-size: 2rem;
  color: #094067;
  font-weight: 700 !important;
  margin-bottom: 0 !important;
  padding: 25px 25px 0 25px;
  text-align: left !important;
}

.rank-text {
  font-size: 3rem;
  font-weight: 700;
  color: #094067;
  margin-bottom: 0 !important;
}

.rank-description {
  text-align: center;
  padding: 0 25px 25px 25px;
  font-size: 1.2rem;
  font-weight: 700 !important;
  color: #094067;
}

.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}

.ideal__title-cont {
  padding-top: 2.1875rem;
}

.ideal__title {
  font-size: 1.3rem;
}

.ideal-sub-title {
  margin-bottom: 2.25rem;
}

@media screen and (max-width: 767px) {
  .position-center {
    padding-top: 3.125rem;
  }
  .rank-description {
    text-align: left;
    padding: 0 25px 25px 25px;
    font-size: 0.75rem;
    font-weight: 700 !important;
    color: #094067;
  }
  .rank-heading {
    font-size: 1rem;
    color: #094067;
    font-weight: 700 !important;
    margin-bottom: 0 !important;
    padding: 25px 25px 0 25px;
    text-align: left !important;
  }

  .ideal-sub-title {
    font-size: 0.9rem;
    margin-bottom: 1rem;
  }

  .rank-text {
    font-size: 1rem;
    font-weight: 700;
    color: #094067;
    margin-bottom: 0 !important;
  }
  .rank {
    font-size: 3rem;
    font-weight: 900;
    line-height: initial;
  }
  .question-font {
    font-size: 1rem;
  }
}
</style>
