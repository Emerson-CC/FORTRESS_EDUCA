from app.utils.database_utils import db

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

# LISTADO GENERAL

def sp_ticket_panel_listar_todos(id_tecnico: int | None = None) -> list[dict]:
    """Retorna todos los tickets activos"""
    return db.call_procedure("sp_ticket_panel_listar_todos", (id_tecnico,)) or []

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
    """Inserta un comentario manual en el ticket."""
    db.call_procedure(
        "sp_ticket_panel_comentario_insertar",
        (id_ticket, tipo_evento, id_usuario, comentario, int(es_interno)),
    )


# CAMBIO DE ESTADO

def sp_ticket_panel_estado_actualizar(id_ticket, id_estado_nuevo, fecha_cierre, resolucion, id_tecnico,) -> None:
    """Actualiza el estado del ticket y registra automáticamente un comentario interno de auditoría con el cambio"""
    db.call_procedure(
        "sp_ticket_panel_estado_actualizar",
        (id_ticket, id_estado_nuevo, fecha_cierre, resolucion, id_tecnico),
    )


# ASIGNACIÓN DE CUPO

def sp_ticket_panel_asignar_cupo(id_ticket, id_cupo, id_tecnico) -> None:
    """Asigna el cupo seleccionado al ticket y registra el cambio como comentario interno de auditoría"""
    db.call_procedure(
        "sp_ticket_panel_asignar_cupo",
        (id_ticket, id_cupo, id_tecnico),
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


def sp_catalogo_colegios() -> list[dict]:
    """Retorna todos los colegios activos."""
    return db.call_procedure("sp_catalogo_colegios", ()) or []


def sp_catalogo_jornadas() -> list[dict]:
    """Retorna todas las jornadas disponibles."""
    return db.call_procedure("sp_catalogo_jornadas", ()) or []


def sp_catalogo_tipo_afectacion() -> list[dict]:
    """Retorna todos los tipos de afectación."""
    return db.call_procedure("sp_catalogo_tipo_afectacion", ()) or []


def sp_catalogo_cupos_disponibles(id_ticket: str) -> list[dict]:
    """Retorna los cupos disponibles para asignar al ticket indicado."""
    return db.call_procedure("sp_catalogo_cupos_disponibles", (id_ticket,)) or []


def sp_tipo_documento_consultar() -> list[dict]:
    """Retorna los tipos de documento activos (reutilizado del módulo acudiente)."""
    return db.call_procedure("sp_tbl_tipo_documento_consultar", ()) or []


def sp_catalogo_barrios() -> list[dict]:
    """Retorna todos los barrios activos para el SelectField de asignación."""
    return db.call_procedure("sp_tbl_barrio_consultar", ()) or []



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
    