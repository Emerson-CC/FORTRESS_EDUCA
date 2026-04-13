from flask import session, redirect, url_for, request
from datetime import datetime, timezone
from flask_jwt_extended import unset_jwt_cookies, verify_jwt_in_request, get_jwt

from app.settings import Config_Session

from app.utils.database_utils import db
from app.repositories.auth_repository import sp_cerrar_sesion

# Declarar Constantes para configuración
TIEMPO_MAX_INACTIVIDAD = Config_Session.PERMANENT_SESSION_LIFETIME
MAX_SESSION_DURATION = Config_Session.MAX_SESSION_DURATION


def _cerrar_sesion_inactiva():
    try:
        verify_jwt_in_request(optional=True)
        claims = get_jwt()
        if claims:
            jti = claims.get("jti", "")
            if jti:
                sp_cerrar_sesion(jti)
                db.commit()

        jti = session.get("jti")
        if jti:
            sp_cerrar_sesion(jti)
            db.commit()
            print(f"[INFO] Sesión cerrada por inactividad: JTI={jti}")
    except Exception as e:
        print(f"[WARN] No se pudo cerrar sesión en BD (inactividad): {e}")
    finally:
        session.clear()


def controlar_sesion(app):
    @app.before_request
    def verificar_inactividad():
        rutas_publicas = [
            "auth.login",
            "auth.verify_mfa",
        ]

        if request.endpoint in rutas_publicas:
            return None

        if "user_id" in session:
            ahora = datetime.now(timezone.utc)
            session_start_str = session.get("session_start")
            if session_start_str:
                try:
                    session_start = datetime.fromisoformat(session_start_str)
                    if ahora - session_start > MAX_SESSION_DURATION:
                        _cerrar_sesion_inactiva()
                        response = redirect(url_for("auth.login_user"))
                        unset_jwt_cookies(response)
                        return response
                except ValueError:
                    _cerrar_sesion_inactiva()
                    response = redirect(url_for("auth.login_user"))
                    unset_jwt_cookies(response)
                    return response

            ultima_str = session.get("ultima_actividad")
            if ultima_str:
                try:
                    ultima = datetime.fromisoformat(ultima_str)
                    if ahora - ultima > TIEMPO_MAX_INACTIVIDAD:
                        _cerrar_sesion_inactiva()
                        response = redirect(url_for("auth.login_user"))
                        unset_jwt_cookies(response)
                        return response
                except ValueError:
                    _cerrar_sesion_inactiva()
                    response = redirect(url_for("auth.login_user"))
                    unset_jwt_cookies(response)
                    return response

            session["ultima_actividad"] = ahora.isoformat()
