<script setup>
  const emit = defineEmits(['page']);
</script>

<template>
  <div class="pagination my-5">
    <button class="pagination-btn" @click="emit('page', 1)">1</button>
    <button class="pagination-btn" @click="emit('page', 2)">2</button>
    <button class="pagination-btn" @click="emit('page', 3)">3</button>
    <button class="pagination-btn" @click="emit('page', 4)">4</button>
    <button class="pagination-btn" @click="emit('page', 5)">5</button>
  </div>
</template>
