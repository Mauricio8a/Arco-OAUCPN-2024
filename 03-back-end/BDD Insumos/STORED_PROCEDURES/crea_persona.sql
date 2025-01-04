CREATE DEFINER=`root`@`localhost` PROCEDURE `crea_persona`(
	IN identificacion VARCHAR(13),
    IN apellidos VARCHAR(70),
    IN nombres VARCHAR(70),
    IN tratamiento VARCHAR(45),
    IN fnac DATE,
    IN cargo VARCHAR(128),
    IN correo VARCHAR(70),
    IN telefono VARCHAR(10),
    OUT mensaje VARCHAR(255)
)
BEGIN
	DECLARE filas_afectadas INT;
	
	-- Concatenamos apellidos y nombres
    SET @apellidos_nombres = CONCAT(apellidos, ' ', nombres);
    
    INSERT IGNORE INTO person (dni, lastname, firstname, names, dob, treat, cargo, email, phone)
    VALUES (identificacion, apellidos, nombres, @apellidos_nombres, fnac, tratamiento, cargo, correo, telefono);

    SET filas_afectadas = ROW_COUNT();

    IF filas_afectadas > 0 THEN
        SET mensaje = 'Persona creada exitosamente.';
    ELSE
        SET mensaje = 'La persona ya existe o se produjo un error al insertar.';
    END IF;
END