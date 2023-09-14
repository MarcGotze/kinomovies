<script setup>
  import Banner from '../components/Banner.vue';
  import NavBar from '../components/NavBar.vue';
  import { ref, onBeforeMount, watchEffect } from 'vue'
  import { getUsers } from '../services/users.js';

  const users = ref();

  onBeforeMount(async () => {
    users.value = await getUsers();
  });
</script>

<template>
  <Banner />
  <NavBar />
  <div class="my-5" v-for="user in users">
    <div class="user-card">
      <img :src="user.image_path" alt="">
      <span class="user-username"> {{ user.username }}</span>
      <div v-for="liked in user.liked_tags">
        <span>LIKED: {{ liked.name }}</span>
      </div>
      <div v-for="disliked in user.disliked_tags">
        <span>DISLIKED: {{ disliked.name }}</span>
      </div>
    </div>
  </div>
</template>
