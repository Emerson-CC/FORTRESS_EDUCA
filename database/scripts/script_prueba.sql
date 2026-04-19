-- ESTE PROCEDURE

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

        et.Nombre_Estado,
        et.Estado_Final,

        ta.Nombre_Afectacion,
        ta.Nivel_Prioridad_TC,

        CONCAT(pe.Primer_Nombre, ' ', COALESCE(pe.Segundo_Nombre, ''), ' ', pe.Primer_Apellido, ' ', COALESCE(pe.Segundo_Apellido, '')) AS Nombre_Estudiante,
        g_act.Nombre_Grado AS Grado_Actual,
        g_prox.Nombre_Grado AS Grado_Proximo,

        j.Nombre_Jornada AS Jornada_Preferencia,
        COALESCE(cp.Nombre_Colegio, 'Sin preferencia') AS Colegio_Preferencia,

        COALESCE(c_asig.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,

        CONCAT(pt.Primer_Nombre, ' ', pt.Primer_Apellido) AS Nombre_Tecnico,

        b.Nombre_Barrio,
        tr.Nombre_Tiempo AS Tiempo_Residencia

    FROM TBL_TICKET t
    INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    INNER JOIN TBL_TIPO_AFECTACION ta ON t.FK_ID_Tipo_Afectacion = ta.ID_Tipo_Afectacion
    INNER JOIN TBL_ESTUDIANTE est ON t.FK_ID_Estudiante = est.ID_Estudiante
    INNER JOIN TBL_PERSONA pe ON est.FK_ID_Persona = pe.ID_Persona
    INNER JOIN TBL_GRADO g_act ON est.FK_ID_Grado_Actual = g_act.ID_Grado
    LEFT  JOIN TBL_GRADO g_prox ON est.FK_ID_Gardo_Proximo = g_prox.ID_Grado
    INNER JOIN TBL_JORNADA j ON t.FK_ID_Jornada_Preferencia = j.ID_Jornada
    LEFT  JOIN TBL_COLEGIO cp ON t.FK_ID_Colegio_Preferencia = cp.ID_Colegio
    LEFT  JOIN TBL_CUPOS cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT  JOIN TBL_COLEGIO c_asig ON cu.FK_ID_Colegio = c_asig.ID_Colegio
    LEFT  JOIN TBL_USUARIO ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
    LEFT  JOIN TBL_PERSONA pt ON ut.FK_ID_Persona = pt.ID_Persona
    INNER JOIN TBL_BARRIO b ON t.FK_ID_Barrio = b.ID_Barrio
    LEFT  JOIN TBL_TIEMPO_RESIDENCIA tr ON t.FK_ID_Tiempo_Residencia = tr.ID_Tiempo_Residencia

    WHERE t.ID_Ticket = p_id_ticket
      AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND t.Estado_Ticket = 1;
END $$
DELIMITER ;


-- Hace lo mismo que lo siguiente?


DROP PROCEDURE IF EXISTS sp_tbl_ticket_consultar_detalle;

DELIMITER $$
CREATE PROCEDURE sp_tbl_ticket_consultar_detalle(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.*,

        CONCAT(e.Primer_Nombre, ' ', e.Primer_Apellido) AS Nombre_Estudiante,
        e.Nombre_Grado_Actual,
        e.Nombre_Grado_Proximo,

        j.Nombre_Jornada,
        b.Nombre_Barrio,

        tr.Nombre_Tiempo

    FROM vw_ticket_base t
    INNER JOIN vw_estudiante_detalle e ON t.FK_ID_Estudiante = e.ID_Estudiante
    INNER JOIN TBL_TICKET t_real ON t.ID_Ticket = t_real.ID_Ticket

    INNER JOIN TBL_JORNADA j ON t_real.FK_ID_Jornada_Preferencia = j.ID_Jornada
    INNER JOIN TBL_BARRIO b ON t_real.FK_ID_Barrio = b.ID_Barrio
    LEFT JOIN TBL_TIEMPO_RESIDENCIA tr ON t_real.FK_ID_Tiempo_Residencia = tr.ID_Tiempo_Residencia

    WHERE t.ID_Ticket = p_id_ticket
      AND t.FK_ID_Usuario_Creador = p_id_usuario;
END $$
DELIMITER ;


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
LEFT JOIN TBL_GRADO gr_p ON e.FK_ID_Grado_Proximo = gr_p.ID_Grado
LEFT JOIN TBL_COLEGIO c ON e.FK_ID_Colegio_Anterior = c.ID_Colegio;