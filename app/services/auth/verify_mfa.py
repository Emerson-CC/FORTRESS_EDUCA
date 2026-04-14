# FUNCIONES DE FLASK
from flask import render_template, request, redirect, flash, session

# CONFIGURACIONES LOCALES
from app.forms.auth_forms import FormVerificarMFA
from app.repositories.auth_repository import sp_obtener_mfa_secret
from app.utils.audit_utils import Auditoria_Session

# CONFIGURAICONES GLOBALES

# SEGURIDAD
from app.security.mfa_controller import MFA_Controller

# ====================================================================================================================================================
#                                           PAGINA VERIFY_MFA.HTML
# ====================================================================================================================================================

class Verify_MFA_Service:

    def Verify_MFA(self):
        """Valida el código TOTP durante el login para usuarios con 2FA activo"""
        
        # Variables en caso de no encontrarse en session
        # _DEFAULT_LOGIN_URL = "auth.login_user"
        # _DEFAULT_SUCCESS_URL = "aplication.dashboard"
        
        login_url = session.get("mfa_login_url", session["mfa_login_url"])
        success_url = session.get("mfa_success_url", session["mfa_success_url"])
        
        # Solo accesible si viene de un login exitoso con MFA pendiente
        if not session.get("mfa_pendiente") or not session.get("mfa_user_autenticado"):
            return redirect(login_url)


        form = FormVerificarMFA()
        
        # =====================================================
        # SOLICITUD POST
        
        if request.method == "POST" and form.validate_on_submit():
            id_usuario = session.get("user_id")
            ip = request.remote_addr
            user_agent = request.headers.get("User-Agent", "")

            try:
                data = sp_obtener_mfa_secret(id_usuario)
                if not data:
                    flash("Error de sesión. Inicie sesión nuevamente.", "danger")
                    return redirect(login_url)

                row = data[0]
                secret = row.get("MFA_Secret") or row.get("mfa_secret")
                if isinstance(secret, (bytes, bytearray)):
                    secret = secret.decode("utf-8")

                if not secret or not MFA_Controller.verificar_codigo(secret, form.codigo_mfa.data.strip()):
                    Auditoria_Session(id_usuario, ip, "FAILED_MFA", user_agent)
                    flash("Código incorrecto. Intente de nuevo.", "danger")
                    return render_template("auth/verify_mfa.html", form=form)

                # MFA válido: limpiar banderas y permitir acceso
                session.pop("mfa_pendiente", None)
                session.pop("mfa_user_autenticado", None)
                session.pop("mfa_login_url", None)
                session.pop("mfa_success_url", None)
                
                Auditoria_Session(id_usuario, ip, "LOGIN_MFA_OK", user_agent)
                return redirect(success_url)

            except Exception as e:
                print(f"[ERROR] VerificarMFA.verificar: {e}")
                flash("Error interno. Intente nuevamente.", "danger")

        return render_template("auth/verify_mfa.html", form=form)