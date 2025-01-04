CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tramites_por_fecha_digitador`(
	IN usuario VARCHAR(255),
    IN fecha DATE,
    OUT dni VARCHAR(255),
    OUT nombres VARCHAR(255),
    OUT procedimiento VARCHAR(255),
    OUT licencia VARCHAR(255),
    OUT usraxis VARCHAR(255),
    OUT tramite INT,
    OUT ffin DATE,
    OUT fcierre DATE
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
    ORDER BY p.kind, l.class ASC;
    
    SET dni = per.dni;
    SET nombres = per.names;
    SET procedimiento = p.kind;
    SET licencia = l.class;
    SET usraxis = u.name;
    SET tramite = ph.numproc;
    SET ffin = ph.ffin;
    SET fcierre= ph.fproc;
END