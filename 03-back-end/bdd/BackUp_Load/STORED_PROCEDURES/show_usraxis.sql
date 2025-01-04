CREATE DEFINER=`root`@`localhost` PROCEDURE `show_usraxis`(
	-- OUT usuario VARCHAR(25),
    -- OUT identificacion VARCHAR(13),
    -- OUT nombres VARCHAR(255)
)
BEGIN
	SELECT u.name AS "USRAXIS", 
    p.dni AS "CÉDULA",
    p.names AS "NOMBRES COMPLETOS",
    P.cargo AS "ROL"
    FROM person p INNER JOIN usraxis u ON u.person_id=p.id;
END