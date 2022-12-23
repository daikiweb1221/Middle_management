<template>
  <section class="all_everyday_behaviors l-all_everyday_behaviors">
    <div class="inner">
      <div class="everyday-behaviors-title-cont">
        <h1
          class="everyday-behaviors-title sub-title"
          style="position: relative"
        >
          Everyone Ideal<span class="everyday-behaviors-title-ja"
            >- みんなの理想の上司 -</span
          >
        </h1>
      </div>

      <div class="all_everyday_behaviors-cont">
        <v-card
          class="all-everyday-behaviors__card"
          elevation="3"
          outlined
          v-for="all in all_everyday_behaviors"
          :key="all.id"
        >
          <div class="everyday-behaviors__inner">
            <v-list-item>
              <v-list-item-content>
                <v-list-item-title
                  >１.{{ all.behaviors_one }}</v-list-item-title
                >
              </v-list-item-content>
            </v-list-item>

            <v-list-item>
              <v-list-item-content>
                <v-list-item-title
                  >２.{{ all.behaviors_two }}</v-list-item-title
                >
              </v-list-item-content>
            </v-list-item>

            <v-list-item>
              <v-list-item-content>
                <v-list-item-title
                  >３.{{ all.behaviors_three }}</v-list-item-title
                >
              </v-list-item-content>
            </v-list-item>
            <v-list-item>
              <v-list-item-content>
                <v-list-item-title
                  >４.{{ all.behaviors_four }}</v-list-item-title
                >
              </v-list-item-content>
            </v-list-item>
            <v-list-item>
              <v-list-item-content>
                <v-list-item-title
                  >５.{{ all.behaviors_five }}</v-list-item-title
                >
              </v-list-item-content>
            </v-list-item>
          </div>
        </v-card>
      </div>
    </div>
  </section>
</template>

<script>
import { mapGetters, mapActions } from "vuex";

export default {
  name: "AllEverydayBehaviorIndex",

  computed: {
    ...mapGetters("everyday_behaviors", ["all_everyday_behaviors"]),
    ...mapGetters("users", ["authUser"]),
  },

  created() {
    this.fetchAllEverydayBehaviors();
  },

  methods: {
    ...mapActions("everyday_behaviors", ["fetchAllEverydayBehaviors"]),
  },
  head() {
    return {
      title: {
        inner: "みんなの理想の上司",
        separator: "|",
        complement: "Middle Management",
      },
    };
  },
};
</script>

<style scoped>
.edit-form {
  margin-top: 30px;
}

.l-all_everyday_behaviors {
  width: 100%;
  height: 100%;
  background-color: #d8eefe;
  padding-bottom: 8rem;
}

.inner {
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  max-width: 1100px;
  margin: auto;
}

.everyday-behaviors-title-cont {
  padding-top: 2.1875rem;
}

.everyday-behaviors-title {
  font-size: 2rem;
}
.everyday-behaviors-title-ja {
  position: absolute;
  color: #5f6c7b;
  font-size: 0.75rem;
  top: 3rem;
  left: 2rem;
}

.all_everyday_behaviors-cont {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin-top: 3.125rem;
}
.v-card {
  width: 500px !important;
  margin-top: 1rem !important;
}

@media screen and (max-width: 767px) {
  .everyday-behaviors-title {
    font-size: 1.3rem;
  }
  .everyday-behaviors-title-ja {
    position: absolute;
    color: #5f6c7b;
    font-size: 0.75rem;
    top: 2rem;
    left: 0.4rem;
  }
}
</style>
