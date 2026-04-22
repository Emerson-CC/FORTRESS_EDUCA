# ============================================================
# app/services/admin/school_service.py
# Lógica de negocio para el módulo de colegios.
# ============================================================

from flask import render_template, redirect, url_for, flash, request

from app.forms.admin_forms import (
    FormFiltroColegios,
    FormAgregarColegio,
    FormEditarColegio,
    FormGuardarJornadas,
    FormCambiarEstadoColegio,
)
from app.repositories.admin_repository import (
    sp_admin_colegios_estadisticas,
    sp_admin_colegios_listar,
    sp_admin_colegio_detalle,
    sp_admin_colegio_insertar,
    sp_admin_colegio_actualizar,
    sp_admin_colegio_estado_cambiar,
    sp_admin_colegio_jornadas_activas,
    sp_admin_colegio_jornada_agregar,
    sp_admin_colegio_jornada_quitar,
    sp_admin_colegio_cupos_obtener,
    sp_admin_colegio_cupo_guardar,
    sp_catalogo_barrios_activos,
    sp_catalogo_jornadas_activas,
    sp_catalogo_grados_activos,
)


# ─────────────────────────────────────────────────────────────────────
# HELPERS DE ORDENAMIENTO
# Se usan para filtrar/ordenar la lista de colegios en Python,
# cumpliendo el requisito de ordenamiento en el backend (no en SQL).
# ─────────────────────────────────────────────────────────────────────

def _insertion_sort_por_nombre(colegios: list[dict]) -> list[dict]:
    """Insertion Sort ascendente sobre la clave 'Nombre_Colegio'"""
    
    lista = list(colegios)
    for i in range(1, len(lista)):
        actual = lista[i]
        clave  = actual["Nombre_Colegio"].lower()
        j = i - 1
        while j >= 0 and lista[j]["Nombre_Colegio"].lower() > clave:
            lista[j + 1] = lista[j]
            j -= 1
        lista[j + 1] = actual
    return lista


def _selection_sort_por_cupos_desc(colegios: list[dict]) -> list[dict]:
    """
        Selection Sort descendente sobre la clave 'Total_Cupos'. 
        Se usa cuando el usuario no aplica ningún filtro, mostrando primero los colegios con más cupos configurados.
    """
    lista = list(colegios)
    n = len(lista)
    for i in range(n):
        idx_max = i
        for j in range(i + 1, n):
            if lista[j]["Total_Cupos"] > lista[idx_max]["Total_Cupos"]:
                idx_max = j
        lista[i], lista[idx_max] = lista[idx_max], lista[i]
    return lista


def _filtrar_colegios(colegios: list[dict], nombre: str, estado: str, id_barrio: int, id_jornada: int, jornadas_catalogo: list[dict]) -> list[dict]:
    """
    Aplica los filtros de la barra de búsqueda sobre la lista completa.
    Toda la lógica vive aquí, sin cláusulas WHERE en SQL.

    Parámetros
    ----------
    colegios : lista completa devuelta por sp_admin_colegios_listar
    nombre : texto libre (busca en Nombre_Colegio y Codigo_DANE)
    estado : "1", "0" o "" (todos)
    id_barrio : ID del barrio o 0 (todos)
    id_jornada : ID de la jornada o 0 (todos)
    jornadas_catalogo : lista [{ID_Jornada, Nombre_Jornada}] para resolver nombre
    """
    resultado = colegios

    # Filtro por nombre / DANE (búsqueda parcial, insensible a mayúsculas)
    if nombre:
        termino = nombre.strip().lower()
        resultado = [
            c for c in resultado
            if termino in c["Nombre_Colegio"].lower()
            or termino in c["Codigo_DANE"].lower()
        ]

    # Filtro por estado
    if estado in ("0", "1"):
        resultado = [
            c for c in resultado
            if str(c["Estado_Colegio"]) == estado
        ]

    # Filtro por barrio
    if id_barrio:
        resultado = [
            c for c in resultado
            if c["ID_Barrio"] == id_barrio
        ]

    # Filtro por jornada (busca el nombre dentro de Jornadas_Activas)
    if id_jornada:
        nombre_jornada = next(
            (j["Nombre_Jornada"] for j in jornadas_catalogo if j["ID_Jornada"] == id_jornada),
            None,
        )
        if nombre_jornada:
            resultado = [
                c for c in resultado
                if nombre_jornada in (c.get("Jornadas_Activas") or "")
            ]

    return resultado


def _construir_matriz_cupos(cupos_raw: list[dict]) -> dict:
    """
    Convierte la lista plana de cupos en una estructura anidada:
    {
      niveles_ordenados: ['Preescolar', 'Primaria', ...],
      grados_por_nivel:  { nivel: [{ ID_Grado, Nombre_Grado }, ...] },
      jornadas:          [{ ID_Jornada, Nombre_Jornada }, ...],
      cupos:             { (id_grado, id_jornada): Cupos_Disponibles }
    }
    Esto simplifica el renderizado en la plantilla Jinja2.
    """
    jornadas_vistas = {}
    grados_por_nivel: dict[str, list] = {}
    cupos: dict[tuple, int] = {}
    orden_niveles = ["Preescolar", "Primaria", "Secundaria", "Bachiller"]

    for fila in cupos_raw:
        nivel    = fila["Nivel_Educativo"]
        id_grado = fila["ID_Grado"]
        id_jorn  = fila["ID_Jornada"]

        # Acumular jornadas (dict preserva orden de inserción en Python 3.7+)
        if id_jorn not in jornadas_vistas:
            jornadas_vistas[id_jorn] = fila["Nombre_Jornada"]

        # Acumular grados por nivel
        if nivel not in grados_por_nivel:
            grados_por_nivel[nivel] = []
        grado_entrada = {"ID_Grado": id_grado, "Nombre_Grado": fila["Nombre_Grado"]}
        if grado_entrada not in grados_por_nivel[nivel]:
            grados_por_nivel[nivel].append(grado_entrada)

        # Mapa de cupos
        cupos[(id_grado, id_jorn)] = fila["Cupos_Disponibles"]

    jornadas = [
        {"ID_Jornada": k, "Nombre_Jornada": v}
        for k, v in jornadas_vistas.items()
    ]
    niveles_ordenados = [n for n in orden_niveles if n in grados_por_nivel]

    return {
        "niveles_ordenados": niveles_ordenados,
        "grados_por_nivel":  grados_por_nivel,
        "jornadas":          jornadas,
        "cupos":             cupos,
    }


# ─────────────────────────────────────────────────────────────────────
# SERVICIO: School_Status_Service
# Gestiona la vista de listado (school_status.html)
# ─────────────────────────────────────────────────────────────────────

class School_Status_Service:

    # ── Cargar listado con filtros ────────────────────────────────────
    def listar_colegios(self):
        """
        Carga la página school_status.html con filtros y estadísticas.
        Flujo:
          1. Cargar catálogos para poblar los SelectField del formulario.
          2. Obtener TODOS los colegios desde la BD (sin filtros SQL).
          3. Aplicar filtros y ordenamiento en Python.
          4. Renderizar template con los datos ya filtrados.
        """
        # --- Catálogos ---
        barrios   = sp_catalogo_barrios_activos()
        jornadas  = sp_catalogo_jornadas_activas()
        choices_barrios  = [(0, "Todos los barrios")] + [(b["ID_Barrio"], b["Nombre_Barrio"]) for b in barrios]
        choices_jornadas = [(0, "Todas")] + [(j["ID_Jornada"], j["Nombre_Jornada"]) for j in jornadas]

        # --- Formularios ---
        form_filtro  = FormFiltroColegios(request.args)
        form_agregar = FormAgregarColegio()

        form_filtro.id_barrio.choices  = choices_barrios
        form_filtro.id_jornada.choices = choices_jornadas
        form_agregar.id_barrio.choices = [(0, "Seleccione un barrio…")] + [(b["ID_Barrio"], b["Nombre_Barrio"]) for b in barrios]
        form_agregar.jornadas.choices  = [(j["ID_Jornada"], j["Nombre_Jornada"]) for j in jornadas]

        # --- Estadísticas (tarjetas) ---
        stats = sp_admin_colegios_estadisticas()

        # --- Todos los colegios desde BD ---
        todos_colegios = sp_admin_colegios_listar()

        # --- Leer parámetros del filtro ---
        nombre     = (form_filtro.nombre.data    or "").strip()
        estado     = form_filtro.estado.data     or ""
        id_barrio  = form_filtro.id_barrio.data  or 0
        id_jornada = form_filtro.id_jornada.data or 0

        # --- Filtrar en Python ---
        colegios_filtrados = _filtrar_colegios(
            todos_colegios, nombre, estado, id_barrio, id_jornada, jornadas
        )

        # --- Ordenar:
        #     · Con filtro activo → insertion sort por nombre (A-Z)
        #     · Sin filtro        → selection sort por cupos (mayor primero)
        hay_filtro = any([nombre, estado, id_barrio, id_jornada])
        if hay_filtro:
            colegios_ordenados = _insertion_sort_por_nombre(colegios_filtrados)
        else:
            colegios_ordenados = _selection_sort_por_cupos_desc(colegios_filtrados)

        return render_template(
            "admin/school_status.html",
            colegios=colegios_ordenados,
            total_colegios=len(colegios_ordenados),
            stats=stats,
            form_filtro=form_filtro,
            form_agregar=form_agregar,
        )

    # ── Agregar nuevo colegio ─────────────────────────────────────────
    def agregar_colegio(self):
        """Procesa el POST del modal de agregar colegio."""
        barrios  = sp_catalogo_barrios_activos()
        jornadas = sp_catalogo_jornadas_activas()

        form = FormAgregarColegio()
        form.id_barrio.choices = [(0, "Seleccione un barrio…")] + [(b["ID_Barrio"], b["Nombre_Barrio"]) for b in barrios]
        form.jornadas.choices  = [(j["ID_Jornada"], j["Nombre_Jornada"]) for j in jornadas]

        if form.validate_on_submit():
            nuevo_id = sp_admin_colegio_insertar(
                nombre    = form.nombre.data.strip(),
                dane      = form.dane.data.strip(),
                email     = form.email.data.strip()    if form.email.data    else "",
                telefono  = form.telefono.data.strip() if form.telefono.data else "",
                direccion = form.direccion.data.strip(),
                id_barrio = form.id_barrio.data,
            )
            if nuevo_id:
                # Activar jornadas seleccionadas
                for id_jornada in form.jornadas.data:
                    sp_admin_colegio_jornada_agregar(nuevo_id, id_jornada)
                flash("Colegio registrado exitosamente.", "success")
            else:
                flash("No se pudo registrar el colegio. Verifique que el nombre y el DANE no estén duplicados.", "danger")
        else:
            for campo, errores in form.errors.items():
                for error in errores:
                    flash(f"{error}", "warning")

        return redirect(url_for("admin.school_status"))


# ─────────────────────────────────────────────────────────────────────
# SERVICIO: School_Config_Service
# Gestiona la página de configuración individual (school_config.html)
# ─────────────────────────────────────────────────────────────────────

class School_Config_Service:

    def _cargar_catalogo_barrios_choices(self) -> list[tuple]:
        barrios = sp_catalogo_barrios_activos()
        return [(b["ID_Barrio"], b["Nombre_Barrio"]) for b in barrios]

    def _cargar_catalogo_jornadas_choices(self) -> list[tuple]:
        jornadas = sp_catalogo_jornadas_activas()
        return [(j["ID_Jornada"], j["Nombre_Jornada"]) for j in jornadas]

    # ── Cargar página de configuración ───────────────────────────────
    def cargar_config(self, id_colegio: int):
        """
        Carga school_config.html con todos los datos del colegio:
        datos generales, jornadas activas y matriz de cupos.
        """
        colegio = sp_admin_colegio_detalle(id_colegio)
        if not colegio:
            flash("Colegio no encontrado.", "danger")
            return redirect(url_for("admin.school_status"))

        # --- Formularios ---
        choices_barrios  = self._cargar_catalogo_barrios_choices()
        choices_jornadas = self._cargar_catalogo_jornadas_choices()

        form_datos = FormEditarColegio(obj=None)
        form_datos.id_barrio.choices = choices_barrios
        # Precargar valores
        form_datos.nombre.data    = colegio["Nombre_Colegio"]
        form_datos.dane.data      = colegio["Codigo_DANE"]
        form_datos.email.data     = colegio["Email"]
        form_datos.telefono.data  = colegio["Telefono"]
        form_datos.direccion.data = colegio["Direccion_Colegio"]
        form_datos.id_barrio.data = colegio["ID_Barrio"]

        form_jornadas = FormGuardarJornadas()
        form_jornadas.jornadas_activas.choices = choices_jornadas

        # Jornadas activas actuales
        jornadas_activas_raw = sp_admin_colegio_jornadas_activas(id_colegio)
        ids_activos = [j["ID_Jornada"] for j in jornadas_activas_raw]
        form_jornadas.jornadas_activas.data = ids_activos

        # Formularios menores
        form_estado = FormCambiarEstadoColegio()

        # --- Matriz de cupos ---
        cupos_raw = sp_admin_colegio_cupos_obtener(id_colegio)
        matriz    = _construir_matriz_cupos(cupos_raw)

        return render_template(
            "admin/school_config.html",
            colegio          = colegio,
            form_datos       = form_datos,
            form_jornadas    = form_jornadas,
            form_estado      = form_estado,
            jornadas_activas = jornadas_activas_raw,
            matriz_cupos     = matriz,
            total_cupos      = colegio["Total_Cupos"],
        )

    # ── Guardar datos institucionales ─────────────────────────────────
    def guardar_datos(self, id_colegio: int):
        """Procesa el POST de la Sección 1 (datos del colegio)."""
        form = FormEditarColegio()
        form.id_barrio.choices = self._cargar_catalogo_barrios_choices()

        if form.validate_on_submit():
            sp_admin_colegio_actualizar(
                id_colegio = id_colegio,
                nombre     = form.nombre.data.strip(),
                dane       = form.dane.data.strip(),
                email      = form.email.data.strip()    if form.email.data    else "",
                telefono   = form.telefono.data.strip() if form.telefono.data else "",
                direccion  = form.direccion.data.strip(),
                id_barrio  = form.id_barrio.data,
            )
            flash("Datos del colegio actualizados correctamente.", "success")
        else:
            for campo, errores in form.errors.items():
                for error in errores:
                    flash(f"{error}", "warning")

        return redirect(url_for("admin.school_config", id_colegio=id_colegio))

    # ── Guardar jornadas ─────────────────────────────────────────────
    def guardar_jornadas(self, id_colegio: int):
        """
        Procesa el POST de la Sección 2 (jornadas).
        Compara las jornadas actuales con las enviadas y aplica
        los cambios: agrega las nuevas, quita las removidas.
        """
        form = FormGuardarJornadas()
        form.jornadas_activas.choices = self._cargar_catalogo_jornadas_choices()

        if form.validate_on_submit():
            nuevas_ids   = set(form.jornadas_activas.data)
            actuales_raw = sp_admin_colegio_jornadas_activas(id_colegio)
            actuales_ids = {j["ID_Jornada"] for j in actuales_raw}

            agregar = nuevas_ids - actuales_ids
            quitar  = actuales_ids - nuevas_ids

            for id_jornada in agregar:
                sp_admin_colegio_jornada_agregar(id_colegio, id_jornada)
            for id_jornada in quitar:
                sp_admin_colegio_jornada_quitar(id_colegio, id_jornada)

            flash("Jornadas actualizadas correctamente.", "success")
        else:
            for campo, errores in form.errors.items():
                for error in errores:
                    flash(f"{error}", "warning")

        return redirect(url_for("admin.school_config", id_colegio=id_colegio))

    # ── Guardar cupos ────────────────────────────────────────────────
    def guardar_cupos(self, id_colegio: int):
        """
        Procesa el POST de la Sección 3 (cupos).
        Los campos tienen el formato: cupo_g{id_grado}_j{id_jornada}
        Se parsean manualmente desde request.form y se persiste
        cada celda con sp_admin_colegio_cupo_guardar.
        No usa WTForms porque los campos son completamente dinámicos.
        """
        errores_guardado = []

        for clave, valor in request.form.items():
            # Ignorar campos que no sean cupos
            if not clave.startswith("cupo_g"):
                continue
            try:
                # Parsear "cupo_g3_j1" → id_grado=3, id_jornada=1
                partes     = clave.split("_")     # ['cupo', 'g3', 'j1']
                id_grado   = int(partes[1][1:])   # 'g3' → 3
                id_jornada = int(partes[2][1:])   # 'j1' → 1
                cupos      = max(0, int(valor or 0))

                sp_admin_colegio_cupo_guardar(id_colegio, id_grado, id_jornada, cupos)
            except (ValueError, IndexError, KeyError):
                errores_guardado.append(clave)

        if errores_guardado:
            flash(f"Algunos cupos no pudieron guardarse ({len(errores_guardado)} error/es).", "warning")
        else:
            flash("Cupos guardados correctamente.", "success")

        return redirect(url_for("admin.school_config", id_colegio=id_colegio))

    # ── Cambiar estado ───────────────────────────────────────────────
    def cambiar_estado(self, id_colegio: int):
        """Procesa el POST de la Sección 4 (activar/desactivar)."""
        form = FormCambiarEstadoColegio()

        if form.validate_on_submit():
            nuevo_estado = sp_admin_colegio_estado_cambiar(id_colegio)
            if nuevo_estado == 1:
                flash("El colegio ha sido activado.", "success")
            else:
                flash("El colegio ha sido desactivado.", "warning")
        else:
            flash("Acción no válida.", "danger")

        return redirect(url_for("admin.school_config", id_colegio=id_colegio))