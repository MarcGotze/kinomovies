<script setup>
  const props = defineProps(['label'])
</script>

<template>
  <header class="mb-5">
    <div class="logo py-5"><span class="logo-start">Kino</span><span class="logo-end">movies</span></div>
    <span class="banner-title text-3xl">{{ props.label }}</span>
  </header>
</template>
