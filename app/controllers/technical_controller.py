from app.services.technical.dashboard import Dashboard_Service
from app.services.tickets.ticket_panel import Ticket_Panel_Service
from app.services.technical.cases import Cases_Service
from app.services.admin.history import History_Service
from app.services.admin.settings import Settings_Service


class TechnicalController:
    """Controlador de funciones para la parte de tecnicos"""

    def __init__(self):
        self.dashboard_service = Dashboard_Service()        
        self.ticket_panel_service = Ticket_Panel_Service()
        self.cases_service = Cases_Service()
        self.history_service = History_Service()
        self.settings_service = Settings_Service()
        
    # DASHBOARD
    def dashboard(self):
        return self.dashboard_service.cargar_dashboard()
        
    # CASES
    def cases(self):
        return self.cases_service.listar_tickets_tecnico()

    
    # HISTORY
    def history(self):
        return self.history_service.listar_auditoria()

    def history_export(self):
        return self.history_service.exportar_csv()    
    
    
    # SETTINGS
    def settings(self):
        return self.settings_service.cargar_settings()
