import datetime
import math

from flask import render_template, request

from app.repositories.admin_repository import (
    sp_cases_exportar_todos,
    sp_cases_listar_todos,
    sp_cases_metricas,
    sp_catalogo_estados_ticket,
    sp_catalogo_grados,
    sp_catalogo_tipo_afectacion,
)
from app.forms.admin_forms import FormFiltroTickets
from app.utils.export_doc_utils import ExportarReporte

POR_PAGINA = 20

COLUMNAS_EXPORT = [
    "ID Ticket", "Estudiante", "Acudiente", "Edad",
    "Grado", "Afectación", "Estado", "Prioridad",
    "Colegio Asignado", "Técnico",
]

# Campos sobre los que actúa la búsqueda libre.
_CAMPOS_BUSQUEDA = (
    "ID_Ticket",
    "Nombre_Estudiante",
    "Nombre_Acudiente",
    "Nombre_Estado",
    "Nombre_Grado",
    "Nombre_Afectacion",
    "Colegio_Asignado",
    "Nombre_Tecnico",
)


# ==============================================================================
# Helpers de búsqueda
# ==============================================================================

def _normalizar(valor) -> str:
    """Convierte cualquier valor a string minúscula para comparación."""
    return str(valor).lower() if valor else ""


def _construir_indice(registros: list[dict]) -> list[tuple[dict, str]]:
    """Pre-computa una cadena de búsqueda por registro"""
    return [
        (r, " ".join(_normalizar(r.get(c)) for c in _CAMPOS_BUSQUEDA))
        for r in registros
    ]


def _buscar_tickets(registros: list[dict], query: str | None) -> list[dict]:
    """Filtra registros cuya cadena indexada contenga TODOS los términos"""
    if not query:
        return registros

    terminos = [t for t in query.strip().lower().split() if t]
    if not terminos:
        return registros

    indexado = _construir_indice(registros)
    return [
        r for r, cadena in indexado
        if all(t in cadena for t in terminos)
    ]


# ==============================================================================
# Helpers de filtrado por selectores
# ==============================================================================

def _filtrar_tickets(
    registros: list[dict],
    id_estado: int | None,
    id_grado: int | None,
    id_afectacion: int | None,
) -> list[dict]:
    resultado = registros
    if id_estado:
        resultado = [r for r in resultado if r["FK_ID_Estado_Ticket"] == id_estado]
    if id_grado:
        resultado = [r for r in resultado if r["FK_ID_Grado"] == id_grado]
    if id_afectacion:
        resultado = [r for r in resultado if r["FK_ID_Tipo_Afectacion"] == id_afectacion]
    return resultado


# ==============================================================================
# Helpers de ordenamiento
# ==============================================================================

def _insertion_sort_fecha_desc(registros: list[dict]) -> list[dict]:
    """Insertion Sort DESC por Fecha_Creacion — con filtros/búsqueda activos."""
    lista = list(registros)
    for i in range(1, len(lista)):
        actual = lista[i]
        clave  = actual["Fecha_Creacion"] or datetime.datetime.min
        j = i - 1
        while j >= 0:
            clave_j = lista[j]["Fecha_Creacion"] or datetime.datetime.min
            if clave_j < clave:
                lista[j + 1] = lista[j]
                j -= 1
            else:
                break
        lista[j + 1] = actual
    return lista


def _selection_sort_prioridad_desc(registros: list[dict]) -> list[dict]:
    """Selection Sort DESC por Puntaje_Prioridad — sin filtros ni búsqueda."""
    lista = list(registros)
    n = len(lista)
    for i in range(n):
        idx_max = i
        for j in range(i + 1, n):
            if (lista[j]["Puntaje_Prioridad"] or 0) > (lista[idx_max]["Puntaje_Prioridad"] or 0):
                idx_max = j
        lista[i], lista[idx_max] = lista[idx_max], lista[i]
    return lista


# ==============================================================================
# Paginación
# ==============================================================================

def _paginar(registros: list[dict], pagina: int, por_pagina: int) -> list[dict]:
    inicio = (pagina - 1) * por_pagina
    return registros[inicio: inicio + por_pagina]


# ==============================================================================
# Servicio
# ==============================================================================

class Cases_Service:
    """Servicio para la vista de listado de todos los tickets (admin)."""

    # ------------------------------------------------------------------
    # Vista principal
    # ------------------------------------------------------------------
    def listar_todos_tickets(self):

        # Leer y sanitizar parámetros GET
        id_estado = self._parse_int(request.args.get("estado"))
        id_grado = self._parse_int(request.args.get("grado"))
        id_afectacion = self._parse_int(request.args.get("afectacion"))
        busqueda = (request.args.get("busqueda") or "").strip()[:100]
        pagina = self._parse_pagina(request.args.get("pagina"))

        # Catálogos para los <select>
        estados = sp_catalogo_estados_ticket()
        grados = sp_catalogo_grados()
        afectaciones = sp_catalogo_tipo_afectacion()

        # Formulario
        form_filtro = FormFiltroTickets(request.args, meta={"csrf": False})
        form_filtro.estado.choices = [(0, "Todos los estados")] + [(e["ID_Estado_Ticket"], e["Nombre_Estado"]) for e in estados]
        form_filtro.grado.choices = [(0, "Todos los grados")] + [(g["ID_Grado"], g["Nombre_Grado"]) for g in grados]
        form_filtro.afectacion.choices = [(0, "Todas las afectaciones")] + [(a["ID_Tipo_Afectacion"], a["Nombre_Afectacion"]) for a in afectaciones]

        # Pipeline: BD → filtros selector → búsqueda libre → orden → paginar
        todos = sp_cases_listar_todos()
        filtrados = _filtrar_tickets(todos, id_estado, id_grado, id_afectacion)
        buscados = _buscar_tickets(filtrados, busqueda)

        hay_restriccion = any([id_estado, id_grado, id_afectacion, busqueda])
        ordenados = _insertion_sort_fecha_desc(buscados) if hay_restriccion \
                    else _selection_sort_prioridad_desc(buscados)

        total_tickets = len(ordenados)
        total_paginas = max(1, math.ceil(total_tickets / POR_PAGINA))
        if pagina > total_paginas:
            pagina = total_paginas

        tickets_pagina = _paginar(ordenados, pagina, POR_PAGINA)
        metricas = sp_cases_metricas() or {}

        filtros_activos = {
            "estado": id_estado,
            "grado": id_grado,
            "afectacion": id_afectacion,
            "busqueda": busqueda,
        }

        return render_template(
            "admin/cases.html",
            tickets = tickets_pagina,
            total_tickets = total_tickets,
            metricas = metricas,
            form_filtro = form_filtro,
            filtros = filtros_activos,
            pagina_actual = pagina,
            total_paginas = total_paginas,
            por_pagina = POR_PAGINA,
            active_page = "cases",
        )

    # ------------------------------------------------------------------
    # Exportar CSV / PDF  (aplica los mismos filtros + búsqueda)
    # ------------------------------------------------------------------
    def exportar_tickets(self):
        formato = request.args.get("formato", "csv").lower()
        id_estado = self._parse_int(request.args.get("estado"))
        id_grado = self._parse_int(request.args.get("grado"))
        id_afectacion = self._parse_int(request.args.get("afectacion"))
        busqueda = (request.args.get("busqueda") or "").strip()[:100]

        todos = sp_cases_exportar_todos()
        filtrados = _filtrar_tickets(todos, id_estado, id_grado, id_afectacion)
        buscados = _buscar_tickets(filtrados, busqueda)

        hay_restriccion = any([id_estado, id_grado, id_afectacion, busqueda])
        ordenados = _insertion_sort_fecha_desc(buscados) if hay_restriccion \
                    else _selection_sort_prioridad_desc(buscados)

        def mapeador(r):
            return {
                "ID Ticket": r["ID_Ticket"],
                "Estudiante": r["Nombre_Estudiante"],
                "Acudiente": r.get("Nombre_Acudiente", "—"),
                "Edad": f"{r.get('Edad_Estudiante', '—')} años",
                "Grado": r["Nombre_Grado"],
                "Afectación": r["Nombre_Afectacion"],
                "Estado": r["Nombre_Estado"],
                "Prioridad": r["Puntaje_Prioridad"],
                "Colegio Asignado": r.get("Colegio_Asignado") or "Sin asignar",
                "Técnico": r.get("Nombre_Tecnico") or "Sin asignar",
            }

        fila = ExportarReporte.cargar_fila(ordenados, mapeador)
        datos = fila.a_lista_datos()
        marca = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M")

        if formato == "pdf":
            return ExportarReporte.pdf(datos, COLUMNAS_EXPORT, "Solicitudes de Cupo", f"solicitudes_{marca}")
        return ExportarReporte.csv(datos, COLUMNAS_EXPORT, f"solicitudes_{marca}")

    # ------------------------------------------------------------------
    # Helpers
    # ------------------------------------------------------------------
    @staticmethod
    def _parse_int(valor) -> int | None:
        try:
            v = int(valor)
            return v if v > 0 else None
        except (TypeError, ValueError):
            return None

    @staticmethod
    def _parse_pagina(valor) -> int:
        try:
            p = int(valor)
            return p if p >= 1 else 1
        except (TypeError, ValueError):
            return 1