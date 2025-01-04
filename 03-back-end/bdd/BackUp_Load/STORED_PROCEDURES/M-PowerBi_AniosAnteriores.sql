let
  Origen = Folder.Files(Ruta),
  #"Archivos ocultos filtrados1" = Table.SelectRows(Origen, each [Attributes]?[Hidden]? <> true),
  #"Invocar función personalizada1" = Table.AddColumn(#"Archivos ocultos filtrados1", "Transformar archivo", each #"Transformar archivo"([Content])),
  #"Columnas con nombre cambiado1" = Table.RenameColumns(#"Invocar función personalizada1", {"Name", "Source.Name"}),
  #"Otras columnas quitadas1" = Table.SelectColumns(#"Columnas con nombre cambiado1", {"Source.Name", "Transformar archivo"}),
  #"Columna de tabla expandida1" = Table.ExpandTableColumn(#"Otras columnas quitadas1", "Transformar archivo", Table.ColumnNames(#"Transformar archivo"(#"Archivo de ejemplo"))),
  #"Tipo cambiado" = Table.TransformColumnTypes(#"Columna de tabla expandida1",{{"Source.Name", type text}, {"OFI", type text}, {"PROCESO", type text}, {"USUARIO", type text}, {"TRAMITE", Int64.Type}, {"ESTADO", type text}, {"IDENTIFICACION", Int64.Type}, {"NOMBRE_COMPLETO", type text}, {"FECHA_SOLICITA", type datetime}, {"FECHA_TERMINO", type datetime}, {"PAGADA", type text}, {"COMPROBANTE_PAGO", Int64.Type}, {"FECHA_COMPROBANTE", type datetime}, {"ID_FINANCIERA", type text}, {"VALOR", Int64.Type}, {"ID_CLASE", type text}, {"FECHA_CONSULTA", type datetime}, {"Column17", type any}}),
  #"Columnas quitadas" = Table.RemoveColumns(#"Tipo cambiado",{"Source.Name", "OFI", "FECHA_SOLICITA", "PAGADA", "COMPROBANTE_PAGO", "FECHA_COMPROBANTE", "ID_FINANCIERA", "VALOR", "Column17"}),
  #"Tipo cambiado1" = Table.TransformColumnTypes(#"Columnas quitadas",{{"IDENTIFICACION", type text}}),
  #"Personalizada agregada" = Table.AddColumn(#"Tipo cambiado1", "CEDULA", each Text.PadStart([IDENTIFICACION], 10, "0")),
  #"Columnas reordenadas" = Table.ReorderColumns(#"Personalizada agregada",{"TRAMITE", "USUARIO", "FECHA_CONSULTA", "PROCESO", "ID_CLASE", "IDENTIFICACION", "NOMBRE_COMPLETO", "ESTADO", "FECHA_TERMINO", "CEDULA"}),
  #"Filtrado por Tipo E" = Table.Filter(#"Columnas reordenadas", [ID_CLASE] = "E"),
  #"Agrupado por año" = Table.GroupBy(#"Filtrado por Tipo E", {{#"FECHA_CONSULTA", type date}}, {"Cantidad", countrows})
in
  #"Agrupado por año"



