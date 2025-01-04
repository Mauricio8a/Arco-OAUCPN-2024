CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tramites_por_numproc`(
	IN numproc INT
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
    
    
END