USE FORTRESS_EDUCA_DB;

-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE PROFILE
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Obtener todos los estudiantes de un acudiente (lista para tarjetas)
-- USADO EN sp_perfil_estudiantes_por_acudiente | sp_tbl_ticket_consultar_detalle | sp_tbl_ticket_cerrado_consultar_por_usuario

CREATE OR REPLACE VIEW vw_estudiante_detalle AS
SELECT
    e.ID_Estudiante,
    e.FK_ID_Acudiente,
    e.Estado_Estudiante,

    p.ID_Persona,
    p.Primer_Nombre,
    p.Segundo_Nombre,
    p.Primer_Apellido,
    p.Segundo_Apellido,
    p.Fecha_Nacimiento,
    p.Num_Doc_Persona,

    ti.Nombre_Tipo_Iden,

    g.Nombre_Genero,
    gp.Nombre_Grupo_Preferencial,

    gr_a.Nombre_Grado AS Grado_Actual,
    gr_p.Nombre_Grado AS Grado_Proximo,

    c.Nombre_Colegio

FROM TBL_ESTUDIANTE e
INNER JOIN TBL_PERSONA p ON e.FK_ID_Persona = p.ID_Persona
INNER JOIN TBL_TIPO_IDENTIFICACION ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
INNER JOIN TBL_GENERO g ON e.FK_ID_Genero = g.ID_Genero
INNER JOIN TBL_GRUPO_PREFERENCIAL gp ON e.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
INNER JOIN TBL_GRADO gr_a ON e.FK_ID_Grado_Actual = gr_a.ID_Grado
LEFT JOIN TBL_GRADO gr_p ON e.FK_ID_Gardo_Proximo = gr_p.ID_Grado
LEFT JOIN TBL_COLEGIO c ON e.FK_ID_Colegio_Anterior = c.ID_Colegio;



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE STATUS
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

FROM TBL_TICKET_COMENTARIO tc
INNER JOIN TBL_USUARIO u ON tc.FK_ID_Usuario = u.ID_Usuario
INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
INNER JOIN TBL_ROL r ON u.FK_ID_Rol = r.ID_Rol;


-- --------------------------------------------------------
-- Obtener datos completos de un ticket específico
-- USADO EN sp_tbl_ticket_consultar_detalle | sp_tbl_ticket_cerrado_consultar_por_usuario

CREATE OR REPLACE VIEW vw_ticket_base AS
SELECT
    t.ID_Ticket,
    t.Titulo_Ticket,
    t.Descripcion_Ticket,
    t.Fecha_Creacion,
    t.Fecha_Cierre,
    t.Puntaje_Prioridad,
    t.FK_ID_Usuario_Creador,
    t.FK_ID_Estudiante,

    et.Nombre_Estado,
    et.Estado_Final,

    ta.Nombre_Afectacion,
    ta.Nivel_Prioridad_TC

FROM TBL_TICKET t
INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
INNER JOIN TBL_TIPO_AFECTACION ta ON t.FK_ID_Tipo_Afectacion = ta.ID_Tipo_Afectacion;



-- ====================================================================================================================================================
-- VIEWS PARA LA PAGINA DE TICKET_OANEL
-- ====================================================================================================================================================

-- --------------------------------------------------------
-- Contiene toda la información del estudiante asociada a un ticket
-- USADO EN sp_ticket_panel_estudiante_consultar

CREATE VIEW vw_ticket_estudiante_detalle AS
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

FROM TBL_TICKET t
INNER JOIN TBL_ESTUDIANTE e ON t.FK_ID_Estudiante = e.ID_Estudiante
INNER JOIN TBL_PERSONA p ON e.FK_ID_Persona = p.ID_Persona
INNER JOIN TBL_TIPO_IDENTIFICACION ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
INNER JOIN TBL_GENERO gen ON e.FK_ID_Genero = gen.ID_Genero
INNER JOIN TBL_GRUPO_PREFERENCIAL gp ON e.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
INNER JOIN TBL_GRADO g_act ON e.FK_ID_Grado_Actual = g_act.ID_Grado
LEFT JOIN TBL_GRADO g_prx ON e.FK_ID_Gardo_Proximo = g_prx.ID_Grado
INNER JOIN TBL_COLEGIO col ON e.FK_ID_Colegio_Anterior = col.ID_Colegio;


-- --------------------------------------------------------
-- Contiene información completa del acudiente (usuario creador del ticket)
-- USADO EN sp_ticket_panel_acudiente_consultar

CREATE VIEW vw_ticket_acudiente_detalle AS
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

FROM TBL_TICKET t
INNER JOIN TBL_USUARIO u ON t.FK_ID_Usuario_Creador = u.ID_Usuario
INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
INNER JOIN TBL_DATOS_ADICIONALES da ON da.FK_ID_Persona = p.ID_Persona
INNER JOIN TBL_TIPO_IDENTIFICACION ti ON da.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
INNER JOIN TBL_BARRIO b ON da.FK_ID_Barrio = b.ID_Barrio
INNER JOIN TBL_LOCALIDAD loc ON b.FK_ID_Localidad = loc.ID_Localidad
INNER JOIN TBL_ESTRATO est ON da.FK_ID_Estrato = est.ID_Estrato
INNER JOIN TBL_GENERO gen ON da.FK_ID_Genero = gen.ID_Genero
INNER JOIN TBL_GRUPO_PREFERENCIAL gp ON da.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
INNER JOIN TBL_PARENTESCO par ON da.FK_ID_Parentesco = par.ID_Parentesco;


-- --------------------------------------------------------
-- Consolida toda la información del ticket para el panel
-- USADO EN sp_ticket_panel_consultar_detalle

CREATE VIEW vw_ticket_panel_detalle AS
SELECT
    t.ID_Ticket,
    t.Titulo_Ticket,
    t.Descripcion_Ticket,
    t.Fecha_Creacion,
    t.Fecha_Cierre,
    t.Puntaje_Prioridad,

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
    tres.Nombre_Tiempo_Residencia,

    -- Asignación
    COALESCE(col_asig.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,
    cu.ID_Cupos,

    -- Estado final
    CASE WHEN t.Fecha_Cierre IS NOT NULL THEN 1 ELSE 0 END AS Estado_Final

FROM TBL_TICKET t
INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
INNER JOIN TBL_ESTUDIANTE es ON t.FK_ID_Estudiante = es.ID_Estudiante
INNER JOIN TBL_PERSONA pe ON es.FK_ID_Persona = pe.ID_Persona
INNER JOIN TBL_GRADO g_act ON es.FK_ID_Grado_Actual = g_act.ID_Grado
LEFT JOIN TBL_GRADO g_prx ON es.FK_ID_Gardo_Proximo = g_prx.ID_Grado
INNER JOIN TBL_JORNADA jor ON t.FK_ID_Jornada_Preferencia = jor.ID_Jornada
INNER JOIN TBL_TIPO_AFECTACION afec ON t.FK_ID_Tipo_Afectacion = afec.ID_Tipo_Afectacion
INNER JOIN TBL_BARRIO b ON t.FK_ID_Barrio = b.ID_Barrio
LEFT JOIN TBL_TIEMPO_RESIDENCIA tres ON t.FK_ID_Tiempo_Residencia = tres.ID_Tiempo_Residencia
LEFT JOIN TBL_COLEGIO col_pref ON t.FK_ID_Colegio_Preferencia = col_pref.ID_Colegio
LEFT JOIN TBL_USUARIO ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
LEFT JOIN TBL_PERSONA pt ON ut.FK_ID_Persona = pt.ID_Persona
LEFT JOIN TBL_CUPOS cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
LEFT JOIN TBL_COLEGIO col_asig ON cu.FK_ID_Colegio = col_asig.ID_Colegio

WHERE t.Estado_Ticket = 1;


-- --------------------------------------------------------
-- Vista general para listados de tickets con información resumida
-- USADO EN sp_cases_listar_todos

CREATE VIEW vw_cases_general AS
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
    es.FK_ID_Gardo_Proximo,
    t.FK_ID_Tipo_Afectacion

FROM TBL_TICKET t
INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
INNER JOIN TBL_ESTUDIANTE es ON t.FK_ID_Estudiante = es.ID_Estudiante
INNER JOIN TBL_PERSONA pe ON es.FK_ID_Persona = pe.ID_Persona
INNER JOIN TBL_GRADO g_act ON es.FK_ID_Grado_Actual = g_act.ID_Grado
LEFT JOIN TBL_GRADO g_prx ON es.FK_ID_Gardo_Proximo = g_prx.ID_Grado
INNER JOIN TBL_TIPO_AFECTACION afec ON t.FK_ID_Tipo_Afectacion = afec.ID_Tipo_Afectacion
INNER JOIN TBL_USUARIO ua ON t.FK_ID_Usuario_Creador = ua.ID_Usuario
INNER JOIN TBL_PERSONA pa ON ua.FK_ID_Persona = pa.ID_Persona
LEFT JOIN TBL_USUARIO ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
LEFT JOIN TBL_PERSONA pt ON ut.FK_ID_Persona = pt.ID_Persona
LEFT JOIN TBL_CUPOS cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
LEFT JOIN TBL_COLEGIO col_asig ON cu.FK_ID_Colegio = col_asig.ID_Colegio

WHERE t.Estado_Ticket = 1;
