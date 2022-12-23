<template>
  <section class="profile l-profile">
    <div class="profile-back-ground">
      <div class="inner">
        <div class="profile__title-cont">
          <h1 class="profile__title">My Profile</h1>
        </div>
        <div class="profile__cont">
          <v-card class="mx-auto profile__card" elevation="3" outlined>
            <v-list-item three-line>
              <v-list-item-content>
                <div class="text-overline mb-4">Profile</div>
                <v-list-item-title class="user__name mb-1">
                  {{ authUser.name }}
                </v-list-item-title>
                <div class="sub-title__wrap">
                  <v-list-item-subtitle
                    ><v-icon class="pr-2" color="#5f6c7b">mdi-email</v-icon
                    >{{ authUser.email }}</v-list-item-subtitle
                  >
                </div>
              </v-list-item-content>

              <v-list-item-avatar tile size="80" color="white">
                <v-img
                  :src="authUser.avatar_url"
                  v-if="authUser.avatar_url"
                ></v-img>
                <v-icon v-else size="80">mdi-account-circle</v-icon>
              </v-list-item-avatar>
            </v-list-item>

            <v-card-actions>
              <v-spacer></v-spacer>
              <div class="profile-edit__wrap">
                <v-btn :to="{ name: 'ProfileEdit' }" icon small>
                  <v-icon>mdi-account-edit</v-icon>
                </v-btn>
              </div>
            </v-card-actions>
          </v-card>
        </div>
      </div>
    </div>
    <div class="everyday-behaviors l-everyday-behaviors">
      <div class="inner">
        <div class="everyday-behaviors-title-cont">
          <h1 class="everyday-behaviors-title sub-title">
            Everyday Behaviors<span class="everyday-behaviors-title-ja"
              >- 土台となる日常の姿 -</span
            >
          </h1>
        </div>
        <div class="everyday-behaviors__block">
          <div class="everyday-behaviors__left">
            <v-card elevation="3" outlined>
              <div class="everyday-behaviors__inner">
                <v-list-item>
                  <v-list-item-content>
                    <v-list-item-title
                      >１.{{
                        everyday_behavior.behaviors_one
                      }}</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>

                <v-list-item two-line>
                  <v-list-item-content>
                    <v-list-item-title
                      >２.{{
                        everyday_behavior.behaviors_two
                      }}</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>

                <v-list-item two-line>
                  <v-list-item-content>
                    <v-list-item-title
                      >３.{{
                        everyday_behavior.behaviors_three
                      }}</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>
                <v-list-item four-line>
                  <v-list-item-content>
                    <v-list-item-title
                      >４.{{
                        everyday_behavior.behaviors_four
                      }}</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>
                <v-list-item five-line>
                  <v-list-item-content>
                    <v-list-item-title
                      >５.{{
                        everyday_behavior.behaviors_five
                      }}</v-list-item-title
                    >
                  </v-list-item-content>
                </v-list-item>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <div class="profile-edit__wrap">
                    <v-btn
                      :to="{ name: 'EverydayBehaviorEditPage' }"
                      icon
                      small
                    >
                      <v-icon>mdi-pencil</v-icon>
                    </v-btn>
                  </div>
                </v-card-actions>
              </div>
            </v-card>
          </div>
          <div class="everyday-behaviors__right">
            <div class="place-point__img-wrap">
              <img
                src="../../../assets/images/everyday-behaviors.png"
                alt="褒めポイント"
                class="place-point__img"
                style="width: 100%"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "ProfileIndex",
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
  head() {
    return {
      title: {
        inner: "マイページ",
        separator: "|",
        complement: "Middle Management",
      },
    };
  },
};
</script>

<style scoped>
.l-profile {
  padding-bottom: 8rem;
}
.profile-back-ground {
  background-color: #d8eefe;
  padding-bottom: 8rem;
}
.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}
.profile__cont {
  margin-top: 1rem;
}

.profile__title-cont {
  padding-top: 2.1875rem;
}

.profile__title {
  font-size: 2rem;
}

.user__name {
  font-size: 1rem;
}

.text-overline {
  color: #5f6c7b;
}
.profile__card {
  max-width: 800px;
  text-align: center;
}

.everyday-behaviors-title {
  position: relative;
  font-size: 2rem;
}

.everyday-behaviors-title-ja {
  position: absolute;
  color: #5f6c7b;
  font-size: 0.75rem;
  top: 2.9375rem;
  left: 4.5625rem;
}

.l-everyday-behaviors {
  margin-top: 4rem;
}

.everyday-behaviors__inner {
  padding-top: 1rem;
}

.everyday-behaviors__block {
  margin: 3rem auto 0;
}

.everyday-behaviors__left {
  width: 50%;
}

@media screen and (min-width: 750px) {
  .everyday-behaviors__block {
    display: flex;
    justify-content: space-between;
    max-width: 850px;
  }
  .everyday-behaviors__right {
    width: 60%;
  }
}

@media screen and (max-width: 767px) {
  .profile-back-ground {
    padding-bottom: 4rem;
  }
  .profile__title {
    font-size: 1.3rem;
  }
  .everyday-behaviors-title {
    position: relative;
    font-size: 1.3rem;
  }

  .everyday-behaviors-title-ja {
    position: absolute;
    color: #5f6c7b;
    font-size: 0.5rem;
    top: 1.875rem;
    left: 2.6875rem;
  }
  .l-everyday-behaviors {
    margin-top: 3rem;
  }

  .everyday-behaviors__left {
    width: 100%;
  }

  .user__name {
    font-size: 1rem;
  }
}
</style>
