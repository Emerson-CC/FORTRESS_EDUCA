USE FORTRESS_EDUCA_DB;

-- ====================================================================================================================================================
--                                          VIEWS PARA ADMIN
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE PROFILE (ADMIN)
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Obtener todos los estudiantes de un acudiente (lista para tarjetas)
-- USADO EN sp_perfil_estudiantes_por_acudiente | sp_tbl_ticket_consultar_detalle | sp_tbl_ticket_cerrado_consultar_por_usuario

CREATE OR REPLACE VIEW vw_estudiante_detalle AS
SELECT
    e.ID_Estudiante,
    e.FK_ID_Acudiente,
    e.Estado_Estudiante,

    -- Persona
    p.ID_Persona AS ID_Persona,
    p.Primer_Nombre,
    p.Segundo_Nombre,
    p.Primer_Apellido,
    p.Segundo_Apellido,
    p.Fecha_Nacimiento,
    p.Num_Doc_Persona AS Numero_Documento,

    -- Catálogos
    ti.Nombre_Tipo_Iden,
    g.Nombre_Genero,
    gp.Nombre_Grupo_Preferencial,

    -- Grados
    gr_a.Nombre_Grado AS Nombre_Grado_Actual,
    gr_p.Nombre_Grado AS Nombre_Grado_Proximo,

    -- Colegio
    c.Nombre_Colegio AS Nombre_Colegio_Anterior,

    -- IDs (CLAVE para formularios)
    e.FK_ID_Genero AS ID_Genero,
    e.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,
    e.FK_ID_Grado_Actual AS ID_Grado_Actual,
    e.FK_ID_Grado_Proximo AS ID_Grado_Proximo,
    e.FK_ID_Colegio_Anterior AS ID_Colegio_Anterior,
    e.FK_ID_Persona AS FK_ID_Persona,
    e.FK_ID_Tipo_Iden AS ID_Tipo_Iden,
    e.FK_ID_Parentesco_Es AS ID_Parentesco

FROM tbl_estudiante e
INNER JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_tipo_identificacion ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
INNER JOIN tbl_genero g ON e.FK_ID_Genero = g.ID_Genero
INNER JOIN tbl_grupo_preferencial gp ON e.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
INNER JOIN tbl_grado gr_a ON e.FK_ID_Grado_Actual = gr_a.ID_Grado
LEFT JOIN tbl_grado gr_p ON e.FK_ID_Grado_Proximo = gr_p.ID_Grado
INNER JOIN tbl_colegio c ON e.FK_ID_Colegio_Anterior = c.ID_Colegio;



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE STATUS (ADMIN)
-- ====================================================================================================================================================

    -- DATOS PARA LA PAGINA DE DETAIL

-- --------------------------------------------------------
-- Obtener comentarios públicos de un ticket
-- USADO EN sp_tbl_ticket_comentarios_consultar

CREATE OR REPLACE VIEW vw_ticket_comentarios AS
SELECT
    tc.ID_Ticket_Comentario,
    tc.FK_ID_Ticket,
    tc.Comentario,
    tc.Fecha_Comentario,
    tc.Es_Interno,
    tc.Estado_Comentario_Ticket,

    u.ID_Usuario,
    CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Usuario,
    r.Nombre_Rol

FROM tbl_ticket_comentario tc
INNER JOIN tbl_usuario u ON tc.FK_ID_Usuario = u.ID_Usuario
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol;


-- --------------------------------------------------------
-- Obtener datos completos de un ticket específico
-- USADO EN sp_tbl_ticket_consultar_detalle | sp_tbl_ticket_cerrado_consultar_por_usuario

CREATE OR REPLACE VIEW vw_ticket_detalle AS
SELECT
    t.ID_Ticket,
    t.Titulo_Ticket,
    t.Descripcion_Ticket,
    t.Fecha_Creacion,
    t.Fecha_Cierre,
    t.Puntaje_Prioridad,
    t.Estado_Ticket,

    t.FK_ID_Usuario_Creador,
    t.FK_ID_Usuario_Tecnico,
    t.FK_ID_Estudiante,
    t.FK_ID_Jornada_Preferencia,
    t.FK_ID_Barrio,
    t.FK_ID_Tiempo_Residencia,
    t.FK_ID_Colegio_Preferencia,
    t.FK_ID_Cupo_Asignado,

    et.Nombre_Estado,
    et.Estado_Final,

    ta.Nombre_Afectacion,
    ta.Nivel_Prioridad_TC

FROM tbl_ticket t
INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
INNER JOIN tbl_tipo_afectacion ta ON t.FK_ID_Tipo_Afectacion = ta.ID_Tipo_Afectacion;



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE ACCOUNTS / ACCOUNTS_USER / ACCOUNTS_FUNC (ADMIN)
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Vista general para listado del historial de acceso
-- USADO EN sp_admin_historial_acceso_listar


CREATE OR REPLACE VIEW vw_historial_acceso AS
SELECT
    sa.ID_Auditoria,
    COALESCE(u.Nombre_Usuario, 'Desconocido') AS Nombre_Usuario,
    COALESCE(r.ID_Rol, 0) AS ID_Rol,
    COALESCE(r.Nombre_Rol, '————') AS Nombre_Rol,
    sa.Tipo_Evento AS Evento,
    sa.IP_Usuario AS IP,
    -- Extrae nombre del navegador desde el User_Agent
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
    END AS Navegador,
    sa.User_Agent,
    sa.Fecha_Evento
FROM tbl_auditoria_sesion sa
LEFT JOIN tbl_usuario u ON sa.FK_ID_Usuario = u.ID_Usuario
LEFT JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
WHERE sa.Estado_Auditoria_Sesion = 1;


-- --------------------------------------------------------
-- Vista general para listado de acciones sobre los usuarios
-- USADO EN sp_admin_historial_acciones_listar

CREATE OR REPLACE VIEW vw_historial_acciones AS
SELECT
    a.ID_Auditoria,
    a.Tipo_Evento AS Evento,
    a.Tabla_Afectada,
    a.ID_Registro_Afectado,
    -- Si el usuario no existe, muestra el ID crudo
    COALESCE(
        CONCAT(
            CASE r.Nombre_Rol
                WHEN 'Admin' THEN 'ADM'
                WHEN 'Tecnico' THEN 'TEC'
                WHEN 'Acudiente' THEN 'ACU'
                WHEN 'Sistema' THEN 'SIS'
                ELSE 'SIS'
            END, '-', u.ID_Usuario
        ),
        CONCAT('USR-', a.FK_ID_Usuario)
    ) AS ID_Formateado,
    COALESCE(r.ID_Rol, 0) AS ID_Rol,
    COALESCE(r.Nombre_Rol, '—') AS Nombre_Rol,
    a.IP_Usuario AS IP,
    COALESCE(CAST(a.Datos_Antiguo AS CHAR), 'No aplica') AS Dato_Antiguo,
    COALESCE(CAST(a.Datos_Nuevos  AS CHAR), 'No aplica') AS Dato_Nuevo,
    a.Fecha_Auditoria AS Fecha_Evento
FROM tbl_auditoria a
LEFT JOIN tbl_usuario u ON a.FK_ID_Usuario = u.ID_Usuario   -- LEFT: muestra aunque el user no exista
LEFT JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol       -- LEFT: muestra aunque no tenga rol
WHERE a.Estado_Auditoria = 1;


-- --------------------------------------------------------
-- Contiene información parcial del acudiente
-- USADO EN sp_admin_metricas_usuarios

CREATE OR REPLACE VIEW vw_admin_acudientes AS
SELECT
    u.ID_Usuario,
    CONCAT('ACU-', u.ID_Usuario) AS ID_Formateado,
    TRIM(CONCAT(
        p.Primer_Nombre,  ' ',
        COALESCE(p.Segundo_Nombre,  ''), ' ',
        p.Primer_Apellido, ' ',
        COALESCE(p.Segundo_Apellido, '')
    )) AS Nombre_Completo,
    u.Doble_Factor_Activo AS MFA,
    da.Email,
    (SELECT COUNT(*) FROM tbl_ticket t
     WHERE t.FK_ID_Usuario_Creador = u.ID_Usuario
       AND t.Estado_Ticket = 1) AS Total_Solicitudes,
    u.Estado_Usuario,
    CASE u.Estado_Usuario WHEN 1 THEN 'Activo' ELSE 'Eliminado' END AS Estado_Texto,
    u.Ultimo_Login
FROM tbl_usuario u
INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
LEFT JOIN tbl_datos_adicionales da ON da.FK_ID_Persona = p.ID_Persona
WHERE r.Nombre_Rol = 'Acudiente';

-- --------------------------------------------------------
-- Contiene información parcial del estudiante
-- USADO EN sp_admin_estudiantes_listar

CREATE OR REPLACE VIEW vw_admin_estudiantes AS
SELECT
    e.ID_Estudiante,
    CONCAT('EST-', e.ID_Estudiante) AS ID_Formateado,
    CONCAT(pe.Primer_Nombre, ' ', pe.Primer_Apellido) AS Nombre_Estudiante,
    CONCAT(pa.Primer_Nombre, ' ', pa.Primer_Apellido) AS Nombre_Acudiente,
    TIMESTAMPDIFF(YEAR, pe.Fecha_Nacimiento, CURDATE()) AS Edad,
    g.Nombre_Genero AS Genero,
    e.Estado_Estudiante,
    CASE e.Estado_Estudiante WHEN 1 THEN 'Activo' ELSE 'Eliminado' END AS Estado_Texto
FROM tbl_estudiante e
INNER JOIN tbl_persona pe ON e.FK_ID_Persona = pe.ID_Persona
INNER JOIN tbl_usuario ua ON e.FK_ID_Acudiente = ua.ID_Usuario
INNER JOIN tbl_persona pa ON ua.FK_ID_Persona = pa.ID_Persona
INNER JOIN tbl_genero g ON e.FK_ID_Genero = g.ID_Genero;


-- --------------------------------------------------------
-- Contiene información parcial de los tecnicos
-- USADO EN sp_admin_tecnicos_listar | sp_admin_metricas_funcionarios

CREATE OR REPLACE VIEW vw_admin_tecnicos AS
SELECT
    u.ID_Usuario,
    CONCAT('TEC-', u.ID_Usuario) AS ID_Formateado,
    CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo,
    da.Email,
    (SELECT COUNT(*) FROM tbl_ticket t
     INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
     WHERE t.FK_ID_Usuario_Tecnico = u.ID_Usuario
       AND et.Estado_Final = 0) AS Casos_Asignados,
    (SELECT COUNT(*) FROM tbl_ticket t
     INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
     WHERE t.FK_ID_Usuario_Tecnico = u.ID_Usuario
       AND et.Estado_Final = 1) AS Casos_Cerrados,
    u.Estado_Usuario,
    CASE u.Estado_Usuario WHEN 1 THEN 'Activo' ELSE 'Desactivado' END AS Estado_Texto,
    u.Ultimo_Login
FROM tbl_usuario u
INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
LEFT  JOIN tbl_datos_adicionales da ON da.FK_ID_Persona = p.ID_Persona
WHERE r.Nombre_Rol = 'Tecnico';


-- --------------------------------------------------------
-- Contiene información parcial de los administradores
-- USADO EN sp_admin_administradores_listar | sp_admin_metricas_funcionarios

CREATE OR REPLACE VIEW vw_admin_administradores AS
SELECT
    u.ID_Usuario,
    CONCAT('ADM-', LPAD(u.ID_Usuario, 4, '0')) AS ID_Formateado,
    CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo,
    u.Ultimo_Login,
    u.Estado_Usuario,
    CASE u.Estado_Usuario WHEN 1 THEN 'Activo' ELSE 'Desactivado' END AS Estado_Texto
FROM tbl_usuario u
INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
WHERE r.Nombre_Rol = 'Admin';



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE HISTORY (ADMIN)
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Retorna todos los datos de los comentarios de auditoría de un ticket específico, incluyendo información del usuario que hizo el comentario y su rol.
-- USADO EN sp_history_listar_auditoria | sp_history_contar_auditoria | sp_history_exportar_auditoria

CREATE OR REPLACE VIEW vw_auditoria_comentarios AS
SELECT
    tc.ID_Ticket_Comentario,
    tc.Tipo_Evento,
    tc.Comentario,
    tc.Fecha_Comentario,
    tc.Es_Interno,
    tc.FK_ID_Ticket,
    tc.Estado_Comentario_Ticket,
    u.ID_Usuario,
    r.Nombre_Rol,
    CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo_Usuario
FROM tbl_ticket_comentario tc
INNER JOIN tbl_usuario u ON tc.FK_ID_Usuario = u.ID_Usuario
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol;



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE SCHOOL_STATUS (ADMIN)
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Agrega totales de cupos y jornadas activas por colegio.
-- USADO EN sp_admin_colegios_estadisticas

CREATE OR REPLACE VIEW vw_colegios_resumen AS
SELECT
    c.ID_Colegio,
    c.Nombre_Colegio,
    c.Codigo_DANE,
    COALESCE(c.Email, '') AS Email,
    COALESCE(c.Telefono, '') AS Telefono,
    c.Direccion_Colegio,
    b.ID_Barrio,
    b.Nombre_Barrio,
    c.Estado_Colegio,
    COALESCE(SUM(CASE WHEN cu.Estado_Cupos = 1 THEN cu.Cupos_Disponibles ELSE 0 END), 0) AS Total_Cupos,
    COALESCE(
        GROUP_CONCAT(
            DISTINCT CASE WHEN cu.Estado_Cupos = 1 THEN j.Nombre_Jornada END
            ORDER BY j.ID_Jornada
            SEPARATOR ','
        ), ''
    ) AS Jornadas_Activas
FROM tbl_colegio c
INNER JOIN tbl_barrio b ON c.FK_ID_Barrio = b.ID_Barrio
LEFT JOIN tbl_cupos cu ON c.ID_Colegio = cu.FK_ID_Colegio
LEFT JOIN tbl_jornada j ON cu.FK_ID_Jornada = j.ID_Jornada
GROUP BY
    c.ID_Colegio, c.Nombre_Colegio, c.Codigo_DANE,
    c.Email, c.Telefono, c.Direccion_Colegio,
    b.ID_Barrio, b.Nombre_Barrio, c.Estado_Colegio;



-- ====================================================================================================================================================
--                                          VIEWS PARA TICKETS
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE TICKET_PANEL (TICKETS)
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Contiene toda la información del estudiante asociada a un ticket
-- USADO EN sp_ticket_panel_estudiante_consultar

CREATE OR REPLACE VIEW vw_ticket_estudiante_detalle AS
SELECT
    t.ID_Ticket,

    e.ID_Estudiante,
    p.ID_Persona,

    -- Identificación
    ti.Nombre_Tipo_Iden,
    p.Num_Doc_Persona AS Numero_Documento,

    -- Datos personales
    p.Primer_Nombre,
    p.Segundo_Nombre,
    p.Primer_Apellido,
    p.Segundo_Apellido,
    p.Fecha_Nacimiento,

    -- Edad calculada dinámicamente
    TIMESTAMPDIFF(YEAR, p.Fecha_Nacimiento, CURDATE()) AS Edad,

    -- Demográficos
    gen.Nombre_Genero,
    gp.Nombre_Grupo_Preferencial,

    -- Académicos
    g_act.Nombre_Grado AS Nombre_Grado_Actual,
    g_prx.Nombre_Grado AS Nombre_Grado_Proximo,

    -- Colegio anterior
    col.Nombre_Colegio AS Nombre_Colegio_Anterior

FROM tbl_ticket t
INNER JOIN tbl_estudiante e ON t.FK_ID_Estudiante = e.ID_Estudiante
INNER JOIN tbl_persona p ON e.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_tipo_identificacion ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
INNER JOIN tbl_genero gen ON e.FK_ID_Genero = gen.ID_Genero
INNER JOIN tbl_grupo_preferencial gp ON e.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
INNER JOIN tbl_grado g_act ON e.FK_ID_Grado_Actual = g_act.ID_Grado
LEFT JOIN tbl_grado g_prx ON e.FK_ID_Grado_Proximo = g_prx.ID_Grado
INNER JOIN tbl_colegio col ON e.FK_ID_Colegio_Anterior = col.ID_Colegio;


-- --------------------------------------------------------
-- Contiene información completa del acudiente (usuario creador del ticket)
-- USADO EN sp_ticket_panel_acudiente_consultar

CREATE OR REPLACE VIEW vw_ticket_acudiente_detalle AS
SELECT
    t.ID_Ticket,

    p.ID_Persona,

    -- Identificación
    p.Num_Doc_Persona AS Numero_Documento,
    ti.Nombre_Tipo_Iden,

    -- Nombre
    p.Primer_Nombre,
    p.Segundo_Nombre,
    p.Primer_Apellido,
    p.Segundo_Apellido,

    -- Contacto
    da.Email,
    da.Telefono,

    -- Ubicación
    b.Nombre_Barrio,
    loc.Nombre_Localidad,
    est.Nombre_Estrato,

    -- Demográficos
    gen.Nombre_Genero,
    gp.Nombre_Grupo_Preferencial,
    par.Nombre_Parentesco,

    -- Metadatos
    u.Fecha_Creacion,

    -- Campos calculados
    CONCAT(LEFT(p.Primer_Nombre,1), LEFT(p.Primer_Apellido,1)) AS Iniciales,
    CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo

FROM tbl_ticket t
INNER JOIN tbl_usuario u ON t.FK_ID_Usuario_Creador = u.ID_Usuario
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_datos_adicionales da ON da.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_tipo_identificacion ti ON da.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
INNER JOIN tbl_barrio b ON da.FK_ID_Barrio = b.ID_Barrio
INNER JOIN tbl_localidad loc ON b.FK_ID_Localidad = loc.ID_Localidad
INNER JOIN tbl_estrato est ON da.FK_ID_Estrato = est.ID_Estrato
INNER JOIN tbl_genero gen ON da.FK_ID_Genero = gen.ID_Genero
INNER JOIN tbl_grupo_preferencial gp ON da.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
INNER JOIN tbl_parentesco par ON da.FK_ID_Parentesco = par.ID_Parentesco;


-- --------------------------------------------------------
-- Consolida toda la información del ticket para el panel
-- USADO EN sp_ticket_panel_consultar_detalle

CREATE OR REPLACE VIEW vw_ticket_panel_detalle AS
SELECT
    t.ID_Ticket,
    t.Titulo_Ticket,
    t.Descripcion_Ticket,
    t.Fecha_Creacion,
    t.Fecha_Cierre,
    t.Puntaje_Prioridad,
    t.FK_ID_Cupo_Asignado,

    -- Estado
    et.ID_Estado_Ticket,
    et.Nombre_Estado,

    -- Técnico
    t.FK_ID_Usuario_Tecnico AS ID_Tecnico,
    CONCAT(pt.Primer_Nombre, ' ', pt.Primer_Apellido) AS Nombre_Tecnico,

    -- Estudiante
    CONCAT(pe.Primer_Nombre, ' ', pe.Primer_Apellido) AS Nombre_Estudiante,
    g_act.Nombre_Grado AS Grado_Actual,
    g_prx.Nombre_Grado AS Grado_Proximo,

    -- Preferencias
    COALESCE(col_pref.Nombre_Colegio, 'Sin preferencia') AS Colegio_Preferencia,
    jor.Nombre_Jornada,
    afec.Nombre_Afectacion,
    b.Nombre_Barrio,
    tres.Nombre_Tiempo,

    -- Asignación
    COALESCE(col_asig.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,
    cu.ID_Cupos,

    -- Estado final
    CASE WHEN t.Fecha_Cierre IS NOT NULL THEN 1 ELSE 0 END AS Estado_Final

FROM tbl_ticket t
INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
INNER JOIN tbl_estudiante es ON t.FK_ID_Estudiante = es.ID_Estudiante
INNER JOIN tbl_persona pe ON es.FK_ID_Persona = pe.ID_Persona
INNER JOIN tbl_grado g_act ON es.FK_ID_Grado_Actual = g_act.ID_Grado
LEFT JOIN tbl_grado g_prx ON es.FK_ID_Grado_Proximo = g_prx.ID_Grado
INNER JOIN tbl_jornada jor ON t.FK_ID_Jornada_Preferencia = jor.ID_Jornada
INNER JOIN tbl_tipo_afectacion afec ON t.FK_ID_Tipo_Afectacion = afec.ID_Tipo_Afectacion
INNER JOIN tbl_barrio b ON t.FK_ID_Barrio = b.ID_Barrio
LEFT JOIN tbl_tiempo_residencia tres ON t.FK_ID_Tiempo_Residencia = tres.ID_Tiempo_Residencia
LEFT JOIN tbl_colegio col_pref ON t.FK_ID_Colegio_Preferencia = col_pref.ID_Colegio
LEFT JOIN tbl_usuario ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
LEFT JOIN tbl_persona pt ON ut.FK_ID_Persona = pt.ID_Persona
LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
LEFT JOIN tbl_colegio col_asig ON cu.FK_ID_Colegio = col_asig.ID_Colegio

WHERE t.Estado_Ticket = 1;


-- --------------------------------------------------------
-- Vista general para listados de tickets con información resumida
-- USADO EN sp_cases_listar_todos

CREATE OR REPLACE VIEW vw_cases_general AS
SELECT
    t.ID_Ticket,
    t.Titulo_Ticket,
    t.Fecha_Creacion,
    t.Fecha_Cierre,
    t.Puntaje_Prioridad,

    et.Nombre_Estado,
    et.Estado_Final,

    CONCAT(pe.Primer_Nombre, ' ', pe.Primer_Apellido) AS Nombre_Estudiante,
    TIMESTAMPDIFF(YEAR, pe.Fecha_Nacimiento, CURDATE()) AS Edad_Estudiante,

    CONCAT(pa.Primer_Nombre, ' ', pa.Primer_Apellido) AS Nombre_Acudiente,

    COALESCE(g_prx.Nombre_Grado, g_act.Nombre_Grado) AS Nombre_Grado,

    afec.Nombre_Afectacion,

    COALESCE(col_asig.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,

    COALESCE(CONCAT(pt.Primer_Nombre, ' ', pt.Primer_Apellido),'Sin asignar') AS Nombre_Tecnico,

    -- IDs necesarios para filtros
    t.FK_ID_Estado_Ticket,
    es.FK_ID_Grado_Actual,
    es.FK_ID_Grado_Proximo,
    t.FK_ID_Tipo_Afectacion

FROM tbl_ticket t
INNER JOIN tbl_estado_ticket et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
INNER JOIN tbl_estudiante es ON t.FK_ID_Estudiante = es.ID_Estudiante
INNER JOIN tbl_persona pe ON es.FK_ID_Persona = pe.ID_Persona
INNER JOIN tbl_grado g_act ON es.FK_ID_Grado_Actual = g_act.ID_Grado
LEFT JOIN tbl_grado g_prx ON es.FK_ID_Grado_Proximo = g_prx.ID_Grado
INNER JOIN tbl_tipo_afectacion afec ON t.FK_ID_Tipo_Afectacion = afec.ID_Tipo_Afectacion
INNER JOIN tbl_usuario ua ON t.FK_ID_Usuario_Creador = ua.ID_Usuario
INNER JOIN tbl_persona pa ON ua.FK_ID_Persona = pa.ID_Persona
LEFT JOIN tbl_usuario ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
LEFT JOIN tbl_persona pt ON ut.FK_ID_Persona = pt.ID_Persona
LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
LEFT JOIN tbl_colegio col_asig ON cu.FK_ID_Colegio = col_asig.ID_Colegio

WHERE t.Estado_Ticket = 1;


-- --------------------------------------------------------
-- Barrios que tienen al menos un colegio activo
-- USADO EN sp_ticket_panel_acudiente_consultar

CREATE OR REPLACE VIEW vw_barrios_con_colegios AS
SELECT DISTINCT
    b.ID_Barrio,
    b.Nombre_Barrio
FROM tbl_barrio b
INNER JOIN tbl_colegio c
    ON c.FK_ID_Barrio = b.ID_Barrio
    AND c.Estado_Colegio = 1
WHERE b.Estado_Barrio = 1
ORDER BY b.Nombre_Barrio;



-- ====================================================================================================================================================
--                                          VIEWS PARA TECHNICAL
-- ====================================================================================================================================================

-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE DASHBOARD
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Extiende vw_cases_general exponiendo el ID del para poder filtrar por él en los SPs del técnico.
-- USADO EN sp_technical_cases_listar_asignados

CREATE OR REPLACE VIEW vw_cases_tecnico AS
SELECT
    v.*,
    ut.ID_Usuario AS ID_Usuario_Tecnico   -- columna extra para filtros
FROM vw_cases_general v
LEFT JOIN tbl_ticket   t  ON v.ID_Ticket = t.ID_Ticket
LEFT JOIN tbl_usuario  ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario;



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE CASES
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Lista de casos asignados a un tecnico
-- USADO EN sp_technical_cases_listar | sp_technical_cases_metricas

CREATE OR REPLACE VIEW vw_technical_cases AS
SELECT
    -- Identificadores y fechas
    t.ID_Ticket,
    t.Fecha_Creacion,
    t.Puntaje_Prioridad,

    -- FKs raw para filtrado posterior en Python
    t.FK_ID_Estado_Ticket,
    t.FK_ID_Usuario_Tecnico,
    t.FK_ID_Tipo_Afectacion,
    est.FK_ID_Grado_Actual,
    est.FK_ID_Grado_Proximo,

    -- Datos del estudiante
    -- tbl_estudiante no tiene nombre; viene de tbl_persona via FK_ID_Persona
    CONCAT(pe.Primer_Nombre, ' ', pe.Primer_Apellido) AS Nombre_Estudiante,
    TIMESTAMPDIFF(YEAR, pe.Fecha_Nacimiento, CURDATE()) AS Edad_Estudiante,

    -- Acudiente (usuario creador del ticket)
    -- tbl_usuario no tiene nombre; viene de tbl_persona via FK_ID_Persona
    CONCAT(pa.Primer_Nombre, ' ', pa.Primer_Apellido) AS Nombre_Acudiente,

    -- Técnico asignado (LEFT JOIN porque puede ser NULL)
    COALESCE(CONCAT(pt.Primer_Nombre, ' ', pt.Primer_Apellido),'Sin asignar') AS Nombre_Tecnico,

    -- Catálogos en texto
    es.Nombre_Estado,
    es.Estado_Final,
    af.Nombre_Afectacion,

    -- Grado: preferir el próximo grado; si no existe, usar el actual
    COALESCE(gp.Nombre_Grado, ga.Nombre_Grado) AS Nombre_Grado,

    -- Colegio asignado a través del cupo
    COALESCE(co.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado

FROM tbl_ticket t

-- Estudiante y su persona
JOIN tbl_estudiante est ON t.FK_ID_Estudiante = est.ID_Estudiante
JOIN tbl_persona pe ON est.FK_ID_Persona = pe.ID_Persona
-- Acudiente: usuario creador → persona
JOIN tbl_usuario ua ON t.FK_ID_Usuario_Creador = ua.ID_Usuario
JOIN tbl_persona pa ON ua.FK_ID_Persona = pa.ID_Persona
-- Técnico asignado → persona (opcional)
LEFT JOIN tbl_usuario ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
LEFT JOIN tbl_persona pt ON ut.FK_ID_Persona = pt.ID_Persona
-- Catálogos obligatorios
JOIN tbl_estado_ticket es ON t.FK_ID_Estado_Ticket = es.ID_Estado_Ticket
JOIN tbl_tipo_afectacion af ON t.FK_ID_Tipo_Afectacion = af.ID_Tipo_Afectacion
-- Grados (actual siempre existe; próximo puede ser NULL)
JOIN tbl_grado ga ON est.FK_ID_Grado_Actual = ga.ID_Grado
LEFT JOIN tbl_grado gp ON est.FK_ID_Grado_Proximo = gp.ID_Grado
-- Cupo y colegio asignados (opcionales)
LEFT JOIN tbl_cupos cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
LEFT JOIN tbl_colegio co ON cu.FK_ID_Colegio = co.ID_Colegio

WHERE t.Estado_Ticket = 1;


-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE HISTORY
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Información completa de los comentarios de auditoría de un ticket específico hechos por un tecnico en especifico
-- USADO EN sp_technical_history_listar_todos | vw_auditoria_comentarios_tecnico

CREATE OR REPLACE VIEW vw_auditoria_comentarios_tecnico AS
SELECT
    tc.ID_Ticket_Comentario,
    tc.Tipo_Evento,
    tc.Comentario,
    tc.Fecha_Comentario,
    tc.Es_Interno,
    tc.FK_ID_Ticket,
    tc.FK_ID_Usuario, -- FK expuesta para filtrar por técnico en SP
    tc.Estado_Comentario_Ticket,
    u.ID_Usuario,
    r.Nombre_Rol,
    CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo_Usuario
FROM tbl_ticket_comentario tc
INNER JOIN tbl_usuario u ON tc.FK_ID_Usuario = u.ID_Usuario
INNER JOIN tbl_persona p ON u.FK_ID_Persona = p.ID_Persona
INNER JOIN tbl_rol r ON u.FK_ID_Rol = r.ID_Rol;
