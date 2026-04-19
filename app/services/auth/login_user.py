from datetime import datetime, timezone

# FUNCIONES DE FLASK
from flask import render_template, request, redirect, url_for, flash, session, current_app, make_response
from flask_jwt_extended import set_access_cookies, set_refresh_cookies, unset_jwt_cookies, get_jwt, verify_jwt_in_request, decode_token

# CONFIGURACIONES LOCALES
from app.forms.auth_forms import LoginUserForm
from app.repositories.auth_repository import sp_validar_data_user, sp_registrar_sesion, sp_validar_data_autenticacion, sp_exito_login, sp_obtener_roles, sp_cerrar_sesion

# SEGURIDAD
from app.security.recaptcha_controller import validar_recaptcha
from app.security.jwt_controller import generar_access_token, generar_refresh_token

# UTILIDADES
from app.utils.password_utils import verificar_contraseña
from app.utils.database_utils import db
from app.utils.audit_utils import Auditoria_Session


# Declarar Variables Globales
CODIGO_TTL_MINUTOS = 10  # tiempo de expiración codigo
    # Intentos fallidos antes de exigir reCAPTCHA
INTENTOS_PARA_RECAPTCHA = 3

class Login_User_Service:
    """Servicio de autenticación."""

# ====================================================================================================================================================
#                                           PAGINA LOGIN_USER.HTML
# ====================================================================================================================================================
    
    def Login_User(self):
        """Validación de credenciales y rol para ingreso"""
        
        form = LoginUserForm()

        # Se usa la IP como base pero se guarda en session para simplicidad.
        intentos_fallidos = session.get("login_intentos", 0)
        mostrar_recaptcha = intentos_fallidos >= INTENTOS_PARA_RECAPTCHA

        # =====================================================
        # SOLICITUD POST

        if request.method == "POST":

            if not form.validate_on_submit():
                errores = "; ".join(
                    f"{field}: {', '.join(msgs)}"
                    for field, msgs in form.errors.items()
                )
                print(f"Errores en el formulario: {errores}")
                return render_template(
                    "auth/login_user.html",
                    form=form,
                    mostrar_recaptcha=mostrar_recaptcha,
                    recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                )

            # Datos de auditoría
            ip = request.remote_addr
            user_agent = request.headers.get("User-Agent")

            # Se valida antes de consultar la BD para ahorrar recursos.
            if mostrar_recaptcha:
                token_recaptcha = request.form.get("g-recaptcha-response", "")

                if not token_recaptcha:
                    flash("Por favor complete el reCAPTCHA.", "warning")
                    return render_template(
                        "auth/login_user.html",
                        form=form,
                        mostrar_recaptcha=True,
                        recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                    )

                # validar_recaptcha retorna True si el token es válido
                if not validar_recaptcha(token_recaptcha):
                    flash("reCAPTCHA inválido. Intente nuevamente.", "danger")
                    return render_template(
                        "auth/login_user.html",
                        form=form,
                        mostrar_recaptcha=True,
                        recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                    )

            # Credenciales del formulario
            username = form.username.data
            password = form.password.data

            try:
                # Buscar datos del usuario en BD por nombre de usuario
                data_user = sp_validar_data_user(username)

                if not data_user:
                    # Se pasa 2 como ID (usuario generido de auditoria del sistema) si no existe en la BD. 
                    Auditoria_Session(2, ip, "US_FAILED_LOGIN", user_agent)

                    # Incrementar contador de intentos fallidos
                    session["login_intentos"] = intentos_fallidos + 1
                    mostrar_recaptcha = session["login_intentos"] >= INTENTOS_PARA_RECAPTCHA

                    flash("Credenciales inválidas", "danger")
                    return render_template(
                        "auth/login_user.html",
                        form=form,
                        mostrar_recaptcha=mostrar_recaptcha,
                        recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                    )
                    
                # Cache en memoria para evitar consultas repetidas a BD
                            
                data_user = data_user[0]

                # Validar credenciales del usuario
                login_validate = self._validar_usuario(username, password)
    
                if not login_validate:
                    # Auditar intento fallido con usuario existente
                    Auditoria_Session(data_user["ID_Usuario"], ip, "FAILED_LOGIN", user_agent)

                    # Incrementar contador de intentos fallidos
                    session["login_intentos"] = intentos_fallidos + 1
                    mostrar_recaptcha = session["login_intentos"] >= INTENTOS_PARA_RECAPTCHA

                    flash("Credenciales inválidas", "danger")
                    return render_template(
                        "auth/login_user.html",
                        form=form,
                        mostrar_recaptcha=mostrar_recaptcha,
                        recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                    )

                # Validar el rol del usuario
                id_rol = data_user["FK_ID_Rol"]
                rol_usuario_validate = self._validar_rol_usuario(id_rol)

                if not rol_usuario_validate:
                    # Auditar intento fallido con usuario existente
                    Auditoria_Session(data_user["ID_Usuario"], ip, "FAILED_LOGIN", user_agent)

                    # Incrementar contador de intentos fallidos
                    session["login_intentos"] = intentos_fallidos + 1
                    mostrar_recaptcha = session["login_intentos"] >= INTENTOS_PARA_RECAPTCHA

                    flash("La cuenta no tiene los permisos necesarios para acceder", "danger")
                    return render_template(
                        "auth/login_user.html",
                        form=form,
                        mostrar_recaptcha=mostrar_recaptcha,
                        recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                    )

                # LOGIN EXITOSO
                session.pop("login_intentos", None)

                primer_nombre   = data_user.get("Primer_Nombre", "")
                primer_apellido = data_user.get("Primer_Apellido", "")
                nombre_completo = data_user.get("Nombre_Completo", "")

                iniciales = (
                    (primer_nombre[0] if primer_nombre else "") +
                    (primer_apellido[0] if primer_apellido else "")
                ).upper()

                
                # Guardar datos importantes para la sesión
                session.permanent = True
                session["user_id"] = data_user["ID_Usuario"]
                session["username"] = nombre_completo
                session["username_login"] = username
                session["role_id"] = data_user["FK_ID_Rol"]
                session["double_factor"] = data_user["Doble_Factor_Activo"]
                session["nombre_acudiente"] = nombre_completo
                session["iniciales"] = iniciales
                session["session_start"] = datetime.now(timezone.utc).isoformat()
                session["ultima_actividad"] = datetime.now(timezone.utc).isoformat()
                
                # GENERAR TOKENS
                access_token = generar_access_token(data_user["ID_Usuario"], data_user["FK_ID_Rol"])
                refresh_token = generar_refresh_token(data_user["ID_Usuario"])

                # RESPUESTA
                response = make_response(redirect(url_for("aplication.dashboard")))

                set_access_cookies(response, access_token)
                set_refresh_cookies(response, refresh_token)
                
                try:
                    decoded = decode_token(access_token)

                    jti = decoded.get("jti", "")
                    session["jti"] = jti
                    
                    sp_registrar_sesion(
                        data_user["ID_Usuario"],
                        jti,
                        user_agent[:255] if user_agent else "Desconocido",
                        ip
                    )
                    db.commit()
                except Exception as e:
                    print(f"[WARN] No se pudo registrar sesión: {e}")
                    
                # Auditoría
                Auditoria_Session(data_user["ID_Usuario"], ip, "LOGIN", user_agent)
                
                if data_user.get("Doble_Factor_Activo") == "ACTIVE":
                    # Marcar que el usuario autenticó credenciales pero aún falta MFA
                    session["mfa_pendiente"] = True
                    session["mfa_user_autenticado"] = True  # bandera para /verify-mfa
                    session["mfa_login_url"] = url_for("auth.login_user")
                    session["mfa_success_url"] = url_for("aplication.dashboard")
                    
                    # Generar tokens igual (para registrar sesión), pero redirigir a MFA
                    response = make_response(redirect(url_for("auth.verify_mfa")))
                    set_access_cookies(response, access_token)
                    set_refresh_cookies(response, refresh_token)

                    try:
                        decoded = decode_token(access_token)
                        jti = decoded.get("jti", "")
                        sp_registrar_sesion(
                            data_user["ID_Usuario"],
                            jti,
                            user_agent[:255] if user_agent else "Desconocido",
                            ip
                        )
                        db.commit()
                    except Exception as e:
                        print(f"[WARN] No se pudo registrar sesión: {e}")

                    Auditoria_Session(data_user["ID_Usuario"], ip, "PENDING_MFA", user_agent)
                    
                return response

            except Exception as e:
                print(f"[ERROR] Error en login: {e}")
                flash("Error interno del servidor. Intente nuevamente.", "danger")
                return render_template(
                    "auth/login_user.html",
                    form=form,
                    mostrar_recaptcha=mostrar_recaptcha,
                    recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
                )

        # =====================================================
        # GET — renderizar formulario con estado actual de intentos
        return render_template(
            "auth/login_user.html",
            form=form,
            mostrar_recaptcha=mostrar_recaptcha,
            recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", "")
        )
    
    def _validar_usuario(self, username, password_ingresada):
        try:
            user_data = sp_validar_data_autenticacion(username)

            if not user_data:
                return False 

            id_usuario = user_data[0].get("ID_Usuario")
            hash_db = user_data[0].get("Contraseña_Hash")

            if not hash_db:
                return False
            
            # Evaluar si las contraseñas coinciden
            es_valido = verificar_contraseña(password_ingresada, hash_db)

            if es_valido:
                # Notificar a la BD
                sp_exito_login(id_usuario)
                return True
            else:
                # Contraseña incorrecta
                return False

        except Exception as e:
            print(f"[ERROR] _validar_usuario: {e}")
            return False

    
    def _validar_rol_usuario(self, role_id):
        """Obtiene el ID del rol para comparar con el rol del usuario"""
        
        try:
            if role_id is None:
                return False
                
            id_rol_requerido = sp_obtener_roles("Acudiente")
            if id_rol_requerido != role_id:
                return False
            return True
        
        except Exception as e:
            print(f"[ERROR] _validar_rol_usuario: {e}")
            return False
        
        
# ====================================================================================================================================================
#                                           FUNCIÓN DE LOGOUT
# ====================================================================================================================================================

    def Logout(self):
        """Cierra la sesión del usuario activo usando Flask-JWT-Extended"""
        try:
            verify_jwt_in_request(optional=True)
            claims = get_jwt()

            if claims:
                user_id = claims.get("sub")
                jti = claims.get("jti", "")
                ip = request.remote_addr
                user_agent = request.headers.get("User-Agent")

                # Marcar sesión como inactiva en BD
                if jti:
                    try:
                        sp_cerrar_sesion(jti)
                        db.commit()
                    except Exception as e:
                        print(f"[WARN] No se pudo cerrar sesión en BD: {e}")

                Auditoria_Session(user_id, ip, "LOGOUT", user_agent)

            response = make_response(redirect(url_for("auth.login_user")))
            unset_jwt_cookies(response)
            session.clear()
            return response

        except Exception as e:
            print(f"[ERROR] Logout: {e}")
            response = make_response(redirect(url_for("auth.login_user")))
            unset_jwt_cookies(response)
            session.clear()
            return response