

DELIMITER $$
CREATE PROCEDURE PROC_MOSTRAR_ESTACIONAMIENTO()
BEGIN
    SELECT NOM_ESTACIONAMIENTO, CANTIDAD_TOTAL, CANTIDAD_DISPONIBLE
    FROM estacionamiento;
END$$
DELIMITER ;