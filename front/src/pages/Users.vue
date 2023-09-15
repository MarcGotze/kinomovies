<script setup>
  import Banner from '../components/Banner.vue';
  import NavBar from '../components/NavBar.vue';
  import { ref, onBeforeMount } from 'vue'
  import { getUsers } from '../services/users.js';

  const users = ref();

  onBeforeMount(async () => {
    users.value = await getUsers();
  });
</script>

<template>
  <Banner />
  <NavBar />
  <div class="my-5 flex justify-center" v-for="user in users">
    <div class="user-card collapse collapse-arrow bg-base-200">
      <input type="radio" name="my-accordion-2" />
      <div class="collapse-title text-xl font-medium flex items-center">
        <img :src="user.image_path" alt="">
        <span class="user-username"> {{ user.username }}</span>
      </div>
      <div class="collapse-content">
        <h3 class="ml-3 mt-4 font-bold">Liked genres:</h3>
        <ul class="flex">
          <li class="liked-tag my-4 p-4 mx-2 font-bold text-center" v-for="liked in user.liked_tags">
            {{ liked.name }}
          </li>
        </ul>
        <h3 class="ml-3 font-bold">Disliked genres:</h3>
        <ul class="flex">
          <li class="disliked-tag my-4 p-4 mx-2 font-bold text-lg text-center" v-for="disliked in user.disliked_tags">
            {{ disliked.name }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
