# FUNCIONES DE FLASK
from flask import request, redirect, url_for, flash, session

# CONFIGURACIONES LOCALES
from app.forms.auth_forms import FormVerificarMFA
from app.repositories.auth_repository import sp_obtener_mfa_secret

# UTILIDADES
from app.utils.audit_utils import Auditoria_Session
from app.utils.response_utils import render_no_cache

# SEGURIDAD
from app.security.mfa_controller import MFA_Controller


# ====================================================================================================================================================
#                                           PAGINA VERIFY_MFA.HTML
# ====================================================================================================================================================

class Verify_MFA_Service:

    def Verify_MFA(self):
        """Valida el código TOTP durante el login para usuarios con 2FA activo"""

        # si la clave no existe en session
        login_url = session.get("mfa_login_url", url_for("auth.login_admin"))
        success_url = session.get("mfa_success_url", url_for("admin.dashboard"))

        # Guard entes de instanciar el form y usa 303.
        if not session.get("mfa_pendiente") or not session.get("mfa_user_autenticado"):
            session.pop("mfa_pendiente", None)
            session.pop("mfa_user_autenticado", None)
            return redirect(login_url, 303)

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
                    return redirect(login_url, 303)

                row = data[0]
                secret = row.get("MFA_Secret") or row.get("mfa_secret")
                if isinstance(secret, (bytes, bytearray)):
                    secret = secret.decode("utf-8")

                if not secret or not MFA_Controller.verificar_codigo(secret, form.codigo_mfa.data.strip()):
                    Auditoria_Session(id_usuario, ip, "FAILED_MFA", user_agent)
                    flash("Código incorrecto. Intente de nuevo.", "danger")
                    return render_no_cache("auth/verify_mfa.html", form=form)

                # MFA válido: limpiar banderas y redirigir
                session.pop("mfa_pendiente", None)
                session.pop("mfa_user_autenticado", None)
                session.pop("mfa_login_url", None)
                session.pop("mfa_success_url", None)

                Auditoria_Session(id_usuario, ip, "LOGIN_MFA", user_agent)
                return redirect(success_url, 303)

            except Exception as e:
                print(f"[ERROR] VerificarMFA.verificar: {e}")
                flash("Error interno. Intente nuevamente.", "danger")

        # =====================================================
        # SOLICITUD POST
        return render_no_cache("auth/verify_mfa.html", form=form)
    
    
<div class="inner-card-body">

    {% if ticket.Estado_Final == 0 %}
    <form method="POST"
        action="{{ url_for('admin.ticket_asignar_cupo', id_ticket=ticket.ID_Ticket) }}">

        {{ form_asignacion.hidden_tag() }}

        <!-- PASO 1 -->
        <div class="card border-0 shadow-sm mb-3">
            <div class="card-body">
                <h6 class="fw-bold text-primary mb-3">
                    <i class="fas fa-map-marker-alt me-1"></i> Ubicación
                </h6>

                <div class="mb-2">
                    <label class="form-label small fw-bold">Barrio</label>
                    {{ form_asignacion.barrio(class="form-select form-select-sm") }}
                </div>
            </div>
        </div>

        <!-- PASO 2 -->
        <div class="card border-0 shadow-sm mb-3">
            <div class="card-body">
                <h6 class="fw-bold text-primary mb-3">
                    <i class="fas fa-school me-1"></i> Institución
                </h6>

                <div class="mb-2">
                    <label class="form-label small fw-bold">Colegio</label>
                    {{ form_asignacion.colegio_asignado(class="form-select form-select-sm") }}
                </div>

                <div class="mb-2">
                    <label class="form-label small fw-bold">Jornada</label>
                    {{ form_asignacion.jornada_asignada(class="form-select form-select-sm") }}
                </div>
            </div>
        </div>

        <!-- PASO 3 -->
        <div class="card border-0 shadow-sm mb-3">
            <div class="card-body">
                <h6 class="fw-bold text-primary mb-3">
                    <i class="fas fa-user-graduate me-1"></i> Datos Académicos
                </h6>

                <input type="text" class="form-control form-control-sm"
                    value="{{ estudiante.Nombre_Grado_Proximo or '—' }}" readonly>
            </div>
        </div>

        <!-- PASO 4 -->
        <div class="card border-0 shadow-sm mb-3">
            <div class="card-body">
                <h6 class="fw-bold text-success mb-3">
                    <i class="fas fa-check-circle me-1"></i> Confirmación de Cupo
                </h6>

                <div class="mb-2">
                    <label class="form-label small fw-bold">Cupo disponible</label>
                    {{ form_asignacion.cupo(class="form-select form-select-sm") }}
                </div>

                <div class="form-text">
                    Solo se muestran cupos disponibles según la selección.
                </div>
            </div>
        </div>

        <!-- BOTÓN -->
        <div class="d-grid">
            <button type="submit" class="btn btn-success btn-sm">
                <i class="fas fa-check-circle me-1"></i> Confirmar Asignación
            </button>
        </div>

    </form>
    
    
    
    
                        <!-- TAB 2 — ASIGNACIÓN DE CUPO -->
                    <div class="tab-pane fade tab-content-inner"
                        id="pane-asignacion" role="tabpanel">

                        <div class="alert alert-info small py-2 mb-3">
                            <i class="fas fa-info-circle me-1"></i>
                            <strong>Izquierda:</strong> datos declarados por el acudiente.
                            <strong>Derecha:</strong> campos editables para la asignación oficial del cupo.
                        </div>

                        <div class="row g-4">

                            <!-- Panel lateral -->
                            <div class="col-lg-3">
                                <!-- Columna lectura -->
                                <div class="inner-card">
                                    <div class="inner-card-head">
                                        <i class="fas fa-eye"></i> Preferencias del Acudiente
                                    </div>
                                    <div class="inner-card-body">
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Colegio de Preferencia</label>
                                            <input type="text" class="form-control form-control-sm"
                                                value="{{ ticket.Colegio_Preferencia }}" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Jornada Preferida</label>
                                            <input type="text" class="form-control form-control-sm"
                                                value="{{ ticket.Nombre_Jornada }}" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Tipo de Afectación</label>
                                            <input type="text" class="form-control form-control-sm"
                                                value="{{ ticket.Nombre_Afectacion }}" readonly>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Barrio de Residencia</label>
                                            <input type="text" class="form-control form-control-sm"
                                                value="{{ ticket.Nombre_Barrio }}" readonly>
                                        </div>
                                        <div class="mb-0">
                                            <label class="form-label text-muted small fw-bold">Tiempo de Residencia</label>
                                            <input type="text" class="form-control form-control-sm"
                                                value="{{ ticket.Nombre_Tiempo or '—' }}" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Columna asignación cupo -->
                            <div class="col-lg-9">

                                <div class="inner-card">
                                    <div class="inner-card-head">
                                        <i class="fas fa-pen-to-square"></i> Asignación Oficial
                                    </div>
                                    <div class="inner-card-body">
                                        {% if ticket.Estado_Final == 0 %}
                                        <form method="POST"
                                            action="{{ url_for('admin.ticket_asignar_cupo', id_ticket=ticket.ID_Ticket) }}">

                                            <!-- Solo se muestren barrios con colegios asignados -->
                                            <!-- UBICACIÓN - PRIMER PASO -->
                                            {{ form_asignacion.hidden_tag() }}
                                            <div class="mb-3">
                                                <label class="form-label text-muted small fw-bold">
                                                    Barrio <span class="text-danger">*</span>
                                                </label>
                                                {{ form_asignacion.barrio(class="form-select form-select-sm") }}
                                            </div>
                                            <!-- INSTITUCIÓN - SEGUNDO PASO -->
                                            <!-- En base al barrio seleccionado se muestran los colegios de ese barrio -->
                                            <div class="mb-3">
                                                <label class="form-label text-muted small fw-bold">
                                                    Colegio Asignado <span class="text-danger">*</span>
                                                </label>
                                                {{ form_asignacion.colegio_asignado(class="form-select form-select-sm") }}
                                            </div>
                                            <!-- Se muestran las jordanas disposibles segun el colegio selecionado -->
                                            <div class="mb-3">
                                                <label class="form-label text-muted small fw-bold">
                                                    Jornada Asignada <span class="text-danger">*</span>
                                                </label>
                                                {{ form_asignacion.jornada_asignada(class="form-select form-select-sm") }}
                                            </div>
                                            <!-- Se toma automaticamente de los datos del estudiante cuando se registro -->
                                            <div class="mb-3">
                                                <label class="form-label text-muted small fw-bold">Grado a Cursar</label>
                                                <input type="text" class="form-control form-control-sm"
                                                    value="{{ estudiante.Nombre_Grado_Proximo or '—' }}" readonly>
                                            </div>

                                            <!-- CONFIRMACIÓN - SEGUNDO PASO -->
                                            <!-- Se valida en TBL_CUPO si existe un cupo con las siguiente condiciones:
                                                - FK_ID_Grado = Grado ingresado en el registro 'Nombre_Grado_Proximo'
                                                - FK_ID_Colegio = ID_Colegio del colegio seleccionado
                                                - FK_ID_Jornada = ID_Jornada de la jornada seleccionada
                                                - Cupos_Disponibles > 0
                                                - Estado_Cupos = 1
                                            -->
                                            <!-- Eliminar seleccion de cupo -->
                                            <div class="mb-3">
                                                <label class="form-label text-muted small fw-bold">
                                                    Cupo Asignado <span class="text-danger">*</span>
                                                </label>
                                                {{ form_asignacion.cupo(class="form-select form-select-sm") }}
                                                <div class="form-text">Seleccione el cupo disponible en el sistema.</div>
                                            </div>
                                            <!-- Si existe un cupo con las condiciones
                                            Motrar toda la información prebia (Colegio, jornada, curso)
                                            Confirmar solicitud

                                            Si se confirma. FK_ID_Estado_Ticket = Solucionado (ID_Estado_Ticket = 0)

                                            Si no se confima, el tecnico/admin debe poder cambiar alguna opcion para seguir validando
                                            -->
                                            <!-- Si no exite cupo con las condiciones
                                            Motrar toda la información prebia (Colegio, jornada, curso)
                                            
                                            Dar un mensaje indicando que no existe ningun cupo en esos momentos (sin boton de confirmar)
                                            El tecnico/admin debe cambiar alguna opcion para validar si existe un cupo con otras opciones.
                                            
                                            -->
                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-success btn-sm">
                                                    <i class="fas fa-check-circle me-1"></i> Confirmar Asignación
                                                </button>
                                            </div>
                                        </form>
                                        {% else %}
                                        <div class="mb-3">
                                            <label class="form-label text-muted small fw-bold">Colegio Asignado</label>
                                            <input type="text" class="form-control form-control-sm"
                                                value="{{ ticket.Colegio_Asignado }}" readonly>
                                        </div>
                                        <div class="alert alert-secondary py-2 small mb-0">
                                            <i class="fas fa-lock me-1"></i>
                                            Asignación bloqueada. El ticket está cerrado.
                                        </div>
                                        {% endif %}
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- /tab asignacion -->
