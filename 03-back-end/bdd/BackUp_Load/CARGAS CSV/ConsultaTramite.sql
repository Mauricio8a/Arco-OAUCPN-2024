SELECT
    ph.identification AS CÉDULA,
    per.names AS "APELLIDOS Y NOMBRES",
    p.kind AS PROCEDIMIENTO,
    l.class AS LICENCIA,
    u.name AS USRAXIS,
    ph.numproc AS TRAMITE,
    ph.ffin AS EMISIÓN
	FROM person_has_procedure ph
    INNER JOIN archivo.person per ON ph.identification = per.dni
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.license l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
	-- WHERE u.name= 'VCASTRO' AND ph.identification = '1706393673' AND ph.fproc > '2018-01-01' AND ph.fproc <'2020-12-31'
    WHERE ph.identification = '1726134503'
    ORDER BY procedimiento, licencia, numproc, fproc ASC;