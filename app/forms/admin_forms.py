from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileRequired, FileAllowed

from wtforms import SelectField, TextAreaField, BooleanField, DateTimeLocalField, HiddenField
from wtforms.validators import DataRequired, Optional, Length


# ─── Validador reutilizable: asegura que el SelectField no quede en "-- Seleccione --" ───
def seleccion_valida(form, field):
    from wtforms.validators import ValidationError
    if not field.data or int(field.data) == 0:
        raise ValidationError("Debe seleccionar una opción válida.")


# ====================================================================================================================================================
#                                           PAGINA CASES.HTML
# ====================================================================================================================================================


    
# ====================================================================================================================================================
#                                           PAGINA TICKET_PANEL.HTML
# ====================================================================================================================================================

# Cambio de estado del ticket
class FormCambiarEstado(FlaskForm):
    """Permite al técnico cambiar el estado del ticket"""
    estado = SelectField(
        "Estado",
        validators=[DataRequired(message="Debe seleccionar un estado."), seleccion_valida],
        coerce=int,
        choices=[],  # se carga en el servicio
    )

    fecha_cierre = DateTimeLocalField(
        "Fecha de Cierre",
        format="%Y-%m-%dT%H:%M",
        validators=[Optional()],
    )

    resolucion = TextAreaField(
        "Resolución",
        validators=[
            DataRequired(message="La resolución es obligatoria."),
            Length(min=5, max=2000, message="La resolución debe tener entre 5 y 2000 caracteres."),
        ],
        render_kw={"rows": 3},
    )


# Agregar comentario al ticket
class FormAgregarComentario(FlaskForm):
    """Permite al técnico agregar un comentario al ticket"""
    comentario = TextAreaField(
        "Comentario",
        validators=[
            DataRequired(message="El comentario no puede estar vacío."),
            Length(min=3, max=3000, message="El comentario debe tener entre 3 y 3000 caracteres."),
        ],
        render_kw={"rows": 3, "placeholder": "Escribe tu comentario aquí…"},
    )

    es_interno = BooleanField(
        "Interno",
        default=False,
    )


class FormConfirmarCupo(FlaskForm):
    """Formulario vacío: solo sirve para validar el token CSRF."""
    pass
    
# Subir documento
class FormSubirDocumentoTecnico(FlaskForm):
    """Formulario para subir documentos adicionales al ticket desde el rol técnico."""

    tipo_documento = SelectField(
        "Tipo de Documento",
        validators=[DataRequired(), seleccion_valida],
        coerce=int,
        choices=[],  # se carga en el servicio
    )

    archivo = FileField(
        "Archivo",
        validators=[
            FileRequired(message="Debe seleccionar un archivo."),
            FileAllowed(
                ["pdf", "jpg", "jpeg", "png"],
                message="Solo se permiten archivos PDF, JPG o PNG.",
            ),
        ],
    )
    

# ====================================================================================================================================================
#                                           PAGINA ACCOUNTS.HTML
# ====================================================================================================================================================

class FormToggleEstado(FlaskForm):
    """Form para cambiar estado de usuario/estudiante/técnico via POST."""
    nuevo_estado = HiddenField("nuevo_estado", validators=[DataRequired()])