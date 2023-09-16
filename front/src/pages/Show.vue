<script setup>
import Banner from "../components/Banner.vue";
import NavBar from "../components/NavBar.vue";
import Cards from "../components/Cards.vue";
import { ref, onMounted } from "vue";
import { getMovie } from "../services/movie.js";
import { getUsers, filterUsersByMovieGenres } from "../services/users.js";
import { useRoute } from "vue-router";

const route = useRoute();
const movieId = route.params.id; // Récupération de l'ID du film depuis les paramètres de la route
const movieDetails = ref(null);
const users = ref(null);
const filteredUsers = ref([]);
const modalState = ref(false);
const image = "https://image.tmdb.org/t/p/w300/";

// Récupère les détails du film au chargement du composant
onMounted(async () => {
  movieDetails.value = await getMovie(movieId);
  users.value = await getUsers();
  filteredUsers.value = filterUsersByMovieGenres(
    movieDetails.value,
    users.value
  );
});

function toggleModal(state) {
  this.modalState = state;
}
</script>

<template>
  <Banner
    v-if="movieDetails"
    :label="movieDetails.title + ` (${movieDetails.release_date.slice(0, -6)})`"
  />
  <NavBar />

  <!-- MOVIE DETAILS -->
  <div class="movie-show flex my-5" v-if="movieDetails">
    <img
      :src="image + movieDetails.poster_path"
      :alt="movieDetails.title + ' poster'"
    />
    <div class="flex flex-col">
      <span class="movie-title-responsive my-5">{{ movieDetails.title }}</span>
      <div class="movie-infos ml-5">
        <p class="text-lg">{{ movieDetails.overview }}</p>
        <ul class="mt-5 flex">
          <li
            class="movie-genres p-3 mx-2 font-bold text-lg text-center"
            v-for="genre in movieDetails.genres"
          >
            {{ genre.name }}
          </li>
        </ul>
      </div>

      <!-- USERS CARDS MODAL -->
      <div class="users-matched ml-5">
        <h2 class="text-2xl mt-5">Users with Similar Interests</h2>
        <div v-if="filteredUsers.length > 0">
          <button class="btn mt-5" @click="toggleModal(true)">
            Display them
          </button>
          <dialog
            id="usersModal"
            :open="modalState"
            class="modal modal-bottom sm:modal-middle"
          >
            <div class="modal-box max-w-none">
              <Cards :users="filteredUsers" />
              <button
                class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                @click="toggleModal(false)"
              >
                ✕
              </button>
              <button class="btn" @click="toggleModal(false)">Close</button>
            </div>
            <form method="dialog" class="modal-backdrop" @click.prevent="toggleModal(false)">
              <button>close</button>
            </form>
          </dialog>
        </div>
        <p v-else>No users with similar interests found.</p>
      </div>
    </div>
  </div>
</template>
