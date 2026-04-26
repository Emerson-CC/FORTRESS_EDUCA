from flask_wtf import FlaskForm
from wtforms import SelectField
from wtforms.validators import Optional

# ====================================================================================================================================================
#                                           PAGINA CASES.HTML
# ====================================================================================================================================================

class FormFiltroTicketsTecnico(FlaskForm):
    """Filtros GET para technical_cases.html"""

    class Meta:
        csrf = False # Formulario GET de solo lectura

    estado = SelectField(
        "Estado",
        coerce=int,
        default=0,
        validators=[Optional()],
    )
    grado = SelectField(
        "Grado",
        coerce=int,
        default=0,
        validators=[Optional()],
    )
    afectacion = SelectField(
        "Tipo de Afectación",
        coerce=int,
        default=0,
        validators=[Optional()],
    )