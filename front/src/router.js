import { createRouter, createWebHistory } from 'vue-router';
import Movies from './pages/Movies.vue';
import Show from './pages/Show.vue'
import Users from './pages/Users.vue';

// Paramètres des différentes routes
const routes = [
  {
    path: '/',
    name: "Movies",
    component: Movies,
  },
  {
    path: '/show/:id',
    name: "Show",
    component: Show,
  },
  {
    path: '/users',
    name: "Users",
    component: Users,
  },
];

// Création du routeur
const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
