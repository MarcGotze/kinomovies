import axios from "axios";

const apiUsers = import.meta.env.VITE_API_BACK_USERS
const options = {
  headers: {
    accept: 'application/json',
  }
};

// FETCHING ALL USERS
export const getUsers = async () => {
  return axios.get(apiUsers + "users", options).then(response => response.data)
};
