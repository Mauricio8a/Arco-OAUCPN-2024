<script setup>
import AppLayout from '@/Layouts/AppLayout2.vue';
import DataTable from 'datatables.net-vue3';
import { ref, onMounted } from 'vue';
import axios from 'axios';
import DataTableLib from 'datatables.net-bs5';
import Buttons from 'datatables.net-buttons-bs5';
import ButtonsHtml5 from 'datatables.net-buttons/js/buttons.html5';
import print from 'datatables.net-buttons/js/buttons.print';
import pdfmake from 'pdfmake';
import logo64base from '@/logos.js';

import xlsx from 'xlsx/dist/xlsx.full.min';
//import xlsxstyle from 'xlsx-style'; // Importar xlsx-style
import ExcelJS from 'exceljs'; // Importar exceljs

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

const usraxis = ref([]);
const selectedUser = ref(null);
const fechaInicio = ref(null);
const fechaFin = ref(null);
const resultados = ref([]);
const columns = ref([
    {
      //title: ' ', // Título de la columna
      data: null, // No se vincula a ningún dato específico
      defaultContent: 'Emisión de Títulos Habilitantes / LICENCIAS' // Contenido por defecto para todas las filas
    },

    {
        //title: 'CAJA',
        data: null, // No se vincula a ningún dato específico
        defaultContent: ' ' // Contenido por defecto para todas las filas
    },
    { data: 'kind' },
    { data: 'numproc' },
    { data: 'class' },
    { data: 'identification' },
    { data: 'names' },
    { data: 'name' },
    { data: 'ffin',
            render: (data, type, row) => {
            if (type === 'display' || type === 'filter') {
                const date = new Date(data);
                const day = String(date.getDate()).padStart(2, '0');
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const year = date.getFullYear();
                return `${day}-${month}-${year}`;
            }
            return data;
            }
        },
    { data: 'ffin',
        render: (data, type, row) => {
        if (type === 'display' || type === 'filter') {
            const date = new Date(data);
            const day = String(date.getDate()).padStart(2, '0');
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const year = date.getFullYear();
            return `${day}-${month}-${year}`;
        }
        return data;
        }
    },
  { data: 'numfojas'},
  { data: null, defaultContent :'ELIMINACIÓN'},
  { data: null, defaultContent :'Físico'}

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

const buscar = () => {
    /* console.log('Datos a enviar:', {
    usuario: selectedUser.value.name,
    fecha_inicio: fechaInicio.value,
    fecha_fin: fechaFin.value
  }); */
  axios.get('/expedientes', {
    params: {
      usuario: selectedUser.value.name, // Enviamos el nombre del usuario
      fecha_inicio: fechaInicio.value,
      fecha_fin: fechaFin.value
    }
  })
  .then(response => {
    resultados.value = response.data;
    // Actualizar la tabla DataTables con los nuevos datos
    console.log(response.data);
  })
  .catch(error => {
    console.error(error);
  });
};

// Función para exportar a Excel usando exceljs
const exportToExcel = async () => {
  try {
    // Cargar la plantilla de Excel
    const response = await fetch('/TEMPLATE1.xlsx'); // Ruta a la plantilla
    const arrayBuffer = await response.arrayBuffer();

    // Crear un libro de trabajo con exceljs
    const workbook = new ExcelJS.Workbook();
    await workbook.xlsx.load(arrayBuffer);

    // Obtener la hoja de cálculo
    const worksheet = workbook.getWorksheet(1); // Asume que la plantilla tiene una sola hoja

    // Cambiar el nombre de la hoja al nombre del usuario
    worksheet.name = selectedUser.value.name + '_' + fechaFin.value;

    // Función para formatear la fecha
    const formatDate = (dateString) => {
      const date = new Date(dateString);
      const day = String(date.getDate()).padStart(2, '0');
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const year = date.getFullYear();
      return `${day}-${month}-${year}`;
    };

    // Insertar los datos en la plantilla
    const startRow = 8; // Fila donde comienzan los datos (ajusta según tu plantilla)
    resultados.value.forEach((row, index) => {
      const currentRow = startRow + index;
      worksheet.getCell(`A${currentRow}`).value = 'Emisión de Títulos Habilitantes / LICENCIAS'; // SERIE/SUBSERIE DOCUMENTAL
      worksheet.getCell(`B${currentRow}`).value = ' '; // No. CAJA
      worksheet.getCell(`C${currentRow}`).value = row.kind; // PROCESO
      worksheet.getCell(`D${currentRow}`).value = row.numproc; // TRÁMITE
      worksheet.getCell(`E${currentRow}`).value = row.class; // LICENCIA
      worksheet.getCell(`F${currentRow}`).value = row.identification; // CÉDULA
      worksheet.getCell(`G${currentRow}`).value = row.names; // APELLIDOS/NOMBRES
      worksheet.getCell(`H${currentRow}`).value = row.name; // USRAXIS
      worksheet.getCell(`I${currentRow}`).value = formatDate(row.ffin); // FECHA APERTURA
      worksheet.getCell(`J${currentRow}`).value = formatDate(row.ffin); // FECHA CIERRE
      worksheet.getCell(`K${currentRow}`).value = row.numfojas; // FOJAS
      worksheet.getCell(`L${currentRow}`).value = 'ELIMINACIÓN'; // DESTINO FINAL
      worksheet.getCell(`M${currentRow}`).value = 'Físico'; // SOPORTE
    });

    // Guardar el archivo modificado
    const buffer = await workbook.xlsx.writeBuffer();
    const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = selectedUser.value.name + '_' + fechaFin.value + '.xlsx';
    link.click();
  } catch (error) {
    console.error('Error al exportar a Excel:', error);
  }
};


// Configuración de DataTables con botones de exportación
const dtOptions = ref({
  dom: 'Bfrtip',
  buttons: [

    {
        extend: 'excelHtml5',
        title: '', // Eliminamos el título por defecto
        text: `<i class='fas fa-file-excel'></i> Exportar a Excel`,
            className: 'btn btn-success',
            action: function (e, dt, node, config) {
            exportToExcel(); // Llamar a la función personalizada
      }

    }, //ffin
    'pdfHtml5'
  ],
  responsive: true,
  language: {
        url: 'https://cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json'
    }
});



</script>

<template>
    <AppLayout title="Expedientes">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Gestión de Expedientes
            </h2>
        </template>

        <!-- Formulario de filtros de búsqueda -->

            <div class="grid grid-cols-4 gap-4">
                <div class="bg-white shadow-md rounded px-2 pt-2 pb-2 mb-4">
                   <strong>Filtros de búsqueda: </strong>
                   <div class="row">
                        <div class="form-group">
                            <strong><label for="usuario">Usuario AXIS:</label></strong>
                            <select v-model="selectedUser" class="form-control">
                                <option value="TODOS">TODOS</option>
                                <option v-for="user in usraxis" :key="user.id" :value="user">{{ user.name }}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <strong><label for="fechaInicio">Fecha de Inicio:</label></strong>
                        <input type="date" class="form-control" v-model="fechaInicio">
                        </div>
                        <div class="form-group">
                        <strong><label for="fechaFin">Fecha de Fin:</label></strong>
                        <input type="date" class="form-control" v-model="fechaFin">
                        </div>
                        <button class="btn btn-primary" @click="buscar">Buscar</button>
                    </div>
                </div>
            </div>




        <!-- DataTable -->
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive text-sm">
                    <DataTable
                    :id="'usraxis-table'"
                    :data="resultados"
                    :columns="columns"
                    :options="dtOptions"
                    class="table table-striped table-bordered"
                    >
                        <thead>
                            <tr>
                                <th>SECCIÓN</th>
                                <th colspan="12">PROCESO DESCONCENTRADO</th>
                            </tr>
                            <tr>
                                <th>SUBSECCIÓN</th>
                                <th colspan="12">DIRECCIÓN PROVINCIAL DE PICHINCHA OAU CORDERO PLATAFORMA NORTE</th>
                            </tr>
                            <tr>
                                <th rowspan="2">SERIE/SUBSERIE DOCUMENTAL</th>
                                <th rowspan="2">No. CAJA</th>
                                <th colspan="4">Nro. EXPEDIENTE</th>
                                <th rowspan="2">APELLIDOS/NOMBRES</th>
                                <th rowspan="2">USRAXIS</th>
                                <th colspan="2">FECHAS EXTREMAS</th>
                                <th rowspan="2">FOJAS</th>
                                <th rowspan="2">DESTINO FINAL</th>
                                <th rowspan="2">SOPORTE</th>
                            </tr>
                            <tr>
                                <th>PROCESO</th>
                                <th>TRÁMITE</th>
                                <th>LICENCIA</th>
                                <th>CÉDULA</th>
                                <th>APERTURA</th>
                                <th>CIERRE</th>
                            </tr>
                        </thead>
                     </DataTable>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
