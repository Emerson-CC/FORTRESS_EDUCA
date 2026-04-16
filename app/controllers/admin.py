from app.services.admin.ticket_panel import Ticket_Panel_Service
from app.services.admin.cases import Cases_Service


class AdminController:
    """Controlador de funciones para la parte de admin"""

    def __init__(self):
        self.ticket_panel_service = Ticket_Panel_Service()
        self.cases_service = Cases_Service()

    # CASES
    def cases(self):
        return self.cases_service.listar_todos_tickets()

    # TICKET PANEL
    def ticket_panel_detail(self, id_ticket: str):
        return self.ticket_panel_service.cargar_ticket_panel(id_ticket)

    def ticket_add_comentario(self, id_ticket: str):
        return self.ticket_panel_service.agregar_comentario(id_ticket)

    def ticket_update_estado(self, id_ticket: str):
        return self.ticket_panel_service.actualizar_estado(id_ticket)

    def ticket_asignar_cupo(self, id_ticket: str):
        return self.ticket_panel_service.asignar_cupo(id_ticket)

    def ticket_upload_doc(self, id_ticket: str):
        return self.ticket_panel_service.subir_documento(id_ticket)

    def ticket_download_doc(self, id_ticket: str, id_doc: int):
        return self.ticket_panel_service.descargar_documento(id_ticket, id_doc)
