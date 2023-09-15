<script setup>
  const props = defineProps(['users'])
</script>

<template>
  <div class="my-5 flex justify-center" v-for="user in users">
    <div class="user-card collapse collapse-arrow bg-base-200">
      <input type="radio" name="my-accordion-2" />
      <div class="collapse-title text-xl font-medium flex items-center">
        <img :src="user.image_path" :alt="user.username">
        <span class="user-username mr-2"> {{ user.username }}</span>
        <span v-if="$route.path != '/users'">Movie Compatibility: {{ Math.floor(user.rating) }}/10</span>
      </div>
      <div class="collapse-content">
        <div class="flex justify-end">
          <a class="contact text-xl mt-5" :href="'mailto:' + user.email">Contact</a>
        </div>
        <h3 class="ml-3 mt-4 font-bold">Liked genres:</h3>
        <ul class="flex">
          <li class="liked-tag my-4 p-3 mx-2 font-bold text-center" v-for="liked in user.liked_tags">
            {{ liked.name }}
          </li>
        </ul>
        <h3 class="ml-3 font-bold">Disliked genres:</h3>
        <ul class="flex">
          <li class="disliked-tag my-4 p-3 mx-2 font-bold text-lg text-center" v-for="disliked in user.disliked_tags">
            {{ disliked.name }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
