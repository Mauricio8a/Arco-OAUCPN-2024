SELECT * FROM archivo.procedure_has_person;

SELECT * FROM procedure_has_person a 
INNER JOIN person b
on a.numproc = 66273014 and b.id = a.person_id;

SELECT * FROM procedure_has_person a
INNER JOIN  person b
ON b.dni = '1716857964' AND b.id = a.person_id;

SELECT id, names FROM archivo.person WHERE person.dni = '1704337615';

SELECT id FROM archivo.procedure_has_person WHERE id = 6278;

SELECT * FROM procedure_has_person a
INNER JOIN  person b
ON b.dni = '1716857964' AND b.id = a.person_id;

SELECT procedure_id, person_id, licence_id, usraxis_id, fproc, numproc, names FROM procedure_has_person a
INNER JOIN  person b
ON b.dni = '1716857964' AND b.id = a.person_id;

/* Consulta para encontrar trámites por cédula' */
SELECT 
	ph.id,
    per.dni,
    per.names,
    p.kind,
    l.class,
    u.name,
    ph.numproc,
    ph.fproc
FROM procedure_has_person ph
INNER JOIN archivo.person per ON ph.person_id = per.id
INNER JOIN archivo.procedure p ON ph.procedure_id = p.id
INNER JOIN archivo.licence l ON ph.licence_id = l.id
INNER JOIN archivo.usraxis u ON ph.usraxis_id = u.id
WHERE per.dni = '1718302589';


-- PROCEDIMIENTO ALMACENADO (TRÁMITES x DNI) 
DELIMITER $$

CREATE PROCEDURE obtener_persona_por_dni (
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

END $$

DELIMITER ;

CALL obtener_persona_por_dni('1718302589');




