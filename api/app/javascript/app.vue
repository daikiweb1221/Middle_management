<template>
  <div>
    <TheHeader class="mb-auto" />
    <router-view />
    <TheFooter class="mt-auto" />
  </div>
</template>

<script>
import TheHeader from "components/TheHeader"
import TheFooter from "components/TheFooter"

export default {
  components: {
    TheHeader,
    TheFooter,
  },
};
</script>
