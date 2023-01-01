<template>
  <div>
    <v-footer class="footer" dark app style="z-index: 5">
      <div>
        <p class="footer__title mb-0">Middle Management</p>
        <small>Copyright &copy; 2022. Middle Management</small>
      </div>
      <div class="privacy-terms__block">
        <v-btn class="privacy__btn" text :to="{ name: 'Privacy' }"
          >プライバシーポリシー</v-btn
        >
        <v-btn class="privacy__btn" text :to="{ name: 'TermsOfService' }"
          >利用規約</v-btn
        >
        <v-btn
          class="privacy__btn"
          text
          href="https://forms.gle/QqW44PKSAF7KHP4t5"
          >お問い合わせ</v-btn
        >
      </div>
    </v-footer>
  </div>
</template>

<script>
export default {
  name: "TheFooter",
};
</script>

<style scoped>
.footer {
  background-color: #094067 !important;
  padding-top: 1rem !important;
  padding-bottom: 1rem !important;
  position: relative !important;
  justify-content: space-between;
}
.footer__title {
  font-size: 0.75rem;
}
small {
  font-size: 0.625rem;
}
.v-btn {
  font-size: 0.625rem !important;
}
.privacy-terms__block {
  margin-top: 0.625rem;
}

@media screen and (min-width: 768px) {
  .footer__title {
    font-size: 1rem;
  }
  small {
    font-size: 0.75rem;
  }
  .v-btn {
    font-size: 0.75rem !important;
  }
  .privacy-terms__block {
    margin-top: initial;
  }
}
</style>
