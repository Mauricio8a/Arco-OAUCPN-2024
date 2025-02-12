import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
    plugins: [
        laravel({
            input: 'resources/js/app.js',
            refresh: true,
        }),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
    css: {
        preprocessorOptions: {
          scss: {
            additionalData: `
              @import "~@fortawesome/fontawesome-free/css/all.min.css";
            `
          }
        }
      },
    resolve: {
        alias: {
            '@': '/resources/js',
            '~images': '/resources/assets/images',
            '@inertiajs/inertia': 'node_modules/@inertiajs/inertia',

        }
    },
});
