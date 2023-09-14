import { createRouter, createWebHistory } from 'vue-router';
import Movies from './pages/Movies.vue';
import Users from './pages/Users.vue';


const routes = [
  {
    path: '/',
    name: "Movies",
    component: Movies,
  },
  {
    path: '/users',
    name: "Users",
    component: Users,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
