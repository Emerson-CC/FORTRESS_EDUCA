from flask import Blueprint, render_template
from app.utils.decorators.admin_decorators import admin_required, login_required
from app.controllers.admin import AdminController

admin_bp = Blueprint("admin", __name__, url_prefix="/fortress_administrativo")
controller = AdminController()

@admin_bp.route("/dashboard")
##@login_required
#@admin_required
def dashboard():
    return render_template("admin/dashboard.html", active_page="dashboard")

# CASES
@admin_bp.route("/cases")
#@login_required
#@admin_required
def cases():
    return controller.cases()

# TICKET PANEL
@admin_bp.route("/ticket_panel/<string:id_ticket>", methods=["GET"])
#@login_required
#@admin_required
def ticket_panel_detail(id_ticket):
    return controller.ticket_panel_detail(id_ticket)

@admin_bp.route("/ticket_panel/<string:id_ticket>/comentario", methods=["POST"])
#@login_required
#@admin_required
def ticket_add_comentario(id_ticket):
    return controller.ticket_add_comentario(id_ticket)

@admin_bp.route("/ticket_panel/<string:id_ticket>/estado", methods=["POST"])
#@login_required
#@admin_required
def ticket_update_estado(id_ticket):
    return controller.ticket_update_estado(id_ticket)

@admin_bp.route("/ticket_panel/<string:id_ticket>/cupo", methods=["POST"])
#@login_required
#@admin_required
def ticket_asignar_cupo(id_ticket):
    return controller.ticket_asignar_cupo(id_ticket)

@admin_bp.route("/ticket_panel/<string:id_ticket>/documento", methods=["POST"])
#@login_required
#@admin_required
def ticket_upload_doc(id_ticket):
    return controller.ticket_upload_doc(id_ticket)

@admin_bp.route("/ticket_panel/<string:id_ticket>/documento/<int:id_doc>/descargar", methods=["GET"])
#@login_required
#@admin_required
def ticket_download_doc(id_ticket, id_doc):
    return controller.ticket_download_doc(id_ticket, id_doc)

# ACCOUNTS
@admin_bp.route("/cuentas")
# @login_required
# @admin_required
def accounts():
    return controller.accounts()

    # ACCOUNTS USER
@admin_bp.route("/cuentas/usuarios")
# @login_required
# @admin_required
def accounts_user():
    return controller.accounts_user()

@admin_bp.route("/cuentas/usuarios/<int:id_usuario>/estado", methods=["POST"])
# @login_required
# @admin_required
def accounts_user_toggle_estado(id_usuario):
    return controller.toggle_estado_usuario(id_usuario)

@admin_bp.route("/cuentas/usuarios/estudiante/<int:id_estudiante>/estado", methods=["POST"])
# @login_required
# @admin_required
def accounts_estudiante_toggle_estado(id_estudiante):
    return controller.toggle_estado_estudiante(id_estudiante)

    # ACCOUNTS FUNC
@admin_bp.route("/cuentas/funcionarios")
# @login_required
# @admin_required
def accounts_func():
    return controller.accounts_func()

@admin_bp.route("/cuentas/funcionarios/<int:id_usuario>/estado", methods=["POST"])
# @login_required
# @admin_required
def accounts_func_toggle_estado(id_usuario):
    return controller.toggle_estado_tecnico(id_usuario)



@admin_bp.route("/history")
#@login_required
#@admin_required
def history():
    return render_template("admin/history.html", active_page="history")

@admin_bp.route("/settings")
#@login_required
#@admin_required
def settings():
    return render_template("admin/settings.html")
