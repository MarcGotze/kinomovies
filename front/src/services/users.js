import axios from "axios";

const apiUsers = import.meta.env.VITE_API_BACK_USERS
const options = {
  headers: {
    accept: 'application/json',
  }
};

export async function getUsers(){
  return axios.get(apiUsers + "users", options).then(response => response.data)
};

export function filterUsersByMovieGenres(movieDetails, users){
  const movieGenres = movieDetails.genres.map((genre) => genre.name);
  const filteredUsers = users.filter((user) => {
    const likedTagsIntersection = user.liked_tags.filter((likedTag) =>
      movieGenres.includes(likedTag.name)
    );

    const dislikedTagsIntersection = user.disliked_tags.filter((dislikedTag) =>
      movieGenres.includes(dislikedTag.name)
    );

    // Ajoute la note de compatibilité à l'utilisateur
    const userLiked = likedTagsIntersection.length;
    user.rating = (userLiked / movieGenres.length) * 10;

    const shouldDisplayUser = likedTagsIntersection.length > 0 && dislikedTagsIntersection.length === 0
    return shouldDisplayUser;
  });
  return filteredUsers;
};
