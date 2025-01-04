SELECT 
    o.name AS OFICINA,
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
	WHERE ph.usraxis_id = 21 AND ph.procedure_id = 1
		-- AND ph.fproc > '2019-01-01' AND ph.fproc <'2020-12-31'
    ORDER BY procedimiento, licencia, numproc, fproc ASC;