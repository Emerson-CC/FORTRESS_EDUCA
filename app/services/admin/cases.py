from flask import render_template, request
 
from app.repositories.admin_repository import sp_cases_listar_todos, sp_cases_metricas, sp_catalogo_estados_ticket, sp_catalogo_grados, sp_catalogo_tipo_afectacion
from app.forms.admin_forms import FormFiltroTickets


# ==============================================================================
# Helpers de filtrado
# ==============================================================================

def _filtrar_tickets(tickets: list[dict], id_estado: int | None, id_grado: int | None, id_afectacion: int | None,) -> list[dict]:
    """Aplica los tres filtros disponibles sobre la lista completa de tickets"""
    resultado = tickets

    # Filtro por estado del ticket
    if id_estado:
        resultado = [
            t for t in resultado
            if t["FK_ID_Estado_Ticket"] == id_estado
        ]

    # Filtro por grado: coincide con el grado actual O el próximo del estudiante
    if id_grado:
        resultado = [
            t for t in resultado
            if t.get("FK_ID_Grado_Actual") == id_grado
            or t.get("FK_ID_Grado_Proximo") == id_grado
        ]

    # Filtro por tipo de afectación
    if id_afectacion:
        resultado = [
            t for t in resultado
            if t["FK_ID_Tipo_Afectacion"] == id_afectacion
        ]

    return resultado


# ==============================================================================
# Helpers de ordenamiento
# ==============================================================================

def _insertion_sort_por_fecha_asc(tickets: list[dict]) -> list[dict]:
    """Insertion Sort ascendente por Fecha_Creacion"""
    lista = list(tickets)
    for i in range(1, len(lista)):
        actual = lista[i]
        clave  = actual["Fecha_Creacion"]
        j = i - 1
        while j >= 0 and lista[j]["Fecha_Creacion"] > clave:
            lista[j + 1] = lista[j]
            j -= 1
        lista[j + 1] = actual
    return lista


def _selection_sort_por_prioridad_desc(tickets: list[dict]) -> list[dict]:
    """Selection Sort descendente por Puntaje_Prioridad"""
    lista = list(tickets)
    n = len(lista)
    for i in range(n):
        idx_max = i
        for j in range(i + 1, n):
            if lista[j]["Puntaje_Prioridad"] > lista[idx_max]["Puntaje_Prioridad"]:
                idx_max = j
        lista[i], lista[idx_max] = lista[idx_max], lista[i]
    return lista


class Cases_Service:
    """Servicio para la vista de listado de todos los tickets (admin)"""
 
    def listar_todos_tickets(self):
        """Obtiene los tickets aplicando los filtros"""
    
        # =====================================================
        # SOLICITUD GET — Leer filtros desde la query string 

        id_estado = self._parse_int(request.args.get("estado"))
        id_grado = self._parse_int(request.args.get("grado"))
        id_afectacion = self._parse_int(request.args.get("afectacion"))
 
        # Catálogos para los <select> de filtros
        estados = sp_catalogo_estados_ticket()
        grados = sp_catalogo_grados()
        afectaciones = sp_catalogo_tipo_afectacion()
 
        choices_estados = [(0, "Todos los estados")] + [(e["ID_Estado_Ticket"], e["Nombre_Estado"]) for e in estados]
        choices_grados = [(0, "Todos los grados")] + [(g["ID_Grado"], g["Nombre_Grado"]) for g in grados]
        choices_afectaciones = [(0, "Todas las afectaciones")] + [(a["ID_Tipo_Afectacion"], a["Nombre_Afectacion"]) for a in afectaciones]

        form_filtro = FormFiltroTickets(request.args)
        form_filtro.estado.choices = choices_estados
        form_filtro.grado.choices = choices_grados
        form_filtro.afectacion.choices = choices_afectaciones
 
        # Consultar datos 
        todos_tickets  = sp_cases_listar_todos()
        tickets_filtrados = _filtrar_tickets(
            todos_tickets, id_estado, id_grado, id_afectacion
        ) 
 
        # Valores seleccionados (para mantener el estado del formulario
        hay_filtro = any([id_estado, id_grado, id_afectacion])
        if hay_filtro:
            # Con filtros: Insertion Sort por fecha ASC (orden de llegada)
            tickets_ordenados = _insertion_sort_por_fecha_asc(tickets_filtrados)
        else:
            # Sin filtros: Selection Sort por prioridad DESC (más urgentes primero)
            tickets_ordenados = _selection_sort_por_prioridad_desc(tickets_filtrados)

        # Métricas y render
        metricas = sp_cases_metricas()

        filtros_activos = {
            "estado": id_estado,
            "grado": id_grado,
            "afectacion": id_afectacion,
        }
        
        return render_template(
            "admin/cases.html",
            tickets = tickets_ordenados,
            total_tickets = len(tickets_ordenados),
            metricas = metricas,
            form_filtro = form_filtro,
            estados = estados,
            filtros = filtros_activos,
            active_page = "cases",
        )
 
    @staticmethod
    def _parse_int(valor: str | None) -> int | None:
        """Convierte un string a int; retorna None si está vacío o no es numérico"""
        try:
            v = int(valor)
            return v if v > 0 else None
        except (TypeError, ValueError):
            return None