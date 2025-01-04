CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresa_obs`(
    IN numero_proc INT,
    IN observacion VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al actualizar la observación' AS mensaje;
    END;

    UPDATE archivo.person_has_procedure
    SET obs = observacion, status_id = 4
    WHERE numproc = numero_proc
    LIMIT 1;
END