import io

# FUNCIONES DE FLASK
from flask import render_template, request, redirect, url_for, flash, session, send_file
from flask_jwt_extended import get_jwt

# UTILIDADES
from app.utils.database_utils import db
from app.utils.password_utils import generar_salt, hashear_contraseña

# SEGURIDAD
from app.security.mfa_controller import MFA_Controller

# CONFIGURACIONES LOCALES
from app.forms.aplication_forms import *
from app.repositories.aplication_repository import * # Archivo intermediario de BD y Services

import pyotp, time # usado para debuggin y obtener logs

# ====================================================================================================================================================
#                                           PÁGINA INDEX.HTML
# ====================================================================================================================================================

# Mapa de prioridad numérica a etiqueta visual
_PRIORIDAD_LABEL = {
    range(0,  30):  ("Baja","danger", "fa-arrow-down"),
    range(30, 60):  ("Media", "danger", "fa-equals"),
    range(60, 85):  ("Alta", "danger", "fa-arrow-up"),
    range(85, 9999):("Crítica","danger", "fa-exclamation-circle"),
}

def _resolver_prioridad(puntaje: int) -> tuple[str, str, str]:
    """Convierte el puntaje numérico en (etiqueta, color_badge, icono)"""
    for rango, datos in _PRIORIDAD_LABEL.items():
        if puntaje in rango:
            return datos
    return ("Media", "warning", "fa-equals")


# Pasos del proceso en orden — reutiliza la misma lógica del módulo de tickets
_PASOS_PROCESO = [
    {
        "label": "Solicitud Enviada",
        "icono": "fa-paper-plane",
        "estado_bd": "Abierto"
    },
    {
        "label": "En Revisión",
        "icono": "fa-eye",
        "estado_bd": "En Revisión"
    },
    {
        "label": "Validación Documentos",
        "icono": "fa-clipboard-check",
        "estado_bd": "Validación de Documentos"
    },
    {
        "label": "Asignación de Cupo",
        "icono": "fa-school",
        "estado_bd": "Asignación de Cupo"
    },
    {
        "label": "Confirmación Final",
        "icono": "fa-flag-checkered",
        "estado_bd": "Confirmación Final"
    },
]

def _construir_pasos(nombre_estado: str | None) -> list[dict]:
    """Devuelve pasos con estado: 'done', 'active' o '' (pendiente)."""
    if not nombre_estado:
        return [dict(p, cls="") for p in _PASOS_PROCESO]

    estados_bd = [p["estado_bd"] for p in _PASOS_PROCESO]
    try:
        idx_actual = estados_bd.index(nombre_estado)
    except ValueError:
        idx_actual = 0

    pasos = []
    for i, paso in enumerate(_PASOS_PROCESO):
        if i < idx_actual:
            pasos.append(dict(paso, cls="done"))
        elif i == idx_actual:
            pasos.append(dict(paso, cls="active"))
        else:
            pasos.append(dict(paso, cls=""))
    return pasos


class Dashboard_Service:

    def cargar_datos_dashboard(self):
        user_id = session["user_id"]
        resumen = sp_dashboard_resumen_acudiente(user_id)

        # Sin datos → el acudiente no tiene estudiante ni tickets aún
        pasos = []
        prioridad = None

        if resumen and resumen.get("ID_Ticket"):
            pasos  = _construir_pasos(resumen.get("Nombre_Estado"))
            prioridad = _resolver_prioridad(resumen.get("Puntaje_Prioridad", 0))

        return render_template(
            "aplication/index.html",
            resumen = resumen,
            pasos = pasos,
            prioridad = prioridad,
            mostrar_modal_estudiante = not resumen,
            actiive_page = 'home',
        )



# ====================================================================================================================================================
#                                           PÁGINA TICKET_REQUEST.HTML
# ====================================================================================================================================================

# Tamaño máximo de archivo en bytes
_MAX_FILE_SIZE = 5 * 1024 * 1024   # 5 MB
_MAX_FILE_SIZE_CERTS = 10 * 1024 * 1024  # 10 MB para certificados

# SelectFields obligatorios del ticket (valor 0 = sin selección)
_SELECTS_REQUERIDOS_TICKET = {
    "id_estudiante":       "form_p1",
    "id_tipo_afectacion":  "form_p2",
    "id_barrio":           "form_p3",
    "id_tiempo_residencia":"form_p3",
    "id_jornada":          "form_p4",
}


def _generar_id_ticket():
    """Genera el ID de ticket en formato EDU-000000"""
    ultimo = sp_ticket_obtener_ultimo_numero()
    
    if ultimo is None:
        ultimo = 0
        
    ultimo = int(ultimo)
    siguiente = ultimo + 1
    return f"EDU-{siguiente:06d}"


def _form_opciones_ticket(form_p1, form_p2, form_p3, form_p4, lista_est):
    """Pobla los choices de los SelectFields del wizard"""
    # Paso 1 — estudiantes
    form_p1.id_estudiante.choices = (
        [(0, "— Seleccione un estudiante —")] +
        [
            (e["ID_Estudiante"],
             f"{e['Primer_Nombre']} {e['Primer_Apellido']}"
             f" — {e.get('Nombre_Grado_Proximo') or e.get('Nombre_Grado_Actual', '')}")
            for e in lista_est
        ]
    )

    # Paso 2 — tipos de afectación
    form_p2.id_tipo_afectacion.choices = (
        [(0, "— Seleccione una afectación —")] +
        [(a["ID_Tipo_Afectacion"], a["Nombre_Afectacion"])
         for a in sp_obtener_tipos_afectacion()]
    )

    # Paso 3 — barrios y tiempos de residencia
    form_p3.id_barrio.choices = (
        [(0, "— Seleccione un barrio —")] +
        [(b["ID_Barrio"], b["Nombre_Barrio"]) for b in sp_obtener_barrios()]
    )
    form_p3.id_tiempo_residencia.choices = (
        [(0, "— Seleccione —")] +
        [(t["ID_Tiempo_Residencia"], t["Nombre_Tiempo"])
         for t in sp_obtener_tiempos_residencia()]
    )

    # Paso 4 — jornadas y colegios
    form_p4.id_jornada.choices = (
        [(0, "— Seleccione una jornada —")] +
        [(j["ID_Jornada"], j["Nombre_Jornada"]) for j in sp_obtener_jornadas()]
    )
    form_p4.id_colegio.choices = (
        [(0, "Sin preferencia (el sistema asignará)")] +
        [(c["ID_Colegio"], c["Nombre_Colegio"]) for c in sp_obtener_colegios()]
    )


def _leer_archivo(file_storage, max_size=_MAX_FILE_SIZE):
    """Lee un FileStorage y retorna los bytes"""
    if not file_storage or file_storage.filename == "":
        return None
    datos = file_storage.read()
    if len(datos) > max_size:
        raise ValueError(f"El archivo '{file_storage.filename}' supera el tamaño permitido.")
    return datos



class Ticket_Service:
    """Gestión de opciones para la creación de un tickets"""

    def Crear_Ticket_Service(self):
        user_id = session.get("user_id")
        if not user_id:
            flash("Sesión no encontrada.", "danger")
            return redirect(url_for("aplication.dashboard"))

        # Verificar que el acudiente tiene al menos un estudiante
        lista_est = sp_obtener_estudiantes_por_acudiente(user_id)
        if not lista_est:
            flash("Debes registrar al menos un estudiante antes de crear una solicitud.", "info")
            return redirect(url_for("aplication.register_student"))

        # Instanciar todos los formularios
        form_p1 = FormTicketPaso1()
        form_p2 = FormTicketPaso2()
        form_p3 = FormTicketPaso3()
        form_p4 = FormTicketPaso4()
        form_p5 = FormTicketPaso5()
        form_p6 = FormTicketPaso6()

        # Poblar SelectFields
        _form_opciones_ticket(form_p1, form_p2, form_p3, form_p4, lista_est)

        # Catálogo de afectaciones para el template (radio buttons)
        tipos_afectacion = sp_obtener_tipos_afectacion()

        if request.method == "GET":
            return render_template(
                "aplication/ticket_request.html",
                form_p1=form_p1,
                form_p2=form_p2,
                form_p3=form_p3,
                form_p4=form_p4,
                form_p5=form_p5,
                form_p6=form_p6,
                tipos_afectacion=tipos_afectacion,
                active_page="request",
            )

        # POST

        # Validar todos los formularios juntos
        forms_validos = all([
            form_p1.validate_on_submit(),
            form_p2.validate_on_submit(),
            form_p3.validate_on_submit(),
            form_p4.validate_on_submit(),
            form_p5.validate_on_submit(),
            form_p6.validate_on_submit(),
        ])

        if not forms_validos:
            errores = {}
            for f in [form_p1, form_p2, form_p3, form_p4, form_p5, form_p6]:
                errores.update(f.errors)
            print(f"[FORM ERRORS TICKET] {errores}")
            flash("Por favor revise todos los campos del formulario.", "danger")
            return render_template(
                "aplication/ticket_request.html",
                form_p1=form_p1,
                form_p2=form_p2,
                form_p3=form_p3,
                form_p4=form_p4,
                form_p5=form_p5,
                form_p6=form_p6,
                tipos_afectacion=tipos_afectacion,
                active_page="request",
            )

        # Segunda validación para SelectFields == 0
        form_map = {
            "form_p1": form_p1, "form_p2": form_p2,
            "form_p3": form_p3, "form_p4": form_p4,
        }
        
        campos_invalidos = [
            campo for campo, form_key in _SELECTS_REQUERIDOS_TICKET.items()
            if getattr(form_map[form_key], campo).data == 0
        ]
        
        if campos_invalidos:
            flash("Hay campos de selección sin completar.", "danger")
            return render_template(
                "aplication/ticket_request.html",
                form_p1=form_p1,
                form_p2=form_p2,
                form_p3=form_p3,
                form_p4=form_p4,
                form_p5=form_p5,
                form_p6=form_p6,
                tipos_afectacion=tipos_afectacion,
                active_page="request",
            )

        id_estudiante = form_p1.id_estudiante.data

        # Verificar que el estudiante no tenga ya un ticket activo
        if sp_ticket_verificar_activo(id_estudiante, user_id):
            flash("Este estudiante ya tiene una solicitud activa en proceso.", "warning")
            return render_template(
                "aplication/ticket_request.html",
                form_p1=form_p1,
                form_p2=form_p2, 
                form_p3=form_p3,
                form_p4=form_p4,
                form_p5=form_p5,
                form_p6=form_p6,
                tipos_afectacion=tipos_afectacion,
                active_page="request",
            )

        # Colegio: 0 = sin preferencia → NULL
        id_colegio = form_p4.id_colegio.data if form_p4.id_colegio.data != 0 else None
        ip = request.remote_addr
        user_agent = request.headers.get("User-Agent")
        
        id_ticket = _generar_id_ticket()

        try:
            sp_ticket_crear((
                id_ticket,
                user_id,
                id_estudiante,
                form_p2.id_tipo_afectacion.data,
                form_p2.descripcion.data,
                form_p3.id_barrio.data,
                form_p3.id_tiempo_residencia.data,
                form_p4.id_jornada.data,
                id_colegio,
                ip,
                user_agent,
            ))

            # Documentos individuales: (file_storage, id_tipo_doc, max_size)
            archivos = [
                (form_p5.doc_acudiente.data, 1, _MAX_FILE_SIZE),
                (form_p5.doc_menor.data, 2, _MAX_FILE_SIZE),
                (form_p5.doc_victima.data, 4, _MAX_FILE_SIZE),
            ]
            for file_storage, id_tipo_doc, max_size in archivos:
                datos = _leer_archivo(file_storage, max_size)
                if datos:
                    sp_documento_ticket_insertar((
                        id_ticket, id_tipo_doc, datos, file_storage.filename
                    ))

            # Certificados múltiples
            for cert in (form_p5.doc_certificados.data or []):
                datos = _leer_archivo(cert, _MAX_FILE_SIZE_CERTS)
                if datos:
                    sp_documento_ticket_insertar((
                        id_ticket, 3, datos, cert.filename
                    ))

            db.commit()
            flash(f"Solicitud {id_ticket} creada correctamente. La revisaremos pronto.", "success")
            return redirect(url_for("aplication.ticket_status"))

        except ValueError as ve:
            db.rollback()
            flash(str(ve), "warning")
        except Exception as e:  
            db.rollback()
            print(f"[ERROR] Creación de ticket fallida: {e}")
            flash("Ocurrió un error al crear la solicitud. Intente nuevamente.", "danger")

        return render_template(
            "aplication/ticket_request.html",
            form_p1=form_p1,
            form_p2=form_p2,
            form_p3=form_p3,
            form_p4=form_p4,
            form_p5=form_p5,
            form_p6=form_p6,
            tipos_afectacion=tipos_afectacion,
            active_page="request",
        )




# ====================================================================================================================================================
#                                           SISTEMA DE TICKETS - SEGUIMIENTO DE SOLICITUDES DE CUPO
# ====================================================================================================================================================

_ALLOWED_EXTENSIONS = {"pdf", "jpg", "jpeg", "png"}
_MAX_FILE_BYTES     = 5 * 1024 * 1024  # 5 MB


def _form_opciones_subir_documento(form):
    """Carga los tipos de documento en el SelectField."""
    tipos = sp_tipo_documento_consultar()
    form.tipo_documento.choices = [(0, "-- Seleccione --")] + [
        (t["ID_Tipo_Doc"], t["Nombre_Tipo_Doc"]) for t in tipos
    ]


# Definición del flujo de estados

_PASOS_TIMELINE = [
    {
        "label":      "Solicitud Enviada",
        "icono":      "fa-paper-plane",
        "estados_bd": ["Abierto"],
    },
    {
        "label":      "En Revisión",
        "icono":      "fa-eye",
        "estados_bd": ["En Revisión"],
    },
    {
        "label":      "Validación de Documentos",
        "icono":      "fa-clipboard-check",
        "estados_bd": ["Validación de Documentos", "Pendiente Acción de Usuario"],
    },
    {
        "label":      "Asignación de Cupo",
        "icono":      "fa-school",
        "estados_bd": ["Asignación de Cupo"],
    },
    {
        "label":      "Confirmación Final",
        "icono":      "fa-flag-checkered",
        "estados_bd": ["Solucionado"],
    },
]

# Estados que terminan el proceso de forma NO exitosa.
# Cuando el ticket llega a uno de estos, el paso activo se marca
# con un ícono y color diferente en el template.
_ESTADOS_RECHAZO = {"Rechazado", "Cancelado a Petición"}

# Estados que terminan el proceso de forma exitosa.
_ESTADOS_EXITOSOS = {"Solucionado"}


def _construir_timeline(nombre_estado_actual: str) -> tuple[list[dict], str]:
    """Construye la lista de pasos del timeline según el estado actual del ticket"""

    # Determinar el índice del paso activo buscando qué paso
    # del timeline corresponde al estado actual de la BD.
    idx_activo = None
    for i, paso in enumerate(_PASOS_TIMELINE):
        if nombre_estado_actual in paso["estados_bd"]:
            idx_activo = i
            break

    # Si el estado no coincide con ningún paso (ej: Rechazado, Cancelado),
    estado_ticket_rechazo = nombre_estado_actual in _ESTADOS_RECHAZO
    estado_ticket_exitoso = nombre_estado_actual in _ESTADOS_EXITOSOS

    if estado_ticket_exitoso:
        # Todos los pasos completados
        idx_activo = len(_PASOS_TIMELINE)
        tipo = "exitoso"
    elif estado_ticket_rechazo:
        # El proceso terminó sin completarse: no hay paso activo,
        # conservamos el último paso marcado como 'warning'
        idx_activo = None
        tipo = "rechazo"
    else:
        tipo = "normal"

    pasos = []
    for i, paso in enumerate(_PASOS_TIMELINE):
        if estado_ticket_rechazo:
            # En rechazo: todos los pasos quedan como completados hasta
            # donde llegó, el resto pendiente. No hay 'active'.
            # Buscamos hasta qué índice llegó por posición aproximada.
            estado_paso = "completed" if i < (idx_activo or 0) else ""
        elif idx_activo is None:
            estado_paso = ""
        elif i < idx_activo:
            estado_paso = "completed"
        elif i == idx_activo:
            # 'Pendiente Acción de Usuario' merece un estado visual distinto
            if nombre_estado_actual == "Pendiente Acción de Usuario":
                estado_paso = "warning"
            else:
                estado_paso = "active"
        else:
            estado_paso = ""

        pasos.append({
            "label":  paso["label"],
            "icono":  paso["icono"],
            "estado": estado_paso,
        })

    return pasos, tipo

# Clases de servicio

class Ticket_Detail_Service:
    """Mostrar tickets creados y su información"""

    def listar_tickets(self):

        user_id = session["user_id"]
        
        # Tickets Abiertos
        tickets_ab = sp_ticket_consultar_por_usuario(user_id)
        # Tickets Cerrados
        tickets_cer = sp_ticket_cerrado_consultar_por_usuario(user_id)
        
        return render_template(
            "aplication/ticket_status.html",
            tickets_ab=tickets_ab,
            tickets_cer=tickets_cer,
            active_page="status",
        )

    def cargar_datos_ticket(self, id_ticket: str):
        user_id = session["user_id"]

        ticket = sp_ticket_consultar_detalle(id_ticket, user_id)
        if not ticket:
            flash("La solicitud no existe o no tiene permisos para verla.", "danger")
            return redirect(url_for("aplication.ticket_status"))

        comentarios = sp_ticket_comentarios_consultar(id_ticket, user_id)
        documentos  = sp_ticket_documentos_consultar(id_ticket, user_id)

        # _construir_timeline ahora retorna (pasos, tipo)
        timeline, timeline_tipo = _construir_timeline(ticket["Nombre_Estado"])

        form = FormSubirDocumento()
        _form_opciones_subir_documento(form)

        ctx = dict(
            ticket = ticket,
            comentarios = comentarios,
            documentos = documentos,
            timeline = timeline,
            timeline_tipo = timeline_tipo,
            form = form,
            active_page="status",
        )

        if request.method == "GET":
            return render_template("aplication/ticket_detail.html", **ctx)

        # POST: subir documento
        if not form.validate_on_submit():
            errores = "; ".join(
                f"{field}: {', '.join(msgs)}"
                for field, msgs in form.errors.items()
            )
            print(f"[FORM ERRORS] {errores}")
            flash("Por favor revise los campos del formulario.", "danger")
            return render_template("aplication/ticket_detail.html", **ctx)

        archivo_field = form.archivo.data
        nombre_original = archivo_field.filename
        extension = nombre_original.rsplit(".", 1)[-1].lower()

        if extension not in _ALLOWED_EXTENSIONS:
            flash("Tipo de archivo no permitido.", "danger")
            return render_template("aplication/ticket_detail.html", **ctx)

        contenido = archivo_field.read()

        if len(contenido) > _MAX_FILE_BYTES:
            flash("El archivo supera el límite de 5 MB.", "danger")
            return render_template("aplication/ticket_detail.html", **ctx)

        try:
            sp_documento_ticket_insertar(
                id_ticket,
                form.tipo_documento.data,
                contenido,
                nombre_original,
            )
            db.commit()
            flash("Documento subido correctamente.", "success")
            return redirect(url_for("aplication.ticket_detail", id_ticket=id_ticket, active_page="status"))

        except Exception as e:
            db.rollback()
            print(f"[ERROR] Subida de documento fallida: {e}")
            flash("Ocurrió un error al subir el documento. Intente nuevamente.", "danger")
            return render_template("aplication/ticket_detail.html", **ctx)


    def descargar_doc(self, id_ticket: str, id_doc: int):
        user_id = session["user_id"]

        doc = sp_documento_ticket_descargar(id_doc, user_id)
        if not doc:
            flash("Documento no encontrado o sin permisos.", "danger")
            return redirect(url_for("aplication.ticket_detail", id_ticket=id_ticket, active_page="status"))

        return send_file(
            io.BytesIO(doc["Archivo"]),
            download_name=doc["Nombre_Original"],
            as_attachment=True,
        )
        
        
        

# ====================================================================================================================================================
#                                           PAGINA PROFILE.HTML
# ====================================================================================================================================================

def _form_opciones_acudiente(form):
    """Asigna choices a los SelectFields del formulario del acudiente."""
    form.estrato.choices = (
        [(0, "— Seleccione un Estrato —")] +
        [(e["ID_Estrato"], e["Nombre_Estrato"]) for e in sp_obtener_estratos()]
    )
    form.genero.choices = (
        [(0, "— Seleccione un Género —")] +
        [(g["ID_Genero"], g["Nombre_Genero"]) for g in sp_obtener_generos()]
    )
    form.grupo_preferencial.choices = (
        [(0, "— Seleccione un Grupo —")] +
        [(gp["ID_Grupo_Preferencial"], gp["Nombre_Grupo_Preferencial"]) for gp in sp_obtener_grupos_preferenciales()]
    )
    form.barrio.choices = (
        [(0, "— Seleccione un Barrio —")] +
        [(b["ID_Barrio"], b["Nombre_Barrio"]) for b in sp_obtener_barrios()]
    )


def _form_opciones_estudiante(form):
    """Asigna choices a todos los SelectFields del formulario del estudiante."""
    form.genero.choices = (
        [(0, "— Seleccione un Género —")] +
        [(g["ID_Genero"], g["Nombre_Genero"]) for g in sp_obtener_generos()]
    )
    form.grupo_preferencial.choices = (
        [(0, "— Seleccione un Grupo —")] +
        [(gp["ID_Grupo_Preferencial"], gp["Nombre_Grupo_Preferencial"]) for gp in sp_obtener_grupos_preferenciales()]
    )
    form.grado_actual.choices = (
        [(0, "— Seleccione un grado —")] +
        [(gr["ID_Grado"], gr["Nombre_Grado"]) for gr in sp_obtener_grados()]
    )
    form.grado_proximo.choices = (
        [(0, "— Seleccione un grado —")] +
        [(gr["ID_Grado"], gr["Nombre_Grado"]) for gr in sp_obtener_grados()]
    )
    form.colegio_anterior.choices = (
        [(0, "— Seleccione un Colegio —")] +
        [(c["ID_Colegio"], c["Nombre_Colegio"]) for c in sp_obtener_colegios()]
    )


class Profile_Data_Service:

    def cargar_datos_perfil(self):
        user_id = session.get("user_id")
        if not user_id:
            flash("No se encontró sesión de usuario activa.", "danger")
            return redirect(url_for("aplication.dashboard"))

        verificacion = sp_verificar_estudiante_acudiente(user_id)
        if not verificacion or verificacion.get("total_estudiantes", 0) == 0:
            flash("Debes registrar al menos un estudiante para continuar.", "info")
            return redirect(url_for("aplication.register_student"))

        form_acu_edit = FormAcudienteDatosEditables()
        form_est = FormEstudianteDatosEditables()
        _form_opciones_acudiente(form_acu_edit)
        _form_opciones_estudiante(form_est)

        # Determinar tab activo
        # Por defecto: acudiente. Si viene ?tab=menor o hay ?estudiante=X → menor.
        id_param  = request.args.get("estudiante", type=int)
        tab_param = request.args.get("tab", "")
        active_tab = "menor" if (tab_param == "menor" or id_param) else "acudiente"

        # POST
        if request.method == "POST":
            form_type = request.form.get("form_type", "").strip().lower()
            if form_type == "acudiente":
                if self._actualizar_acudiente(form_acu_edit):
                    return redirect(url_for("aplication.profile", tab="acudiente"))
                active_tab = "acudiente"
            elif form_type == "estudiante":
                # Recuperar el estudiante que se estaba editando para volver a él
                id_est_post = request.form.get("id_estudiante", type=int)
                if self._actualizar_estudiante(form_est):
                    return redirect(url_for(
                        "aplication.profile",
                        tab="menor",
                        estudiante=id_est_post
                    ))
                active_tab = "menor"
            else:
                flash("Tipo de formulario no reconocido.", "danger")

        # Datos desde BD
        datos_acu_fijos = sp_obtener_perfil_acudiente(user_id)
        datos_acu = sp_obtener_perfil_acudiente(user_id)
        lista_est = sp_obtener_estudiantes_por_acudiente(user_id)

        # Pre-poblar acudiente (solo GET)
        if datos_acu and request.method == "GET":
            form_acu_edit.telefono.data = datos_acu.get("Telefono")
            form_acu_edit.barrio.data = datos_acu.get("ID_Barrio", 0)
            form_acu_edit.genero.data = datos_acu.get("ID_Genero", 0)
            form_acu_edit.grupo_preferencial.data = datos_acu.get("ID_Grupo_Preferencial", 0)
            form_acu_edit.estrato.data = datos_acu.get("ID_Estrato", 0)

        # Estudiante activo
        estudiante_activo = None
        if lista_est:
            if id_param:
                estudiante_activo = next(
                    (e for e in lista_est if e["ID_Estudiante"] == id_param),
                    lista_est[0]
                )
            else:
                estudiante_activo = lista_est[0]

            # Asingar datos del estudiante para los campos del formulario
            if request.method == "GET" and estudiante_activo:
                form_est.id_estudiante.data = estudiante_activo["ID_Estudiante"]
                form_est.primer_nombre.data = estudiante_activo.get("Primer_Nombre")
                form_est.segundo_nombre.data = estudiante_activo.get("Segundo_Nombre")
                form_est.primer_apellido.data = estudiante_activo.get("Primer_Apellido")
                form_est.segundo_apellido.data = estudiante_activo.get("Segundo_Apellido")
                form_est.fecha_nacimiento.data = estudiante_activo.get("Fecha_Nacimiento")
                form_est.genero.data = estudiante_activo.get("ID_Genero", 0)
                form_est.grupo_preferencial.data = estudiante_activo.get("ID_Grupo_Preferencial", 0)
                form_est.grado_actual.data = estudiante_activo.get("ID_Grado_Actual", 0)
                form_est.grado_proximo.data = estudiante_activo.get("ID_Grado_Proximo", 0)
                form_est.colegio_anterior.data = estudiante_activo.get("ID_Colegio_Anterior", 0)

        return render_template(
            "aplication/profile.html",
            form_acu=form_acu_edit,
            form_est=form_est,
            datos_acu_fijos=datos_acu_fijos,
            datos_acu=datos_acu,
            lista_est=lista_est,
            estudiante_activo=estudiante_activo,
            active_tab=active_tab,
            active_page="profile",
        )

    # Guardar datos del acudiente

    def _actualizar_acudiente(self, form):
        _form_opciones_acudiente(form)
        if not form.validate_on_submit():
            flash("Por favor revise los campos del formulario del acudiente.", "danger")
            return False

        user_id   = session.get("user_id")
        datos_acu = sp_obtener_perfil_acudiente(user_id)
        if not datos_acu:
            flash("No se encontró el perfil del acudiente.", "danger")
            return False

        try:
            sp_actualizar_datos_adicionales((
                datos_acu.get("ID_Datos_Adicionales"),
                form.telefono.data,
                datos_acu.get("ID_Persona"),
                form.genero.data,
                form.grupo_preferencial.data,
                form.estrato.data,
                form.barrio.data,
                user_id,
                request.remote_addr,
                request.headers.get("User-Agent"),
            ))
            db.commit()
            flash("Datos del acudiente actualizados correctamente.", "success")
            return True
        except Exception as e:
            db.rollback()
            flash("Error al guardar los cambios del acudiente.", "danger")
            return False

    # Guardar estudiante

    def _actualizar_estudiante(self, form):
        _form_opciones_estudiante(form)
        if not form.validate_on_submit():
            flash("Por favor revise los campos del formulario del menor.", "danger")
            return False

        user_id = session.get("user_id")
        id_estudiante = form.id_estudiante.data

        # Verificar que el estudiante pertenece al acudiente activo
        datos_est = sp_obtener_estudiante_por_id(id_estudiante, user_id)
        
        if not datos_est:
            flash("No se encontró el estudiante indicado.", "danger")
            return False

        ip = request.remote_addr
        user_agent = request.headers.get("User-Agent")
        
        try:
            # 1. Actualizar TBL_PERSONA del menor
            sp_actualizar_persona((
                datos_est["ID_Persona"],
                form.primer_nombre.data,
                form.segundo_nombre.data or None,
                form.primer_apellido.data,
                form.segundo_apellido.data or None,
                form.fecha_nacimiento.data,
                user_id,
                ip,
                user_agent,
            ))

            # 2. Actualizar TBL_ESTUDIANTE
            sp_actualizar_estudiante((
                form.grado_actual.data,
                form.grado_proximo.data,
                form.colegio_anterior.data,
                form.genero.data,
                form.grupo_preferencial.data,
                datos_est["ID_Persona"],
                user_id,
                ip,
                user_agent,
            ))

            db.commit()
            flash("Datos del estudiante actualizados correctamente.", "success")
            return True
        except Exception as e:
            db.rollback()
            flash("Ocurrió un error al guardar los cambios del estudiante.", "danger")
            return False
        
        
# ====================================================================================================================================================
#                                           PAGINA REGISTER_STUDENT.HTML
# ====================================================================================================================================================

def _form_opciones_estudiante_register(form):
    """Asigna choices a todos los SelectFields del formulario del estudiante"""
    
    generos = sp_obtener_generos()
    grupos_preferenciales = sp_obtener_grupos_preferenciales()
    grados = sp_obtener_grados()
    colegios = sp_obtener_colegios()
    tipos_identificacion  = sp_obtener_tipos_identificacion()
    parentesco_estudiante = sp_obtener_parentesco_est()

    form.tipo_identificacion.choices = (
        [(0, "— Seleccione una Identificación —")] +
        [(t["ID_Tipo_Iden"], t["Nombre_Tipo_Iden"]) for t in tipos_identificacion]
    )
    form.genero.choices = (
        [(0, "— Seleccione un Género —")] +
        [(g["ID_Genero"], g["Nombre_Genero"]) for g in generos]
    )
    form.grupo_preferencial.choices = (
        [(0, "— Seleccione un Grupo —")] +
        [(gp["ID_Grupo_Preferencial"], gp["Nombre_Grupo_Preferencial"]) for gp in grupos_preferenciales]
    )
    form.grado_actual.choices = (
        [(0, "— Seleccione un grado —")] +
        [(gr["ID_Grado"], gr["Nombre_Grado"]) for gr in grados]
    )
    form.grado_proximo.choices = (
        [(0, "— Seleccione un grado —")] +
        [(gr["ID_Grado"], gr["Nombre_Grado"]) for gr in grados]
    )
    form.colegio_anterior.choices = (
        [(0, "— Seleccione un Colegio —")] +
        [(c["ID_Colegio"], c["Nombre_Colegio"]) for c in colegios]
    )
    form.parentesco.choices = (
        [(0, "— Seleccione un Parentesco —")] +
        [(p["ID_Parentesco"], p["Nombre_Parentesco"]) for p in parentesco_estudiante]
    )


# Campos SelectField que no pueden ser 0
_SELECTS_REQUERIDOS = [
    "tipo_identificacion", "genero", "grupo_preferencial",
    "grado_actual", "grado_proximo", "colegio_anterior", "parentesco"
]


class Register_Student_Service:
    """Gestiona el proceso para el registro de un nuevo estudiante"""

    def registrar(self):
        form = FormRegistroEstudiante()
        _form_opciones_estudiante_register(form)

        if request.method == "GET":
            return render_template(
                "aplication/register_student.html",
                form=form,
            )

        # POST

        # Validación de WTForms
        if not form.validate_on_submit():
            errores = "; ".join(
                f"{field}: {', '.join(msgs)}"
                for field, msgs in form.errors.items()
            )
            print(f"[FORM ERRORS] {errores}")
            flash("Por favor revise todos los campos del formulario.", "danger")
            return render_template(
                "aplication/register_student.html",
                form=form,
            )

        # verificar que ningún SelectField llegó como 0
        campos_invalidos = [
            campo for campo in _SELECTS_REQUERIDOS
            if getattr(form, campo).data == 0
        ]
        
        if campos_invalidos:
            flash("Hay campos de selección sin completar. Por favor revise el formulario.", "danger")
            return render_template(
                "aplication/register_student.html",
                form=form,
            )

        # ── Datos seguros, proceder con BD ───────────────────────────────────
        user_id = session["user_id"]
        ip  = request.remote_addr
        user_agent = request.headers.get("User-Agent")

        try:
            # Verificar duplicado
            estudiante_existente = sp_estudiante_existe(
                form.numero_documento.data, user_id
            )
            if estudiante_existente:
                flash("Este estudiante ya se encuentra registrado.", "warning")
                return render_template(
                    "aplication/register_student.html",
                    form=form,
                )

            sp_registrar_estudiante((
                # TBL_PERSONA
                form.numero_documento.data,
                form.primer_nombre.data,
                form.segundo_nombre.data or None,
                form.primer_apellido.data,
                form.segundo_apellido.data or None,
                form.fecha_nacimiento.data,
                # TBL_ESTUDIANTE
                form.tipo_identificacion.data,
                form.grado_actual.data,
                form.grado_proximo.data,
                form.colegio_anterior.data,
                form.genero.data,
                form.grupo_preferencial.data,
                user_id,
                form.parentesco.data,
                # Auditoría
                ip,
                user_agent,
            ))

            db.commit()
            session["estudiante_verificado"] = True
            flash("Estudiante registrado correctamente.", "success")
            return redirect(url_for("aplication.profile"))

        except Exception as e:
            db.rollback()
            print(f"[ERROR] Registro de estudiante fallido: {e}")
            session["estudiante_verificado"] = False
            flash("Ocurrió un error al registrar al estudiante. Intente nuevamente.", "danger")
            return render_template(
                "aplication/register_student.html",
                form=form,
            )


# ====================================================================================================================================================
#                                           PAGINA SECURITY.HTML
# ====================================================================================================================================================

class Security_Settings_Service:
    """Inicializa los formularios para la pagina de security."""

    def cargar_informacion_seguridad(self):
        
        form_password = FormCambiarcontraseña()
        form_mfa_activar = FormVerificarMFA()
        form_mfa_desactivar = FormVerificarMFA()
        sesiones = Security_Settings_Service().Session_Handler_Service()
        
        return render_template(
            "aplication/security.html",
            form_password=form_password,
            form_mfa_activar=form_mfa_activar,
            form_mfa_desactivar=form_mfa_desactivar,
            sesiones=sesiones,
            active_page="security"
        )

# ==========================================================================
#  GESTIÓN DE CAMBIO DE CONTRASEÑA

    def Change_Password_Service(self):
        """Gestiona el cambio de contraseña desde el perfil del usuario."""

        # Cargar formulario
        form = FormCambiarcontraseña()
        
        ip = request.remote_addr
        user_agent = request.headers.get("User-Agent", "")
        id_usuario = session.get("user_id")
        username = session.get("username_login")

        if request.method == "POST":
            if not form.validate_on_submit():
                errores = "; ".join(
                    f"{f}: {', '.join(m)}" for f, m in form.errors.items()
                )
                flash(f"Errores en el formulario: {errores}", "danger")
                return redirect(url_for("aplication.security"))

            contraseña_actual = form.contraseña_actual.data
            nueva_contraseña = form.nueva_contraseña.data

            try:
                # Obtener datos del usuario actual para validar contraseña
                data_user = sp_validar_data_user(username)
                if not data_user:
                    flash("Sesión inválida. Por favor inicie sesión nuevamente.", "danger")
                    return redirect(url_for("aplication.security"))

                data_user = data_user[0]
                
                salt_actual = data_user["Password_Salt"]

                validar_contraseña = self._validar_usuario(username, contraseña_actual, salt_actual)
                
                if not validar_contraseña:
                    flash("La contraseña actual no es correcta.", "danger")
                    return redirect(url_for("aplication.security"))

                # Generar nuevo salt + hash
                nuevo_salt = generar_salt()
                nuevo_hash = hashear_contraseña(nueva_contraseña, "user", nuevo_salt)

                # Llamar SP para cambiar contraseña
                sp_cambiar_contraseña_perfil(id_usuario, nuevo_hash, nuevo_salt, ip, user_agent)
                
                db.commit()
                flash("Contraseña actualizada correctamente.", "success")
                return redirect(url_for("aplication.security"))

            except Exception as e:
                db.rollback()
                print(f"[ERROR] Cambiarcontraseña: {e}")
                flash("Error interno. Intente nuevamente.", "danger")
                return redirect(url_for("aplication.security"))

        # GET — Renderizar página de seguridad con formulario
        return render_template(
            "aplication/security.html",
            form_password=form,
            active_page="security"
        ) 
        
    def _validar_usuario(self, username, password, salt):
        try:
            hash_password = hashear_contraseña(password, "user", salt)
            result = sp_validar_login(username, hash_password)

            if not result:
                return False
            return result[0].get("Resultado") == "SUCCESS"

        except Exception as e:
            print(f"[ERROR] _validar_usuario: {e}")
            return False

# ==========================================================================
#  GESTIÓN DE MFA (Microsoft Authenticator / TOTP)

    def MFA_Activation_Service(self):
        """Activa, desactiva y verifica el doble factor de autenticación."""

        # Obener datos del usuario
        id_usuario = session.get("user_id")
        username = session.get("username")

        try:
            # Verificar si ya hay un secret temporal pendiente en BD
            data = sp_obtener_mfa_secret(id_usuario)
            row = data[0] if data else {}

            secret_temp_existente = row.get("MFA_Secret_Temp")
            if isinstance(secret_temp_existente, (bytes, bytearray)):
                secret_temp_existente = secret_temp_existente.decode("utf-8")

            # Si ya hay un secret temporal, reutilizarlo en lugar de generar uno nuevo
            if secret_temp_existente and session.get("mfa_secret_temp") == secret_temp_existente:
                flash("Ya tiene un QR pendiente. Escanéelo e ingrese el código para confirmar.", "info")
                return redirect(url_for("aplication.security"))

            # No hay secret pendiente: generar uno nuevo
            secret = MFA_Controller.generar_secret()
            uri = MFA_Controller.generar_uri(secret, username)
            qr_b64 = MFA_Controller.generar_qr_base64(uri)

            sp_guardar_mfa_secret_temp(id_usuario, secret)
            db.commit()

            session['mfa_secret_temp'] = secret
            session['mfa_qr_temp'] = f"data:image/png;base64,{qr_b64}"
            
            print(f"[DEBUG] iniciar_activacion - secret generado: {secret}")
            print(f"[DEBUG] iniciar_activacion - session mfa_secret_temp antes: {session.get('mfa_secret_temp')}")
            
            flash("QR generado. Escaneelo con Microsoft Authenticator e ingrese el código para confirmar.", "info")
            return redirect(url_for("aplication.security"))

        except Exception as e:
            db.rollback()
            print(f"[ERROR] iniciar_activacion MFA: {e}")
            flash("No se pudo generar el QR. Intente nuevamente.", "danger")
            return redirect(url_for("aplication.security"))

    def mfa_activacion(self):
        """Recibe el código TOTP y, si es válido, activa el MFA"""
        
        form = FormVerificarMFA()
        id_usuario = session.get("user_id")

        if not form.validate_on_submit():
            errores = "; ".join(f"{f}: {', '.join(m)}" for f, m in form.errors.items())
            flash(f"Errores en el formulario: {errores}", "danger")
            return redirect(url_for("aplication.security"))

        try:
            # Obtener secret desde la BD (fuente de verdad)
            data = sp_obtener_mfa_secret(id_usuario)
            if not data:
                flash("Sesión expirada. Inicie el proceso nuevamente.", "danger")
                return redirect(url_for("aplication.security"))
            
            row = data[0]

            # Normalizar: el driver puede retornar bytes o str
            secret_temp = row.get("MFA_Secret_Temp") or row.get("mfa_secret_temp")
            if isinstance(secret_temp, (bytes, bytearray)):
                secret_temp = secret_temp.decode("utf-8")

            if not secret_temp:
                # Fallback: usar el secret guardado en sesión
                secret_temp = session.get("mfa_secret_temp")

            if not secret_temp:
                flash("No hay configuración pendiente. Inicie el proceso nuevamente.", "danger")
                return redirect(url_for("aplication.security"))

            codigo_ingresado = form.codigo_mfa.data.strip()
            
            if not MFA_Controller.verificar_codigo(secret_temp, codigo_ingresado):
                flash("Código incorrecto. Verifique la hora de su dispositivo e intente de nuevo.", "danger")
                return redirect(url_for("aplication.security"))

            sp_activar_mfa(id_usuario)
            db.commit()

            session["double_factor"] = "ACTIVE"
            session.pop('mfa_secret_temp', None)
            session.pop('mfa_qr_temp', None)

            flash("Autenticación de dos factores activada correctamente.", "success")
            return redirect(url_for("aplication.security"))

        except Exception as e:
            db.rollback()
            print(f"[ERROR] confirmar_activacion MFA: {e}")
            flash("Error interno al confirmar. Intente nuevamente.", "danger")
            return redirect(url_for("aplication.security"))


    def mfa_desactivar(self):
        """Desactiva el MFA después de verificar un código vigente"""
        
        form = FormVerificarMFA()
        id_usuario = session.get("user_id")

        if not form.validate_on_submit():
            errores = "; ".join(f"{f}: {', '.join(m)}" for f, m in form.errors.items())
            flash(f"Errores en el formulario: {errores}", "danger")
            return redirect(url_for("aplication.security"))

        try:
            data = sp_obtener_mfa_secret(id_usuario)
            if not data:
                flash("Sesión expirada. Inicie sesión nuevamente.", "danger")
                return redirect(url_for("auth.login_user"))

            row = data[0]

            # Normalizar igual que en confirmar_activacion
            secret = row.get("MFA_Secret") or row.get("mfa_secret")
            if isinstance(secret, (bytes, bytearray)):
                secret = secret.decode("utf-8")

            if not secret:
                flash("El 2FA no está activo en tu cuenta.", "warning")
                return redirect(url_for("aplication.security"))

            if not MFA_Controller.verificar_codigo(secret, form.codigo_mfa.data.strip()):
                flash("Código incorrecto. No se puede desactivar.", "danger")
                return redirect(url_for("aplication.security"))

            sp_desactivar_mfa(id_usuario)
            db.commit()

            session["double_factor"] = "INACTIVE"

            flash("Autenticación de dos factores desactivada.", "success")
            return redirect(url_for("aplication.security"))

        except Exception as e:
            db.rollback()
            print(f"[ERROR] desactivar MFA: {e}")
            flash("Error interno. Intente nuevamente.", "danger")
            return redirect(url_for("aplication.security"))


# ==========================================================================
# CENTRO DE CONTROL DE SESIONES 

    def Session_Handler_Service(self):
        """Consulta y revoca sesiones activas del usuario."""
        
        id_usuario = session.get("user_id")
        try:
            sesiones = sp_listar_sesiones(id_usuario)
            jti_actual = get_jwt().get("jti", "")

            sesiones_formateadas = []
            for s in (sesiones or []):
                sesiones_formateadas.append({
                    "id": s["ID_Sesion"],
                    "JTI": s["JTI"],
                    "dispositivo": s["Dispositivo"] or "Desconocido",
                    "ip": s["IP"] or "—",
                    "inicio": s["Fecha_Inicio"].strftime("%d/%m/%Y %H:%M") if s.get("Fecha_Inicio") else "—",
                    "ultimo": s["Ultimo_Acceso"].strftime("%d/%m/%Y %H:%M") if s.get("Ultimo_Acceso") else "—",
                    "es_actual": s["JTI"] == jti_actual,
                })

            session['sesiones_activas'] = sesiones_formateadas
            return sesiones_formateadas

        except Exception as e:
            print(f"[ERROR] listar sesiones: {e}")
            return []

    def cerrar_sesiones(self):
        id_usuario = session.get("user_id")
        try:
            jti_actual = get_jwt().get("jti", "")
            sp_cerrar_todas_sesiones(id_usuario, jti_actual)
            db.commit()
            flash("Todas las demás sesiones han sido cerradas.", "success")
        except Exception as e:
            db.rollback()
            print(f"[ERROR] cerrar_otras: {e}")
            flash("Error al cerrar sesiones. Intente nuevamente.", "danger")
        return redirect(url_for("aplication.security"))

    def cerrar_sesion(self, jti_sesion: str):
        id_usuario = session.get("user_id")
        try:
            sesiones = sp_listar_sesiones(id_usuario) or []
            sesion = next((s for s in sesiones if s["JTI"] == jti_sesion), None)

            if not sesion:
                flash("Sesión no encontrada.", "warning")
                return redirect(url_for("aplication.security"))

            jti_actual = get_jwt().get("jti", "")
            if jti_sesion == jti_actual:
                flash("No puede cerrar su sesión actual desde aquí.", "danger")
                return redirect(url_for("aplication.security"))

            sp_cerrar_sesion(jti_sesion)
            db.commit()
            flash("Sesión cerrada correctamente.", "success")
        except Exception as e:
            db.rollback()
            print(f"[ERROR] cerrar_una: {e}")
            flash("Error al cerrar sesión. Intente nuevamente.", "danger")
        return redirect(url_for("aplication.security"))
    
            
# ====================================================================================================================================================
#                                           PAGINA SETTINGS.HTML
# ====================================================================================================================================================

 
class General_Settings_Service:
    #  Carga inicial: GET /settings 
    
    def cargar_datos_settings(self):

        id_usuario = session.get("user_id")
        
        prefs = sp_configuracion_obtener_notificaciones(id_usuario)
 
        # Si el SP no devuelve resultados, inicializamos valores seguros
        if prefs and len(prefs) > 0:
            notif_email = bool(prefs[0]["Notificaciones_Email"])
            notif_navegador = bool(prefs[0]["Notificaciones_Navegador"])
        else:
            notif_email = False
            notif_navegador = False
 
        form_email = FormNotificacionesEmail()
        form_navegador  = FormNotificacionesNavegador()
        form_eliminar = FormEliminarCuenta()
 
        # Pre-seleccionar checkboxes según el estado guardado en BD
        form_email.notificaciones_email.data          = notif_email
        form_navegador.notificaciones_navegador.data  = notif_navegador
 
        return render_template(
            "aplication/settings.html",
            form_email=form_email,
            form_navegador=form_navegador,
            form_eliminar=form_eliminar,
            notif_email_activo=notif_email,
            notif_navegador_activo=notif_navegador,
            active_page="settings",
        )
# ==========================================================================
# ACTUALIZAR NOTIFICACIONES AL CORREO
    
    def Email_Notif_Service(self):
        """Procesa el formulario de notificaciones por correo electrónico."""
        
        form_email = FormNotificacionesEmail()
 
        if form_email.validate_on_submit():
            activo = 1 if form_email.notificaciones_email.data else 0
 
            try:
                id_usuario = session.get("user_id")

                sp_configuracion_actualizar_notif_email(id_usuario, activo)
 
                estado = "activadas" if activo else "desactivadas"
                flash(
                    f"Las notificaciones por correo han sido {estado} correctamente.",
                    "success"
                )
 
            except Exception:
                flash(
                    "Ocurrió un error al actualizar las notificaciones por correo. "
                    "Intenta de nuevo más tarde.",
                    "danger"
                )
        else:
            flash("Solicitud inválida. Por favor recarga la página e intenta de nuevo.", "warning")
 
        return redirect(url_for("aplication.settings"))
 

# ==========================================================================
# ACTUALIZAR NOTIFICACIONES EN EL NAVEGADOR

    def Browser_Notif_Service(self):
        """Procesa el formulario de notificaciones del navegador"""
        
        # Cargar formularios
        form_navegador = FormNotificacionesNavegador()

        if form_navegador.validate_on_submit():
            activo = 1 if form_navegador.notificaciones_navegador.data else 0

            try:
                id_usuario = session.get("user_id")
                sp_configuracion_actualizar_notif_navegador(id_usuario, activo)

                estado = "activadas" if activo else "desactivadas"
                flash(
                    f"Las notificaciones del navegador han sido {estado} correctamente.",
                    "success"
                )

            except Exception:
                flash(
                    "Ocurrió un error al actualizar las notificaciones del navegador. "
                    "Intenta de nuevo más tarde.",
                    "danger"
                )
        else:
            flash("Solicitud inválida. Por favor recarga la página e intenta de nuevo.", "warning")

        return redirect(url_for("aplication.settings"))


# ==========================================================================
# ELIMINAR CUENTA
    
    def Delete_Account_Service(self):
        form_eliminar = FormEliminarCuenta()
        
        if form_eliminar.validate_on_submit():
            id_usuario = session.get("user_id")
            username = session.get("username_login")
            
            if not id_usuario or not username:
                flash("Sesión no válida. Por favor inicia sesión de nuevo.", "danger")
                return redirect(url_for("auth.login_user"))
            
            password = form_eliminar.contraseña.data

            try:
                # 1. Obtener sal y validar contraseña
                data_user = sp_validar_data_user(username)
                if not data_user:
                    raise Exception("Usuario no encontrado")
                
                data_user = data_user[0]
                salt = data_user["Password_Salt"]

                if not self._validar_usuario(username, password, salt):
                    flash("Contraseña incorrecta. No se procedió con la eliminación.", "danger")
                    return redirect(url_for("aplication.settings"))
                
                # 2. Proceder con la eliminación lógica
                ip = request.remote_addr or ""
                user_agent = request.headers.get("User-Agent", "")
                
                sp_eliminar_cuenta_completa(id_usuario, ip, user_agent)
                
                session.clear()
                flash("Cuenta eliminada correctamente. Hasta pronto.", "success")
                return redirect(url_for("auth.login_user"))

            except Exception as e:
                db.rollback()
                print(f"[ERROR] eliminar_cuenta: {e}")
                flash("Error de sistema al procesar la solicitud.", "danger")
                return redirect(url_for("aplication.settings"))
            
        # Si el formulario no es válido o falta la contraseña
        flash("Debe ingresar su contraseña para confirmar.", "warning")
        return redirect(url_for("aplication.settings"))

    def _validar_usuario(self, username, password, salt):
        try:
            hash_password = hashear_contraseña(password, "user", salt)
            result = sp_validar_login(username, hash_password)
            # Retorna True solo si el resultado es SUCCESS
            return result and result[0].get("Resultado") == "SUCCESS"
        except Exception as e:
            print(f"[ERROR] _validar_usuario: {e}")
            return False