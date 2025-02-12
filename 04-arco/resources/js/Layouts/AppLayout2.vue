<script setup>
import { ref } from 'vue'
import { Head, Link, router } from '@inertiajs/vue3';
import ApplicationMark from '@/Components/ApplicationMark.vue';
import Banner from '@/Components/Banner.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';

import { VMenu, VList, VListItem, VDivider } from 'vuetify/components';

  const drawer = ref(null)

  defineProps({
    title: String,
    });

  const showingNavigationDropdown = ref(false);

  const logout = () => {
    router.post(route('logout'));
    };
</script>

<script>
  export default {
    data: () => ({ drawer: null }),
  }
</script>


<template>
  <v-app id="inspire">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/vuetify@1.4.0/dist/vuetify.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <v-navigation-drawer v-model="drawer" class="text-black-40">
        <!-- <img src="/images/agencia_nacional_de_transito.svg" width="100" height="100" class="mt-5 ml-5"> -->
            <!-- Logo -->
            <div class="shrink-0 flex items-center mt-5 ml-5">
                <ApplicationMark class="block h-9 w-auto" />
            </div>

            <!-- <div class="shrink-0 flex items-center mt-5 ml-5">
                                    <Link :href="route('dashboard')">

                                    </Link>
            </div> -->
        <!-- Menú de navegación -->
        <v-list>
            <v-list-item link>
                <Link :href="route('dashboard')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-dashboard" class="mr-3"/>Dashboard</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <Link :href="route('usuarios')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-users-cog" class="mr-3"/>Usuarios</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <Link :href="route('personas')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-walking" class="mr-3"/>Personas</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <Link :href="route('digitadores')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-chalkboard-teacher" class="mr-3"/>Digitadores</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <Link :href="route('licencias')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-id-card" class="mr-3"/>Licencias</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <Link :href="route('tramites')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-tasks" class="mr-3"/>Trámites</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <Link :href="route('expedientes')" style="text-decoration: none">
                    <v-list-item-title class="ml-2"><v-icon icon="fa-book-open" class="mr-3"/>Expedientes</v-list-item-title>
                </Link>
            </v-list-item>

            <v-list-item link>
                <v-list-item-title class="ml-2"><v-icon icon="fa-search" class="mr-3"/>Fichas</v-list-item-title>
            </v-list-item>

            <v-list-item link>
                <v-list-item-title class="ml-2"><v-icon icon="fa-file-pdf" class="mr-3"/>Informes Técnicos</v-list-item-title>
            </v-list-item>

            <v-list-item link>
                <v-list-item-title class="ml-2"><v-icon icon="fa-copy" class="mr-3"/>Inventarios</v-list-item-title>
            </v-list-item>
        </v-list>
    </v-navigation-drawer>

    <v-app-bar class="bg-primary">

      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      <img src="/images/ANT_logo_solo.png" width="20" height="20">
      <v-app-bar-title>ARCO - Sistema de Gestión de Archivo Documental</v-app-bar-title>


      <div class="hidden sm:flex sm:items-center sm:ms-6">
    <div class="ms-3 relative">
      <!-- Menú desplegable con v-menu -->
      <v-menu offset-y>
        <template v-slot:activator="{ props }">
          <button
            v-bind="props"
            class="flex text-sm border-2 border-transparent rounded-full focus:outline-none focus:border-gray-300 transition"
          >
            <img
              v-if="$page.props.jetstream.managesProfilePhotos"
              class="size-8 rounded-full object-cover"
              :src="$page.props.auth.user.profile_photo_url"
              :alt="$page.props.auth.user.name"
            />
            <span v-else class="inline-flex rounded-md">
              <button
                type="button"
                class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none focus:bg-gray-50 active:bg-gray-50 transition ease-in-out duration-150"
              >
                {{ $page.props.auth.user.name }}
                <svg
                  class="ms-2 -me-0.5 size-4"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M19.5 8.25l-7.5 7.5-7.5-7.5"
                  />
                </svg>
              </button>
            </span>
          </button>
        </template>

        <v-list>
          <!-- Account Management -->
          <v-list-item>
            <v-list-item-title class="text-xs text-gray-400">
              Administrar cuenta
            </v-list-item-title>
          </v-list-item>

          <v-list-item :href="route('profile.show')">
            <v-list-item-title>Perfil</v-list-item-title>
          </v-list-item>

          <v-list-item
            v-if="$page.props.jetstream.hasApiFeatures"
            :href="route('api-tokens.index')"
          >
            <v-list-item-title>API Tokens</v-list-item-title>
          </v-list-item>

          <v-divider />

          <!-- Authentication -->
          <v-list-item @click="logout">
            <v-list-item-title>Salir</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </div>
  </div>


    </v-app-bar>

    <v-main>
        <!-- Page Heading -->
        <header v-if="$slots.header" class="bg-white shadow">
                <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                    <slot name="header" />
                </div>
            </header>

        <v-container>
            <slot />
        </v-container>
    </v-main>
  </v-app>
</template>
