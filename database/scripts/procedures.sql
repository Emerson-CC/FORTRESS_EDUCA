USE FORTRESS_EDUCA_DB;

-- ====================================================================================================================================================
--                                          SPs PARA LOS DECORADORES Y DEMAS CONFIGURACIONES
-- ====================================================================================================================================================

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_rol_consultar_nombre;

DELIMITER $$
CREATE PROCEDURE sp_tbl_rol_consultar_nombre(
    IN p_Nombre_Rol VARCHAR(50)
)
BEGIN
    SELECT ID_Rol 
    FROM tbl_rol 
    WHERE Nombre_Rol = p_Nombre_Rol 
    AND Estado_Rol = 1;
END $$
DELIMITER ;

-- --------------------------------------------------------
-- Verificar si un JTI está activo (para blacklist)

DROP PROCEDURE IF EXISTS sp_tbl_sesion_activa_verificar_jti;

DELIMITER $$
CREATE PROCEDURE sp_tbl_sesion_activa_verificar_jti(
    IN p_jti VARCHAR(64)
)
BEGIN
    SELECT COUNT(*) AS activo
    FROM tbl_sesion_activa
    WHERE JTI = p_jti AND Activa = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Registro de cambios de los datos de las tablas de la BD
DROP PROCEDURE IF EXISTS sp_insertar_auditoria;

DELIMITER $$
CREATE PROCEDURE sp_insertar_auditoria(
    IN p_tabla VARCHAR(100),
    IN p_evento VARCHAR(20),
    IN p_id_registro VARCHAR(50),
    IN p_datos_old JSON,
    IN p_datos_new JSON,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255),
    IN p_id_usuario INT
)
BEGIN
    INSERT INTO tbl_auditoria (
        Tabla_Afectada,
        Tipo_Evento,
        ID_Registro_Afectado,
        Datos_Antiguo,
        Datos_Nuevos,
        IP_Usuario,
        User_Agent,
        FK_ID_Usuario
    )
    VALUES (
        p_tabla,
        p_evento,
        p_id_registro,
        p_datos_old,
        p_datos_new,
        p_ip,
        p_user_agent,
        p_id_usuario
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtiene los datos del usuario relacionados con el MFA

DROP PROCEDURE IF EXISTS sp_tbl_usuario_verificar_mfa;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_verificar_mfa(
    IN p_id_usuario INT
)
BEGIN
    SELECT 
        Doble_Factor_Activo,
        MFA_Secret
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario
      AND Estado_Usuario = 1
    LIMIT 1;
END $$
DELIMITER ;

-- ====================================================================================================================================================
--                                          SPs PARA HOME
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE LOGIN
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- VALIDACIONES PARA EL INICIO DE SESIÓN

DROP PROCEDURE IF EXISTS sp_validar_data_user;

DELIMITER $$
CREATE PROCEDURE sp_validar_data_user(
    IN p_nombre_usuario VARCHAR(50)
)
BEGIN
    SELECT 
        u.ID_Usuario,
        u.Doble_Factor_Activo,
        u.FK_ID_Rol,

        -- Datos de persona
        p.Primer_Nombre,
        p.Primer_Apellido,
        CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo

    FROM tbl_usuario u
    INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
    
    WHERE u.Nombre_Usuario = p_nombre_usuario
    AND u.Estado_Usuario = 1
    AND p.Estado_Persona = 1

    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_obtener_datos_autenticacion;

DELIMITER $$
CREATE PROCEDURE sp_obtener_datos_autenticacion(
    IN p_nombre_usuario VARCHAR(50)
)
BEGIN
    SELECT 
        ID_Usuario, 
        Contraseña_Hash, 
        Intentos_Fallidos
    FROM tbl_usuario
    WHERE Nombre_Usuario = p_nombre_usuario
    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------


DROP PROCEDURE IF EXISTS sp_registrar_exito_login;

DELIMITER $$
CREATE PROCEDURE sp_registrar_exito_login(IN p_id_usuario INT)
BEGIN
    UPDATE tbl_usuario
    SET Ultimo_Login = NOW(), Intentos_Fallidos = 0
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_auditoria_sesion;

DELIMITER $$
CREATE PROCEDURE sp_auditoria_sesion(
    IN p_usuario INT,
    IN p_ip VARCHAR(45),
    IN p_evento VARCHAR(45),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    INSERT INTO tbl_auditoria_sesion(
        FK_ID_Usuario,
        IP_Usuario,
        Tipo_Evento,
        User_Agent
    )

    VALUES(
        p_usuario,
        p_ip,
        p_evento,
        p_user_agent
    );
END $$
DELIMITER ;


-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE VERIFY_MFA
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Obtener secret MFA activo

DROP PROCEDURE IF EXISTS sp_tbl_usuario_obtener_mfa_secret;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_obtener_mfa_secret(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        MFA_Secret,
        MFA_Secret_Temp,
        Doble_Factor_Activo
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE REGISTER
-- ====================================================================================================================================================

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_barrio_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_barrio_consultar()
BEGIN
    SELECT
        ID_Barrio,
        Nombre_Barrio
    FROM tbl_barrio
    WHERE Estado_Barrio = 1
    ORDER BY Nombre_Barrio;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_parentesco_consultar_acu;

DELIMITER $$
CREATE PROCEDURE sp_tbl_parentesco_consultar_acu()
BEGIN
    SELECT 
        ID_Parentesco,
        Nombre_Parentesco
    FROM tbl_parentesco
    WHERE Estado_Parentesco = 1 AND Tipo_Usuario = 'ACUDIENTE'
    ORDER BY ID_Parentesco;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_tipo_identificacion_consultar_acu;

DELIMITER $$
CREATE PROCEDURE sp_tbl_tipo_identificacion_consultar_acu()
BEGIN
    SELECT 
        ID_Tipo_Iden,
        Nombre_Tipo_Iden
    FROM tbl_tipo_identificacion
    WHERE Estado_Identificacion = 1 AND Tipo_Usuario = 'ACUDIENTE'
    ORDER BY Nombre_Tipo_Iden;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_usuario_verificar_existente;

DELIMITER $$
CREATE PROCEDURE sp_usuario_verificar_existente(
    IN p_Email VARCHAR(255),
    IN p_Documento INT
)
BEGIN
    SELECT 
        u.Nombre_Usuario,
        p.ID_Persona
    FROM tbl_usuario u
    JOIN tbl_persona p
    ON u.FK_ID_Persona = p.ID_Persona
    WHERE u.Nombre_Usuario = p_Email
    OR p.ID_Persona = p_Documento;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_registrar_usuario_completo;

DELIMITER $$
CREATE PROCEDURE sp_registrar_usuario_completo(
    -- PERSONA
    IN p_Num_Doc_Persona VARCHAR(30),
    IN p_Primer_Nombre VARCHAR(50),
    IN p_Segundo_Nombre VARCHAR(50),
    IN p_Primer_Apellido VARCHAR(50),
    IN p_Segundo_Apellido VARCHAR(50),
    IN p_Fecha_Nacimiento DATE,

    -- DATOS ADICIONALES
    IN p_Email VARCHAR(255),
    IN p_Telefono VARCHAR(45),
    IN p_FK_ID_Parentesco TINYINT,
    IN p_FK_ID_Tipo_Iden TINYINT,
    IN p_FK_ID_Genero TINYINT,
    IN p_FK_ID_Grupo_Preferencial TINYINT,
    IN p_FK_ID_Estrato TINYINT,
    IN p_FK_ID_Barrio INT,

    -- USUARIO
    IN p_Nombre_Usuario VARCHAR(50),
    IN p_password_hash VARCHAR(255),
    IN p_FK_ID_Rol TINYINT,

    -- AUDITORÍA
    IN p_IP VARCHAR(50),
    IN p_User_Agent VARCHAR(255)
)
BEGIN
    DECLARE v_ID_Persona INT;
    DECLARE v_ID_Datos_Adicionales INT;
    DECLARE v_ID_Usuario INT;

    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- INSERT PERSONA
    INSERT INTO tbl_persona (
        Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, 
        Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona
    ) VALUES (
        p_Num_Doc_Persona, p_Primer_Nombre, p_Segundo_Nombre,
        p_Primer_Apellido, p_Segundo_Apellido, p_Fecha_Nacimiento, 1
    );

    SET v_ID_Persona = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_persona', 'CREATE', CAST(v_ID_Persona AS CHAR),
        NULL, JSON_OBJECT('Doc', p_Num_Doc_Persona, 'Nombre', p_Primer_Nombre), 
        p_IP, p_User_Agent, 1
    );

    -- DATOS ADICIONALES
    INSERT INTO tbl_datos_adicionales (
        Email, Telefono, FK_ID_Parentesco, FK_ID_Tipo_Iden, 
        FK_ID_Persona, FK_ID_Genero, FK_ID_Grupo_Preferencial, 
        FK_ID_Estrato, FK_ID_Barrio, Estado_Datos_Adicionales
    ) VALUES (
        p_Email, p_Telefono, p_FK_ID_Parentesco, p_FK_ID_Tipo_Iden,
        v_ID_Persona, p_FK_ID_Genero, p_FK_ID_Grupo_Preferencial,
        p_FK_ID_Estrato, p_FK_ID_Barrio, 1
    );

    SET v_ID_Datos_Adicionales = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_datos_adicionales', 'CREATE', CAST(v_ID_Datos_Adicionales AS CHAR),
        NULL, JSON_OBJECT('Email', p_Email, 'Tel', p_Telefono), 
        p_IP, p_User_Agent, 1
    );

    -- USUARIO
    INSERT INTO tbl_usuario (
        Nombre_Usuario, Contraseña_Hash, 
        Ultimo_Cambio_Contraseña, Ultimo_Login, Intentos_Fallidos,
        Fecha_Creacion, Doble_Factor_Activo, MFA_Fecha_Configuracion,
        MFA_Secret, MFA_Secret_Temp, Notificaciones_Email,
        Notificaciones_Navegador, Aceptacion_Terminos, FK_ID_Persona,
        FK_ID_Rol, Estado_Usuario
    ) VALUES (
        p_Nombre_Usuario, p_password_hash,
        NULL, NULL, 0,
        CURRENT_TIMESTAMP, 'INACTIVE', NULL,
        NULL, NULL, 0,
        0, 'ACCEPTED', v_ID_Persona,
        p_FK_ID_Rol, 1
    );

    SET v_ID_Usuario = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_usuario', 'CREATE_ACCOUNT', CAST(v_ID_Usuario AS CHAR),
        NULL, JSON_OBJECT('Username', p_Nombre_Usuario), 
        p_IP, p_User_Agent, 1
    );

    COMMIT;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE RECOVER_PASSWORD
-- ====================================================================================================================================================

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_usuario_obtener_email;

DELIMITER $$
CREATE PROCEDURE sp_usuario_obtener_email(
    IN p_Nombre_Usuario VARCHAR(50)
)
BEGIN
    SELECT 
        DA.Email
    FROM tbl_usuario U
    INNER JOIN tbl_datos_adicionales DA ON U.FK_ID_Persona = DA.FK_ID_Persona
    WHERE U.Nombre_Usuario = p_Nombre_Usuario 
    AND DA.Email = p_Nombre_Usuario;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_usuario_recuperar_contraseña;

DELIMITER $$
CREATE PROCEDURE sp_usuario_recuperar_contraseña(
    IN p_username VARCHAR(100),
    IN p_nuevo_hash VARCHAR(255),
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_id_usuario INT;

    START TRANSACTION;

    SELECT ID_Usuario INTO v_id_usuario
    FROM tbl_usuario
    WHERE Nombre_Usuario = p_username;

    UPDATE tbl_usuario
    SET Contraseña_Hash = p_nuevo_hash,
        Ultimo_Cambio_Contraseña = CURRENT_TIMESTAMP
    WHERE Nombre_Usuario = p_username;

    CALL sp_insertar_auditoria(
        'tbl_usuario',
        'PASSWORD_CHANGE',
        v_id_usuario,
        JSON_OBJECT('evento','recuperacion_password'),
        JSON_OBJECT('evento','password_actualizado'),
        p_ip,
        p_user_agent,
        1
    );

    COMMIT;
END $$
DELIMITER ;






-- ====================================================================================================================================================
--                                          SPs PARA APLICATION
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE REQUEST
-- ====================================================================================================================================================


-- --------------------------------------------------------
-- Resumen del panel principal para el acudiente

DROP PROCEDURE IF EXISTS sp_tbl_dashboard_resumen_acudiente;

DELIMITER $$
CREATE PROCEDURE sp_tbl_dashboard_resumen_acudiente(
    IN p_id_usuario INT
)
BEGIN
    -- Datos del acudiente y su estudiante
    SELECT
        -- Acudiente
        CONCAT(pa.Primer_Nombre, ' ', COALESCE(pa.Segundo_Nombre, ''), ' ', pa.Primer_Apellido) AS Nombre_Acudiente,

        -- Estudiante
        CONCAT(pe.Primer_Nombre, ' ', pe.Primer_Apellido) AS Nombre_Estudiante,
        g_act.Nombre_Grado AS Grado_Actual,
        COALESCE(g_prox.Nombre_Grado, 'No definido') AS Grado_Proximo,

        -- Ticket más reciente
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Fecha_Creacion AS Fecha_Ticket,
        t.Puntaje_Prioridad,
        et.Nombre_Estado,
        et.Estado_Final,
        ta.Nombre_Afectacion,

        -- Colegio asignado (si existe)
        COALESCE(c.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,

        -- Conteo total de tickets del usuario
        (
            SELECT COUNT(*)
            FROM tbl_ticket t2
            WHERE t2.FK_ID_Usuario_Creador = p_id_usuario
              AND t2.Estado_Ticket = 1
        ) AS Total_Tickets,

        -- Conteo de documentos pendientes (tickets abiertos sin documentos)
        (
            SELECT COUNT(*)
            FROM tbl_ticket t3
            WHERE t3.FK_ID_Usuario_Creador = p_id_usuario
              AND t3.Estado_Ticket = 1
              AND t3.FK_ID_Estado_Ticket NOT IN (
                  SELECT ID_Estado_Ticket FROM tbl_estado_ticket WHERE Estado_Final = 1
              )
              AND NOT EXISTS (
                  SELECT 1 FROM tbl_documento_ticket dt
                  WHERE dt.FK_ID_Ticket = t3.ID_Ticket
                    AND dt.Estado_Documentos = 1
              )
        ) AS Tickets_Sin_Documentos

    FROM tbl_usuario u
    INNER JOIN tbl_persona pa ON u.FK_ID_Persona = pa.ID_Persona
    -- Estudiante vinculado al acudiente
    INNER JOIN tbl_estudiante est ON est.FK_ID_Acudiente = u.ID_Usuario
    INNER JOIN tbl_persona pe ON est.FK_ID_Persona = pe.ID_Persona
    INNER JOIN tbl_grado g_act ON est.FK_ID_Grado_Actual = g_act.ID_Grado
    LEFT  JOIN tbl_grado g_prox ON est.FK_ID_Grado_Proximo = g_prox.ID_Grado
    -- Ticket más reciente
    LEFT JOIN tbl_ticket t ON t.FK_ID_Usuario_Creador = u.ID_Usuario 
        AND t.Estado_Ticket = 1
        AND t.Fecha_Creacion = (
            SELECT MAX(t_inner.Fecha_Creacion)
            FROM tbl_ticket t_inner
            WHERE t_inner.FK_ID_Usuario_Creador = u.ID_Usuario
              AND t_inner.Estado_Ticket = 1
        )

    LEFT JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    LEFT JOIN tbl_tipo_afectacion ta ON t.FK_ID_Tipo_Afectacion = ta.ID_Tipo_Afectacion
    LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN tbl_colegio c ON cu.FK_ID_Colegio = c.ID_Colegio

    WHERE u.ID_Usuario  = p_id_usuario
      AND u.Estado_Usuario = 1
    LIMIT 1;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE REQUEST
-- ====================================================================================================================================================

-- DATOS PARA LISTAS DE OPCIONES 

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_tipo_afectacion_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_tipo_afectacion_consultar()
BEGIN
    SELECT ID_Tipo_Afectacion, Nombre_Afectacion, Nivel_Prioridad_TC
    FROM tbl_tipo_afectacion
    WHERE Estado_Afectacion = 1
    ORDER BY Nivel_Prioridad_TC DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_jornada_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_jornada_consultar()
BEGIN
    SELECT ID_Jornada, Nombre_Jornada
    FROM tbl_jornada
    WHERE Estado_Jornada = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_tiempo_residencia_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_tiempo_residencia_consultar()
BEGIN
    SELECT ID_Tiempo_Residencia, Nombre_Tiempo
    FROM tbl_tiempo_residencia;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Verificar ticket activo para un estudiante, un estudiante no puede tener dos tickets abiertos simultáneamente

DROP PROCEDURE IF EXISTS sp_ticket_verificar_activo;

DELIMITER $$
CREATE PROCEDURE sp_ticket_verificar_activo(
    IN p_id_estudiante INT,
    IN p_id_usuario INT
)
BEGIN
    SELECT COUNT(*) AS total_activos
    FROM tbl_ticket t
    INNER JOIN tbl_estado_ticket e ON t.FK_ID_Estado_Ticket = e.ID_Estado_Ticket
    WHERE t.FK_ID_Estudiante = p_id_estudiante
      AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND e.Estado_Final = 0
      AND t.Estado_Ticket = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Generar próximo ID_Ticket en formato EDU-000000

DROP PROCEDURE IF EXISTS sp_ticket_obtener_ultimo_numero;

DELIMITER $$
CREATE PROCEDURE sp_ticket_obtener_ultimo_numero()
BEGIN
    SELECT COALESCE(
        MAX(CAST(SUBSTRING(ID_Ticket, 5) AS UNSIGNED)), 
        0
    ) AS ultimo_numero
    FROM tbl_ticket;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- 

DROP PROCEDURE IF EXISTS sp_ticket_crear;

DELIMITER $$
CREATE PROCEDURE sp_ticket_crear(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT,
    IN p_id_estudiante INT,
    IN p_id_tipo_afectacion TINYINT,
    IN p_descripcion TEXT,
    IN p_id_barrio INT,
    IN p_id_tiempo_residencia TINYINT,
    IN p_id_jornada TINYINT,
    IN p_id_colegio INT,
    IN p_ip VARCHAR(45),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_titulo VARCHAR(150);
    DECLARE v_puntaje INT DEFAULT 0;
    DECLARE v_nombre_est VARCHAR(120);
    DECLARE v_grado VARCHAR(60);
    DECLARE v_nivel_afectacion TINYINT DEFAULT 0;
    DECLARE v_nivel_gp TINYINT DEFAULT 0;
    DECLARE v_id_estado_inicial TINYINT;
    DECLARE v_msg_comentario TEXT;

    -- Manejo de errores: rollback automático
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Nombre del estudiante y grado para el título
    SELECT CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido),
           gr.Nombre_Grado
    INTO   v_nombre_est, v_grado
    FROM   tbl_estudiante e
    INNER JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_grado gr ON e.FK_ID_Grado_Proximo = gr.ID_Grado
    WHERE  e.ID_Estudiante = p_id_estudiante;

    SET v_titulo = CONCAT('Solicitud de Cupo — ', v_nombre_est, ' — ', v_grado);

    -- Puntaje de prioridad
    SELECT Nivel_Prioridad_TC INTO v_nivel_afectacion
    FROM tbl_tipo_afectacion
    WHERE ID_Tipo_Afectacion = p_id_tipo_afectacion;

    SELECT gp.Nivel_Prioridad_GP INTO v_nivel_gp
    FROM tbl_estudiante e
    INNER JOIN tbl_grupo_preferencial gp 
        ON e.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
    WHERE e.ID_Estudiante = p_id_estudiante;

    SET v_puntaje = COALESCE(v_nivel_afectacion, 0) + COALESCE(v_nivel_gp, 0);

    -- Estado inicial
    SELECT ID_Estado_Ticket INTO v_id_estado_inicial
    FROM tbl_estado_ticket
    WHERE Estado_Final = 0 AND Estado_Estado_Ticket = 1
    ORDER BY ID_Estado_Ticket ASC
    LIMIT 1;

    -- Insertar ticket
    INSERT INTO tbl_ticket (
        ID_Ticket, Titulo_Ticket, Descripcion_Ticket, Puntaje_Prioridad,
        FK_ID_Usuario_Creador, FK_ID_Estudiante, FK_ID_Tipo_Afectacion,
        FK_ID_Colegio_Preferencia, FK_ID_Jornada_Preferencia,
        FK_ID_Estado_Ticket, FK_ID_Barrio, FK_ID_Tiempo_Residencia
    ) VALUES (
        p_id_ticket, v_titulo, p_descripcion, v_puntaje,
        p_id_usuario, p_id_estudiante, p_id_tipo_afectacion,
        p_id_colegio, p_id_jornada,
        v_id_estado_inicial, p_id_barrio, p_id_tiempo_residencia
    );

    -- Crear mensaje del comentario automático
    SET v_msg_comentario = CONCAT(
        '[Nueva Solicitud] Ticket creado: ',
        v_titulo
    );

    -- Insertar comentario automático
    INSERT INTO tbl_ticket_comentario (
        Tipo_Evento,
        Comentario,
        Es_Interno,
        FK_ID_Usuario,
        FK_ID_Ticket
    ) VALUES (
        'Nueva Solicitud',
        v_msg_comentario,
        1, -- interno
        p_id_usuario,
        p_id_ticket
    );

    COMMIT;

    -- Retorno
    SELECT 
        p_id_ticket AS id_ticket, 
        v_titulo AS titulo, 
        v_puntaje AS puntaje;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Insertar documento de ticket

DROP PROCEDURE IF EXISTS sp_documento_ticket_insertar;

DELIMITER $$
CREATE PROCEDURE sp_documento_ticket_insertar(
    IN p_id_ticket VARCHAR(10),
    IN p_id_tipo_doc TINYINT,
    IN p_archivo MEDIUMBLOB,
    IN p_nombre_original VARCHAR(100)
)
BEGIN
    INSERT INTO tbl_documento_ticket (
        FK_ID_Ticket,
        FK_ID_Tipo_Doc,
        Archivo,
        Nombre_Original
    ) VALUES (
        p_id_ticket,
        p_id_tipo_doc,
        p_archivo,
        p_nombre_original
    );
END $$
DELIMITER ;


-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE STATUS
-- ====================================================================================================================================================

-- DATOS PARA LISTAS DE TICKETS 

-- --------------------------------------------------------
-- Obtener todos los tickets de un acudiente (usuario)

DROP PROCEDURE IF EXISTS sp_tbl_ticket_consultar_por_usuario;

DELIMITER $$
CREATE PROCEDURE sp_tbl_ticket_consultar_por_usuario(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Fecha_Creacion,
        t.Fecha_Cierre,
        et.Nombre_Estado,
        g.Nombre_Grado,
        CONCAT(p.Primer_Nombre, ' ', COALESCE(p.Segundo_Nombre, ''), ' ', p.Primer_Apellido, ' ', COALESCE(p.Segundo_Apellido, '')) AS Nombre_Estudiante,
        COALESCE(c.Nombre_Colegio, 'Sin asignar') AS Nombre_Colegio
    FROM tbl_ticket t
    INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    INNER JOIN tbl_estudiante est ON t.FK_ID_Estudiante = est.ID_Estudiante
    INNER JOIN tbl_persona p ON est.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_grado g ON est.FK_ID_Grado_Actual = g.ID_Grado
    LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN tbl_colegio c ON cu.FK_ID_Colegio = c.ID_Colegio

    WHERE t.FK_ID_Usuario_Creador = p_id_usuario 
        AND t.Estado_Ticket = 1
        AND et.Estado_Final = 0
    ORDER BY t.Fecha_Creacion DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Obtener todos los tickets de un acudiente (usuario)

DROP PROCEDURE IF EXISTS sp_tbl_ticket_cerrado_consultar_por_usuario;

DELIMITER $$
CREATE PROCEDURE sp_tbl_ticket_cerrado_consultar_por_usuario(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Fecha_Creacion,
        t.Fecha_Cierre,
        et.Nombre_Estado,
        g.Nombre_Grado,
        CONCAT(p.Primer_Nombre, ' ', COALESCE(p.Segundo_Nombre, ''), ' ', p.Primer_Apellido, ' ', COALESCE(p.Segundo_Apellido, '')) AS Nombre_Estudiante,
        COALESCE(c.Nombre_Colegio, 'Sin asignar') AS Nombre_Colegio
    FROM tbl_ticket t
    INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    INNER JOIN tbl_estudiante est ON t.FK_ID_Estudiante = est.ID_Estudiante
    INNER JOIN tbl_persona p ON est.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_grado g ON est.FK_ID_Grado_Actual = g.ID_Grado
    LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN tbl_colegio c ON cu.FK_ID_Colegio = c.ID_Colegio

    WHERE t.FK_ID_Usuario_Creador = p_id_usuario 
        AND t.Estado_Ticket = 1
        AND et.Estado_Final = 1
    ORDER BY t.Fecha_Creacion DESC;
END $$
DELIMITER ;


-- DATOS PARA LA PAGINA DE DETAIL

-- --------------------------------------------------------
-- Obtener datos completos de un ticket específico

DROP PROCEDURE IF EXISTS sp_tbl_ticket_consultar_detalle;

DELIMITER $$
CREATE PROCEDURE sp_tbl_ticket_consultar_detalle(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Descripcion_Ticket,
        t.Fecha_Creacion,
        t.Fecha_Cierre,
        t.Puntaje_Prioridad,

        t.Nombre_Estado,
        t.Estado_Final,

        t.Nombre_Afectacion,
        t.Nivel_Prioridad_TC,

        CONCAT(e.Primer_Nombre, ' ', e.Primer_Apellido) AS Nombre_Estudiante,
        e.Nombre_Grado_Actual,
        e.Nombre_Grado_Proximo,

        j.Nombre_Jornada AS Jornada_Preferencia,
        COALESCE(cp.Nombre_Colegio, 'Sin preferencia') AS Colegio_Preferencia,
        COALESCE(c_asig.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,

        CONCAT(pt.Primer_Nombre, ' ', pt.Primer_Apellido) AS Nombre_Tecnico,

        b.Nombre_Barrio,
        tr.Nombre_Tiempo

    FROM vw_ticket_detalle t
    INNER JOIN vw_estudiante_detalle e ON t.FK_ID_Estudiante = e.ID_Estudiante
    INNER JOIN tbl_jornada j ON t.FK_ID_Jornada_Preferencia = j.ID_Jornada
    INNER JOIN tbl_barrio b ON t.FK_ID_Barrio = b.ID_Barrio
    LEFT JOIN tbl_tiempo_residencia tr ON t.FK_ID_Tiempo_Residencia = tr.ID_Tiempo_Residencia
    LEFT JOIN tbl_colegio cp ON t.FK_ID_Colegio_Preferencia = cp.ID_Colegio
    LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN tbl_colegio c_asig ON cu.FK_ID_Colegio = c_asig.ID_Colegio
    LEFT JOIN tbl_usuario ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
    LEFT JOIN tbl_persona pt ON ut.FK_ID_Persona = pt.ID_Persona

    WHERE t.ID_Ticket = p_id_ticket
    AND t.FK_ID_Usuario_Creador = p_id_usuario
    AND t.Estado_Ticket = 1;
END $$
DELIMITER ;

-- --------------------------------------------------------
-- Obtener comentarios públicos de un ticket

DROP PROCEDURE IF EXISTS sp_tbl_ticket_comentarios_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_ticket_comentarios_consultar(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT *
    FROM vw_ticket_comentarios vc
    INNER JOIN tbl_ticket t ON vc.FK_ID_Ticket = t.ID_Ticket

    WHERE vc.FK_ID_Ticket = p_id_ticket
      AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND vc.Es_Interno = 0
      AND vc.Estado_Comentario_Ticket = 1
    ORDER BY vc.Fecha_Comentario ASC;
END $$
DELIMITER ;


-- --------------------------------------------------------
--  Obtener documentos de un ticket

DROP PROCEDURE IF EXISTS sp_tbl_ticket_documentos_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_ticket_documentos_consultar(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT
        dt.ID_Doc_Ticket,
        dt.Nombre_Original,
        dt.Fecha_Subida,
        tdoc.Nombre_Tipo_Doc
    FROM tbl_documento_ticket dt
    INNER JOIN tbl_tipo_documento tdoc ON dt.FK_ID_Tipo_Doc = tdoc.ID_Tipo_Doc
    INNER JOIN tbl_ticket t ON dt.FK_ID_Ticket = t.ID_Ticket
    WHERE dt.FK_ID_Ticket = p_id_ticket AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND dt.Estado_Documentos = 1
    ORDER BY dt.Fecha_Subida DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Obtener tipos de documento activos

DROP PROCEDURE IF EXISTS sp_tbl_tipo_documento_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_tipo_documento_consultar()
BEGIN
    SELECT ID_Tipo_Doc, Nombre_Tipo_Doc
    FROM tbl_tipo_documento
    WHERE Estado_Documentos = 1
    ORDER BY Nombre_Tipo_Doc ASC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Subir documento a un ticket

DROP PROCEDURE IF EXISTS sp_tbl_documento_ticket_insertar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_documento_ticket_insertar(
    IN p_id_ticket VARCHAR(10),
    IN p_id_tipo_doc TINYINT,
    IN p_archivo MEDIUMBLOB,
    IN p_nombre_original VARCHAR(100)
)
BEGIN
    INSERT INTO tbl_documento_ticket (
        FK_ID_Ticket,
        FK_ID_Tipo_Doc,
        Archivo,
        Nombre_Original
    ) VALUES (
        p_id_ticket,
        p_id_tipo_doc,
        p_archivo,
        p_nombre_original
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Descargar un documento (verificando que pertenece al usuario)

DROP PROCEDURE IF EXISTS sp_tbl_documento_ticket_descargar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_documento_ticket_descargar(
    IN p_id_doc INT,
    IN p_id_usuario INT
)
BEGIN
    SELECT
        dt.Archivo,
        dt.Nombre_Original,
        tdoc.Nombre_Tipo_Doc
    FROM tbl_documento_ticket dt
    INNER JOIN tbl_tipo_documento tdoc ON dt.FK_ID_Tipo_Doc = tdoc.ID_Tipo_Doc
    INNER JOIN tbl_ticket t ON dt.FK_ID_Ticket = t.ID_Ticket
    WHERE dt.ID_Doc_Ticket = p_id_doc AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND dt.Estado_Documentos = 1;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE PROFILE
-- ====================================================================================================================================================

-- DATOS PARA LISTAS DE OPCIONES 

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_genero_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_genero_consultar()
BEGIN
    SELECT
        ID_Genero,
        Nombre_Genero
    FROM tbl_genero
    WHERE Estado_Genero = 1
    ORDER BY Nombre_Genero;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_grupo_preferencial_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_grupo_preferencial_consultar()
BEGIN
    SELECT
        ID_Grupo_Preferencial,
        Nombre_Grupo_Preferencial
    FROM tbl_grupo_preferencial
    WHERE Estado_Grupo_Preferencial = 1
    ORDER BY ID_Grupo_Preferencial;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_grado_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_grado_consultar()
BEGIN
    SELECT
        ID_Grado,
        Nombre_Grado
    FROM tbl_grado
    WHERE Estado_Grado = 1
    ORDER BY ID_Grado;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_colegio_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_colegio_consultar()
BEGIN
    SELECT
        ID_Colegio,
        Nombre_Colegio
    FROM tbl_colegio
    WHERE Estado_Colegio = 1
    ORDER BY Nombre_Colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_tipo_identificacion_consultar_est;

DELIMITER $$
CREATE PROCEDURE sp_tbl_tipo_identificacion_consultar_est()
BEGIN
    SELECT 
        ID_Tipo_Iden,
        Nombre_Tipo_Iden
    FROM tbl_tipo_identificacion
    WHERE Estado_Identificacion = 1 AND Tipo_Usuario = 'ESTUDIANTE'
    ORDER BY Nombre_Tipo_Iden;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_estrato_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_estrato_consultar()
BEGIN
    SELECT 
        ID_Estrato, 
        Nombre_Estrato
    FROM tbl_estrato
    WHERE Estado_Estrato = 1
    ORDER BY ID_Estrato;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_localidad_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_localidad_consultar()
BEGIN
    SELECT
        ID_Localidad,
        Nombre_Localidad
    FROM tbl_localidad
    WHERE Estado_Localidad = 1
    ORDER BY Nombre_Localidad;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_barrio_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_barrio_consultar()
BEGIN
    SELECT
    ID_Barrio,
    Nombre_Barrio
    FROM tbl_barrio
    WHERE Estado_Barrio = 1
    ORDER BY Nombre_Barrio;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_parentesco_consultar_est;

DELIMITER $$
CREATE PROCEDURE sp_tbl_parentesco_consultar_est()
BEGIN
    SELECT 
        ID_Parentesco,
        Nombre_Parentesco
    FROM tbl_parentesco
    WHERE Estado_Parentesco = 1 AND Tipo_Usuario = 'ESTUDIANTE'
    ORDER BY ID_Parentesco;
END $$
DELIMITER ;


-- --------------------------------------------------------
    -- Reutilización de sp_tbl_parentesco_consultar_acu


-- PERFIL DEL USUARIO (ACUDIENTE)

-- --------------------------------------------------------
-- SP: Obtener todos los datos de un acudiente

DROP PROCEDURE IF EXISTS sp_perfil_acudiente_consultar;

DELIMITER $$
CREATE PROCEDURE sp_perfil_acudiente_consultar(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        -- Identidad (Solo lectura para el usuario)
        p.ID_Persona, -- ID técnico para el servicio Python
        p.Num_Doc_Persona AS Numero_Documento,
        p.Primer_Nombre,
        p.Segundo_Nombre,
        p.Primer_Apellido,
        p.Segundo_Apellido,
        ti.Nombre_Tipo_Iden,

        -- Contacto (Editable)
        da.ID_Datos_Adicionales,
        da.Email,
        da.Telefono,

        -- Ubicación y Demografía (Editable)
        da.FK_ID_Barrio AS ID_Barrio,
        b.Nombre_Barrio,
        da.FK_ID_Estrato AS ID_Estrato,
        da.FK_ID_Genero AS ID_Genero,
        da.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,

        -- Metadatos
        par.Nombre_Parentesco,
        u.Fecha_Creacion
    FROM tbl_usuario u
    INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_datos_adicionales da ON da.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_tipo_identificacion ti ON da.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
    INNER JOIN tbl_barrio b ON da.FK_ID_Barrio = b.ID_Barrio
    INNER JOIN tbl_parentesco par ON da.FK_ID_Parentesco = par.ID_Parentesco
    WHERE u.ID_Usuario = p_id_usuario
    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_datos_adicionales_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_datos_adicionales_actualizar(
    IN p_id_datos INT,
    IN p_telefono VARCHAR(45),
    IN p_id_persona INT,
    IN p_genero TINYINT,
    IN p_grupo_pref TINYINT,
    IN p_estrato TINYINT,
    IN p_barrio TINYINT,
    IN p_id_usuario INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_old JSON;
    
    START TRANSACTION;

    -- Captura estado anterior para auditoría
    SELECT JSON_OBJECT(
        'Telefono', Telefono,
        'Genero', FK_ID_Genero,
        'Grupo', FK_ID_Grupo_Preferencial,
        'Estrato', FK_ID_Estrato,
        'Barrio', FK_ID_Barrio
    ) INTO v_old
    FROM tbl_datos_adicionales
    WHERE ID_Datos_Adicionales = p_id_datos;

    UPDATE tbl_datos_adicionales
    SET
        Telefono = p_telefono,
        FK_ID_Genero = p_genero,
        FK_ID_Grupo_Preferencial = p_grupo_pref,
        FK_ID_Estrato = p_estrato,
        FK_ID_Barrio = p_barrio
    WHERE ID_Datos_Adicionales = p_id_datos
      AND FK_ID_Persona = p_id_persona;

    CALL sp_insertar_auditoria(
        'tbl_datos_adicionales', 'UPDATE', CAST(p_id_datos AS CHAR),
        v_old, 
        JSON_OBJECT('Telefono', p_telefono, 'Genero', p_genero, 'Barrio', p_barrio),
        p_ip, p_user_agent, p_id_usuario
    );

    COMMIT;
END $$
DELIMITER ;


--      PERFIL DE ESTUDIANTES

-- --------------------------------------------------------
-- SP: Obtener todos los estudiantes de un acudiente (lista para tarjetas)

DROP PROCEDURE IF EXISTS sp_perfil_estudiantes_por_acudiente;

DELIMITER $$
CREATE PROCEDURE sp_perfil_estudiantes_por_acudiente(IN p_id_usuario INT)
BEGIN
    SELECT *
    FROM vw_estudiante_detalle
    WHERE FK_ID_Acudiente = p_id_usuario
      AND Estado_Estudiante = 1
    ORDER BY Primer_Apellido, Primer_Nombre;
END $$
DELIMITER ;

-- --------------------------------------------------------
-- SP: Obtener un estudiante específico por su ID (para edición)

DROP PROCEDURE IF EXISTS sp_perfil_estudiante_por_id;

DELIMITER $$
CREATE PROCEDURE sp_perfil_estudiante_por_id(
    IN p_id_estudiante INT,
    IN p_id_usuario INT
)
BEGIN
    SELECT
        e.ID_Estudiante,
        p.ID_Persona,
        p.Primer_Nombre,
        p.Segundo_Nombre,
        p.Primer_Apellido,
        p.Segundo_Apellido,
        p.Fecha_Nacimiento,
        ti.Nombre_Tipo_Iden,
        p.Num_Doc_Persona AS Numero_Documento,
        e.FK_ID_Genero AS ID_Genero,
        e.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,
        e.FK_ID_Grado_Actual AS ID_Grado_Actual,
        e.FK_ID_Grado_Proximo AS ID_Grado_Proximo,
        e.FK_ID_Colegio_Anterior AS ID_Colegio_Anterior,
        e.FK_ID_Tipo_Iden AS ID_Tipo_Iden,
        ti.Nombre_Tipo_Iden,
        p.Num_Doc_Persona AS Numero_Documento

    FROM tbl_estudiante e
    INNER JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_tipo_identificacion ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
    WHERE e.ID_Estudiante = p_id_estudiante
      AND e.FK_ID_Acudiente = p_id_usuario
      AND e.Estado_Estudiante = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Verificar cuántos estudiantes activos tiene un acudiente

DROP PROCEDURE IF EXISTS sp_tbl_estudiante_verificar_por_acudiente;

DELIMITER $$
CREATE PROCEDURE sp_tbl_estudiante_verificar_por_acudiente(IN p_id_acudiente INT)
BEGIN
    SELECT COUNT(*) AS total_estudiantes
    FROM tbl_estudiante
    WHERE FK_ID_Acudiente   = p_id_acudiente
      AND Estado_Estudiante = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
--  SP: Perfil del estudiante (datos para pre-poblar forms)

DROP PROCEDURE IF EXISTS sp_perfil_estudiante_consultar;

DELIMITER $$
CREATE PROCEDURE sp_perfil_estudiante_consultar(
    IN p_id_acudiente INT
)
BEGIN
    SELECT
        -- Llaves primarias técnicas
        e.ID_Estudiante, 
        p.ID_Persona,

        -- Identificación (Solo lectura)
        ti.Nombre_Tipo_Iden,
        p.Num_Doc_Persona AS Numero_Documento,

        -- Datos Personales (Editables)
        p.Primer_Nombre,
        p.Segundo_Nombre,
        p.Primer_Apellido,
        p.Segundo_Apellido,
        p.Fecha_Nacimiento,

        -- Demográficos
        e.FK_ID_Genero AS ID_Genero,
        e.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,

        -- Académicos (Editables)
        e.FK_ID_Grado_Actual AS ID_Grado_Actual,
        e.FK_ID_Grado_Proximo AS ID_Grado_Proximo,
        e.FK_ID_Colegio_Anterior AS ID_Colegio_Anterior
        
    FROM tbl_estudiante e
    INNER JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_tipo_identificacion ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
    WHERE e.FK_ID_Acudiente = p_id_acudiente
      AND e.Estado_Estudiante = 1
    LIMIT 1;

END $$
DELIMITER ;


--      ACTUALIZAR DATOS

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_persona_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_persona_actualizar(
    IN p_id_persona INT,
    IN p_primer_nombre VARCHAR(50),
    IN p_segundo_nombre VARCHAR(50),
    IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50),
    IN p_fecha_nac DATE,

    -- AUDITORÍA
    IN p_id_usuario INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_old JSON;
    DECLARE v_new JSON;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error actualizando persona';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM tbl_persona WHERE ID_Persona = p_id_persona
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Persona no existe';
    END IF;

    -- OLD DATA
    SELECT JSON_OBJECT(
        'Primer_Nombre', Primer_Nombre,
        'Segundo_Nombre', Segundo_Nombre,
        'Primer_Apellido', Primer_Apellido,
        'Segundo_Apellido', Segundo_Apellido,
        'Fecha_Nacimiento', Fecha_Nacimiento
    )
    INTO v_old
    FROM tbl_persona
    WHERE ID_Persona = p_id_persona;

    -- UPDATE
    UPDATE tbl_persona
    SET
        Primer_Nombre = p_primer_nombre,
        Segundo_Nombre = p_segundo_nombre,
        Primer_Apellido = p_primer_apellido,
        Segundo_Apellido = p_segundo_apellido,
        Fecha_Nacimiento = p_fecha_nac
    WHERE ID_Persona = p_id_persona;

    -- NEW DATA
    SET v_new = JSON_OBJECT(
        'Primer_Nombre', p_primer_nombre,
        'Segundo_Nombre', p_segundo_nombre,
        'Primer_Apellido', p_primer_apellido,
        'Segundo_Apellido', p_segundo_apellido,
        'Fecha_Nacimiento', p_fecha_nac
    );

    -- AUDITORÍA
    CALL sp_insertar_auditoria(
        'tbl_persona',
        'UPDATE',
        p_id_persona,
        v_old,
        v_new,
        p_ip,
        p_user_agent,
        p_id_usuario
    );

    COMMIT;

END $$
DELIMITER ;


-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_estudiante_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_estudiante_actualizar(
    IN p_grado_actual TINYINT,
    IN p_grado_proximo TINYINT,
    IN p_colegio INT,
    IN p_genero TINYINT,
    IN p_grupo_pref TINYINT,
    IN p_id_persona INT,

    -- AUDITORÍA
    IN p_id_usuario INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_old JSON;
    DECLARE v_new JSON;
    DECLARE v_id_estudiante INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error actualizando estudiante';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    SELECT ID_Estudiante
    INTO v_id_estudiante
    FROM tbl_estudiante
    WHERE FK_ID_Persona = p_id_persona
    LIMIT 1;

    IF v_id_estudiante IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estudiante no existe';
    END IF;

    -- OLD DATA
    SELECT JSON_OBJECT(
        'Grado_Actual', FK_ID_Grado_Actual,
        'Grado_Proximo', FK_ID_Grado_Proximo,
        'Colegio', FK_ID_Colegio_Anterior,
        'Genero', FK_ID_Genero,
        'Grupo_Preferencial', FK_ID_Grupo_Preferencial
    )
    
    INTO v_old
    FROM tbl_estudiante
    WHERE ID_Estudiante = v_id_estudiante;

    -- UPDATE
    UPDATE tbl_estudiante
    SET
        FK_ID_Grado_Actual = p_grado_actual,
        FK_ID_Grado_Proximo = p_grado_proximo,
        FK_ID_Colegio_Anterior = p_colegio,
        FK_ID_Genero = p_genero,
        FK_ID_Grupo_Preferencial = p_grupo_pref
    WHERE ID_Estudiante = v_id_estudiante;

    -- NEW DATA
    SET v_new = JSON_OBJECT(
        'Grado_Actual', p_grado_actual,
        'Grado_Proximo', p_grado_proximo,
        'Colegio', p_colegio,
        'Genero', p_genero,
        'Grupo_Preferencial', p_grupo_pref
    );

    -- AUDITORÍA
    CALL sp_insertar_auditoria(
        'tbl_estudiante',
        'UPDATE',
        v_id_estudiante,
        v_old,
        v_new,
        p_ip,
        p_user_agent,
        p_id_usuario
    );

    COMMIT;

END $$
DELIMITER ;


--      REGISTRAR ESTUDIANTE

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_registrar_estudiante_completo;

DELIMITER $$
CREATE PROCEDURE sp_registrar_estudiante_completo(
    -- PERSONA
    IN p_Num_Doc_Persona VARCHAR(30),
    IN p_Primer_Nombre VARCHAR(50),
    IN p_Segundo_Nombre VARCHAR(50),
    IN p_Primer_Apellido VARCHAR(50),
    IN p_Segundo_Apellido VARCHAR(50),
    IN p_Fecha_Nacimiento DATE,

    -- ESTUDIANTE
    IN p_FK_ID_Tipo_Iden TINYINT,
    IN p_FK_ID_Grado_Actual TINYINT,
    IN p_FK_ID_Grado_Proximo TINYINT,
    IN p_FK_ID_Colegio_Anterior INT,
    IN p_FK_ID_Genero TINYINT,
    IN p_FK_ID_Grupo_Preferencial TINYINT,
    IN p_FK_ID_Acudiente INT,
    IN p_FK_ID_Parentesco_Es TINYINT,

    -- AUDITORÍA
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    -- Variables para capturar los IDs generados automáticamente
    DECLARE v_ID_Persona_New INT;
    DECLARE v_ID_Estudiante_New INT;

    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en registro completo de estudiante';
    END;

    START TRANSACTION;

    -- INSERT PERSONA
    INSERT INTO tbl_persona(
        Num_Doc_Persona,
        Primer_Nombre,
        Segundo_Nombre,
        Primer_Apellido,
        Segundo_Apellido,
        Fecha_Nacimiento,
        Estado_Persona
    )
    VALUES(
        p_Num_Doc_Persona,
        p_Primer_Nombre,
        p_Segundo_Nombre,
        p_Primer_Apellido,
        p_Segundo_Apellido,
        p_Fecha_Nacimiento,
        1
    );

    -- Capturar el ID generado para la persona
    SET v_ID_Persona_New = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_persona',
        'CREATE',
        CAST(v_ID_Persona_New AS CHAR),
        NULL,
        JSON_OBJECT('Doc', p_Num_Doc_Persona, 'Nombre', p_Primer_Nombre),
        p_ip,
        p_user_agent,
        p_FK_ID_Acudiente
    );

    -- INSERT ESTUDIANTE
    INSERT INTO tbl_estudiante (
        FK_ID_Tipo_Iden,
        FK_ID_Persona,
        FK_ID_Grado_Actual,
        FK_ID_Grado_Proximo,
        FK_ID_Colegio_Anterior,
        FK_ID_Genero,
        FK_ID_Grupo_Preferencial,
        FK_ID_Acudiente,
        FK_ID_Parentesco_Es,
        Estado_Estudiante
    )
    VALUES (
        p_FK_ID_Tipo_Iden,
        v_ID_Persona_New,
        p_FK_ID_Grado_Actual,
        p_FK_ID_Grado_Proximo,
        p_FK_ID_Colegio_Anterior,
        p_FK_ID_Genero,
        p_FK_ID_Grupo_Preferencial,
        p_FK_ID_Acudiente,
        p_FK_ID_Parentesco_Es,
        1
    );

    -- Capturar el ID generado para el estudiante
    SET v_ID_Estudiante_New = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_estudiante',
        'CREATE',
        CAST(v_ID_Estudiante_New AS CHAR),
        NULL,
        JSON_OBJECT('ID_Persona', v_ID_Persona_New, 'Grado', p_FK_ID_Grado_Actual),
        p_ip,
        p_user_agent,
        p_FK_ID_Acudiente
    );

    COMMIT;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Usada en registro para validar si existe un estudiante con el mismo documento

DROP PROCEDURE IF EXISTS sp_tbl_estudiante_verificar_existente;

DELIMITER $$
CREATE PROCEDURE sp_tbl_estudiante_verificar_existente (
    IN p_num_doc VARCHAR(30),
    IN p_fk_id_acudiente INT
)
BEGIN

    SELECT COUNT(*) AS existe 
    FROM tbl_estudiante e
    INNER JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
    WHERE p.Num_Doc_Persona = p_num_doc 
      AND e.FK_ID_Acudiente = p_fk_id_acudiente 
      AND e.Estado_Estudiante = 1; 
END $$
DELIMITER ;


-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE SECURITY
-- ====================================================================================================================================================

--      SISTEMA DE CAMBIO DE CONTRASEÑA

-- --------------------------------------------------------
-- Cambio de contraseña desde perfil

DROP PROCEDURE IF EXISTS sp_tbl_usuario_cambiar_contraseña_perfil;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_cambiar_contraseña_perfil(
    IN p_id_usuario INT,
    IN p_nuevo_hash VARCHAR(255),
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    
    START TRANSACTION;

        -- Actualización de credenciales
        UPDATE tbl_usuario
        SET Contraseña_Hash = p_nuevo_hash,
            Ultimo_Cambio_Contraseña = CURRENT_TIMESTAMP
        WHERE ID_Usuario = p_id_usuario;

        -- Registro de auditoría
        CALL sp_insertar_auditoria(
            'tbl_usuario', 
            'PASSWORD_CHANGE', 
            CAST(p_id_usuario AS CHAR),
            JSON_OBJECT('evento', 'cambio_password_perfil'),
            JSON_OBJECT('resultado', 'exitoso'),
            p_ip, 
            p_user_agent, 
            p_id_usuario
        );

    COMMIT;
END $$
DELIMITER ;


-- --------------------------------------------------------
    -- Reutilización de sp_validar_data_user



--      SISTEMA DE MFA

-- --------------------------------------------------------
-- Guardar secret MFA temporal

DROP PROCEDURE IF EXISTS sp_tbl_usuario_guardar_mfa_secret_temp;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_guardar_mfa_secret_temp(
    IN p_id_usuario INT,
    IN p_secret VARCHAR(64)
)
BEGIN
    UPDATE tbl_usuario
    SET MFA_Secret_Temp = p_secret
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Confirmar y activar MFA

DROP PROCEDURE IF EXISTS sp_tbl_usuario_activar_mfa;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_activar_mfa(
    IN p_id_usuario INT
)
BEGIN
    UPDATE tbl_usuario
    SET MFA_Fecha_Configuracion = CURRENT_TIMESTAMP,
        MFA_Secret = MFA_Secret_Temp,
        MFA_Secret_Temp = NULL,
        Doble_Factor_Activo = 'ACTIVE'
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Desactivar MFA

DROP PROCEDURE IF EXISTS sp_tbl_usuario_desactivar_mfa;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_desactivar_mfa(
    IN p_id_usuario INT
)
BEGIN
    UPDATE tbl_usuario
    SET MFA_Fecha_Configuracion = CURRENT_TIMESTAMP,
        MFA_Secret = NULL,
        MFA_Secret_Temp = NULL,
        Doble_Factor_Activo = 'INACTIVE'
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Obtener secret MFA activo

DROP PROCEDURE IF EXISTS sp_tbl_usuario_obtener_mfa_secret;

DELIMITER $$
CREATE PROCEDURE sp_tbl_usuario_obtener_mfa_secret(
    IN p_id_usuario INT
)
BEGIN
    SELECT MFA_Secret, MFA_Secret_Temp, Doble_Factor_Activo
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;


--      SISTEMA PARA VALIDAR SESIONES ACTIVAS

-- --------------------------------------------------------

DROP PROCEDURE IF EXISTS sp_tbl_sesion_activa_registrar_sesion;

DELIMITER $$
CREATE PROCEDURE sp_tbl_sesion_activa_registrar_sesion(
    IN p_id_usuario INT,
    IN p_jti VARCHAR(64),
    IN p_dispositivo VARCHAR(255),
    IN p_ip VARCHAR(50)
)
BEGIN
    INSERT INTO tbl_sesion_activa (FK_ID_Usuario, JTI, Dispositivo, IP)
    VALUES (p_id_usuario, p_jti, p_dispositivo, p_ip)
    ON DUPLICATE KEY UPDATE Ultimo_Acceso = CURRENT_TIMESTAMP;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Listar sesiones activas de un usuario

DROP PROCEDURE IF EXISTS sp_tbl_sesion_activa_listar_sesiones;

DELIMITER $$
CREATE PROCEDURE sp_tbl_sesion_activa_listar_sesiones(
    IN p_id_usuario INT
)
BEGIN
    SELECT ID_Sesion, JTI, Dispositivo, IP, Fecha_Inicio, Ultimo_Acceso
    FROM tbl_sesion_activa
    WHERE FK_ID_Usuario = p_id_usuario
      AND Activa = 1
    ORDER BY Ultimo_Acceso DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- Cerrar sesión específica (por JTI)

DROP PROCEDURE IF EXISTS sp_tbl_sesion_activa_cerrar_sesion;

DELIMITER $$
CREATE PROCEDURE sp_tbl_sesion_activa_cerrar_sesion(
    IN p_jti VARCHAR(64)
)
BEGIN
    UPDATE tbl_sesion_activa
    SET Activa = 0
    WHERE JTI = p_jti;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Cerrar todas las sesiones de un usuario

DROP PROCEDURE IF EXISTS sp_tbl_sesion_activa_cerrar_todas_sesiones;

DELIMITER $$
CREATE PROCEDURE sp_tbl_sesion_activa_cerrar_todas_sesiones(
    IN p_id_usuario INT,
    IN p_jti_actual VARCHAR(64)   -- excluir la sesión actual
)
BEGIN
    UPDATE tbl_sesion_activa
    SET Activa = 0
    WHERE FK_ID_Usuario = p_id_usuario
      AND JTI <> p_jti_actual;
END $$
DELIMITER ;




-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE SETTINGS
-- ====================================================================================================================================================

--      SISTEMA DE CONFIGURACIONES VARIAS

-- --------------------------------------------------------
-- SP: Obtener preferencias de notificación del usuario

DROP PROCEDURE IF EXISTS sp_configuracion_obtener_notificaciones;
 
DELIMITER $$
CREATE PROCEDURE sp_configuracion_obtener_notificaciones(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        Notificaciones_Email,
        Notificaciones_Navegador
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario
      AND Estado_Usuario = 1;
END $$
DELIMITER ;
 
 
-- --------------------------------------------------------
-- SP: Actualizar notificaciones de correo electrónico

DROP PROCEDURE IF EXISTS sp_configuracion_actualizar_notif_email;
 
DELIMITER $$
CREATE PROCEDURE sp_configuracion_actualizar_notif_email(
    IN p_id_usuario INT,
    IN p_activo TINYINT(1)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
 
    SELECT COUNT(*) INTO v_existe
    FROM tbl_usuario
    WHERE ID_Usuario   = p_id_usuario
      AND Estado_Usuario = 1;
 
    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Usuario no encontrado o inactivo.';
    END IF;
 
    UPDATE tbl_usuario
    SET Notificaciones_Email = p_activo
    WHERE ID_Usuario = p_id_usuario;
 
    -- Devuelve el estado actualizado para confirmación
    SELECT Notificaciones_Email AS notif_email_activo
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;
 
 
-- --------------------------------------------------------
-- SP: Actualizar notificaciones del navegador

DROP PROCEDURE IF EXISTS sp_configuracion_actualizar_notif_navegador;
 
DELIMITER $$
CREATE PROCEDURE sp_configuracion_actualizar_notif_navegador(
    IN p_id_usuario INT,
    IN p_activo TINYINT(1)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
 
    SELECT COUNT(*) INTO v_existe
    FROM tbl_usuario
    WHERE ID_Usuario    = p_id_usuario
      AND Estado_Usuario = 1;
 
    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Usuario no encontrado o inactivo.';
    END IF;
 
    UPDATE tbl_usuario
    SET Notificaciones_Navegador = p_activo
    WHERE ID_Usuario = p_id_usuario;
 
    -- Devuelve el estado actualizado para confirmación
    SELECT Notificaciones_Navegador AS notif_navegador_activo
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario;
END $$
DELIMITER ;


--      SISTEMA PARA ELIMINAR AL USUARIO ACTUAL

-- --------------------------------------------------------
    -- Reutilización de sp_tbl_usuario_validar_login


-- --------------------------------------------------------
-- SP: Eliminar Usuario y Estudiante asociado

DROP PROCEDURE IF EXISTS sp_eliminar_cuenta_completa;

DELIMITER $$
CREATE PROCEDURE sp_eliminar_cuenta_completa(
    IN p_ID_Usuario INT,
    IN p_IP VARCHAR(50),
    IN p_User_Agent VARCHAR(255)
)
BEGIN
    -- Declaración de variable para el prefijo de ofuscación
    DECLARE v_Timestamp VARCHAR(20);
    
    -- Manejador de errores para hacer ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la eliminación completa del usuario y sus estudiantes asociados';
    END;

    -- Generar una marca de tiempo única para esta transacción
    SET v_Timestamp = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');

    START TRANSACTION;
        
        -- OFUSCAR Y DESACTIVAR PERSONAS DE LOS ESTUDIANTES 
        UPDATE tbl_persona 
        SET Num_Doc_Persona = CONCAT('DEL_', v_Timestamp, '_', Num_Doc_Persona),
            Estado_Persona = 0
        WHERE ID_Persona IN (
            SELECT FK_ID_Persona FROM tbl_estudiante WHERE FK_ID_Acudiente = p_ID_Usuario
        );

        -- INACTIVAR REGISTROS EN tbl_estudiante
        UPDATE tbl_estudiante 
        SET Estado_Estudiante = 0
        WHERE FK_ID_Acudiente = p_ID_Usuario;

        -- Registro de auditoría para los estudiantes
        CALL sp_insertar_auditoria(
            'tbl_estudiante', 'DELETE_STUDENT', CAST(p_ID_Usuario AS CHAR),
            NULL, JSON_OBJECT('Accion', 'Baja masiva por retiro de acudiente'),
            p_IP, p_User_Agent, p_ID_Usuario
        );

        -- LOGICA DE OFUSCACIÓN DE USUARIO Y DATOS ADICIONALES
        UPDATE tbl_usuario u
        JOIN tbl_datos_adicionales d ON u.FK_ID_Persona = d.FK_ID_Persona
        SET u.Estado_Usuario = 0,
            u.Nombre_Usuario = CONCAT('del_', v_Timestamp, '_', u.Nombre_Usuario),
            d.Estado_Datos_Adicionales = 0,
            d.Email = CONCAT('del_', v_Timestamp, '_', d.Email),
            d.Telefono = CONCAT('del_', v_Timestamp, '_', d.Telefono)
        WHERE u.ID_Usuario = p_ID_Usuario;

        -- INACTIVAR Y OFUSCAR PERSONA DEL USUARIO
        UPDATE tbl_persona p
        JOIN tbl_usuario u ON p.ID_Persona = u.FK_ID_Persona
        SET p.Estado_Persona = 0,
            p.Num_Doc_Persona = CONCAT('DEL_', v_Timestamp, '_', p.Num_Doc_Persona)
        WHERE u.ID_Usuario = p_ID_Usuario;

        -- Auditoría final del cierre de cuenta
        CALL sp_insertar_auditoria(
            'SISTEMA', 'ACCOUNT_CLOSED', CAST(p_ID_Usuario AS CHAR),
            NULL, JSON_OBJECT('Status', 'Cuenta inactivada y datos UNIQUE liberados'),
            p_IP, p_User_Agent, p_ID_Usuario
        );

    COMMIT;
END $$
DELIMITER ;





-- ====================================================================================================================================================
--                                          SPs PARA ADMIN
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE LOGIN
-- ====================================================================================================================================================

    -- Se usaron los mismo que en login usuario / acudiente
 
-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE DASHBOARD
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Conteo de datos para metricas del dashboard

DROP PROCEDURE IF EXISTS sp_dashboard_metricas;

DELIMITER $$
CREATE PROCEDURE sp_dashboard_metricas()
BEGIN
    SELECT
        -- Total de solicitudes activas
        (SELECT COUNT(*) 
            FROM tbl_ticket 
            WHERE Estado_Ticket = 1) AS total_solicitudes,
        
        -- Total de usuarios activos (Acudientes, Técnicos, Administradores)
        (SELECT COUNT(*) 
            FROM tbl_usuario 
            WHERE Estado_Usuario = 1 
            AND FK_ID_Rol IN (2, 3, 4)) AS total_usuarios,
        
        -- Cupos asignados (tickets con estado 'Solucionado')
        (SELECT COUNT(*) 
            FROM tbl_ticket t
            JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
            WHERE t.Estado_Ticket = 1 
            AND et.Nombre_Estado = 'Solucionado') AS cupos_asignados,
        
        -- Cupos disponibles en Engativá (suma de cupos disponibles en colegios de barrios de Engativá)
        (SELECT COALESCE(SUM(c.Cupos_Disponibles), 0)
            FROM tbl_cupos c
            JOIN tbl_colegio co ON c.FK_ID_Colegio = co.ID_Colegio
            JOIN tbl_barrio b ON co.FK_ID_Barrio = b.ID_Barrio
            JOIN tbl_localidad l ON b.FK_ID_Localidad = l.ID_Localidad
            WHERE c.Estado_Cupos = 1 
            AND l.ID_Localidad = 1  -- Engativá ID_Localidad = 1
            AND co.Estado_Colegio = 1
            AND b.Estado_Barrio = 1
            AND l.Estado_Localidad = 1) AS cupos_disponibles_engativa;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Conteo de datos para grafica de Actividad de solicitudes (ultimos 7 dias)

DROP PROCEDURE IF EXISTS sp_dashboard_chart_actividad;

DELIMITER $$
CREATE PROCEDURE sp_dashboard_chart_actividad()
BEGIN
    -- Actividad de los últimos 7 días
    WITH dias AS (
        SELECT CURDATE() - INTERVAL n DAY AS fecha
        FROM (
            SELECT 0 AS n UNION SELECT 1 UNION SELECT 2
            UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
        ) nums
    )
    SELECT
        DATE_FORMAT(d.fecha, '%a') AS label,
        d.fecha,
        COUNT(DISTINCT CASE WHEN DATE(t.Fecha_Creacion) = d.fecha THEN t.ID_Ticket END) AS nuevas_solicitudes,
        COUNT(DISTINCT CASE WHEN DATE(t.Fecha_Creacion) = d.fecha
                            AND et.Nombre_Estado = 'Solucionado' THEN t.ID_Ticket END) AS cupos_asignados
    FROM dias d
    LEFT JOIN tbl_ticket t
        ON DATE(t.Fecha_Creacion) = d.fecha
        AND t.Estado_Ticket = 1
    LEFT JOIN tbl_estado_ticket et
        ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    GROUP BY d.fecha
    ORDER BY d.fecha ASC;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE CASES
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Listado de todos los Tickets del sistema 

DROP PROCEDURE IF EXISTS sp_cases_listar_todos;

DELIMITER $$
CREATE PROCEDURE sp_cases_listar_todos()
BEGIN
    SELECT *
    FROM vw_cases_general;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Datos de las metricas de las tarjetas

DROP PROCEDURE IF EXISTS sp_cases_metricas;

DELIMITER $$
CREATE PROCEDURE sp_cases_metricas()
BEGIN
    SELECT
        -- Total de tickets activos en el sistema
        COUNT(*) AS total_solicitudes,

        -- Tickets en estado "En Revisión" (ID 2)
        SUM(t.FK_ID_Estado_Ticket = 2) AS en_revision,

        -- Tickets con estado final = 1 (Solucionado, Rechazado, Cancelado)
        SUM(et.Estado_Final = 1) AS solucionados,

        -- Cupos disponibles: suma de Cupos_Disponibles en tbl_cupos activos
        (SELECT COALESCE(SUM(c.Cupos_Disponibles), 0)FROM tbl_cupos c WHERE c.Estado_Cupos = 1) AS cupos_disponibles,

        -- Tickets con cupo asignado (FK_ID_Cupo_Asignado no nulo)
        SUM(t.FK_ID_Cupo_Asignado IS NOT NULL) AS cupos_asignados

    FROM tbl_ticket t
    INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    WHERE t.Estado_Ticket = 1;
END $$
DELIMITER ;



    -- CATÁLOGOS PARA LOS FILTROS DEL LISTADO

-- --------------------------------------------------------
-- SP: Estados del ticket (para el filtro de estado)

DROP PROCEDURE IF EXISTS sp_catalogo_estados_ticket;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_estados_ticket()
BEGIN
    SELECT ID_Estado_Ticket, Nombre_Estado
    FROM tbl_estado_ticket
    WHERE Estado_Estado_Ticket = 1
    ORDER BY ID_Estado_Ticket;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Grados del ticket (para el filtro de grado)

DROP PROCEDURE IF EXISTS sp_catalogo_grados;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_grados()
BEGIN
    SELECT ID_Grado, Nombre_Grado
    FROM tbl_grado
    ORDER BY ID_Grado;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE ACCOUNTS
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Para roles activos

DROP PROCEDURE IF EXISTS sp_tbl_rol_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_rol_consultar()
BEGIN
    SELECT ID_Rol, Nombre_Rol
    FROM tbl_rol
    WHERE ID_Rol <> 5 AND Estado_Rol = 1 
    ORDER BY Nombre_Rol;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Para tener los eventos de sesión (LOGIN / LOGOUT / FAILED_LOGIN)

DROP PROCEDURE IF EXISTS sp_admin_eventos_acceso_consultar;

DELIMITER $$
CREATE PROCEDURE sp_admin_eventos_acceso_consultar()
BEGIN
    SELECT 'LOGIN' AS Nombre_Evento
    UNION ALL SELECT 'LOGIN_MFA'

    UNION ALL SELECT 'LOGOUT'

    UNION ALL SELECT 'PENDING_MFA'

    UNION ALL SELECT 'MFA_SETUP_OK'
    UNION ALL SELECT 'MFA_SETUP_FAILED'

    UNION ALL SELECT 'AD_FAILED_LOGIN'
    UNION ALL SELECT 'US_FAILED_LOGIN'

    UNION ALL SELECT 'FAILED_MFA'
    UNION ALL SELECT 'FAILED_LOGIN';

END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Para tener los eventos de auditoría de tablas

DROP PROCEDURE IF EXISTS sp_admin_eventos_auditoria_consultar;

DELIMITER $$
-- Eventos de auditoría de tablas
CREATE PROCEDURE sp_admin_eventos_auditoria_consultar()
BEGIN
    SELECT DISTINCT Tipo_Evento AS Nombre_Evento
    FROM tbl_auditoria
    WHERE Estado_Auditoria = 1
    ORDER BY Tipo_Evento;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Navegadores distintos extraídos de User_Agent en tbl_auditoria_sesion

DROP PROCEDURE IF EXISTS sp_admin_navegadores_consultar;

DELIMITER $$
CREATE PROCEDURE sp_admin_navegadores_consultar()
BEGIN
    SELECT DISTINCT
        CASE
            WHEN User_Agent LIKE '%Brave/%' OR User_Agent LIKE '% Brave %' THEN 'Brave'
            WHEN User_Agent LIKE '%Edg/%' THEN 'Edge'
            WHEN User_Agent LIKE '%OPR/%' OR User_Agent LIKE '%Opera/%' THEN 'Opera'
            WHEN User_Agent LIKE '%Vivaldi/%' THEN 'Vivaldi'
            WHEN User_Agent LIKE '%CriOS/%' THEN 'Chrome (iOS)'
            WHEN User_Agent LIKE '%Chrome/%' THEN 'Chrome'
            WHEN User_Agent LIKE '%Firefox/%' THEN 'Firefox'
            WHEN User_Agent LIKE '%Safari/%' AND User_Agent NOT LIKE '%Chrome/%' AND User_Agent NOT LIKE '%Chromium/%' THEN 'Safari'
            WHEN User_Agent LIKE '%MSIE %' OR User_Agent LIKE '%Trident/%' THEN 'Internet Explorer'
            ELSE 'Otro'
        END AS Nombre_Navegador
    FROM tbl_auditoria_sesion
    WHERE Estado_Auditoria_Sesion = 1
    ORDER BY Nombre_Navegador;
END $$
DELIMITER ;



-- --------------------------------------------------------
-- SP: Obtener historial de acceso con filtros opcionales

DROP PROCEDURE IF EXISTS sp_admin_historial_acceso_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_historial_acceso_listar(
    IN p_id_rol TINYINT,
    IN p_evento VARCHAR(50),
    IN p_navegador VARCHAR(100)
)
BEGIN
    SELECT *
    FROM vw_historial_acceso
    WHERE ID_Rol <> 1
        AND (p_id_rol IS NULL OR ID_Rol = p_id_rol)
        AND (p_evento IS NULL OR Evento = p_evento)
        AND (p_navegador IS NULL OR Navegador = p_navegador)
    ORDER BY Fecha_Evento DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener historial de acciones con filtros opcionales

DROP PROCEDURE IF EXISTS sp_admin_historial_acciones_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_historial_acciones_listar(
    IN p_id_rol TINYINT,
    IN p_evento VARCHAR(50)
)
BEGIN
    SELECT *
    FROM vw_historial_acciones
    WHERE (p_id_rol IS NULL OR ID_Rol = p_id_rol)
        AND (p_evento IS NULL OR Evento = p_evento)
    ORDER BY Fecha_Evento DESC;
END $$
DELIMITER ;



-- --------------------------------------------------------
-- SP: Obtener las métricas globales de cuentas

DROP PROCEDURE IF EXISTS sp_admin_metricas_accounts;

DELIMITER $$
CREATE PROCEDURE sp_admin_metricas_accounts()
BEGIN
    SELECT
        -- Total de usuarios en el sistema
        (SELECT COUNT(*)
         FROM tbl_usuario
         WHERE Estado_Usuario = 1) AS total_usuarios,

        -- Acudientes con sesión activa ahora mismo
        (SELECT COUNT(DISTINCT sa.FK_ID_Usuario)
            FROM tbl_sesion_activa sa
            INNER JOIN tbl_usuario u ON sa.FK_ID_Usuario = u.ID_Usuario
            INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
            WHERE sa.Activa = 1
                AND r.Nombre_Rol = 'Acudiente') AS acudientes_con,

        -- Técnicos con sesión activa ahora mismo
        (SELECT COUNT(DISTINCT sa.FK_ID_Usuario)
            FROM tbl_sesion_activa sa
            INNER JOIN tbl_usuario  u ON sa.FK_ID_Usuario = u.ID_Usuario
            INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
            WHERE sa.Activa = 1
                AND r.Nombre_Rol = 'Tecnico') AS tecnicos_con,

        -- Administradores con sesión activa ahora mismo
        (SELECT COUNT(DISTINCT sa.FK_ID_Usuario)
            FROM tbl_sesion_activa sa
            INNER JOIN tbl_usuario  u ON sa.FK_ID_Usuario = u.ID_Usuario
            INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
            WHERE sa.Activa = 1
            AND r.Nombre_Rol = 'Admin') AS administradores_con;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA ACCOUNTS_USER
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Obtener la lista de los tipos de identificación

DROP PROCEDURE IF EXISTS sp_tbl_tipo_iden_consultar_admin;

DELIMITER $$
CREATE PROCEDURE sp_tbl_tipo_iden_consultar_admin()
BEGIN
    SELECT ID_Tipo_Iden, Nombre_Tipo_Iden
    FROM tbl_tipo_identificacion
    WHERE Estado_Identificacion = 1
    ORDER BY Nombre_Tipo_Iden;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de acudientes los parentescos activos

DROP PROCEDURE IF EXISTS sp_tbl_parentesco_consultar_admin;

DELIMITER $$
CREATE PROCEDURE sp_tbl_parentesco_consultar_admin()
BEGIN
    SELECT ID_Parentesco, Nombre_Parentesco
    FROM tbl_parentesco
    WHERE Estado_Parentesco = 1
    ORDER BY ID_Parentesco;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de grados disponibles

DROP PROCEDURE IF EXISTS sp_tbl_grado_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_grado_consultar()
BEGIN
    SELECT ID_Grado, Nombre_Grado
    FROM tbl_grado
    ORDER BY ID_Grado;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de colegios disponibles

DROP PROCEDURE IF EXISTS sp_tbl_colegio_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_colegio_consultar()
BEGIN
    SELECT ID_Colegio, Nombre_Colegio
    FROM tbl_colegio
    WHERE Estado_Colegio = 1
    ORDER BY Nombre_Colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de generos

DROP PROCEDURE IF EXISTS sp_tbl_genero_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_genero_consultar()
BEGIN
    SELECT ID_Genero, Nombre_Genero
    FROM tbl_genero
    ORDER BY ID_Genero;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de grupos preferenciales

DROP PROCEDURE IF EXISTS sp_tbl_grupo_pref_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_grupo_pref_consultar()
BEGIN
    SELECT ID_Grupo_Preferencial, Nombre_Grupo_Preferencial
    FROM tbl_grupo_preferencial
    ORDER BY ID_Grupo_Preferencial;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de acudientes activos para vincular con estudiante

DROP PROCEDURE IF EXISTS sp_tbl_acudientes_activos_consultar;

DELIMITER $$
CREATE PROCEDURE sp_tbl_acudientes_activos_consultar()
BEGIN
    SELECT
        u.ID_Usuario,
        CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo,
        p.Num_Doc_Persona
    FROM tbl_usuario u
    JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
    WHERE u.FK_ID_Rol = 2
      AND u.Estado_Usuario = 1
    ORDER BY p.Primer_Apellido, p.Primer_Nombre;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Verificar si un estudiante ya existe por documento

DROP PROCEDURE IF EXISTS sp_estudiante_verificar_existente;

DELIMITER $$
CREATE PROCEDURE sp_estudiante_verificar_existente(
    IN p_Documento VARCHAR(30)
)
BEGIN
    SELECT e.ID_Estudiante
    FROM tbl_estudiante e
    JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
    WHERE p.Num_Doc_Persona = p_Documento;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Registrar usuario (Acudiente / Técnico / Admin) desde el panel admin

DROP PROCEDURE IF EXISTS sp_registrar_usuario_por_admin;

DELIMITER $$
CREATE PROCEDURE sp_registrar_usuario_por_admin(
    -- PERSONA
    IN p_Num_Doc VARCHAR(30),
    IN p_Primer_Nombre VARCHAR(50),
    IN p_Segundo_Nombre VARCHAR(50),
    IN p_Primer_Ape VARCHAR(50),
    IN p_Segundo_Ape VARCHAR(50),
    IN p_Fecha_Nac DATE,
    -- DATOS ADICIONALES
    IN p_Email VARCHAR(255),
    IN p_Telefono VARCHAR(45),
    IN p_ID_Parentesco TINYINT,
    IN p_ID_Tipo_Iden TINYINT,
    IN p_ID_Genero TINYINT,
    IN p_ID_Grupo_Pref TINYINT,
    IN p_ID_Estrato TINYINT,
    IN p_ID_Barrio INT,
    -- USUARIO
    IN p_Nombre_Usuario VARCHAR(255),
    IN p_Password_Hash VARCHAR(255),
    IN p_ID_Rol TINYINT,
    -- AUDITORÍA
    IN p_IP VARCHAR(50),
    IN p_User_Agent VARCHAR(255),
    IN p_ID_Admin INT
)
BEGIN
    DECLARE v_ID_Persona INT;
    DECLARE v_ID_Datos INT;
    DECLARE v_ID_Usuario INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    INSERT INTO tbl_persona (
        Num_Doc_Persona, Primer_Nombre, Segundo_Nombre,
        Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona
    ) VALUES (
        p_Num_Doc, p_Primer_Nombre, p_Segundo_Nombre,
        p_Primer_Ape, p_Segundo_Ape, p_Fecha_Nac, 1
    );
    SET v_ID_Persona = LAST_INSERT_ID();

    INSERT INTO tbl_datos_adicionales (
        Email, Telefono, FK_ID_Parentesco, FK_ID_Tipo_Iden,
        FK_ID_Persona, FK_ID_Genero, FK_ID_Grupo_Preferencial,
        FK_ID_Estrato, FK_ID_Barrio, Estado_Datos_Adicionales
    ) VALUES (
        p_Email, p_Telefono, p_ID_Parentesco, p_ID_Tipo_Iden,
        v_ID_Persona, p_ID_Genero, p_ID_Grupo_Pref,
        p_ID_Estrato, p_ID_Barrio, 1
    );
    SET v_ID_Datos = LAST_INSERT_ID();

    INSERT INTO tbl_usuario (
        Nombre_Usuario, Contraseña_Hash,
        Ultimo_Cambio_Contraseña, Ultimo_Login, Intentos_Fallidos,
        Fecha_Creacion, Doble_Factor_Activo,
        Notificaciones_Email, Notificaciones_Navegador,
        Aceptacion_Terminos, FK_ID_Persona, FK_ID_Rol, Estado_Usuario
    ) VALUES (
        p_Nombre_Usuario, p_Password_Hash,
        NULL, NULL, 0,
        CURRENT_TIMESTAMP, 'INACTIVE',
        0, 0,
        'ACCEPTED', v_ID_Persona, p_ID_Rol, 1
    );
    SET v_ID_Usuario = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_usuario', 'CREATE_ACCOUNT', CAST(v_ID_Usuario AS CHAR),
        NULL,
        JSON_OBJECT('Username', p_Nombre_Usuario, 'Rol', p_ID_Rol, 'CreadoPor', p_ID_Admin),
        p_IP, p_User_Agent, p_ID_Admin
    );

    COMMIT;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Registrar estudiante desde el panel admin

DROP PROCEDURE IF EXISTS sp_registrar_estudiante_admin;

DELIMITER $$
CREATE PROCEDURE sp_registrar_estudiante_admin(
    -- PERSONA
    IN p_Num_Doc VARCHAR(30),
    IN p_Primer_Nombre VARCHAR(50),
    IN p_Segundo_Nombre VARCHAR(50),
    IN p_Primer_Ape VARCHAR(50),
    IN p_Segundo_Ape VARCHAR(50),
    IN p_Fecha_Nac DATE,
    -- ESTUDIANTE
    IN p_ID_Tipo_Iden TINYINT,
    IN p_ID_Grado_Actual TINYINT,
    IN p_ID_Grado_Proximo TINYINT,   -- puede ser NULL
    IN p_ID_Colegio_Ant INT,
    IN p_ID_Genero TINYINT,
    IN p_ID_Grupo_Pref TINYINT,
    IN p_ID_Acudiente INT,
    IN p_ID_Parentesco_Es TINYINT,
    -- AUDITORÍA
    IN p_IP VARCHAR(50),
    IN p_User_Agent VARCHAR(255),
    IN p_ID_Admin INT
)
BEGIN
    DECLARE v_ID_Persona    INT;
    DECLARE v_ID_Estudiante INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    INSERT INTO tbl_persona (
        Num_Doc_Persona, Primer_Nombre, Segundo_Nombre,
        Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona
    ) VALUES (
        p_Num_Doc, p_Primer_Nombre, p_Segundo_Nombre,
        p_Primer_Ape, p_Segundo_Ape, p_Fecha_Nac, 1
    );
    SET v_ID_Persona = LAST_INSERT_ID();

    INSERT INTO tbl_estudiante (
        FK_ID_Tipo_Iden, FK_ID_Persona, FK_ID_Grado_Actual,
        FK_ID_Grado_Proximo, FK_ID_Colegio_Anterior,
        FK_ID_Genero, FK_ID_Grupo_Preferencial,
        FK_ID_Acudiente, FK_ID_Parentesco_Es, Estado_Estudiante
    ) VALUES (
        p_ID_Tipo_Iden, v_ID_Persona, p_ID_Grado_Actual,
        NULLIF(p_ID_Grado_Proximo, 0), p_ID_Colegio_Ant,
        p_ID_Genero, p_ID_Grupo_Pref,
        p_ID_Acudiente, p_ID_Parentesco_Es, 1
    );
    SET v_ID_Estudiante = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'tbl_estudiante', 'CREATE', CAST(v_ID_Estudiante AS CHAR),
        NULL,
        JSON_OBJECT('Doc', p_Num_Doc, 'Nombre', p_Primer_Nombre, 'Acudiente', p_ID_Acudiente),
        p_IP, p_User_Agent, p_ID_Admin
    );

    COMMIT;
END $$
DELIMITER ;




-- ====================================================================================================================================================
-- SP PARA LA PAGINA ACCOUNTS_USER
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Obtener la lista de acudientes

DROP PROCEDURE IF EXISTS sp_admin_acudientes_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_acudientes_listar()
BEGIN
    SELECT * FROM VW_ADMIN_ACUDIENTES ORDER BY ID_Usuario DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Obtener la lista de estudiantes

DROP PROCEDURE IF EXISTS sp_admin_estudiantes_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_estudiantes_listar()
BEGIN
    SELECT * FROM VW_ADMIN_ESTUDIANTES ORDER BY ID_Estudiante DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Métricas para accounts_user.html

DROP PROCEDURE IF EXISTS sp_admin_metricas_usuarios;

DELIMITER $$
CREATE PROCEDURE sp_admin_metricas_usuarios()
BEGIN
    SELECT
        (SELECT COUNT(*) FROM VW_ADMIN_ACUDIENTES) AS acudientes,
        (SELECT COUNT(*) FROM tbl_estudiante) AS estudiantes,
        (SELECT COUNT(*) FROM tbl_usuario u
            INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
            WHERE r.Nombre_Rol = 'Acudiente'
                AND u.Doble_Factor_Activo = 'ACTIVE') AS usuarios_mfa;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Toggle estado de estudiante, registra en tbl_auditoria con JSON

DROP PROCEDURE IF EXISTS sp_admin_toggle_estado_estudiante;

DELIMITER $$
CREATE PROCEDURE sp_admin_toggle_estado_estudiante(
    IN p_id_estudiante INT,
    IN p_nuevo_estado TINYINT,
    IN p_ejecutor_id INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_estado_actual TINYINT;

    SELECT Estado_Estudiante INTO v_estado_actual
    FROM tbl_estudiante
    WHERE ID_Estudiante = p_id_estudiante;

    UPDATE tbl_estudiante
    SET Estado_Estudiante = p_nuevo_estado
    WHERE ID_Estudiante = p_id_estudiante;

    INSERT INTO tbl_auditoria (
        Tabla_Afectada,
        Tipo_Evento,
        ID_Registro_Afectado,
        Datos_Antiguo,
        Datos_Nuevos,
        IP_Usuario,
        User_Agent,
        FK_ID_Usuario
    ) VALUES (
        'tbl_estudiante',
        'DELETE',
        CAST(p_id_estudiante AS CHAR),
        JSON_OBJECT('Estado_Estudiante', v_estado_actual),
        JSON_OBJECT('Estado_Estudiante', p_nuevo_estado),
        p_ip,
        p_user_agent,
        p_ejecutor_id
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Toggle estado de usuario, registra en tbl_auditoria con JSON

DROP PROCEDURE IF EXISTS sp_admin_toggle_estado_usuario;

DELIMITER $$
CREATE PROCEDURE sp_admin_toggle_estado_usuario(
    IN p_id_usuario INT,
    IN p_nuevo_estado TINYINT,
    IN p_ejecutor_id INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_estado_actual TINYINT;
    DECLARE v_evento VARCHAR(20);

    -- Estado actual antes del cambio
    SELECT Estado_Usuario INTO v_estado_actual
    FROM tbl_usuario
    WHERE ID_Usuario = p_id_usuario;

    SET v_evento = IF(p_nuevo_estado = 1, 'UPDATE', 'DELETE');

    -- Aplicar cambio
    UPDATE tbl_usuario
    SET Estado_Usuario = p_nuevo_estado
    WHERE ID_Usuario = p_id_usuario;

    -- Registrar en auditoría con JSON estructurado
    INSERT INTO tbl_auditoria (
        Tabla_Afectada,
        Tipo_Evento,
        ID_Registro_Afectado,
        Datos_Antiguo,
        Datos_Nuevos,
        IP_Usuario,
        User_Agent,
        FK_ID_Usuario
    ) VALUES (
        'tbl_usuario',
        v_evento,
        CAST(p_id_usuario AS CHAR),
        JSON_OBJECT('Estado_Usuario', v_estado_actual),
        JSON_OBJECT('Estado_Usuario', p_nuevo_estado),
        p_ip,
        p_user_agent,
        p_ejecutor_id
    );
END $$
DELIMITER ;


-- ====================================================================================================================================================
-- SP PARA LA PAGINA ACCOUNTS_FUNC
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Listar técnicos con filtro de estado opcional

DROP PROCEDURE IF EXISTS sp_admin_tecnicos_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_tecnicos_listar(
    IN p_estado TINYINT
)
BEGIN
    SELECT *
    FROM VW_ADMIN_TECNICOS
    WHERE (p_estado IS NULL OR Estado_Usuario = p_estado)
    ORDER BY ID_Usuario DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Listar técnicos con filtro de estado opcional

DROP PROCEDURE IF EXISTS sp_admin_administradores_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_administradores_listar()
BEGIN
    SELECT * FROM VW_ADMIN_ADMINISTRADORES ORDER BY ID_Usuario DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Métricas para accounts_func.html

DROP PROCEDURE IF EXISTS sp_admin_metricas_funcionarios;

DELIMITER $$
CREATE PROCEDURE sp_admin_metricas_funcionarios()
BEGIN
    SELECT
        (SELECT COUNT(*)
         FROM VW_ADMIN_TECNICOS) AS tecnicos,
        (SELECT COUNT(*)
         FROM VW_ADMIN_TECNICOS WHERE Estado_Usuario = 0) AS tecnicos_desactivados,
        (SELECT COUNT(*)
         FROM VW_ADMIN_ADMINISTRADORES) AS administradores;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE HISTORY (ADMIN)
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Listar registros paginados con filtros opcionales

DROP PROCEDURE IF EXISTS sp_history_listar_todos;

DELIMITER $$
CREATE PROCEDURE sp_history_listar_todos()
BEGIN
    SELECT
        ID_Ticket_Comentario,
        Tipo_Evento,
        Comentario,
        Fecha_Comentario,
        Es_Interno,
        FK_ID_Ticket,
        Nombre_Rol,
        Nombre_Completo_Usuario
    FROM vw_auditoria_comentarios
    WHERE Estado_Comentario_Ticket = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Export completo sin paginación (para CSV)

DROP PROCEDURE IF EXISTS sp_history_exportar_auditoria;

DELIMITER $$
CREATE PROCEDURE sp_history_exportar_auditoria(
    IN p_tipo_evento VARCHAR(30),
    IN p_fecha_desde DATE,
    IN p_fecha_hasta DATE
)
BEGIN
    SELECT
        ID_Ticket_Comentario,
        Tipo_Evento,
        Comentario,
        Fecha_Comentario,
        Es_Interno,
        FK_ID_Ticket,
        Nombre_Rol,
        Nombre_Completo_Usuario
    FROM vw_auditoria_comentarios
    WHERE Estado_Comentario_Ticket = 1
      AND (p_tipo_evento IS NULL OR Tipo_Evento = p_tipo_evento)
      AND (p_fecha_desde IS NULL OR DATE(Fecha_Comentario) >= p_fecha_desde)
      AND (p_fecha_hasta IS NULL OR DATE(Fecha_Comentario) <= p_fecha_hasta)
    ORDER BY Fecha_Comentario DESC;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE SCHOOL_STATUS
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Métricas para las tarjetas del encabezado de school_status.html

DROP PROCEDURE IF EXISTS sp_admin_colegios_estadisticas;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegios_estadisticas()
BEGIN
    SELECT
        COUNT(*) AS Total_Colegios,
        SUM(Estado_Colegio) AS Total_Activos,
        SUM(CASE WHEN Total_Cupos > 0 THEN 1 ELSE 0 END) AS Total_Configurados,
        COALESCE(SUM(Total_Cupos), 0) AS Total_Cupos
    FROM VW_COLEGIOS_RESUMEN;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Devuelve todos los colegios con sus datos de resumen

DROP PROCEDURE IF EXISTS sp_admin_colegios_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegios_listar()
BEGIN
    SELECT
        ID_Colegio,
        Nombre_Colegio,
        Codigo_DANE,
        Email,
        Telefono,
        Direccion_Colegio,
        ID_Barrio,
        Nombre_Barrio,
        Estado_Colegio,
        Total_Cupos,
        Jornadas_Activas
    FROM VW_COLEGIOS_RESUMEN
    WHERE ID_Colegio <> 1    
    ORDER BY ID_Colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Devuelve todos los colegios con sus datos de resumen

DROP PROCEDURE IF EXISTS sp_admin_colegio_detalle;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_detalle(IN p_id_colegio INT)
BEGIN
    SELECT
        ID_Colegio,
        Nombre_Colegio,
        Codigo_DANE,
        Email,
        Telefono,
        Direccion_Colegio,
        ID_Barrio,
        Nombre_Barrio,
        Estado_Colegio,
        Total_Cupos,
        Jornadas_Activas
    FROM VW_COLEGIOS_RESUMEN
    WHERE ID_Colegio = p_id_colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Registra un nuevo colegio. Retorna el ID generado

DROP PROCEDURE IF EXISTS sp_admin_colegio_insertar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_insertar(
    IN p_nombre VARCHAR(100),
    IN p_dane VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_telefono VARCHAR(45),
    IN p_direccion VARCHAR(100),
    IN p_id_barrio INT,
    OUT p_nuevo_id INT
)
BEGIN
    INSERT INTO tbl_colegio (
        Nombre_Colegio, Codigo_DANE, Email, Telefono,
        Direccion_Colegio, FK_ID_Barrio, Estado_Colegio
    )
    VALUES (
        p_nombre, p_dane, NULLIF(p_email, ''), NULLIF(p_telefono, ''),
        p_direccion, p_id_barrio, 1
    );
    SET p_nuevo_id = LAST_INSERT_ID();
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE SCHOOL_CONFIG
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Actualiza los datos institucionales de un colegio existente

DROP PROCEDURE IF EXISTS sp_admin_colegio_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_actualizar(
    IN p_id_colegio INT,
    IN p_nombre VARCHAR(100),
    IN p_dane VARCHAR(15),
    IN p_email VARCHAR(255),
    IN p_telefono VARCHAR(45),
    IN p_direccion VARCHAR(100),
    IN p_id_barrio INT
)
BEGIN
    UPDATE tbl_colegio
    SET
        Nombre_Colegio = p_nombre,
        Codigo_DANE = p_dane,
        Email = NULLIF(p_email, ''),
        Telefono = NULLIF(p_telefono, ''),
        Direccion_Colegio = p_direccion,
        FK_ID_Barrio = p_id_barrio
    WHERE ID_Colegio = p_id_colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Activa o desactiva un colegio

DROP PROCEDURE IF EXISTS sp_admin_colegio_estado_cambiar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_estado_cambiar(IN p_id_colegio INT)
BEGIN
    UPDATE tbl_colegio
    SET Estado_Colegio = CASE WHEN Estado_Colegio = 1 THEN 0 ELSE 1 END
    WHERE ID_Colegio = p_id_colegio;

    -- Retorna el nuevo estado para que el servicio pueda armar el mensaje
    SELECT Estado_Colegio AS Nuevo_Estado
    FROM   tbl_colegio
    WHERE  ID_Colegio = p_id_colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Jornadas que el colegio tiene actualmente con cupos activos

DROP PROCEDURE IF EXISTS sp_admin_colegio_jornadas_activas;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_jornadas_activas(IN p_id_colegio INT)
BEGIN
    SELECT DISTINCT
        j.ID_Jornada,
        j.Nombre_Jornada,
        COUNT(cu.ID_Cupos) AS Grados_Configurados
    FROM tbl_jornada j
    INNER JOIN tbl_cupos cu
           ON j.ID_Jornada = cu.FK_ID_Jornada
          AND cu.FK_ID_Colegio = p_id_colegio
          AND cu.Estado_Cupos  = 1
    WHERE j.Estado_Jornada = 1
    GROUP BY j.ID_Jornada, j.Nombre_Jornada
    ORDER BY j.ID_Jornada;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Agrega una jornada al colegio insertando filas vacías en tbl_cupos

DROP PROCEDURE IF EXISTS sp_admin_colegio_jornada_agregar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_jornada_agregar(
    IN p_id_colegio INT,
    IN p_id_jornada TINYINT
)
BEGIN
    INSERT IGNORE INTO tbl_cupos (FK_ID_Grado, FK_ID_Colegio, FK_ID_Jornada, Cupos_Disponibles, Estado_Cupos)
    SELECT g.ID_Grado, p_id_colegio, p_id_jornada, 0, 1
    FROM tbl_grado g
    WHERE g.Estado_Grado = 1;
    
    -- Si el registro ya existía pero estaba inactivo, reactivarlo
    UPDATE tbl_cupos
    SET Estado_Cupos = 1
    WHERE FK_ID_Colegio = p_id_colegio
      AND FK_ID_Jornada = p_id_jornada;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Desactiva todos los cupos de una jornada para el colegio

DROP PROCEDURE IF EXISTS sp_admin_colegio_jornada_quitar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_jornada_quitar(
    IN p_id_colegio INT,
    IN p_id_jornada TINYINT
)
BEGIN
    UPDATE tbl_cupos
    SET Estado_Cupos = 0
    WHERE FK_ID_Colegio = p_id_colegio
      AND FK_ID_Jornada = p_id_jornada;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Matriz completa de cupos para la tabla de school_config.html.

DROP PROCEDURE IF EXISTS sp_admin_colegio_cupos_obtener;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_cupos_obtener(IN p_id_colegio INT)
BEGIN
    SELECT
        g.ID_Grado,
        g.Nombre_Grado,
        g.Nivel_Educativo,
        j.ID_Jornada,
        j.Nombre_Jornada,
        COALESCE(cu.Cupos_Disponibles, 0) AS Cupos_Disponibles,
        COALESCE(cu.Cupos_Reservados,  0) AS Cupos_Reservados
    FROM tbl_grado g
    CROSS JOIN tbl_jornada j
    LEFT JOIN tbl_cupos cu
           ON cu.FK_ID_Grado = g.ID_Grado
          AND cu.FK_ID_Colegio = p_id_colegio
          AND cu.FK_ID_Jornada = j.ID_Jornada
          AND cu.Estado_Cupos = 1
    WHERE g.Estado_Grado = 1
      AND j.Estado_Jornada = 1
      -- Solo jornadas activas del colegio
      AND j.ID_Jornada IN (
          SELECT DISTINCT FK_ID_Jornada
          FROM tbl_cupos
          WHERE FK_ID_Colegio = p_id_colegio
            AND Estado_Cupos = 1
      )
    ORDER BY g.ID_Grado, j.ID_Jornada;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Upsert de un cupo individual (grado × jornada × colegio).

DROP PROCEDURE IF EXISTS sp_admin_colegio_cupo_guardar;

DELIMITER $$
CREATE PROCEDURE sp_admin_colegio_cupo_guardar(
    IN p_id_colegio INT,
    IN p_id_grado TINYINT,
    IN p_id_jornada TINYINT,
    IN p_cupos_disponibles TINYINT
)
BEGIN
    INSERT INTO tbl_cupos (FK_ID_Grado, FK_ID_Colegio, FK_ID_Jornada, Cupos_Disponibles, Estado_Cupos)
    VALUES (p_id_grado, p_id_colegio, p_id_jornada, p_cupos_disponibles, 1)
    ON DUPLICATE KEY UPDATE
        Cupos_Disponibles = p_cupos_disponibles,
        Estado_Cupos = 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Lista de barrios activos para poblar SelectField en formularios.

DROP PROCEDURE IF EXISTS sp_catalogo_barrios_activos;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_barrios_activos()
BEGIN
    SELECT ID_Barrio, Nombre_Barrio
    FROM tbl_barrio
    WHERE Estado_Barrio = 1
    ORDER BY Nombre_Barrio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Lista de jornadas activas para poblar SelectField y filtros

DROP PROCEDURE IF EXISTS sp_catalogo_jornadas_activas;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_jornadas_activas()
BEGIN
    SELECT ID_Jornada, Nombre_Jornada
    FROM tbl_jornada
    WHERE Estado_Jornada = 1
    ORDER BY ID_Jornada;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Lista de grados activos ordenados por ID

DROP PROCEDURE IF EXISTS sp_catalogo_grados_activos;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_grados_activos()
BEGIN
    SELECT ID_Grado, Nombre_Grado, Nivel_Educativo
    FROM tbl_grado
    WHERE Estado_Grado = 1
    ORDER BY ID_Grado;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE SETTINGS
-- ====================================================================================================================================================

    -- TIPO DE AFECTACIÓN

-- --------------------------------------------------------
-- SP: Ver lista de tipos de afectaciones

DROP PROCEDURE IF EXISTS sp_admin_prioridad_afectaciones_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_afectaciones_listar()
BEGIN
    SELECT ID_Tipo_Afectacion,
           Nombre_Afectacion,
           Descripcion_Afectacion,
           Nivel_Prioridad_TC,
           Estado_Afectacion
    FROM tbl_tipo_afectacion
    ORDER BY Nivel_Prioridad_TC DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Ver lista de tipos de afectaciones

DROP PROCEDURE IF EXISTS sp_admin_prioridad_afectacion_insertar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_afectacion_insertar(
    IN  p_nombre VARCHAR(60),
    IN  p_descripcion VARCHAR(150),
    IN  p_nivel TINYINT,
    OUT p_nuevo_id TINYINT
)
BEGIN
    INSERT INTO tbl_tipo_afectacion
        (Nombre_Afectacion, Descripcion_Afectacion, Nivel_Prioridad_TC)
    VALUES (p_nombre, p_descripcion, p_nivel);
    SET p_nuevo_id = LAST_INSERT_ID();
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Actualizar un tipo de afectación registrada

DROP PROCEDURE IF EXISTS sp_admin_prioridad_afectacion_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_afectacion_actualizar(
    IN p_id TINYINT,
    IN p_nombre VARCHAR(60),
    IN p_descripcion VARCHAR(150),
    IN p_nivel TINYINT
)
BEGIN
    UPDATE tbl_tipo_afectacion
    SET Nombre_Afectacion = p_nombre,
           Descripcion_Afectacion = p_descripcion,
           Nivel_Prioridad_TC = p_nivel
    WHERE  ID_Tipo_Afectacion = p_id;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Eliminado logico de tipo de afectación

DROP PROCEDURE IF EXISTS sp_admin_prioridad_afectacion_estado_cambiar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_afectacion_estado_cambiar(
    IN p_id TINYINT
)
BEGIN
    UPDATE tbl_tipo_afectacion
    SET Estado_Afectacion = IF(Estado_Afectacion = 1, 0, 1)
    WHERE ID_Tipo_Afectacion = p_id;

    SELECT Estado_Afectacion AS Nuevo_Estado
    FROM tbl_tipo_afectacion
    WHERE ID_Tipo_Afectacion = p_id;
END $$
DELIMITER ;


    -- GRUPO / COMUNIDAD PREFERENCIAL

-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_grupos_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_grupos_listar()
BEGIN
    SELECT ID_Grupo_Preferencial,
           Nombre_Grupo_Preferencial,
           Descripcion_Grupo_Preferencial,
           Nivel_Prioridad_GP,
           Estado_Grupo_Preferencial
    FROM   tbl_grupo_preferencial
    ORDER  BY Nivel_Prioridad_GP DESC;
END $$
DELIMITER ;

-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_grupo_insertar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_grupo_insertar(
    IN  p_nombre VARCHAR(30),
    IN  p_descripcion VARCHAR(150),
    IN  p_nivel TINYINT,
    OUT p_nuevo_id TINYINT
)
BEGIN
    INSERT INTO tbl_grupo_preferencial
        (Nombre_Grupo_Preferencial, Descripcion_Grupo_Preferencial, Nivel_Prioridad_GP)
    VALUES (p_nombre, p_descripcion, p_nivel);
    SET p_nuevo_id = LAST_INSERT_ID();
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_grupo_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_grupo_actualizar(
    IN p_id TINYINT,
    IN p_nombre VARCHAR(30),
    IN p_descripcion VARCHAR(150),
    IN p_nivel TINYINT
)
BEGIN
    UPDATE tbl_grupo_preferencial
    SET    Nombre_Grupo_Preferencial = p_nombre,
           Descripcion_Grupo_Preferencial = p_descripcion,
           Nivel_Prioridad_GP = p_nivel
    WHERE  ID_Grupo_Preferencial = p_id;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_grupo_estado_cambiar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_grupo_estado_cambiar(
    IN p_id TINYINT
)
BEGIN
    UPDATE tbl_grupo_preferencial
    SET Estado_Grupo_Preferencial = IF(Estado_Grupo_Preferencial = 1, 0, 1)
    WHERE ID_Grupo_Preferencial = p_id;

    SELECT Estado_Grupo_Preferencial AS Nuevo_Estado
    FROM tbl_grupo_preferencial
    WHERE ID_Grupo_Preferencial = p_id;
END $$
DELIMITER ;


    -- ESTRATO

-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_estratos_listar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_estratos_listar()
BEGIN
    SELECT ID_Estrato,
           Nombre_Estrato,
           Descripcion_Estrato,
           Nivel_Prioridad_E,
           Estado_Estrato
    FROM   tbl_estrato
    ORDER  BY Nivel_Prioridad_E DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_estrato_insertar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_estrato_insertar(
    IN  p_nombre VARCHAR(10),
    IN  p_descripcion VARCHAR(150),
    IN  p_nivel TINYINT,
    OUT p_nuevo_id TINYINT
)
BEGIN
    INSERT INTO tbl_estrato
        (Nombre_Estrato, Descripcion_Estrato, Nivel_Prioridad_E)
    VALUES (p_nombre, p_descripcion, p_nivel);
    SET p_nuevo_id = LAST_INSERT_ID();
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_estrato_actualizar;

DELIMITER $$
CREATE PROCEDURE sp_admin_prioridad_estrato_actualizar(
    IN p_id TINYINT,
    IN p_nombre VARCHAR(10),
    IN p_descripcion VARCHAR(150),
    IN p_nivel TINYINT
)
BEGIN
    UPDATE tbl_estrato
    SET    Nombre_Estrato = p_nombre,
           Descripcion_Estrato = p_descripcion,
           Nivel_Prioridad_E = p_nivel
    WHERE  ID_Estrato = p_id;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: 

DROP PROCEDURE IF EXISTS sp_admin_prioridad_estrato_estado_cambiar;

DELIMITER $$

CREATE PROCEDURE sp_admin_prioridad_estrato_estado_cambiar(
    IN p_id TINYINT
)
BEGIN
    UPDATE tbl_estrato
    SET    Estado_Estrato = IF(Estado_Estrato = 1, 0, 1)
    WHERE  ID_Estrato = p_id;

    SELECT Estado_Estrato AS Nuevo_Estado
    FROM   tbl_estrato
    WHERE  ID_Estrato = p_id;
END $$
DELIMITER ;



-- ====================================================================================================================================================
--                                          SPs PARA TECHNICAL
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE DASHBOARD
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Métricas del dashboard del técnico

DROP PROCEDURE IF EXISTS sp_technical_dashboard_metricas;

DELIMITER $$
CREATE PROCEDURE sp_technical_dashboard_metricas(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        -- Tickets activos asignados al técnico que aún no tienen solución
        (SELECT COUNT(*)
            FROM tbl_ticket t
            JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
            WHERE t.FK_ID_Usuario_Tecnico = p_id_usuario
              AND t.Estado_Ticket = 1
              AND et.Estado_Final = 0
        ) AS solicitudes_asignadas,

        -- Tickets resueltos por el técnico (Estado_Final = 1)
        (SELECT COUNT(*)
            FROM tbl_ticket t
            JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
            WHERE t.FK_ID_Usuario_Tecnico = p_id_usuario
              AND t.Estado_Ticket = 1
              AND et.Estado_Final = 1
        ) AS solicitudes_solucionadas,

        -- Total de tickets asignados al técnico (cualquier estado de ticket)
        (SELECT COUNT(*)
            FROM tbl_ticket
            WHERE FK_ID_Usuario_Tecnico = p_id_usuario
              AND Estado_Ticket = 1
        ) AS total_solicitudes,

        -- Cupos disponibles en Engativá — dato global (igual que admin)
        (SELECT COALESCE(SUM(c.Cupos_Disponibles), 0)
            FROM tbl_cupos c
            JOIN tbl_colegio co ON c.FK_ID_Colegio = co.ID_Colegio
            JOIN tbl_barrio b  ON co.FK_ID_Barrio = b.ID_Barrio
            JOIN tbl_localidad l ON b.FK_ID_Localidad = l.ID_Localidad
            WHERE c.Estado_Cupos = 1
              AND co.Estado_Colegio = 1
              AND b.Estado_Barrio = 1
              AND l.Estado_Localidad = 1
              AND l.ID_Localidad = 1   -- Engativá
        ) AS cupos_disponibles_engativa;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Métricas del dashboard del técnico

DROP PROCEDURE IF EXISTS sp_technical_cases_listar_asignados;

DELIMITER $$
CREATE PROCEDURE sp_technical_cases_listar_asignados(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        ID_Ticket,
        Nombre_Estudiante,
        Nombre_Grado,
        Nombre_Estado,
        Estado_Final,
        Fecha_Creacion
    FROM  vw_cases_tecnico
    WHERE ID_Usuario_Tecnico = p_id_usuario
    ORDER BY Fecha_Creacion DESC
    LIMIT 5;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Actividad de los últimos 7 días, filtrada por técnico

DROP PROCEDURE IF EXISTS sp_technical_dashboard_chart_actividad;

DELIMITER $$
CREATE PROCEDURE sp_technical_dashboard_chart_actividad(IN p_id_usuario INT)
BEGIN
    WITH dias AS (
        SELECT CURDATE() - INTERVAL n DAY AS fecha
        FROM (
            SELECT 0 AS n UNION SELECT 1 UNION SELECT 2
            UNION SELECT 3  UNION SELECT 4 UNION SELECT 5 UNION SELECT 6
        ) nums
    )
    SELECT
        DATE_FORMAT(d.fecha, '%a')  AS label,
        d.fecha,
        -- Nuevas solicitudes asignadas al técnico en ese día
        COUNT(DISTINCT CASE
            WHEN DATE(t.Fecha_Creacion) = d.fecha THEN t.ID_Ticket
        END) AS nuevas_solicitudes,
        -- Solicitudes que ese día pasaron a "Solucionado"
        COUNT(DISTINCT CASE
            WHEN DATE(t.Fecha_Creacion) = d.fecha
             AND et.Nombre_Estado = 'Solucionado' THEN t.ID_Ticket
        END) AS cupos_asignados
    FROM dias d
    LEFT JOIN tbl_ticket t
           ON DATE(t.Fecha_Creacion)      = d.fecha
          AND t.Estado_Ticket             = 1
          AND t.FK_ID_Usuario_Tecnico     = p_id_usuario   -- filtro técnico
    LEFT JOIN tbl_estado_ticket et
           ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    GROUP BY d.fecha
    ORDER BY d.fecha ASC;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE CASES
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Retorna todos los tickets del técnico indicado

DROP PROCEDURE IF EXISTS sp_technical_cases_listar;

DELIMITER $$
CREATE PROCEDURE sp_technical_cases_listar(
    IN p_id_tecnico INT      -- ID del técnico autenticado
)
BEGIN
    SELECT *
    FROM vw_technical_cases
    WHERE FK_ID_Usuario_Tecnico = p_id_tecnico;
    -- Sin ORDER BY: Python aplica _filtrar y _ordenar.
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Conteo de datos para metricas de cases de tecnico

DROP PROCEDURE IF EXISTS sp_technical_cases_metricas;

DELIMITER $$
CREATE PROCEDURE sp_technical_cases_metricas(
    IN p_id_tecnico INT
)
BEGIN
    SELECT
        -- Scoped al técnico
        COUNT(*) AS solicitudes_asignadas,
        SUM(FK_ID_Estado_Ticket = 2) AS en_revision,
        SUM(Nombre_Estado = 'Solucionado') AS solucionados,

        -- Global (cupos disponibles en el sistema, sin importar técnico)
        (SELECT COALESCE(SUM(c.Cupos_Disponibles), 0)FROM tbl_cupos c WHERE c.Estado_Cupos = 1) AS cupos_disponibles

    FROM vw_technical_cases
    WHERE FK_ID_Usuario_Tecnico = p_id_tecnico;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE HISTORY
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Retorna TODOS los registros de comentarios del técnico indicado.

DROP PROCEDURE IF EXISTS sp_technical_history_listar_todos;

DELIMITER $$
CREATE PROCEDURE sp_technical_history_listar_todos(
    IN p_id_tecnico INT
)
BEGIN
    SELECT
        ID_Ticket_Comentario,
        Tipo_Evento,
        Comentario,
        Fecha_Comentario,
        Es_Interno,
        FK_ID_Ticket,
        Nombre_Rol,
        Nombre_Completo_Usuario
    FROM vw_auditoria_comentarios_tecnico
    WHERE Estado_Comentario_Ticket = 1
      AND FK_ID_Usuario = p_id_tecnico;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Export completo del técnico sin paginación (para CSV/PDF)

DROP PROCEDURE IF EXISTS sp_technical_history_exportar;

DELIMITER $$
CREATE PROCEDURE sp_technical_history_exportar(
    IN p_id_tecnico INT,
    IN p_tipo_evento VARCHAR(30),
    IN p_fecha_desde DATE,
    IN p_fecha_hasta DATE
)
BEGIN
    SELECT
        ID_Ticket_Comentario,
        Tipo_Evento,
        Comentario,
        Fecha_Comentario,
        Es_Interno,
        FK_ID_Ticket,
        Nombre_Rol,
        Nombre_Completo_Usuario
    FROM vw_auditoria_comentarios_tecnico
    WHERE Estado_Comentario_Ticket = 1
      AND FK_ID_Usuario = p_id_tecnico
      AND (p_tipo_evento IS NULL OR Tipo_Evento = p_tipo_evento)
      AND (p_fecha_desde IS NULL OR DATE(Fecha_Comentario) >= p_fecha_desde)
      AND (p_fecha_hasta IS NULL OR DATE(Fecha_Comentario) <= p_fecha_hasta)
    ORDER BY Fecha_Comentario DESC;
END $$
DELIMITER ;



-- ====================================================================================================================================================
--                                          SPs PARA TICKETS
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- SP PARA LA PAGINA DE TICKET_PANEL
-- ====================================================================================================================================================


-- --------------------------------------------------------
-- SP: Detalle completo del ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_consultar_detalle;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_consultar_detalle(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT *
    FROM vw_ticket_panel_detalle
    WHERE ID_Ticket = p_id_ticket
    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Comentarios del ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_comentarios_consultar;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_comentarios_consultar(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT
        tc.ID_Ticket_Comentario,
        tc.Tipo_Evento,
        tc.Comentario,
        tc.Fecha_Comentario,
        tc.Es_Interno,
        CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Usuario,
        r.Nombre_Rol
    FROM tbl_ticket_comentario tc
    INNER JOIN tbl_usuario u ON tc.FK_ID_Usuario = u.ID_Usuario
    INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
    INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
    WHERE tc.FK_ID_Ticket = p_id_ticket
      AND tc.Estado_Comentario_Ticket = 1
    ORDER BY tc.Fecha_Comentario DESC;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Insertar comentario de un ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_comentario_insertar;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_comentario_insertar(
    IN p_id_ticket VARCHAR(10),
    IN p_tipo_evento VARCHAR(20),
    IN p_id_usuario INT,
    IN p_comentario TEXT,
    IN p_es_interno TINYINT(1)
)
BEGIN
    INSERT INTO tbl_ticket_comentario (
        Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket
    ) VALUES (
        p_tipo_evento, p_comentario, p_es_interno, p_id_usuario, p_id_ticket
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Actualizar el estado del ticket y agregar un comentario

DROP PROCEDURE IF EXISTS sp_ticket_panel_estado_actualizar;
DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_estado_actualizar(
    IN p_id_ticket VARCHAR(10),
    IN p_id_estado_nuevo TINYINT,
    IN p_fecha_cierre DATETIME,    -- NULL si no se cierra
    IN p_resolucion TEXT,
    IN p_id_tecnico INT           -- técnico que ejecuta el cambio
)
BEGIN
    DECLARE v_estado_anterior VARCHAR(60);
    DECLARE v_estado_nuevo VARCHAR(60);
    DECLARE v_tipo_evento VARCHAR(20);
    DECLARE v_es_final TINYINT;    
    DECLARE v_msg_auditoria TEXT;

    -- Capturar el nombre del estado anterior para la auditoría
    SELECT et.Nombre_Estado INTO v_estado_anterior
    FROM tbl_ticket t
    INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    WHERE t.ID_Ticket = p_id_ticket
    LIMIT 1;

    -- Capturar el nombre del nuevo estado
    SELECT Nombre_Estado INTO v_estado_nuevo
    FROM tbl_estado_ticket
    WHERE ID_Estado_Ticket = p_id_estado_nuevo
    LIMIT 1;

    -- Obtener si es estado final
    SELECT Estado_Final 
    INTO v_es_final
    FROM tbl_estado_ticket
    WHERE ID_Estado_Ticket = p_id_estado_nuevo
    LIMIT 1;
    
    -- Actualizar el ticket
    UPDATE tbl_ticket
    SET FK_ID_Estado_Ticket = p_id_estado_nuevo,
        Fecha_Cierre = p_fecha_cierre
    WHERE ID_Ticket = p_id_ticket;

    -- Definir el tipo de evento para auditoria
    SET v_tipo_evento = IF(v_es_final = 1, 'Cierre Solicitud', 'Cambio de Estado');

    -- Construir el mensaje de auditoría
    SET v_msg_auditoria = CONCAT(
        '[', v_tipo_evento, '] ',
        v_estado_anterior, ' → ', v_estado_nuevo,
        IF(p_resolucion IS NOT NULL AND p_resolucion != '',
        CONCAT(' | Resolución: ', p_resolucion), '')
    );

    -- Registrar el cambio como comentario interno automático
    INSERT INTO tbl_ticket_comentario (
        Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket
    ) VALUES (
        v_tipo_evento, v_msg_auditoria, 1, p_id_tecnico, p_id_ticket
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Asignar cupo al ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_asignar_cupo;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_asignar_cupo(
    IN p_id_ticket VARCHAR(10),
    IN p_id_cupo INT,
    IN p_id_tecnico INT
)
BEGIN
    DECLARE v_nombre_colegio VARCHAR(100);
    DECLARE v_tipo_evento VARCHAR(20);
    DECLARE v_msg_auditoria TEXT;

    -- Obtener el nombre del colegio para la auditoría
    SELECT col.Nombre_Colegio INTO v_nombre_colegio
    FROM tbl_cupos c
    INNER JOIN tbl_colegio col ON c.FK_ID_Colegio = col.ID_Colegio
    WHERE c.ID_Cupos = p_id_cupo
    LIMIT 1;

    -- Asignar el cupo al ticket
    UPDATE tbl_ticket
    SET FK_ID_Cupo_Asignado = p_id_cupo
    WHERE ID_Ticket = p_id_ticket;

    -- Definir el tipo de evento para auditoria
    SET v_tipo_evento = 'Cupo Asignado';

    -- Registrar auditoría
    SET v_msg_auditoria = CONCAT(
        '[Cupo Asignado] Colegio: ', COALESCE(v_nombre_colegio, 'Desconocido'),
        ' | Cupo ID: ', p_id_cupo
    );

    INSERT INTO tbl_ticket_comentario (
        Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket
    ) VALUES (
        v_tipo_evento, v_msg_auditoria, 1, p_id_tecnico, p_id_ticket
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Documentos del ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_documentos_consultar;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_documentos_consultar(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT
        dt.ID_Doc_Ticket,
        dt.Nombre_Original,
        dt.Fecha_Subida,
        td.Nombre_Tipo_Doc
    FROM tbl_documento_ticket dt
    INNER JOIN tbl_tipo_documento td ON dt.FK_ID_Tipo_Doc = td.ID_Tipo_Doc
    WHERE dt.FK_ID_Ticket = p_id_ticket
      AND dt.Estado_Documentos = 1
    ORDER BY dt.Fecha_Subida DESC;
END $$
DELIMITER ;

-- --------------------------------------------------------
-- SP: Descargar documento del ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_documento_descargar;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_documento_descargar(
    IN p_id_doc INT
)
BEGIN
    SELECT
        dt.Archivo,
        dt.Nombre_Original
    FROM tbl_documento_ticket dt
    WHERE dt.ID_Doc_Ticket = p_id_doc
      AND dt.Estado_Documentos = 1
    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Insertar documento al ticket
    -- Reutilización de sp_documento_ticket_insertar


-- --------------------------------------------------------
-- SP: Datos del acudiente para el panel

DROP PROCEDURE IF EXISTS sp_ticket_panel_acudiente_consultar;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_acudiente_consultar(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT *
    FROM vw_ticket_acudiente_detalle
    WHERE ID_Ticket = p_id_ticket
    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Datos del Estudiante del ticket

DROP PROCEDURE IF EXISTS sp_ticket_panel_estudiante_consultar;

DELIMITER $$
CREATE PROCEDURE sp_ticket_panel_estudiante_consultar(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT *
    FROM vw_ticket_estudiante_detalle
    WHERE ID_Ticket = p_id_ticket
    LIMIT 1;
END $$
DELIMITER ;


    --  CATALOGOS PARA LOS SELECTFIELDS DEL FORMULARIO

-- --------------------------------------------------------
-- SP: Estados del ticket activos

DROP PROCEDURE IF EXISTS sp_catalogo_estados_ticket;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_estados_ticket()
BEGIN
    SELECT ID_Estado_Ticket, Nombre_Estado
    FROM tbl_estado_ticket
    ORDER BY ID_Estado_Ticket;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Colegios activos

DROP PROCEDURE IF EXISTS sp_catalogo_colegios;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_colegios()
BEGIN
    SELECT ID_Colegio, Nombre_Colegio
    FROM tbl_colegio
    ORDER BY Nombre_Colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Jornadas

DROP PROCEDURE IF EXISTS sp_catalogo_jornadas;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_jornadas()
BEGIN
    SELECT ID_Jornada, Nombre_Jornada
    FROM tbl_jornada
    WHERE Estado_Jornada = 1
    ORDER BY ID_Jornada;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Tipos de afectación

DROP PROCEDURE IF EXISTS sp_catalogo_tipo_afectacion;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_tipo_afectacion()
BEGIN
    SELECT ID_Tipo_Afectacion, Nombre_Afectacion
    FROM tbl_tipo_afectacion
    WHERE Estado_Afectacion = 1
    ORDER BY ID_Tipo_Afectacion;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Cupos disponibles

DROP PROCEDURE IF EXISTS sp_catalogo_cupos_disponibles;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_cupos_disponibles(
    IN p_id_ticket VARCHAR(10)     -- ticket actual (para no excluirlo de su propio cupo)
)
BEGIN
    SELECT
        cu.ID_Cupos,
        CONCAT(col.Nombre_Colegio, ' — ', jor.Nombre_Jornada, ' — Grado: ', g.Nombre_Grado) AS Label_Cupo
    FROM tbl_cupos cu
    INNER JOIN tbl_colegio col ON cu.FK_ID_Colegio = col.ID_Colegio
    INNER JOIN tbl_jornada jor ON cu.FK_ID_Jornada = jor.ID_Jornada
    INNER JOIN tbl_grado g ON cu.FK_ID_Grado = g.ID_Grado
    WHERE cu.Estado_Cupos = 1   -- activo/disponible
      AND (
          -- Cupos sin asignar a ningún ticket
          cu.ID_Cupos NOT IN (
              SELECT FK_ID_Cupo_Asignado
              FROM tbl_ticket
              WHERE FK_ID_Cupo_Asignado IS NOT NULL
                AND ID_Ticket != p_id_ticket
          )
      )
    ORDER BY col.Nombre_Colegio, jor.Nombre_Jornada;
END $$
DELIMITER ;



-- ====================================================================================================================================================
-- SP PARA EL SISTEMA DE RESOLUCIÓN DE TICKETS
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- SP: Barrios disponibles con Colegios asignados

DROP PROCEDURE IF EXISTS sp_catalogo_barrios_con_colegios;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_barrios_con_colegios()
BEGIN
    SELECT ID_Barrio, Nombre_Barrio
    FROM VW_BARRIOS_CON_COLEGIOS;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Colegios filtrados por barrio

DROP PROCEDURE IF EXISTS sp_catalogo_colegios_por_barrio;

DELIMITER $$
CREATE PROCEDURE sp_catalogo_colegios_por_barrio(IN p_id_barrio INT)
BEGIN
    SELECT
        ID_Colegio,
        Nombre_Colegio,
        Direccion_Colegio,
        IFNULL(Telefono, 'No disponible') AS Telefono,
        IFNULL(Email, 'No disponible') AS Email
    FROM tbl_colegio
    WHERE FK_ID_Barrio = p_id_barrio
      AND Estado_Colegio = 1
    ORDER BY Nombre_Colegio;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Valida si existe cupo para grado + colegio + jornada del ticket dado; retorna la fila o vacío.

DROP PROCEDURE IF EXISTS sp_ticket_validar_cupo;

DELIMITER $$
CREATE PROCEDURE sp_ticket_validar_cupo(
    IN p_id_ticket VARCHAR(10),
    IN p_id_colegio INT,
    IN p_id_jornada TINYINT
)
BEGIN
    SELECT
        cu.ID_Cupos,
        cu.Cupos_Disponibles,
        c.Nombre_Colegio,
        c.Direccion_Colegio,
        IFNULL(c.Telefono, 'No disponible') AS Telefono,
        IFNULL(c.Email, 'No disponible') AS Email,
        j.Nombre_Jornada,
        g.Nombre_Grado
    FROM tbl_ticket t
    INNER JOIN tbl_estudiante e
        ON e.ID_Estudiante = t.FK_ID_Estudiante
    INNER JOIN tbl_cupos cu
        ON  cu.FK_ID_Colegio = p_id_colegio
        AND cu.FK_ID_Jornada = p_id_jornada
        AND cu.FK_ID_Grado = e.FK_ID_Grado_Proximo
        AND cu.Cupos_Disponibles > 0
        AND cu.Estado_Cupos = 1
    INNER JOIN tbl_colegio c ON c.ID_Colegio = cu.FK_ID_Colegio
    INNER JOIN tbl_jornada j ON j.ID_Jornada = cu.FK_ID_Jornada
    INNER JOIN tbl_grado g ON g.ID_Grado = cu.FK_ID_Grado
    WHERE t.ID_Ticket = p_id_ticket
    LIMIT 1;
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Se confirma la asignación del cupo:
--     · Vincula el cupo al ticket
--     · Cambia estado → 4 (Pendiente Acción de Usuario)
--     · Inserta comentario público automático con info completa

DROP PROCEDURE IF EXISTS sp_ticket_confirmar_asignacion;

DELIMITER $$
CREATE PROCEDURE sp_ticket_confirmar_asignacion(
    IN p_id_ticket VARCHAR(10),
    IN p_id_cupo INT,
    IN p_id_tecnico INT
)
BEGIN
    DECLARE v_colegio VARCHAR(100);
    DECLARE v_dir VARCHAR(100);
    DECLARE v_tel VARCHAR(45);
    DECLARE v_email VARCHAR(255);
    DECLARE v_jornada VARCHAR(20);
    DECLARE v_grado VARCHAR(30);
    DECLARE v_msg TEXT;

    SELECT
        c.Nombre_Colegio,
        c.Direccion_Colegio,
        IFNULL(c.Telefono, 'No disponible'),
        IFNULL(c.Email,'No disponible'),
        j.Nombre_Jornada,
        g.Nombre_Grado
    INTO v_colegio, v_dir, v_tel, v_email, v_jornada, v_grado
    FROM tbl_cupos cu
    INNER JOIN tbl_colegio c ON c.ID_Colegio = cu.FK_ID_Colegio
    INNER JOIN tbl_jornada j ON j.ID_Jornada = cu.FK_ID_Jornada
    INNER JOIN tbl_grado g ON g.ID_Grado = cu.FK_ID_Grado
    WHERE cu.ID_Cupos = p_id_cupo;

    SET v_msg = CONCAT(
        'Estimado usuario, se ha identificado un cupo disponible para su solicitud. '
        'A continuación encontrará los detalles de la asignación propuesta:\n\n',
        '  Institución : ', v_colegio,  '\n',
        '  Dirección   : ', v_dir,      '\n',
        '  Teléfono    : ', v_tel,      '\n',
        '  Correo      : ', v_email,    '\n',
        '  Grado       : ', v_grado,    '\n',
        '  Jornada     : ', v_jornada,  '\n\n',
        'Por favor responda este mensaje confirmando o rechazando la asignación.\n\n',
        'AVISO IMPORTANTE: si no recibimos su respuesta en un plazo de 3 días hábiles, '
        'el ticket será marcado automáticamente como RECHAZADO por abandono.'
    );

    -- Actualizar ticket: vincular cupo + cambiar estado
    UPDATE tbl_ticket
    SET FK_ID_Cupo_Asignado = p_id_cupo,
        FK_ID_Estado_Ticket = 4          -- Pendiente Acción de Usuario
    WHERE ID_Ticket = p_id_ticket;

    -- Comentario público automático
    INSERT INTO tbl_ticket_comentario
        (Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket)
    VALUES
        ('Cupo Asignado', v_msg, 0, p_id_tecnico, p_id_ticket);

    -- Lógica de reserva: bloquea el cupo para que nadie más lo use
    UPDATE tbl_cupos
    SET Cupos_Disponibles = Cupos_Disponibles - 1,
        Cupos_Reservados = Cupos_Reservados + 1
    WHERE ID_Cupos = p_id_cupo 
      AND Cupos_Disponibles > 0; -- Validación de seguridad
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Devuelve tickets abandonados (estado 4, sin respuesta del usuario creador en +3 días desde la asignación).

DROP PROCEDURE IF EXISTS sp_ticket_obtener_abandonados;

DELIMITER $$
CREATE PROCEDURE sp_ticket_obtener_abandonados()
BEGIN
    SELECT
        t.ID_Ticket,
        t.FK_ID_Cupo_Asignado,
        IFNULL(t.FK_ID_Usuario_Tecnico,
               t.FK_ID_Usuario_Creador) AS ID_Responsable
    FROM tbl_ticket t
    WHERE t.FK_ID_Estado_Ticket = 4
        AND t.Estado_Ticket = 1
        -- El último comentario del ticket tiene más de 3 días
        AND (
            SELECT MAX(tc.Fecha_Comentario)
            FROM tbl_ticket_comentario tc
            WHERE tc.FK_ID_Ticket = t.ID_Ticket
        ) < DATE_SUB(NOW(), INTERVAL 3 DAY)
        -- El usuario creador NO ha respondido tras la asignación del cupo
        AND NOT EXISTS (
            SELECT 1
            FROM tbl_ticket_comentario tc2
            WHERE tc2.FK_ID_Ticket  = t.ID_Ticket
                AND tc2.FK_ID_Usuario = t.FK_ID_Usuario_Creador
                AND tc2.Tipo_Evento   IN ('Comentario', 'Documento Subido')
                AND tc2.Fecha_Comentario > (
                    SELECT MAX(tc3.Fecha_Comentario)
                    FROM tbl_ticket_comentario tc3
                    WHERE tc3.FK_ID_Ticket = t.ID_Ticket
                    AND tc3.Tipo_Evento  = 'Cupo Asignado'
                )
        );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Rechaza un ticket abandonado y deja comentario público

DROP PROCEDURE IF EXISTS sp_ticket_rechazar_abandonado;

DELIMITER $$
CREATE PROCEDURE sp_ticket_rechazar_abandonado(
    IN p_id_ticket      VARCHAR(10),
    IN p_id_responsable INT
)
BEGIN
    UPDATE tbl_cupos cu
    INNER JOIN tbl_ticket t ON cu.ID_Cupos = t.FK_ID_Cupo_Asignado
    SET cu.Cupos_Reservados = cu.Cupos_Reservados - 1,
        cu.Cupos_Disponibles = cu.Cupos_Disponibles + 1
    WHERE t.ID_Ticket = p_id_ticket;

    UPDATE tbl_ticket
    SET FK_ID_Estado_Ticket = 6,
        FK_ID_Cupo_Asignado = NULL,
        Fecha_Cierre = NOW()
    WHERE ID_Ticket = p_id_ticket;

    INSERT INTO tbl_ticket_comentario
        (Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket)
    VALUES (
        'Cierre Solicitud',
        'El ticket ha sido RECHAZADO automáticamente por abandono. No se recibió respuesta '
        'del usuario en el plazo de 3 días hábiles establecido tras la notificación del cupo disponible.',
        0,
        p_id_responsable,
        p_id_ticket
    );
END $$
DELIMITER ;

    -- TAB COMFIRMAR ASIGNACIÓN

-- --------------------------------------------------------
-- SP: Usuario CONFIRMA el cupo asignado
-- * Cupos_Disponibles - 1, Cupos_Reservados - 1 (cupo tomado)
-- * Estado ticket = 8 (Solucionado)
-- * Comentario público automático


DROP PROCEDURE IF EXISTS sp_ticket_usuario_confirmar_cupo;

DELIMITER $$
CREATE PROCEDURE sp_ticket_usuario_confirmar_cupo(
    IN p_id_ticket  VARCHAR(10),
    IN p_id_tecnico INT
)
BEGIN
    DECLARE v_id_cupo INT;
    DECLARE v_colegio VARCHAR(100);
    DECLARE v_dir VARCHAR(100);
    DECLARE v_tel VARCHAR(45);
    DECLARE v_email VARCHAR(255);
    DECLARE v_jornada VARCHAR(20);
    DECLARE v_grado VARCHAR(30);

    -- Obtener cupo asignado al ticket
    SELECT FK_ID_Cupo_Asignado INTO v_id_cupo
    FROM tbl_ticket WHERE ID_Ticket = p_id_ticket;

    -- Datos del cupo para el comentario
    SELECT
        c.Nombre_Colegio,
        c.Direccion_Colegio,
        IFNULL(c.Telefono, 'No disponible'),
        IFNULL(c.Email,    'No disponible'),
        j.Nombre_Jornada,
        g.Nombre_Grado
    INTO v_colegio, v_dir, v_tel, v_email, v_jornada, v_grado
    FROM tbl_cupos cu
    INNER JOIN tbl_colegio c ON c.ID_Colegio = cu.FK_ID_Colegio
    INNER JOIN tbl_jornada j ON j.ID_Jornada = cu.FK_ID_Jornada
    INNER JOIN tbl_grado g ON g.ID_Grado = cu.FK_ID_Grado
    WHERE cu.ID_Cupos = v_id_cupo;

    -- Descontar cupo reservado (ahora es definitivo)
    UPDATE tbl_cupos
    SET Cupos_Reservados = Cupos_Reservados - 1
    WHERE ID_Cupos = v_id_cupo;

    -- Cerrar el ticket como Solucionado
    UPDATE tbl_ticket
    SET FK_ID_Estado_Ticket = 8,
        Fecha_Cierre = NOW()
    WHERE ID_Ticket = p_id_ticket;

    -- Comentario público de cierre
    INSERT INTO tbl_ticket_comentario
        (Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket)
    VALUES (
        'Cierre Solicitud',
        CONCAT(
            'El usuario ha CONFIRMADO la asignación del cupo. El ticket queda SOLUCIONADO.\n\n',
            'Resumen del cupo asignado:\n',
            '  Institución : ', v_colegio, '\n',
            '  Dirección : ', v_dir,     '\n',
            '  Teléfono : ', v_tel,     '\n',
            '  Correo : ', v_email,   '\n',
            '  Grado : ', v_grado,   '\n',
            '  Jornada : ', v_jornada
        ),
        0,
        p_id_tecnico,
        p_id_ticket
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Usuario CANCELA el cupo asignado (Nuevo Comportamiento 2)
-- * Cupos_Disponibles + 1, Cupos_Reservados - 1 (cupo liberado)
-- * FK_ID_Cupo_Asignado = NULL
-- * Estado ticket = 5 (Asignación de Cupo)
-- * Comentario público ICO

DROP PROCEDURE IF EXISTS sp_ticket_usuario_cancelar_cupo;

DELIMITER $$
CREATE PROCEDURE sp_ticket_usuario_cancelar_cupo(
    IN p_id_ticket  VARCHAR(10),
    IN p_id_tecnico INT
)
BEGIN
    DECLARE v_id_cupo INT;

    SELECT FK_ID_Cupo_Asignado INTO v_id_cupo
    FROM tbl_ticket WHERE ID_Ticket = p_id_ticket;

    -- Liberar reserva
    UPDATE tbl_cupos
    SET Cupos_Disponibles = Cupos_Disponibles + 1,
        Cupos_Reservados  = Cupos_Reservados  - 1
    WHERE ID_Cupos = v_id_cupo;

    -- Revertir ticket: sin cupo, volver a Asignación de Cupo
    UPDATE tbl_ticket
    SET FK_ID_Cupo_Asignado = NULL,
        FK_ID_Estado_Ticket = 5
    WHERE ID_Ticket = p_id_ticket;

    -- Comentario público
    INSERT INTO tbl_ticket_comentario
        (Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket)
    VALUES (
        'Cupo Cancelado',
        'El cupo propuesto ha sido CANCELADO. El técnico deberá buscar una nueva opción de asignación.',
        0,
        p_id_tecnico,
        p_id_ticket
    );
END $$
DELIMITER ;


-- --------------------------------------------------------
-- SP: Consulta detalle completo del cupo asignado a un ticket

DROP PROCEDURE IF EXISTS sp_ticket_cupo_asignado_detalle;

DELIMITER $$
CREATE PROCEDURE sp_ticket_cupo_asignado_detalle(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT
        cu.ID_Cupos,
        cu.Cupos_Disponibles,
        cu.Cupos_Reservados,
        cu.Estado_Cupos,
        g.Nombre_Grado,
        g.Nivel_Educativo,
        j.Nombre_Jornada,
        c.ID_Colegio,
        c.Nombre_Colegio,
        c.Codigo_DANE,
        c.Direccion_Colegio,
        IFNULL(c.Telefono, 'No disponible') AS Telefono,
        IFNULL(c.Email,    'No disponible') AS Email,
        b.Nombre_Barrio,
        l.Nombre_Localidad
    FROM tbl_ticket t
    INNER JOIN tbl_cupos   cu ON cu.ID_Cupos   = t.FK_ID_Cupo_Asignado
    INNER JOIN tbl_grado    g ON g.ID_Grado    = cu.FK_ID_Grado
    INNER JOIN tbl_jornada  j ON j.ID_Jornada  = cu.FK_ID_Jornada
    INNER JOIN tbl_colegio  c ON c.ID_Colegio  = cu.FK_ID_Colegio
    INNER JOIN tbl_barrio   b ON b.ID_Barrio   = c.FK_ID_Barrio
    INNER JOIN tbl_localidad l ON l.ID_Localidad = b.FK_ID_Localidad
    WHERE t.ID_Ticket = p_id_ticket
        AND t.FK_ID_Cupo_Asignado IS NOT NULL;
END $$
DELIMITER ;