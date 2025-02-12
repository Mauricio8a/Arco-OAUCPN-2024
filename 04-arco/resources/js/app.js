import './bootstrap';
import '../css/app.css';

import { createApp, h } from 'vue';
import { createInertiaApp } from '@inertiajs/vue3';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import { ZiggyVue } from '../../vendor/tightenco/ziggy';

import vuetify from './vuetify'; // Ruta correcta

//Importar íconos de FA
import { aliases, fa } from 'vuetify/iconsets/fa-svg'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import '@fortawesome/fontawesome-free/css/all.min.css';


library.add(fas) // Include needed solid icons
library.add(far) // Include needed regular icons


const appName = import.meta.env.VITE_APP_NAME || 'ARCO';

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
    setup({ el, App, props, plugin }) {
        return createApp({ render: () => h(App, props) })
            .use(plugin)
            .use(vuetify)
            .use(ZiggyVue)
            .component('font-awesome-icon', FontAwesomeIcon) //Importa íconos FA
            .mount(el);
    },
    progress: {
        color: '#4B5563',
    },
});
