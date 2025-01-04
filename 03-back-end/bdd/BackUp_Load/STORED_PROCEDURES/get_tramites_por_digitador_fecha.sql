CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tramites_por_fecha_digitador`(
	IN usuario VARCHAR(255),
    IN fecha DATE
    )
BEGIN
	SELECT
    p.kind  AS "PROCEDIMIENTO",
    ph.numproc AS "TRAMITE",
    l.class  AS "LICENCIA",
    ph.identification  AS "CÉDULA",
    per.names  AS "APELLIDOS Y NOMBRES",
    u.name  AS "USRAXIS",
    ph.ffin AS "APERTURA",
    ph.fproc AS "CIERRE"
	FROM person_has_procedure ph
    INNER JOIN archivo.person per ON ph.identification  = per.dni 
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
    WHERE u.name = usuario AND ph.ffin  = fecha 
    ORDER BY p.kind, l.class, per.names ASC;
    
END