import axios from "../../plugins/axios";
import { serializeEvent } from "../../src/functions/serializers";

const state = {
  events: [],
  event: null,
  isEditMode: false,
};

const getters = {
  events: (state) => state.events.map((event) => serializeEvent(event)),
  event: (state) => serializeEvent(state.event),
  isEditMode: (state) => state.isEditMode,
};

const mutations = {
  setEvents: (state, events) => (state.events = events),
  appendEvent: (state, event) => (state.events = [...state.events, event]),
  setEvent: (state, event) => (state.event = event),
  removeEvent: (state, event) =>
    (state.events = state.events.filter((e) => e.id !== event.id)),
  resetEvent: (state) => (state.event = null),
  updateEvent: (state, event) =>
    (state.events = state.events.map((e) => (e.id === event.id ? event : e))),
  setEditMode: (state, bool) => (state.isEditMode = bool),
};

const actions = {
  async fetchEvents({ commit }) {
    const res = await axios.get("events");
    commit("setEvents", res.data);
  },
  async createEvent({ commit }, event) {
    const res = await axios.post(`events`, event);
    commit("appendEvent", res.data);
  },
  async deleteEvent({ commit }, id) {
    const res = await axios.delete(`events/${id}`);
    commit("removeEvent", res.data);
    commit("resetEvent");
  },
  async updateEvent({ commit }, event) {
    const response = await axios.put(`events/${event.id}`, event);
    commit("updateEvent", response.data);
  },
  setEvent({ commit }, event) {
    commit("setEvent", event);
  },
  setEditMode({ commit }, bool) {
    commit("setEditMode", bool);
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
