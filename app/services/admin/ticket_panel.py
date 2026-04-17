import io
from flask import render_template, redirect, url_for, flash, session, send_file

#  Repositories 
from app.repositories.admin_repository import (
    # Detalle
    sp_ticket_panel_consultar_detalle,
    # Comentarios
    sp_ticket_panel_comentarios_consultar,
    sp_ticket_panel_comentario_insertar,
    # Estado
    sp_ticket_panel_estado_actualizar,
    # Cupo
    sp_ticket_panel_asignar_cupo,
    # Documentos
    sp_ticket_panel_documentos_consultar,
    sp_ticket_panel_documento_descargar,
    sp_ticket_panel_documento_insertar,
    # Datos de acudiente / estudiante
    sp_ticket_panel_acudiente_consultar,
    sp_ticket_panel_estudiante_consultar,
    # Catálogos
    sp_catalogo_estados_ticket,
    sp_catalogo_colegios,
    sp_catalogo_jornadas,
    sp_catalogo_tipo_afectacion,
    sp_catalogo_cupos_disponibles,
    sp_tipo_documento_consultar,
    sp_catalogo_barrios,
)

from app.forms.admin_forms import FormCambiarEstado, FormAgregarComentario, FormAsignarCupo, FormSubirDocumentoTecnico
from app.utils.database_utils import db

# Constantes 
_ALLOWED_EXTENSIONS = {"pdf", "jpg", "jpeg", "png"}
_MAX_FILE_BYTES = 5 * 1024 * 1024   # 5 MB


class Ticket_Panel_Service:
    """Servicio principal para el panel técnico de tickets."""

    def __init__(self):
        self._allowed_extensions = _ALLOWED_EXTENSIONS
        self._max_file_bytes = _MAX_FILE_BYTES

    def _cargar_formularios(self, id_ticket: str) -> dict:
        """Instancia y rellena los formularios del panel del ticket."""
        form_estado = FormCambiarEstado()
        estados = sp_catalogo_estados_ticket()
        form_estado.estado.choices = [(0, "-- Seleccione --")] + [
            (e["ID_Estado_Ticket"], e["Nombre_Estado"]) for e in estados
        ]

        form_comentario = FormAgregarComentario()

        form_asignacion = FormAsignarCupo()
        colegios = sp_catalogo_colegios()
        jornadas = sp_catalogo_jornadas()
        afectaciones = sp_catalogo_tipo_afectacion()
        barrios = sp_catalogo_barrios()
        cupos = sp_catalogo_cupos_disponibles(id_ticket)

        form_asignacion.colegio_asignado.choices = [(0, "-- Seleccione --")] + [
            (c["ID_Colegio"], c["Nombre_Colegio"]) for c in colegios
        ]
        form_asignacion.jornada_asignada.choices = [(0, "-- Seleccione --")] + [
            (j["ID_Jornada"], j["Nombre_Jornada"]) for j in jornadas
        ]
        form_asignacion.tipo_afectacion.choices = [(0, "-- Seleccione --")] + [
            (a["ID_Tipo_Afectacion"], a["Nombre_Afectacion"]) for a in afectaciones
        ]
        form_asignacion.barrio.choices = [(0, "-- Seleccione --")] + [
            (b["ID_Barrio"], b["Nombre_Barrio"]) for b in barrios
        ]
        form_asignacion.cupo.choices = [(0, "-- Seleccione --")] + [
            (cu["ID_Cupos"], cu["Label_Cupo"]) for cu in cupos
        ]

        form_doc = FormSubirDocumentoTecnico()
        tipos_doc = sp_tipo_documento_consultar()
        form_doc.tipo_documento.choices = [(0, "-- Seleccione --")] + [
            (t["ID_Tipo_Doc"], t["Nombre_Tipo_Doc"]) for t in tipos_doc
        ]

        return {
            "form_estado": form_estado,
            "form_comentario": form_comentario,
            "form_asignacion": form_asignacion,
            "form_doc": form_doc,
        }

    def _cargar_contexto_ticket(self, id_ticket: str) -> dict | None:
        """Carga los datos completos del ticket para el panel."""
        ticket = sp_ticket_panel_consultar_detalle(id_ticket)
        if not ticket:
            return None

        comentarios = sp_ticket_panel_comentarios_consultar(id_ticket)
        documentos = sp_ticket_panel_documentos_consultar(id_ticket)
        acudiente = sp_ticket_panel_acudiente_consultar(id_ticket)
        estudiante = sp_ticket_panel_estudiante_consultar(id_ticket)

        return {
            "ticket": ticket,
            "comentarios": comentarios,
            "documentos": documentos,
            "acudiente": acudiente,
            "estudiante": estudiante,
        }   

    def _contexto_tecnico(self) -> dict:
        """Construye datos de contexto del técnico para el navbar."""
        nombre = session.get("nombre_usuario", "Técnico")
        partes = nombre.strip().split()
        iniciales = "".join(p[0].upper() for p in partes[:2]) if partes else "T"
        return {"nombre_usuario": nombre, "iniciales": iniciales}

    def cargar_ticket_panel(self, id_ticket: str):
        """Retorna la vista del detalle del ticket."""
        ctx = self._cargar_contexto_ticket(id_ticket)
        if not ctx:
            flash("El ticket no existe o no está disponible.", "danger")
            return redirect(url_for("admin.ticket_panel"))

        forms = self._cargar_formularios(id_ticket)
        forms["form_estado"].estado.data = ctx["ticket"]["ID_Estado_Ticket"]

        return render_template(
            "admin/ticket_panel.html",
            **ctx,
            **forms,
            tecnico=self._contexto_tecnico(),
        )

    def agregar_comentario(self, id_ticket: str):
        """Agrega un comentario interno o público al ticket."""
        form = FormAgregarComentario()
        if not form.validate_on_submit():
            errores = "; ".join(
                f"{f}: {', '.join(msgs)}" for f, msgs in form.errors.items()
            )
            print(f"[FORM ERROR - comentario] {errores}")
            flash("Por favor revise el comentario antes de enviarlo.", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

        try:
            sp_ticket_panel_comentario_insertar(
                id_ticket=id_ticket,
                id_usuario=session["user_id"],
                comentario=form.comentario.data.strip(),
                es_interno=form.es_interno.data,
            )
            db.commit()
            flash("Comentario agregado correctamente.", "success")
        except Exception as e:
            db.rollback()
            print(f"[ERROR - comentario] {e}")
            flash("Ocurrió un error al guardar el comentario.", "danger")

        return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

    def actualizar_estado(self, id_ticket: str):
        """Actualiza el estado del ticket."""
        form_estado = FormCambiarEstado()
        estados = sp_catalogo_estados_ticket()
        form_estado.estado.choices = [(0, "-- Seleccione --")] + [
            (e["ID_Estado_Ticket"], e["Nombre_Estado"]) for e in estados
        ]

        if not form_estado.validate_on_submit():
            errores = "; ".join(
                f"{f}: {', '.join(msgs)}" for f, msgs in form_estado.errors.items()
            )
            print(f"[FORM ERROR - estado] {errores}")
            flash("Por favor revise los campos antes de guardar.", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

        fecha_cierre = form_estado.fecha_cierre.data if form_estado.fecha_cierre.data else None

        try:
            sp_ticket_panel_estado_actualizar(
                id_ticket=id_ticket,
                id_estado_nuevo=form_estado.estado.data,
                fecha_cierre=fecha_cierre,
                resolucion=form_estado.resolucion.data.strip(),
                id_tecnico=session["user_id"],
            )
            db.commit()
            flash("Estado del ticket actualizado correctamente.", "success")
        except Exception as e:
            db.rollback()
            print(f"[ERROR - estado] {e}")
            flash("No se pudo actualizar el estado. Intente nuevamente.", "danger")

        return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

    def asignar_cupo(self, id_ticket: str):
        """Asigna el cupo seleccionado al ticket."""
        form_asignacion = FormAsignarCupo()
        form_asignacion.colegio_asignado.choices = [(0, "-- Seleccione --")] + [
            (c["ID_Colegio"], c["Nombre_Colegio"]) for c in sp_catalogo_colegios()
        ]
        form_asignacion.jornada_asignada.choices = [(0, "-- Seleccione --")] + [
            (j["ID_Jornada"], j["Nombre_Jornada"]) for j in sp_catalogo_jornadas()
        ]
        form_asignacion.tipo_afectacion.choices = [(0, "-- Seleccione --")] + [
            (a["ID_Tipo_Afectacion"], a["Nombre_Afectacion"]) for a in sp_catalogo_tipo_afectacion()
        ]
        form_asignacion.barrio.choices = [(0, "-- Seleccione --")] + [
            (b["ID_Barrio"], b["Nombre_Barrio"]) for b in sp_catalogo_barrios()
        ]
        form_asignacion.cupo.choices = [(0, "-- Seleccione --")] + [
            (cu["ID_Cupos"], cu["Label_Cupo"]) for cu in sp_catalogo_cupos_disponibles(id_ticket)
        ]

        if not form_asignacion.validate_on_submit():
            errores = "; ".join(
                f"{f}: {', '.join(msgs)}" for f, msgs in form_asignacion.errors.items()
            )
            print(f"[FORM ERROR - cupo] {errores}")
            flash("Por favor revise los campos de asignación.", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

        try:
            sp_ticket_panel_asignar_cupo(
                id_ticket=id_ticket,
                id_cupo=form_asignacion.cupo.data,
                id_tecnico=session["user_id"],
            )
            db.commit()
            flash("Cupo asignado correctamente.", "success")
        except Exception as e:
            db.rollback()
            print(f"[ERROR - cupo] {e}")
            flash("No se pudo asignar el cupo. Intente nuevamente.", "danger")

        return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

    def subir_documento(self, id_ticket: str):
        """Sube un documento adicional al ticket."""
        form_doc = FormSubirDocumentoTecnico()
        tipos_doc = sp_tipo_documento_consultar()
        form_doc.tipo_documento.choices = [(0, "-- Seleccione --")] + [
            (t["ID_Tipo_Doc"], t["Nombre_Tipo_Doc"]) for t in tipos_doc
        ]

        if not form_doc.validate_on_submit():
            errores = "; ".join(
                f"{f}: {', '.join(msgs)}" for f, msgs in form_doc.errors.items()
            )
            print(f"[FORM ERROR - documento] {errores}")
            flash(f"Por favor revise el formulario de documentos: {errores}", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket) + "#pane-documentos")

        archivo_field = form_doc.archivo.data
        nombre_original = archivo_field.filename
        extension = nombre_original.rsplit(".", 1)[-1].lower()

        if extension not in self._allowed_extensions:
            flash("Tipo de archivo no permitido. Solo PDF, JPG o PNG.", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket) + "#pane-documentos")

        contenido = archivo_field.read()
        if len(contenido) > self._max_file_bytes:
            flash("El archivo supera el límite de 5 MB.", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket) + "#pane-documentos")

        try:
            sp_ticket_panel_documento_insertar(
                id_ticket=id_ticket,
                id_tipo_doc=form_doc.tipo_documento.data,
                archivo=contenido,
                nombre_original=nombre_original,
            )
            sp_ticket_panel_comentario_insertar(
                id_ticket=id_ticket,
                id_usuario=session["user_id"],
                comentario=f"[Documento Subido] {nombre_original}",
                es_interno=True,
            )
            db.commit()
            flash("Documento subido correctamente.", "success")
        except Exception as e:
            db.rollback()
            print(f"[ERROR - documento upload] {e}")
            flash("Ocurrió un error al subir el documento.", "danger")

        return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

    def descargar_documento(self, id_ticket: str, id_doc: int):
        """Descarga el documento asociado al ticket."""
        doc = sp_ticket_panel_documento_descargar(id_doc)
        if not doc:
            flash("Documento no encontrado.", "danger")
            return redirect(url_for("admin.ticket_panel_detail", id_ticket=id_ticket))

        return send_file(
            io.BytesIO(doc["Archivo"]),
            download_name=doc["Nombre_Original"],
            as_attachment=True,
        )