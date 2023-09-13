<script setup>
  import { ref, onMounted, watchEffect } from 'vue'
  import { getMovies, getGenres } from '../services/movie.js';
  import Pagination from '../components/Pagination.vue'

  const selectedPage = ref(1);
  const movies = ref();
  const genres = ref();
  const image = "https://image.tmdb.org/t/p/w300/";

  onMounted(async () => {
    await refreshMovies();
    genres.value = await getGenres();
  });

  const refreshMovies = async () => {
  movies.value = await getMovies(selectedPage.value);
  };

  watchEffect(() => {
    refreshMovies();
  });
</script>

<template>
  <Pagination @page="selectedPage = $event"/>
  <div class="movies-container mb-14">
    <div class="movies-card" v-if="movies" v-for="movie in movies">
      <a href="#"><img :src="image + movie.backdrop_path" alt="">
        <div class="hover-box">
          <span class="movies-title">{{ movie.title }}</span>
          <!-- <span class="movies-date"> ({{ movie.release_date.slice(0, -6) }})</span> -->
        </div>
      </a>
    </div>
  </div>
</template>
