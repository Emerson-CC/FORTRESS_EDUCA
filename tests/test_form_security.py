from app.security.forms_controller import validate_no_html, validate_no_sql_injection, validate_no_cmd_injection
from wtforms import ValidationError
from app.forms.aplication_forms import FormAgregarComentarioUsuario

def test_xss_en_comentario_es_rechazado(app):
    """El comentario con script NO debe guardarse ni pasar validación."""

    with app.app_context():
        with app.test_request_context():
            form = FormAgregarComentarioUsuario(data={
                "comentario": "<script>alert('XSS')</script>"
            })
            result = form.validate()

            assert result is False, "El formulario debió fallar"
            assert form.comentario.errors, "Debió haber errores en el campo"
            # Verificar que el valor filtrado no contiene el script
            assert "<script>" not in form.comentario.data


def test_cmd_injection_en_comentario_es_rechazado(app):
    with app.app_context():
        with app.test_request_context():
            payloads = ["| cat /etc/passwd", "`whoami`", "$(rm -rf /)"]
            for payload in payloads:
                form = FormAgregarComentarioUsuario(data={"comentario": payload})
                result = form.validate()
                assert result is False, f"Payload '{payload}' debió ser rechazado"