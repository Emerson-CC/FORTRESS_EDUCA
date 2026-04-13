# ====================================================================================================================================================
#                                           PAGINA REGISTER.HTML
# ====================================================================================================================================================

class Register_Service:
 
    def _form_registro_acudiente(self, form):
        """Pobla las opciones de listas desplegables del formulario de registro"""
        try:
            barrio = sp_obtener_barrios()
            parentesco = sp_obtener_parentesco_acu()
            tipos_documento = sp_obtener_tipos_documento()
            
            # Poblar SelectField: Barrio
            form.barrio.choices = [
                (bar["ID_Barrio"], bar["Nombre_Barrio"]) for bar in barrio
            ]
            
            # Poblar SelectField: Parentesco
            form.parentesco.choices = [
                (par["ID_Parentesco"], par["Nombre_Parentesco"]) for par in parentesco
            ]
            
            # Poblar SelectField: Tipo de Documento
            form.tipo_documento.choices = [
                (doc["ID_Tipo_Iden"], doc["Nombre_Tipo_Iden"]) for doc in tipos_documento
            ]
            
        except Exception as e:
            print(f"[ERROR] Error al cargar opciones de formulario: {e}")
            flash("Error al cargar el formulario. Intente nuevamente.", "danger")
 
 
    def Register(self):
        """Maneja las solicitudes GET y POST del formulario de registro"""
        
        form = RegisterForm()
        
        # Poblar opciones de SelectField desde la BD
        self._form_registro_acudiente(form)
        
        # =====================================================
        # SOLICITUD GET: Renderizar formulario vacío
        
        if request.method == "GET":
            response = make_response(
                render_template(
                    "auth/register.html",
                    form=form,
                    recaptcha_site_key=current_app.config.get("RECAPTCHA_SITE_KEY", ""),
                    recaptcha_error=None
                )
            )
            response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, private"
            response.headers["Pragma"] = "no-cache"
            response.headers["Expires"] = "0"
            return response
 
        # =====================================================
        # SOLICITUD POST: Procesar registro
        
        token_recaptcha = request.form.get("g-recaptcha-response", "")
        if not token_recaptcha:
            flash("Por favor complete la verificación reCAPTCHA antes de continuar.", "danger")
            return redirect(url_for("auth.register"))
 
        if not validar_recaptcha(token_recaptcha):
            flash("La verificación reCAPTCHA falló o expiró. Intente nuevamente.", "danger")
            return redirect(url_for("auth.register"))
 
        if not form.validate_on_submit():
            errores = "; ".join(
                f"{field}: {', '.join(msgs)}"
                for field, msgs in form.errors.items()
            )
            print(f"[VALIDACIÓN] Errores en el formulario: {errores}")
            flash("Error con el formulario. Por favor revise los campos.", "danger")
            return redirect(url_for("auth.register"))
 
        try:
            user_exists = sp_usuario_existe(form.email.data)
            if user_exists:
                flash(
                    "El documento o correo electrónico ya está registrado en el sistema. "
                    "Si olvidó su contraseña, use la opción 'Recuperar contraseña'.",
                    "warning"
                )
                return redirect(url_for("auth.register"))
 
        except Exception as e:
            print(f"[ERROR] Error al verificar usuario: {e}")
            flash("Error al procesar su registro. Intente nuevamente más tarde.", "danger")
            return redirect(url_for("auth.register"))
 
        try:
            salt = generar_salt()
            hash_password = hashear_contraseña(form.password.data, salt)
            
            ip = request.remote_addr
            user_agent = request.headers.get("User-Agent", "")
 
            sp_registrar_usuario((
                form.primer_nombre.data.strip(),
                form.segundo_nombre.data.strip() if form.segundo_nombre.data else None,
                form.primer_apellido.data.strip(),
                form.segundo_apellido.data.strip() if form.segundo_apellido.data else None,
                form.fecha_nacimiento.data,
                form.email.data.lower(),
                form.telefono.data.strip(),
                form.parentesco.data,
                form.tipo_documento.data,
                1,
                1,
                1,
                form.barrio.data,
                form.email.data.lower(),
                salt,
                hash_password,
                2,
                ip,
                user_agent
            ))
            
            db.commit()
            flash("Cuenta creada correctamente. Ya puede iniciar sesión con sus credenciales.", "success")
            return redirect(url_for("auth.login_user"))
 
        except Exception as e:
            # Revertir cambios en BD en caso de error
            db.rollback()
            
            print(f"[ERROR] Registro fallido: {e}")
            
            # Mostrar mensaje de error genérico al usuario
            flash("Ocurrió un error al crear la cuenta. Intente nuevamente o contacte al administrador.", "danger")
            
            return redirect(url_for("auth.register"))
 




