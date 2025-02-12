<script setup>
import AppLayout from '@/Layouts/AppLayout2.vue';

</script>

<template>
    <AppLayout title="Usuarios AXIS">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Usuarios AXIS que han generado Expedientes
            </h2>
        </template>

                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">

                    <table class="table-normal w-fill">
                        <thead>
                            <tr>
                                <th class="px-4 py-2">ID</th>
                                <th class="px-4 py-2">OFICINA</th>
                                <th class="px-4 py-2">CÉDULA</th>
                                <th class="px-4 py-2">NOMBRES COMPLETOS</th>
                                <th class="px-4 py-2">USUARIO</th>
                                <th class="px-4 py-2">CARGO</th>
                                <th class="px-4 py-2">EMAIL</th>
                            </tr>
                        </thead>
                        <tbody class="text-xs">
                            <tr v-for="usr in usraxis" :key="usr.id">
                                <td class="border px-4 py-2">{{ usr.id }}</td>
                                <td class="border px-4 py-2">{{ usr.office.name }}</td>
                                <td class="border px-4 py-2">{{ usr.person.dni }}</td>
                                <td class="border px-4 py-2">{{ usr.person.names }}</td>
                                <td class="border px-4 py-2">{{ usr.name }}</td>
                                <td class="border px-4 py-2">{{ usr.person.cargo }}</td>
                                <td class="border px-4 py-2">{{ usr.person.email }}</td>
                            </tr>
                        </tbody>
                    </table>
             </div>

    </AppLayout>
</template>


<script>

export default {
    props: {
      usraxis: Array,
    },

    computed: {

    },
  }
  </script>
