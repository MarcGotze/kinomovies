import axios from "axios";

const apiKey = import.meta.env.VITE_TMDB_KEY
const options = {
  headers: {
    accept: 'application/json',
    Authorization: `Bearer ${apiKey}`
  }
};

export const getMovies = async (page) => {
  const moviesUrl = `https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=${page}`;
  return axios.get(moviesUrl, options).then(response => response.data.results)
};

// FETCHING MOVIES GENRES
// export const getGenres = async () => {
//   const genresUrl = 'https://api.themoviedb.org/3/genre/movie/list?language=en';
//   return fetch(genresUrl, options).then(response => response.json()).then(response => response.results)
// };
