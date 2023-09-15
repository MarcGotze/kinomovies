import axios from "axios";

const apiKey = import.meta.env.VITE_TMDB_KEY
const options = {
  headers: {
    accept: 'application/json',
    Authorization: `Bearer ${apiKey}`
  }
};

// Récupère les 20 meilleurs films par page
export const getMovies = async (page) => {
  const moviesUrl = `https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=${page}`;
  return axios.get(moviesUrl, options).then(response => response.data.results)
};

// Récupère les info d'un film via son id
export const getMovie = async (id) => {
  const movieUrl = `https://api.themoviedb.org/3/movie/${id}?language=en-US`;
  return axios.get(movieUrl, options).then(response => response.data)
};
