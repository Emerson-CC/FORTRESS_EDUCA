from app.utils.database_utils import db

# ====================================================================================================================================================
#                                           PAGINA DASHBOARD.HTML
# ====================================================================================================================================================

def sp_dashboard_metricas() -> dict | None:
    """Retorna las métricas agregadas para el dashboard del admin"""
    resultado = db.call_procedure("sp_dashboard_metricas", ())
    return resultado[0] if resultado else None

def sp_dashboard_chart_actividad() -> list[dict]:
    """Retorna la actividad de solicitudes de los últimos 7 días para el gráfico del dashboard"""
    return db.call_procedure("sp_dashboard_chart_actividad", ()) or []
    

# ====================================================================================================================================================
#                                           PAGINA CASES.HTML
# ====================================================================================================================================================


def sp_cases_listar_todos(id_estado: int | None = None, id_grado: int | None = None, id_afectacion: int | None = None) -> list[dict]:
    """Retorna todos los tickets activos con soporte de filtros opcionales"""
    return db.call_procedure(
        "sp_cases_listar_todos",
        (id_estado, id_grado, id_afectacion),
    ) or []
 
 
def sp_cases_metricas() -> dict | None:
    """Retorna las métricas agregadas para las tarjetas superiores"""
    resultado = db.call_procedure("sp_cases_metricas", ())
    return resultado[0] if resultado else None
 
 
# Catálogos para los filtros
 
def sp_catalogo_estados_ticket() -> list[dict]:
    """Estados del ticket activos (para el <select> de filtro de estado)."""
    return db.call_procedure("sp_catalogo_estados_ticket", ()) or []
 
 
def sp_catalogo_grados() -> list[dict]:
    """Grados disponibles (para el <select> de filtro de grado)."""
    return db.call_procedure("sp_catalogo_grados", ()) or []
 
 
def sp_catalogo_tipo_afectacion() -> list[dict]:
    """Tipos de afectación (para el <select> de filtro de afectación)."""
    return db.call_procedure("sp_catalogo_tipo_afectacion", ()) or []



# ====================================================================================================================================================
#                                           PAGINA TICKET_PANEL.HTML
# ====================================================================================================================================================

# DETALLE DEL TICKET

def sp_ticket_panel_consultar_detalle(id_ticket) -> dict | None:
    """Retorna todos los datos del ticket para el panel del técnico."""
    resultado = db.call_procedure("sp_ticket_panel_consultar_detalle", (id_ticket,))
    return resultado[0] if resultado else None


# COMENTARIOS

def sp_ticket_panel_comentarios_consultar(id_ticket) -> list[dict]:
    """ Retorna TODOS los comentarios del ticket (públicos e internos)"""
    return db.call_procedure("sp_ticket_panel_comentarios_consultar", (id_ticket,)) or []


def sp_ticket_panel_comentario_insertar(id_ticket, tipo_evento, id_usuario, comentario, es_interno) -> None:
    """Inserta un comentario en el ticket"""
    db.call_procedure(
        "sp_ticket_panel_comentario_insertar",
        (id_ticket, tipo_evento, id_usuario, comentario, int(es_interno)),
    )


# ASIGNACIÓN DE CUPO
def sp_ticket_validar_cupo(id_ticket: str, id_colegio: int, id_jornada: int) -> dict | None:
    """Verifica si existe cupo disponible para la combinación grado (del estudiante) + colegio + jornada"""
    resultado = db.call_procedure(
        "sp_ticket_validar_cupo", (id_ticket, id_colegio, id_jornada)
    )
    return resultado[0] if resultado else None


def sp_ticket_confirmar_asignacion(id_ticket: str, id_cupo: int, id_tecnico: int) -> None:
    """Asigna el cupo al ticket, cambia estado a 4 e inserta el comentario público automático"""
    db.call_procedure(
        "sp_ticket_confirmar_asignacion", (id_ticket, id_cupo, id_tecnico)
    )

    # GESTIÓN DE DTICKET ABANDONADOS
def sp_ticket_obtener_abandonados() -> list[dict]:
    """Retorna tickets en estado 4 sin respuesta del usuario en +3 días"""
    return db.call_procedure("sp_ticket_obtener_abandonados", ()) or []


def sp_ticket_rechazar_abandonado(id_ticket: str, id_responsable: int) -> None:
    """Cierra el ticket como Rechazado y registra el comentario automático"""
    db.call_procedure(
        "sp_ticket_rechazar_abandonado", (id_ticket, id_responsable)
    )


# CAMBIO DE ESTADO

def sp_ticket_panel_estado_actualizar(id_ticket, id_estado_nuevo, fecha_cierre, resolucion, id_tecnico,) -> None:
    """Actualiza el estado del ticket y registra automáticamente un comentario interno de auditoría con el cambio"""
    db.call_procedure(
        "sp_ticket_panel_estado_actualizar",
        (id_ticket, id_estado_nuevo, fecha_cierre, resolucion, id_tecnico),
    )


# DOCUMENTOS

def sp_ticket_panel_documentos_consultar(id_ticket) -> list[dict]:
    """Retorna la lista de documentos del ticket (sin restricción de usuario)"""
    return db.call_procedure("sp_ticket_panel_documentos_consultar", (id_ticket,)) or []


def sp_ticket_panel_documento_descargar(id_doc) -> dict | None:
    """Retorna el binario y metadata del documento para descarga"""
    resultado = db.call_procedure("sp_ticket_panel_documento_descargar", (id_doc,))
    return resultado[0] if resultado else None


def sp_ticket_panel_documento_insertar(id_ticket, id_tipo_doc, archivo, nombre_original) -> None:
    """Inserta un documento subido por el técnico al ticket."""
    db.call_procedure(
        "sp_documento_ticket_insertar",
        (id_ticket, id_tipo_doc, archivo, nombre_original),
    )


# DATOS DEL ACUDIENTE Y ESTUDIANTE (solo lectura)

def sp_ticket_panel_acudiente_consultar(id_ticket) -> dict | None:
    """Retorna los datos del acudiente creador del ticket."""
    resultado = db.call_procedure("sp_ticket_panel_acudiente_consultar", (id_ticket,))
    return resultado[0] if resultado else None


def sp_ticket_panel_estudiante_consultar(id_ticket) -> dict | None:
    """Retorna los datos del estudiante asociado al ticket."""
    resultado = db.call_procedure("sp_ticket_panel_estudiante_consultar", (id_ticket,))
    return resultado[0] if resultado else None


# CATÁLOGOS PARA SELECTFIELDS

def sp_catalogo_estados_ticket() -> list[dict]:
    """Retorna todos los estados del ticket para poblar el SelectField."""
    return db.call_procedure("sp_catalogo_estados_ticket", ()) or []


def sp_catalogo_jornadas() -> list[dict]:
    """Retorna todas las jornadas disponibles."""
    return db.call_procedure("sp_catalogo_jornadas", ()) or []


def sp_tipo_documento_consultar() -> list[dict]:
    """Retorna los tipos de documento activos (reutilizado del módulo acudiente)."""
    return db.call_procedure("sp_tbl_tipo_documento_consultar", ()) or []

    # ASIGNACIÓN DE CUPO

def sp_catalogo_barrios_con_colegios() -> list[dict]:
    """Barrios que tienen al menos un colegio activo (usa VW_BARRIOS_CON_COLEGIOS)."""
    return db.call_procedure("sp_catalogo_barrios_con_colegios", ()) or []

def sp_catalogo_colegios_por_barrio(id_barrio: int) -> list[dict]:
    """Colegios activos dentro del barrio indicado."""
    return db.call_procedure("sp_catalogo_colegios_por_barrio", (id_barrio,)) or []


    # 
    
def sp_ticket_cupo_asignado_detalle(id_ticket: str) -> dict | None:
    """Retorna toda la info del cupo actualmente asignado al ticket."""
    resultado = db.call_procedure("sp_ticket_cupo_asignado_detalle", (id_ticket,))
    return resultado[0] if resultado else None


def sp_ticket_usuario_confirmar_cupo(id_ticket: str, id_tecnico: int) -> None:
    """Confirma el cupo: descuenta disponible+reservado, cierra ticket como Solucionado."""
    db.call_procedure("sp_ticket_usuario_confirmar_cupo", (id_ticket, id_tecnico))


def sp_ticket_usuario_cancelar_cupo(id_ticket: str, id_tecnico: int) -> None:
    """Cancela el cupo: libera reserva, quita FK_ID_Cupo_Asignado, vuelve a estado 5."""
    db.call_procedure("sp_ticket_usuario_cancelar_cupo", (id_ticket, id_tecnico))

# ====================================================================================================================================================
#                                           PAGINA ACCOUNTS.HTML
# ====================================================================================================================================================

def sp_admin_metricas_accounts():
    resultado = db.call_procedure("sp_admin_metricas_accounts", ())
    return resultado[0] if resultado else {}

def sp_admin_roles_consultar():
    return db.call_procedure("sp_tbl_rol_consultar", ()) or []

def sp_admin_eventos_acceso_consultar():
    return db.call_procedure("sp_admin_eventos_acceso_consultar", ()) or []

def sp_admin_eventos_auditoria_consultar():
    return db.call_procedure("sp_admin_eventos_auditoria_consultar", ()) or []

def sp_admin_navegadores_consultar():
    return db.call_procedure("sp_admin_navegadores_consultar", ()) or []

def sp_admin_historial_acceso_listar(id_rol=None, evento=None, navegador=None):
    return db.call_procedure(
        "sp_admin_historial_acceso_listar",
        (id_rol, evento, navegador)
    ) or []

def sp_admin_historial_acciones_listar(id_rol=None, evento=None):
    return db.call_procedure(
        "sp_admin_historial_acciones_listar",
        (id_rol, evento)
    ) or []



# ====================================================================================================================================================
#                                           PAGINA ACCOUNTS_USER.HTML
# ====================================================================================================================================================

def sp_admin_metricas_usuarios():
    resultado = db.call_procedure("sp_admin_metricas_usuarios", ())
    return resultado[0] if resultado else {}

def sp_admin_acudientes_listar():
    return db.call_procedure("sp_admin_acudientes_listar", ()) or []

def sp_admin_estudiantes_listar():
    return db.call_procedure("sp_admin_estudiantes_listar", ()) or []

def sp_admin_toggle_estado_usuario(id_usuario, nuevo_estado, ejecutor_id, ip, user_agent):
    return db.call_procedure(
        "sp_admin_toggle_estado_usuario",
        (id_usuario, nuevo_estado, ejecutor_id, ip, user_agent),
        commit=True
    )

def sp_admin_toggle_estado_estudiante(id_estudiante, nuevo_estado, ejecutor_id, ip, user_agent):
    return db.call_procedure(
        "sp_admin_toggle_estado_estudiante",
        (id_estudiante, nuevo_estado, ejecutor_id, ip, user_agent),
        commit=True
    )



# ====================================================================================================================================================
#                                           PAGINA ACCOUNTS_FUNC.HTML
# ====================================================================================================================================================

def sp_admin_metricas_funcionarios():
    resultado = db.call_procedure("sp_admin_metricas_funcionarios", ())
    return resultado[0] if resultado else {}

def sp_admin_tecnicos_listar(estado=None):
    return db.call_procedure(
        "sp_admin_tecnicos_listar",
        (estado,)
    ) or []

def sp_admin_administradores_listar():
    return db.call_procedure("sp_admin_administradores_listar", ()) or []

def sp_admin_toggle_estado_tecnico(id_usuario, nuevo_estado, ejecutor_id, ip, user_agent):
    """Reutiliza el mismo SP que toggle_estado_usuario."""
    return db.call_procedure(
        "sp_admin_toggle_estado_usuario",
        (id_usuario, nuevo_estado, ejecutor_id, ip, user_agent),
        commit=True
    )
    


# ====================================================================================================================================================
#                                           PAGINA HISTORY.HTML
# ====================================================================================================================================================

def sp_history_listar_auditoria(tipo_evento, fecha_desde, fecha_hasta, pagina, por_pagina) -> list[dict]:
    """Retorna los registros de auditoría paginados y filtrados"""
    return (
        db.call_procedure(
            "sp_history_listar_auditoria",
            (tipo_evento, fecha_desde, fecha_hasta, pagina, por_pagina),
        )
        or []
    )

def sp_history_contar_auditoria(tipo_evento, fecha_desde, fecha_hasta) -> int:
    """Retorna el total de registros que coinciden con los filtros."""
    resultado = db.call_procedure(
        "sp_history_contar_auditoria",
        (tipo_evento, fecha_desde, fecha_hasta),
    )
    return resultado[0]["total"] if resultado else 0

def sp_history_exportar_auditoria(tipo_evento, fecha_desde, fecha_hasta) -> list[dict]:
    """Retorna TODOS los registros sin paginar (para CSV)"""
    return (
        db.call_procedure(
            "sp_history_exportar_auditoria",
            (tipo_evento, fecha_desde, fecha_hasta),
        )
        or []
    )