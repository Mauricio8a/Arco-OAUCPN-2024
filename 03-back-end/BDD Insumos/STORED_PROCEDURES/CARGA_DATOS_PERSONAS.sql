DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_personas_csv`(IN tabla_destino VARCHAR(255))
BEGIN
    DECLARE mensaje VARCHAR(255);

    -- Eliminar la tabla temporal si existe
    SET @sql = 'DROP TABLE IF EXISTS temp_?';
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING tabla_destino;
    DEALLOCATE PREPARE stmt;

    -- Crear tabla temporal
    SET @sql = 'CREATE TEMPORARY TABLE IF NOT EXISTS temp_? AS SELECT dni, names FROM ? LIMIT 0';
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING tabla_destino, tabla_destino;
    DEALLOCATE PREPARE stmt;

    -- Cargar datos desde el archivo CSV
    LOAD DATA INFILE 'person_new.csv' 
	INTO TABLE temp_person
		FIELDS TERMINATED BY ','
			LINES TERMINATED BY '\n'
				IGNORE 1 LINES 
					(dni, names);

    -- Insertar datos nuevos en la tabla principal
    SET @sql = 'INSERT IGNORE INTO ? (dni, names) SELECT dni, names FROM temp_?';
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING tabla_destino, tabla_destino;
    DEALLOCATE PREPARE stmt;

    -- Eliminar tabla temporal
    SET @sql = 'DROP TABLE temp_?';
    PREPARE stmt FROM @sql;
    EXECUTE stmt USING tabla_destino;
    DEALLOCATE PREPARE stmt;

    SET mensaje = CONCAT('Carga de datos desde archivo person_new a ', tabla_destino, ' completada.');
    SELECT mensaje;
END $$
DELIMITER ;