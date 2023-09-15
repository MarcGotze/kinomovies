<script setup>
import Banner from '../components/Banner.vue';
import NavBar from '../components/NavBar.vue';
import { ref, onMounted } from 'vue';
import { getMovie } from '../services/movie.js';
import { useRoute } from 'vue-router';

const route = useRoute();
const movieId = route.params.id; // Récupération de l'ID du film depuis les paramètres de la route
const movieDetails = ref(null);
const image = "https://image.tmdb.org/t/p/w300/";

// Charger les détails du film au chargement du composant
onMounted(async () => {
  movieDetails.value = await getMovie(movieId);
  console.log(movieDetails);
});
</script>

<template>
  <Banner />
  <NavBar />
  <div>
    <div class="flex my-5" v-if="movieDetails">
      <img :src="image + movieDetails.poster_path" alt="">
      <div class="movie-infos ml-5">
        <span class="text-3xl mr-2">{{ movieDetails.title }}</span>
        <span class="text-2xl">({{ movieDetails.release_date.slice(0, -6) }})</span>
        <p class="mt-5 text-lg">{{ movieDetails.overview }}</p>
        <ul class="mt-5 flex">
          <li class="mx-2" v-for="genre in movieDetails.genres">
            {{ genre.name }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
