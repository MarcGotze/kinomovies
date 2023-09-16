<script setup>
import Banner from "../components/Banner.vue";
import NavBar from "../components/NavBar.vue";
import Cards from "../components/Cards.vue";
import { ref, onBeforeMount } from "vue";
import { getUsers } from "../services/users.js";

const pageLabel = "USERS";
const users = ref(null);

onBeforeMount(async () => {
  users.value = await getUsers();
});
</script>

<template>
  <Banner :label="pageLabel" />
  <NavBar />
  <Cards :users="users" />
</template>
