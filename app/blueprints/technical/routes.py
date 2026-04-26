from flask import Blueprint
from app.utils.decorators.technical_decorator import technical_required, login_required, mfa_required
from app.controllers.technical_controller import TechnicalController

technical_bp = Blueprint("technical", __name__, url_prefix="/fortress_tecnicos")
controller = TechnicalController()

@technical_bp.route("/dashboard")
@login_required
@technical_required
@mfa_required
def dashboard():
    return controller.dashboard()   

# CASES
@technical_bp.route("/cases")
@login_required
@technical_required
@mfa_required
def cases():
    return controller.cases()

# HISTORY
@technical_bp.route("/history")
@login_required
@technical_required
@mfa_required
def history():
    return controller.history()

@technical_bp.route("/history/export")
@login_required
@technical_required
@mfa_required
def history_export():
    return controller.history_export()

