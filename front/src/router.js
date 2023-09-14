import { createRouter, createWebHistory } from 'vue-router';
import Movies from './pages/Movies.vue';


const routes = [
  {
    path: '/',
    component: Movies,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
