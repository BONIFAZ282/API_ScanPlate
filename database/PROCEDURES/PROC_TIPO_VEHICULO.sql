-- = LISTAR TODO
DELIMITER $$
CREATE PROCEDURE PROC_TIPO_VEHICULO_LISTAR()
BEGIN
  SELECT * FROM TIPO_VEHICULO;
END $$
DELIMITER ;



-- = CREAR O MODIFICAR
DELIMITER $$
CREATE PROCEDURE PROC_TIPO_VEHICULO_CU(
    _ID_TIPO_VEHICULO INT,
    _NOM_TIPO_VEHICULO VARCHAR(30)
) BEGIN
    -- MENSAJE A LA INTERFAZ
    DECLARE __ICON VARCHAR(10) DEFAULT 'error';
    DECLARE __MESSAGE_TEXT VARCHAR(300) DEFAULT 'HA OCURRIDO UN ERROR';
    DECLARE __STATUS_CODE CHAR(3) DEFAULT '501';

    -- COMPROBAR QUE EL NOMBRE NO EXISTA
    DECLARE __EXISTS_NOMBRE INT DEFAULT 0;
    SELECT ID_TIPO_VEHICULO INTO __EXISTS_NOMBRE
    FROM TIPO_VEHICULO
    WHERE ID_TIPO_VEHICULO <> _ID_TIPO_VEHICULO AND
    NOM_TIPO_VEHICULO = _NOM_TIPO_VEHICULO AND ESTADO <> 0;


    IF __EXISTS_NOMBRE = 0 THEN
        IF _ID_TIPO_VEHICULO = 0 THEN
            INSERT INTO TIPO_VEHICULO
                (NOM_TIPO_VEHICULO, ESTADO) VALUES
                (_NOM_TIPO_VEHICULO, '1');

                -- MENSAJE
                SET __ICON = 'success';
                SET __MESSAGE_TEXT = 'REGISTRO EXITOSO';
                SET __STATUS_CODE = '201';
        ELSE
            UPDATE TIPO_VEHICULO
                SET 
                    NOM_TIPO_VEHICULO = _NOM_TIPO_VEHICULO
                WHERE
                    ID_TIPO_VEHICULO = _ID_TIPO_VEHICULO;

                -- MENSAJE
                SET __ICON = 'success';
                SET __MESSAGE_TEXT = 'DATOS ACTUALIZADOS';
                SET __STATUS_CODE = '202';
        END IF;
    ELSE
         -- MENSAJE
        SET __ICON = 'warning';
        SET __MESSAGE_TEXT = '¡EL NOMBRE YA SE ENCUENTRA EN USO!';
        SET __STATUS_CODE = '200';
    END IF;
    SELECT __ICON AS 'ICON', __MESSAGE_TEXT AS 'MESSAGE_TEXT', __STATUS_CODE AS 'STATUS_CODE';
END $$
DELIMITER ;



-- = ELIMINAR TIPO_VEHICULO
DELIMITER $$
CREATE PROCEDURE PROC_TIPO_VEHICULO_DELETE(
    _ID_TIPO_VEHICULO INT
) BEGIN
    -- MENSAJES A LA INTERFAZ
    DECLARE __ICON VARCHAR(10) DEFAULT 'error';
    DECLARE __MESSAGE_TEXT VARCHAR(300) DEFAULT 'HA OCURRIDO UN ERROR';
    DECLARE __STATUS_CODE CHAR(3) DEFAULT '501';

    -- SABER SI NO SE ENCUENTRA O YA ESTA ELIMINADO
    DECLARE __NO_EXISTS INT DEFAULT 0;

    SELECT IF(ESTADO <> 0, ID_TIPO_VEHICULO, 0) INTO __NO_EXISTS FROM TIPO_VEHICULO
    WHERE ID_TIPO_VEHICULO = _ID_TIPO_VEHICULO;

    IF __NO_EXISTS = 0 THEN 
        -- MENSAJE
        SET __ICON = 'warning';
        SET __MESSAGE_TEXT = 'EL ELEMENTO NO EXISTE O YA HA SIDO ELIMINADO';
        SET __STATUS_CODE = '200';
    ELSE
        UPDATE TIPO_VEHICULO
            SET ESTADO = '0'
            WHERE ID_TIPO_VEHICULO = _ID_TIPO_VEHICULO;
        -- MENSAJE
            SET __ICON = 'success';
            SET __MESSAGE_TEXT = 'ELEMENTO ELIMINADO';
            SET __STATUS_CODE = '202';
    END IF;
    SELECT __ICON AS 'ICON', __MESSAGE_TEXT AS 'MESSAGE_TEXT', __STATUS_CODE AS 'STATUS_CODE';
END $$
DELIMITER ;