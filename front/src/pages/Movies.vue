<script setup>
  import Banner from '../components/Banner.vue';
  import NavBar from '../components/NavBar.vue';
  import Pagination from '../components/Pagination.vue'
  import { ref, onMounted, watchEffect } from 'vue'
  import { getMovies } from '../services/movie.js';

  const pageLabel = "MOVIES"
  const selectedPage = ref(1);
  const movies = ref(null);
  const image = "https://image.tmdb.org/t/p/w300/";

  // Récupération des datas au chargement du composant
  onMounted(async () => {
    await refreshMovies();
  });

  const refreshMovies = async () => {
  movies.value = await getMovies(selectedPage.value);
  };

  // watchEffect relance la fonction refreshMovies si elle détecte des changements dans les données passées à l'intérieur
  watchEffect(() => {
    refreshMovies();
  });
</script>

<template>
  <Banner :label="pageLabel" />
  <NavBar />
  <Pagination @page="selectedPage = $event"/> <!-- La variable selectedPage est émise à movies-->

  <div class="movies-container mb-14">
    <div class="movies-card" v-if="movies" v-for="movie in movies" :key="movie.id">
      <router-link :to="'/show/' + movie.id"><img :src="image + movie.backdrop_path" :alt="movie.title + ' backdrop'">
        <div class="hover-box">
          <span class="movies-title">{{ movie.title }}</span>
        </div>
      </router-link>
    </div>
  </div>

</template>
