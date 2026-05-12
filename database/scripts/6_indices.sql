-- ============================================================
-- tbl_ticket_comentario  (History)
-- Soportan ORDER BY Fecha_Comentario DESC y los tres filtros
-- ============================================================
CREATE INDEX idx_tc_fecha
    ON tbl_ticket_comentario (Fecha_Comentario DESC);

CREATE INDEX idx_tc_tipo_fecha
    ON tbl_ticket_comentario (Tipo_Evento, Fecha_Comentario DESC);

-- ============================================================
-- tbl_ticket  (Cases)
-- Soportan ORDER BY Puntaje_Prioridad / Fecha_Creacion y filtros
-- ============================================================
CREATE INDEX idx_ticket_prioridad
    ON tbl_ticket (Puntaje_Prioridad DESC, Fecha_Creacion DESC);

CREATE INDEX idx_ticket_estado_prioridad
    ON tbl_ticket (FK_ID_Estado_Ticket, Puntaje_Prioridad DESC);

CREATE INDEX idx_ticket_afectacion
    ON tbl_ticket (FK_ID_Tipo_Afectacion);

-- ============================================================
-- tbl_usuario  (Accounts / acudientes)
-- Soportan ORDER BY ID_Usuario DESC y filtro por Estado
-- ============================================================
CREATE INDEX idx_usuario_estado_id
    ON tbl_usuario (Estado_Usuario, ID_Usuario DESC);

-- ============================================================
-- tbl_estudiante  (Accounts / estudiantes)
-- Soportan ORDER BY ID_Estudiante DESC y filtro por Estado
-- ============================================================
CREATE INDEX idx_estudiante_estado_id
    ON tbl_estudiante (Estado_Estudiante, ID_Estudiante DESC);