CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_tramite_por_dni`(
  IN dni VARCHAR(255),
  OUT nombres VARCHAR(255),
  OUT procedimiento VARCHAR(255),
  OUT licencia VARCHAR(255),
  OUT usraxis VARCHAR(255),
  OUT numproc INT,
  OUT fproc DATE
)
BEGIN
	SELECT
    per.dni,
    per.names,
    p.kind AS procedimiento,
    l.class AS licencia,
    u.name AS usraxis,
    ph.numproc,
    ph.fproc
	FROM procedure_has_person ph
	INNER JOIN archivo.person per ON ph.person_id = per.id
	INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
	INNER JOIN archivo.licence l ON ph.licence_id = l.id
	INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
	WHERE per.dni = dni;

	SET nombres = per.names;
	SET procedimiento = p.kind;
	SET licencia = l.class;
	SET usraxis = u.name;
	SET numproc = ph.numproc;
	SET fproc = ph.fproc;
END