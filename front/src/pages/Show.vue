<script setup>
import Banner from '../components/Banner.vue';
import NavBar from '../components/NavBar.vue';
import User from '../components/User.vue';
import { ref, onMounted } from 'vue';
import { getMovie } from '../services/movie.js';
import { getUsers } from '../services/users.js';
import { useRoute } from 'vue-router';

const route = useRoute();
const movieId = route.params.id; // Récupération de l'ID du film depuis les paramètres de la route
const movieDetails = ref(null);
const users = ref(null)
const filteredUsers = ref([]);
const userRatings = ref({});
const image = "https://image.tmdb.org/t/p/w300/";

// Récupère les détails du film au chargement du composant
onMounted(async () => {
  movieDetails.value = await getMovie(movieId);
  users.value = await getUsers();
  filteredUsers.value = filterUsersByMovieGenres();
});

 // Fonction pour filtrer les utilisateurs en fonction des genres du film
 const filterUsersByMovieGenres = () => {
  // Récupère les genres du film
  const movieGenres = movieDetails.value.genres.map((genre) => genre.name);
  // Filtre les utilisateurs en fonction des genres du film
  const filteredUsers = users.value.filter((user) => {
    // Vérifie s'ils ont des liked_tags similaires aux genres du film
    const likedTagsIntersection = user.liked_tags.filter((likedTag) =>
      movieGenres.includes(likedTag.name)
    );

    // Vérifie s'ils ont des disliked_tags en commun avec les genres du film
    const dislikedTagsIntersection = user.disliked_tags.filter((dislikedTag) =>
      movieGenres.includes(dislikedTag.name)
    );

    // Calcule la note en fonction du nombre de correspondances entre les genres du film et les liked_tags
    const userLiked = likedTagsIntersection.length;

    // Ajoute la note à l'utilisateur
    user.rating = (userLiked / movieGenres.length) * 10

    // Si l'utilisateur a des liked_tags similaires mais aucun disliked_tags en commun, on affiche
    return likedTagsIntersection.length > 0 && dislikedTagsIntersection.length === 0;
  });
  return filteredUsers;
};

</script>

<template>
  <Banner v-if="movieDetails" :label="movieDetails.title + ` (${movieDetails.release_date.slice(0, -6)})` " />
  <NavBar />
  <div class="movie-show flex my-5" v-if="movieDetails">
    <img :src="image + movieDetails.poster_path" :alt="movieDetails.title + ' poster'">
    <div class="flex flex-col">
      <span class="movie-title-responsive my-5">{{ movieDetails.title }}</span>
      <div class="movie-infos ml-5">
        <p class="text-lg">{{ movieDetails.overview }}</p>
        <ul class="mt-5 flex">
          <li class="movie-genres p-3 mx-2 font-bold text-lg text-center" v-for="genre in movieDetails.genres">
            {{ genre.name }}
          </li>
        </ul>
      </div>
      <div class="users-matched ml-5">
        <h2 class="text-2xl mt-5">Users with Similar Interests</h2>
        <div v-if="filteredUsers.length > 0">
          <button  class="btn mt-5" onclick="my_modal_5.showModal()">Display them</button>
            <dialog id="my_modal_5" class="modal modal-bottom sm:modal-middle">
              <div class="modal-box max-w-none">
                <User :users="filteredUsers" />
                <div class="modal-action">
                  <form method="dialog">
                    <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">✕</button>
                    <button class="btn">Close</button>
                  </form>
                </div>
              </div>
            </dialog>
        </div>
        <p v-else>No users with similar interests found.</p>
      </div>
    </div>
  </div>
</template>
