DROP DATABASE archivo;
CREATE DATABASE archivo;
USE archivo;
ALTER SCHEMA `archivo`  DEFAULT CHARACTER SET utf8mb4  DEFAULT COLLATE utf8mb4_spanish_ci;

-- CODIGO PARA CARGAR DATOS DESDE ARCHIVO CSV
LOAD DATA INFILE 'C:/Users/mochoa/Documents/ARCHIVO PLATAFORMA NORTE/2024/BDD/class.csv'
	INTO TABLE `archivo`.`licence`
		FIELDS TERMINATED BY ','
			LINES TERMINATED BY '\n';
            
LOAD DATA INFILE 'PERSONAS2024_18-11-2024.csv' 
	INTO TABLE person2024_temp
		FIELDS TERMINATED BY ','
			LINES TERMINATED BY '\n'
				IGNORE 1 LINES 
					(dni, names);
            
LOAD DATA INFILE 'person_has_procedure_2024_18-11-2024.csv' 
	INTO TABLE php2024_temp
		FIELDS TERMINATED BY ','
			LINES TERMINATED BY '\n'
				IGNORE 1 LINES
					(procedure_id, identification, usraxis_id, licence_id, year_id, status_id, fproc, ffin, numproc, numfojas);


-- Left Join usraxis vs person
SELECT u.name, p.dni, p.names FROM person p LEFT JOIN usraxis u ON u.person_id=p.id;           

-- Muestra de toda la tabla
SELECT * FROM license;

-- Prueba de inserción en campos únicos
INSERT INTO licence (`class`, `desc`) VALUES("A1", "XXXXXXX");

-- Inserción de nuevos registros en tabla 'person'
-- Función para obtener el último ID de una tabla
DELIMITER $$
CREATE FUNCTION obtener_ultimo_id(person VARCHAR(50))
RETURNS INT
BEGIN
  DECLARE ultimo_id INT;
  SET ultimo_id = (SELECT MAX(id) FROM person);
  RETURN ultimo_id;
END$$
DELIMITER ;

-- Utilización de la función en el proceso de carga incremental
-- SET @tabla = 'person'; -- Reemplaza 'person' con el nombre de tu tabla
-- SET @ultimo_id = obtener_ultimo_id(@tabla);

-- ANTES DE CARGA INCREMENTAL EJECUTAR:
ALTER TABLE person AUTO_INCREMENT = 1;

-- CARGA INCERMENTAL:
INSERT IGNORE INTO person (dni, names)
SELECT dni, names FROM person2019_temp;

-- PARA TABLA DE PERSONAS:
INSERT IGNORE INTO person (dni, names)
SELECT dni, names
FROM person2024_temp;
 -- WHERE id > @ultimo_id;

-- PARA TABLA PERSON_HAS_PROCEDURE:
INSERT INTO person_has_procedure (procedure_id, identification, usraxis_id, licence_id, year_id, status_id, fproc, ffin, numproc, numfojas)
	SELECT procedure_id, identification, usraxis_id, licence_id, year_id, status_id, fproc, ffin, numproc, numfojas
		FROM php2024_temp;

-- CREACIÓN DE TABLA TEMPORAL
CREATE TEMPORARY TABLE person2024_temp AS SELECT dni,names FROM person LIMIT 0;
CREATE TEMPORARY TABLE php2024_temp AS SELECT procedure_id, identification, usraxis_id, licence_id, year_id, status_id, fproc, ffin, numproc, numfojas FROM person_has_procedure LIMIT 0;

SELECT max(id) FROM tu_tabla;

-- BORRAR COLUMNA DE TABLA TEMPORAL:
ALTER TABLE nombre_tabla_temporal DROP COLUMN nombre_columna;

-- CAMBIAR CONFIGURACIÓN EN ARCHIVO my.ini:
-- secure-file-priv=""
-- local_infile = 1

-- Eliminar la tabla temporal si existe
	SET @tabla_destino = 'person';
    SET @sql = CONCAT('DROP TABLE IF EXISTS temp_', @tabla_destino);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
-- AGREGAR COLUMNA EN TABLA
ALTER TABLE archivo.person_has_procedure ADD COLUMN box INT;
ALTER TABLE archivo.person_has_procedure ADD COLUMN box INT DEFAULT 0;
ALTER TABLE archivo.person_has_procedure ADD COLUMN obs VARCHAR(255) DEFAULT NULL;

-- ACTUALIZAR EL VALOR DE LA COLUMNA BOX A 0
UPDATE archivo.person_has_procedure SET box = 0 WHERE numproc > 0;
