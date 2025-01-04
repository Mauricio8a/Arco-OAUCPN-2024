CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tramites_por_dni`(
	IN dni VARCHAR(255),
    OUT cedula VARCHAR(255),
    OUT nombres VARCHAR(255),
    OUT procedimiento VARCHAR(255),
    OUT licencia VARCHAR(255),
    OUT usraxis VARCHAR(255),
    OUT numproc INT,
    OUT fproc DATE
)
BEGIN
	SELECT
    ph.identification COLLATE utf8mb4_spanish_ci AS CÉDULA,
    per.names COLLATE utf8mb4_spanish_ci AS "APELLIDOS Y NOMBRES",
    p.kind COLLATE utf8mb4_spanish_ci AS PROCEDIMIENTO,
    l.class COLLATE utf8mb4_spanish_ci AS LICENCIA,
    u.name COLLATE utf8mb4_spanish_ci AS USRAXIS,
    ph.numproc AS TRAMITE,
    ph.ffin AS EMISIÓN
	FROM person_has_procedure ph
    INNER JOIN archivo.person per ON ph.identification COLLATE utf8mb4_spanish_ci = per.dni COLLATE utf8mb4_spanish_ci
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
    WHERE ph.identification COLLATE utf8mb4_spanish_ci = dni COLLATE utf8mb4_spanish_ci
    ORDER BY procedimiento COLLATE utf8mb4_spanish_ci, licencia, numproc, fproc ASC;
    
    SET cedula = dni;
    SET nombres = per.names;
    SET procedimiento = p.kind;
    SET licencia = l.class;
    SET usraxis = u.name;
    SET numproc = ph.numproc;
    SET fproc = ph.ffin;
END