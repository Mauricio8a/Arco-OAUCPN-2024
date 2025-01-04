CREATE DEFINER=`root`@`localhost` PROCEDURE `crea_usraxis`(
	IN usuario VARCHAR(25),
    IN id_persona INT,
    IN id_oficina INT,
    OUT mensaje VARCHAR(255)
)
BEGIN
	DECLARE filas_afectadas INT;
	ALTER TABLE usraxis AUTO_INCREMENT = 1;
    INSERT IGNORE INTO usraxis (name, person_id, office_id)
    VALUES (usuario, id_persona, id_oficina);

    SET filas_afectadas = ROW_COUNT();

    IF filas_afectadas > 0 THEN
        SET mensaje = '¡Usuario de AXIS 4.0 para reportes de Archivo creado exitosamente!';
    ELSE
        SET mensaje = 'El usuario ya existe o se produjo un error al insertar.';
    END IF;
END