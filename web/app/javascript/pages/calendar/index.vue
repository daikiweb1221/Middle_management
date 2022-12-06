<template>
  <div>
    <h1>Calendar</h1>
    <ul>
      <li v-for="event in events" :key="event.id">
        {{ event.name }}
      </li>
    </ul>
    <button type="submit" @click="fetchEvents()">fetchEvents</button>

    <CalendarDetail />
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import CalendarDetail from "../components/CalendarDetail";
export default {
  name: "CalendarIndex",

  components: {
    CalendarDetail,
  },

  computed: {
    ...mapGetters("events", ["events"]),
  },

  methods: {
    ...mapActions("events", ["fetchEvents"]),
  },
};
</script>
