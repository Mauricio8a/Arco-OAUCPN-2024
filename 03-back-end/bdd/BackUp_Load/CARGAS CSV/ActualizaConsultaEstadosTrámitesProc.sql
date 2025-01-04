-- Consultar estado del trámite
SELECT
    ph.identification  AS CÉDULA,
    per.names  AS "APELLIDOS Y NOMBRES",
    p.kind  AS PROCEDIMIENTO,
    l.class  AS LICENCIA,
    u.name  AS USRAXIS,
    ph.numproc AS TRAMITE,
    ph.ffin AS EMISIÓN,
    s.state AS ESTADO,
    ph.obs AS OBSERVACIÓN
	FROM person_has_procedure ph
    INNER JOIN archivo.person per ON ph.identification  = per.dni 
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
    INNER JOIN archivo.status s ON ph.status_id = s.id
    WHERE ph.numproc  = 67781230
    ORDER BY procedimiento, licencia, numproc, fproc ASC;
    
    -- Actualizar estado y observación del expediente con base a número de trámite
    UPDATE person_has_procedure SET status_id = 10, obs=' CURSO ANULADO memo nro. ANT-DTHAB-2023-2526-M' WHERE numproc = 67781230;
    
    
    -- Consultar todos los trámites con novedades
    SELECT
    ph.identification  AS CÉDULA,
    per.names  AS "APELLIDOS Y NOMBRES",
    p.kind  AS PROCEDIMIENTO,
    l.class  AS LICENCIA,
    u.name  AS USRAXIS,
    ph.numproc AS TRAMITE,
    ph.ffin AS EMISIÓN,
    s.state AS ESTADO,
    ph.obs AS OBSERVACIÓN
	FROM person_has_procedure ph
    INNER JOIN archivo.person per ON ph.identification  = per.dni 
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
    INNER JOIN archivo.status s ON ph.status_id = s.id
    WHERE ph.obs  <> 'FINALIZADO'
    ORDER BY procedimiento, licencia, numproc, fproc ASC;