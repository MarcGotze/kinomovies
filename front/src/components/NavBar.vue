<script setup>
</script>

<template>
  <nav>
    <router-link class="nav-link" to="/" :class="$route.path === '/' ? 'active-link' : 'inactive-link'">
      <i class="fa-solid fa-film fa-2xl" style="color: #000000"></i>
    </router-link>
    <router-link class="nav-link" to="/users" :class="$route.path === '/users' ? 'active-link' : 'inactive-link'">
      <i class="fa-solid fa-users fa-2xl" style="color: #000000"></i>
    </router-link>
  </nav>
</template>

<style scoped>
.active-link {
  background-color: #FFBE00;
}

.inactive-link {
  background-color: white;
}
</style>
