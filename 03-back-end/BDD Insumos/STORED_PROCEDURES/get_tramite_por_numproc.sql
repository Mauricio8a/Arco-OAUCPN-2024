CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tramites_por_numproc`(
	IN numproc INT,
    OUT cedula VARCHAR(255),
    OUT nombres VARCHAR(255),
    OUT procedimiento VARCHAR(255),
    OUT licencia VARCHAR(255),
    OUT usraxis VARCHAR(255),
    OUT tramite INT,
    OUT fproc DATE
)
BEGIN
	SELECT
    ph.identification  AS CÉDULA,
    per.names  AS "APELLIDOS Y NOMBRES",
    p.kind  AS PROCEDIMIENTO,
    l.class  AS LICENCIA,
    u.name  AS USRAXIS,
    ph.numproc AS TRAMITE,
    ph.ffin AS EMISIÓN
	FROM person_has_procedure ph
    INNER JOIN archivo.person per ON ph.identification  = per.dni 
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
    WHERE ph.numproc  = numproc 
    ORDER BY procedimiento, licencia, numproc, fproc ASC;
    
    SET cedula = dni;
    SET nombres = per.names;
    SET procedimiento = p.kind;
    SET licencia = l.class;
    SET usraxis = u.name;
    SET tramite = ph.numproc;
    SET fproc = ph.ffin;
END