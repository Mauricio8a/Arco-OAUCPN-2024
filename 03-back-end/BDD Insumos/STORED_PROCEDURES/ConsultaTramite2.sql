SELECT 
    o.name AS AGENCIA,
    ph.identification AS CÉDULA,
    a.names AS "NOMBRES COMPLETOS",
    p.kind AS PROCEDIMIENTO,
    l.class AS LICENCIA,
    u.name AS USRAXIS,
    ph.numproc AS TRAMITE,
    ph.fproc AS "FECHA EMISIÓN",
    s.state AS ESTADO,
    ph.numfojas AS "FOJAS"
	FROM person_has_procedure ph
    INNER JOIN archivo.person a ON ph.identification = a.dni
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
    INNER JOIN archivo.status s ON ph.status_id = s.id
    INNER JOIN archivo.office o ON u.office_id = o.id
	WHERE ph.usraxis_id = 7  -- AND ph.procedure_id = 1
		 AND fproc = '2018-12-05' -- '2018-12-01'AND fproc < '2018-12-31'
    ORDER BY procedimiento, licencia, fproc ASC;