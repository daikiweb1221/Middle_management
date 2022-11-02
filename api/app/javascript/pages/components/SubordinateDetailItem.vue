<template>
  <div>
    <p>{{ subordinate.name }}</p>
    <p>{{ subordinate.email }}</p>
    <p>{{ subordinate.birthday }}</p>
  </div>
</template>

<script>
export default {
  name: "SubordinateDetailItem",
  props: {
    subordinate: Object,
    require: true,
  },
};
</script>
