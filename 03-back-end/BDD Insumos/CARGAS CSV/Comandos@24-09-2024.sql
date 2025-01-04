DROP DATABASE archivo;
CREATE DATABASE archivo;
USE archivo;
ALTER SCHEMA `archivo`  DEFAULT CHARACTER SET utf8mb4  DEFAULT COLLATE utf8mb4_spanish_ci ;
LOAD DATA INFILE 'C:/Users/mochoa/Documents/ARCHIVO PLATAFORMA NORTE/2024/BDD/class.csv'
	INTO TABLE `archivo`.`licence`
		FIELDS TERMINATED BY ','
			LINES TERMINATED BY '\n';
            
-- Left Join usraxis vs person
SELECT u.name, p.dni, p.names  FROM person p LEFT JOIN usraxis u ON u.person_id=p.id;            

-- Muestra de toda la tabla
SELECT * FROM licence;

-- Prueba de inserción en campos únicos
INSERT INTO licence (`class`, `desc`) VALUES("A1", "XXXXXXX");