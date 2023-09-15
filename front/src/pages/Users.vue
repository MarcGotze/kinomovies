<script setup>
  import Banner from '../components/Banner.vue';
  import NavBar from '../components/NavBar.vue';
  import User from '../components/User.vue';
  import { ref, onBeforeMount } from 'vue'
  import { getUsers } from '../services/users.js';

  const pageLabel = "USERS"
  const users = ref(null);

  onBeforeMount(async () => {
    users.value = await getUsers();
  });
</script>

<template>
  <Banner :label="pageLabel" />
  <NavBar />
  <User :users="users" />
</template>
