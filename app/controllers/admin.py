from app.services.admin.dashboard import Dashboard_Service
from app.services.admin.ticket_panel import Ticket_Panel_Service
from app.services.admin.cases import Cases_Service
from app.services.admin.accounts import Accounts_Service
from app.services.admin.accounts_user import Accounts_User_Service
from app.services.admin.accounts_func import Accounts_Func_Service
from app.services.admin.history import History_Service

class AdminController:
    """Controlador de funciones para la parte de admin"""

    def __init__(self):
        self.dashboard_service = Dashboard_Service()        
        self.ticket_panel_service = Ticket_Panel_Service()
        self.cases_service = Cases_Service()
        self.accounts_service = Accounts_Service()
        self.accounts_user_service = Accounts_User_Service()
        self.accounts_func_service = Accounts_Func_Service()
        self.history_service = History_Service()
        
    # DASHBOARD
    def dashboard(self):
        return self.dashboard_service.cargar_dashboard()
        
    # CASES
    def cases(self):
        return self.cases_service.listar_todos_tickets()

    # TICKET PANEL
    def ticket_panel_detail(self, id_ticket: str):
        return self.ticket_panel_service.cargar_ticket_panel(id_ticket)

        # TAB COMENTARIOS
    def ticket_add_comentario(self, id_ticket: str):
        return self.ticket_panel_service.agregar_comentario(id_ticket)

        # SIDERBAR
    def ticket_update_estado(self, id_ticket: str):
        return self.ticket_panel_service.actualizar_estado(id_ticket)

        # TAB ASIGNACIÓN DE CUPO
    def ticket_asignar_cupo(self, id_ticket: str):
        return self.ticket_panel_service.asignar_cupo(id_ticket)

    def ticket_filtrar_cupo(self, id_ticket: str):
        return self.ticket_panel_service.filtrar_cupo(id_ticket)

        # TAB DOCUMENTOS
    def ticket_upload_doc(self, id_ticket: str):
        return self.ticket_panel_service.subir_documento(id_ticket)

    def ticket_download_doc(self, id_ticket: str, id_doc: int):
        return self.ticket_panel_service.descargar_documento(id_ticket, id_doc)

        # TAB COMFIRMACIÓN DE CUPO
    def ticket_autorizar_cupo(self, id_ticket: str):
        return self.ticket_panel_service.autorizar_cupo(id_ticket)

    def ticket_cancelar_cupo(self, id_ticket: str):
        return self.ticket_panel_service.cancelar_cupo(id_ticket)
    
    # ACCOUNTS
    def accounts(self):
        return self.accounts_service.listar_historial()

        # ACCOUNTS USER
    def accounts_user(self):
        return self.accounts_user_service.listar_usuarios()

    def toggle_estado_usuario(self, id_usuario: int):
        return self.accounts_user_service.toggle_estado_usuario(id_usuario)

    def toggle_estado_estudiante(self, id_estudiante: int):
        return self.accounts_user_service.toggle_estado_estudiante(id_estudiante)

        # ACCOUNTS FUNC
    def accounts_func(self):
        return self.accounts_func_service.listar_funcionarios()

    def toggle_estado_tecnico(self, id_usuario: int):
        return self.accounts_func_service.toggle_estado_tecnico(id_usuario)
    
    # HISTORY
    def history(self):
        return self.history_service.listar_auditoria()

    def history_export(self):
        return self.history_service.exportar_csv()    