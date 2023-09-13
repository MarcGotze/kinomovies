const apiKey = import.meta.env.VITE_TMDB_KEY

const options = {
  method: 'GET',
  headers: {
    accept: 'application/json',
    Authorization: `Bearer ${apiKey}`
  }
};

// FETCHING TOP RATED MOVIES
export const getMovies = async (page) => {
  const moviesUrl = `https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=${page}`;
  return fetch(moviesUrl, options).then(response => response.json()).then(response => response.results)
};

// FETCHING MOVIES GENRES
export const getGenres = async () => {
  const genresUrl = 'https://api.themoviedb.org/3/genre/movie/list?language=en';
  return fetch(genresUrl, options).then(response => response.json()).then(response => response.results)
};
