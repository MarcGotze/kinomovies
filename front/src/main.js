import { createApp } from 'vue'
import App from './App.vue'
import './style/application.scss'

import { register } from "swiper/element/bundle";
register();

createApp(App).mount('#app')
