<script setup>
import AppLayout from '@/Layouts/AppLayout2.vue';
import { ref, onMounted } from 'vue';
import axios from 'axios';
import DataTable from 'datatables.net-vue3';
import DataTableLib from 'datatables.net-bs5';
import Buttons from 'datatables.net-buttons-bs5';
import ButtonsHtml5 from 'datatables.net-buttons/js/buttons.html5';
import print from 'datatables.net-buttons/js/buttons.print';
import pdfmake from 'pdfmake';
import logo64base from '@/logos.js';

//import pdfFonts from 'pdfmake/build/vfs_fonts';
import pdfFonts from '@/vfs_fonts';
import 'datatables.net-responsive-bs5';
import JsZip from 'jszip';


window.JSZip = JsZip;
pdfmake.vfs = pdfFonts.vfs;

DataTable.use(DataTableLib);
DataTable.use(pdfmake);
DataTable.use(ButtonsHtml5);

DataTable.use(Buttons);
DataTable.use(print);

const usraxis = ref(null);
const columns = ref([
  { data: null, render: (data, type, row, meta) => meta.row + 1 },
  //{ data: 'id' },
  { data: 'office_name' },
  { data: 'person_dni' },
  { data: 'person_names' },
  { data: 'name' },
  { data: 'person_cargo' },
  { data: 'person_email' }
]);

const getUsraxis = async () => {
  try {
    const response = await axios.get('/usraxis');
    //console.log(response.data); // Verifica la estructura de los datos
    usraxis.value = response.data; // Usar los datos ya transformados
  } catch (error) {
    console.error('Error fetching data:', error);
  }
};

onMounted(() => {
  getUsraxis();
});
</script>

<template>
  <AppLayout title="Digitadores">
    <template #header>
      <h2 class="font-semibold text-xl text-gray-800 leading-tight">
        Usuarios AXIS que han registrado expedientes
      </h2>
    </template>

    <!-- Datatable -->
    <div class="row">
      <div class="col-lg-12">
        <div class="table-responsive text-sm">
          <DataTable
            v-if="usraxis"
            :id="'usraxis-table'"
            :data="usraxis"
            :columns="columns"
            class="table table-striped table-bordered display"
            :options="{
              responsive: true,
              autoWidth: false,
              dom: 'Bfrtip',
              buttons: [
                {
                  extend: 'excelHtml5', // Botón de exportación a Excel
                  text: `<i class='fas fa-file-excel'></i> Exportar a Excel`,
                  className: 'btn btn-success',
                  title: 'Usuarios Axis que han generado expedientes en la OAU CPN', // Título del archivo Excel
                  exportOptions: {
                    columns: ':visible' // Exportar solo las columnas visibles
                  },
                },
                {
                  extend:'pdfHtml5',
                  text: `<i class='fas fa-file-pdf'></i> Generar PDF`,
                  title: ' ',
                  className: 'btn btn-danger',


                customize: function (doc) {
                // Definir márgenes personalizados
                doc.pageMargins = [20, 20, 20, 60]; // [izquierda, arriba, derecha, abajo]

                // Agregar el logo al PDF
                doc.content.splice(0, 0, {

                    columns: [
                            {
                                image: logo64base,
                                width: 100, // Ancho de la imagen
                                alignment: 'left' // Alineación del logo
                            },
                            {
                                stack: [
                                {
                                text: 'OFICINA DE ATENCIÓN AL USUARIO CORDERO PLATAFORMA NORTE',
                                style: 'header', // Usa el estilo 'header'
                                alignment: 'center', // Alineación del título
                                margin: [5, 0, 0, 0] // Márgenes: [izquierda, arriba, derecha, abajo]
                                },
                                {
                                text: 'Reporte de usuarios Axis',
                                style: 'header', // Usa el estilo 'header'
                                alignment: 'center', // Alineación del título
                                margin: [5, 0, 0, 0] // Márgenes: [izquierda, arriba, derecha, abajo]
                                }
                               ]


                            }
                            ],
                margin: [0, 0, 0, 10] // Margen inferior
                });


                // Definir estilos personalizados
                doc.styles = {
                    header: {
                    fontSize: 14,
                    bold: true,
                    color: '#2c3e50' // Color del texto
                    },
                    subheader: {
                    fontSize: 12,
                    bold: true,
                    color: '#34495e'
                    },
                    tableHeader: {
                    fillColor: '#3498db', // Color de fondo
                    color: '#ffffff', // Color del texto
                    bold: true,
                    fontSize: 10 // Tamaño de fuente para la cabecera de la tabla
                    },
                    tableBody: {
                    fontSize: 8 // Tamaño de fuente para el cuerpo de la tabla
                    }
                };

                // Personalizar la tabla
                if (doc.content[2].table) {
                    // Aplicar estilo a la cabecera de la tabla
                    doc.content[2].table.headerRows = 1;
                    doc.content[2].table.body[0].forEach(function (cell) {
                    cell.fillColor = doc.styles.tableHeader.fillColor;
                    cell.color = doc.styles.tableHeader.color;
                    cell.bold = doc.styles.tableHeader.bold;
                    cell.fontSize = doc.styles.tableHeader.fontSize; // Tamaño de fuente para la cabecera
                    });

                    // Ajustar el ancho de las columnas
                    doc.content[2].table.widths = ['auto', 'auto', 'auto', 'auto', 'auto', 'auto', 'auto'];

                    // Aplicar estilo al cuerpo de la tabla
                    for (let i = 1; i < doc.content[2].table.body.length; i++) {
                    doc.content[2].table.body[i].forEach(function (cell) {
                        cell.fontSize = doc.styles.tableBody.fontSize; // Tamaño de fuente para el cuerpo
                    });
                    }

                    // Forzar el salto de página si la tabla es muy grande
                    doc.content[2].table.pageBreak = 'before';
                }

                // Agregar un pie de página
                doc.footer = function (currentPage, pageCount) {
                    return {
                    text: `Página ${currentPage} de ${pageCount}`,
                    alignment: 'center',
                    margin: [0, 10, 0, 0]
                    };
                }
                }
                },
                {
                  extend:'print',
                  text: `<i class='fas fa-print'></i> Imprimir`,
                  title: 'Reporte de usuarios AXIS que han generado expedientes en la OAU CPN',
                  className: 'btn btn-primary'
                }
              ],
              language: {
                search: 'Buscar',
                zeroRecords: 'No existen registros para mostrar',
                info: 'Mostrando del _START_ al _END_ de _TOTAL_ registros',
                infoFiltered: '(Filtrados de _MAX_ registros.)',
                paginate: { first: 'Primero', previous: 'Anterior', next: 'Siguiente', last: 'Último' }
              }
            }"
          >
            <thead>
              <tr>
                <th>ID</th>
                <th>OFICINA</th>
                <th>CÉDULA</th>
                <th>NOMBRES COMPLETOS</th>
                <th>USRAXIS</th>
                <th>CARGO</th>
                <th>EMAIL</th>
              </tr>
            </thead>
          </DataTable>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<style>
@import 'datatables.net-bs5';
@import 'datatables.net-buttons-bs5';
</style>
