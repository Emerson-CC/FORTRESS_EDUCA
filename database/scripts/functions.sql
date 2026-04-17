USE FORTRESS_EDUCA_DB;

-- ====================================================================================================================================================
-- FN GENERALES PARA DEL SISTEMA
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- FN: Busca y retorna el ID_Usuario del técnico con menos tickets asignados
-- USADO EN: trg_asignar_tecnico_ticket | trg_reasignar_tickets_tecnico_inactivo

DROP FUNCTION IF EXISTS fn_obtener_tecnico_disponible;

DELIMITER $$

CREATE FUNCTION fn_obtener_tecnico_disponible()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_tecnico_id INT;

    SELECT u.ID_Usuario
    INTO v_tecnico_id
    FROM TBL_USUARIO u
    LEFT JOIN TBL_TICKET t 
        ON u.ID_Usuario = t.FK_ID_Usuario_Tecnico
        AND t.Estado_Ticket = 1
    WHERE u.FK_ID_Rol = 3
      AND u.Estado_Usuario = 1
    GROUP BY u.ID_Usuario
    ORDER BY COUNT(t.ID_Ticket) ASC
    LIMIT 1;

    RETURN v_tecnico_id;
END $$

DELIMITER ;