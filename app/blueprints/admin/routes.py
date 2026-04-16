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

@admin_bp.route("/cases")
#@login_required
#@admin_required
def cases():
    return controller.cases()

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

@admin_bp.route("/users")
##@login_required
#@admin_required
def users():
    return render_template("admin/users.html", active_page="users")

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
