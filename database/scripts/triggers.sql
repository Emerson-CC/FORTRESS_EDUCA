USE FORTRESS_EDUCA_DB;

-- ====================================================================================================================================================
-- TRG GENERALES PARA DEL SISTEMA
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- TRG: Realiza el progceso de auditoria 

DROP TRIGGER IF EXISTS trg_auditoria_estudiante_update;

DELIMITER $$
CREATE TRIGGER trg_auditoria_estudiante_update
AFTER UPDATE ON TBL_ESTUDIANTE
FOR EACH ROW
BEGIN
    INSERT INTO TBL_AUDITORIA(
        Tabla, Accion, Registro_ID, Fecha
    )
    VALUES (
        'TBL_ESTUDIANTE',
        'UPDATE',
        NEW.ID_Estudiante,
        NOW()
    );
END;
DELIMITER ;

-- ====================================================================================================================================================
-- TRG GENERALES PARA DEL SISTEMA DE TICKETS 
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- TRG: Se activa antes de la creación de un ticket, asigna automaticamente a un técnico disponible

DROP TRIGGER IF EXISTS trg_asignar_tecnico_ticket;

DELIMITER $$

CREATE TRIGGER trg_asignar_tecnico_ticket
BEFORE INSERT ON TBL_TICKET
FOR EACH ROW
BEGIN
    -- Solo asigna si no viene ya asignado
    IF NEW.FK_ID_Usuario_Tecnico IS NULL THEN
        SET NEW.FK_ID_Usuario_Tecnico = fn_obtener_tecnico_disponible();
    END IF;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- TRG: Se activa depues de la creación de un usuario y valida si es técnico. 
-- Si lo es, le asigna tickets con FK_ID_Usuario_Tecnico = NULL

DROP TRIGGER IF EXISTS trg_asignar_tickets_a_nuevo_tecnico;

DELIMITER $$

CREATE TRIGGER trg_asignar_tickets_a_nuevo_tecnico
AFTER INSERT ON TBL_USUARIO
FOR EACH ROW
BEGIN
    DECLARE v_tecnico_id INT;

    IF NEW.FK_ID_Rol = 3 AND NEW.Estado_Usuario = 1 THEN

        SET v_tecnico_id = fn_obtener_tecnico_disponible();

        UPDATE TBL_TICKET
        SET FK_ID_Usuario_Tecnico = v_tecnico_id
        WHERE FK_ID_Usuario_Tecnico IS NULL
          AND Estado_Ticket = 1;

    END IF;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- TRG: Se activa depues de la eliminación de un usuario técnico. Reasigna sus tickets a otros tecnicos (FK_ID_Usuario_Tecnico)
-- Además, deja un comentario en TBL_TICKET_COMENTARIO para contexto al usuario.

DROP TRIGGER IF EXISTS trg_reasignar_tickets_tecnico_inactivo;

DELIMITER $$

CREATE TRIGGER trg_reasignar_tickets_tecnico_inactivo
AFTER UPDATE ON TBL_USUARIO
FOR EACH ROW
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_ticket_id VARCHAR(10);
    DECLARE v_nuevo_tecnico INT;
    DECLARE v_nombre_anterior VARCHAR(150);
    DECLARE v_nombre_nuevo VARCHAR(150);
    DECLARE v_msg TEXT;

    -- Cursor para recorrer tickets afectados
    DECLARE cur_tickets CURSOR FOR
        SELECT ID_Ticket
        FROM TBL_TICKET
        WHERE FK_ID_Usuario_Tecnico = OLD.ID_Usuario
          AND Estado_Ticket = 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Condición: usuario deja de ser técnico o se desactiva
    IF (OLD.FK_ID_Rol = 3 AND (NEW.FK_ID_Rol <> 3 OR NEW.Estado_Usuario = 0)) THEN

        -- Obtener nombre técnico anterior
        SELECT CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido)
        INTO v_nombre_anterior
        FROM TBL_PERSONA p
        WHERE p.ID_Persona = OLD.FK_ID_Persona;

        OPEN cur_tickets;

        read_loop: LOOP
            FETCH cur_tickets INTO v_ticket_id;
            IF done THEN
                LEAVE read_loop;
            END IF;

            -- Obtener nuevo técnico disponible
            SET v_nuevo_tecnico = fn_obtener_tecnico_disponible();

            -- Actualizar ticket
            UPDATE TBL_TICKET
            SET FK_ID_Usuario_Tecnico = v_nuevo_tecnico
            WHERE ID_Ticket = v_ticket_id;

            -- Obtener nombre nuevo técnico (si existe)
            IF v_nuevo_tecnico IS NOT NULL THEN
                SELECT CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido)
                INTO v_nombre_nuevo
                FROM TBL_USUARIO u
                INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
                WHERE u.ID_Usuario = v_nuevo_tecnico;
            ELSE
                SET v_nombre_nuevo = 'Sin asignar';
            END IF;

            -- Construir mensaje tipo auditoría
            SET v_msg = CONCAT(
                '[Reasignación Automática] Técnico: ',
                v_nombre_anterior,
                ' -> ',
                v_nombre_nuevo
            );

            -- Insertar comentario (VISIBLE al usuario)
            INSERT INTO TBL_TICKET_COMENTARIO (
                Comentario,
                Es_Interno,
                FK_ID_Usuario,
                FK_ID_Ticket
            ) VALUES (
                v_msg,
                0, -- público
                COALESCE(v_nuevo_tecnico, OLD.ID_Usuario), 
                v_ticket_id
            );

        END LOOP;

        CLOSE cur_tickets;

    END IF;

END $$

DELIMITER ;


-- --------------------------------------------------------
-- TRG: Se activa despues de que el usuario creador comenta/sube un documento en un ticket en estado 4 (Pendiente Acción del Usuario)
-- Al ticket lo avanza al estado 5 (Solicitud Cupo)

DROP TRIGGER IF EXISTS trg_respuesta_usuario_cupo;

DELIMITER $$
CREATE TRIGGER trg_respuesta_usuario_cupo
AFTER INSERT ON TBL_TICKET_COMENTARIO
FOR EACH ROW
BEGIN
    DECLARE v_estado  TINYINT;
    DECLARE v_creador INT;

    IF NEW.Tipo_Evento IN ('Comentario', 'Documento Subido') THEN
        SELECT FK_ID_Estado_Ticket, FK_ID_Usuario_Creador
        INTO   v_estado, v_creador
        FROM   TBL_TICKET
        WHERE  ID_Ticket = NEW.FK_ID_Ticket;

        IF v_estado = 4 AND NEW.FK_ID_Usuario = v_creador THEN
            UPDATE TBL_TICKET
            SET FK_ID_Estado_Ticket = 5   -- Asignación de Cupo
            WHERE ID_Ticket = NEW.FK_ID_Ticket;
        END IF;
    END IF;
END $$
DELIMITER ;


-- ====================================================================================================================================================
-- TRG PARA CREACIÓN DE USUARIO (ACUDIENTES) / ESTUDIANTES
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- TRG: Valida que la fecha de nacimiento ingresada tenga el formato correcto

DROP TRIGGER IF EXISTS trg_validar_fecha_estudiante;

DELIMITER $$
CREATE TRIGGER trg_validar_fecha_estudiante
BEFORE INSERT ON TBL_PERSONA
FOR EACH ROW
BEGIN
    IF NEW.Fecha_Nacimiento > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fecha de nacimiento inválida';
    END IF;
END;
DELIMITER ;
