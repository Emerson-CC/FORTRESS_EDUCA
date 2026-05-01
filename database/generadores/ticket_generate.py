# generador_tickets.py

import random
from datetime import datetime, timedelta

# ===========================================================================================
# CONFIGURACIÓN BASE
# ===========================================================================================

ID_USUARIO_INICIAL = 10
TOTAL_USUARIOS = 1000
ESTUDIANTES_POR_USUARIO = 2

ID_ESTUDIANTE_INICIAL = 10
ID_TICKET_INICIAL = 100        # → EDU-000100
ID_TICKET_FINAL = 1000       # → EDU-001000


TECNICOS = list(range(7000, 7201))

ESTADOS_TICKET = list(range(1, 9))
ESTADOS_FINALES = {6, 7, 8}

ESTADO_NOMBRES = {
    1: "Abierto",
    2: "En Revisión",
    3: "Validación de Documentos",
    4: "Pendiente Acción de Usuario",
    5: "Asignación de Cupo",
    6: "Rechazado",
    7: "Cancelado a Petición",
    8: "Solucionado",
}

TIPO_AFECTACION = {1: 40, 2: 35, 3: 20, 4: 15, 5: 5}
ESTRATO_PRIORIDAD = {1: 60, 2: 50, 3: 40, 4: 30}
GRUPO_PRIORIDAD = {1: 0, 2: 30, 3: 25, 4: 25, 5: 20, 6: 20}

GRADOS = {
    1: "Pre jardín",  2: "Transición",  3: "Primero",  4: "Segundo",
    5: "Tercero",     6: "Cuarto",      7: "Quinto",   8: "Sexto",
    9: "Séptimo",    10: "Octavo",     11: "Noveno",
   12: "Décimo",     13: "Once",
}

BARRIOS = list(range(1, 35))
JORNADAS = list(range(1, 7))
COLEGIOS_ID = list(range(1, 31))
TIEMPO_RESIDENCIA = list(range(1, 5))

# Datos de colegios para el comentario de confirmación de cupo

COLEGIOS = [
    ('IED Juan del Corral',              'intdijuandelcorral10@educacionbogota.edu.co',   '6012503781', 'Kr 69B No. 79A-42',      "Mañana"),
    ('IED Magdalena Ortega de Nariño',   'lnalmagdalenaorteg10@educacionbogota.edu.co',   '6012400968', 'Kr 69B No. 78A-36',      "Tarde"),
    ('IED República de Colombia',        'coldirepdecolombia10@educacionbogota.edu.co',   '6012509683', 'Cl 68 No. 69-10',        "Completa", ),
    ('IED Garcés Navas',                 'escdgarcesnavasii10@educacionbogota.edu.co',    '6012275473', 'Kr 104A No. 76B-09',     "Única"),
    ('Colegio Minuto de Dios Siglo XXI', 'colegio@minutodedios.edu.co',                   '6014304411', 'Tv 74 No. 81C-05',       "Mañana"),
    ('IED Villas de Granada',            'cedvillasdegranada10@educacionbogota.edu.co',   '6014316104', 'Cl 78 No. 114A-25',      "Tarde"),
    ('IED La Estrada',                   'cedlaestrada10@educacionbogota.edu.co',         '6012316491', 'Cl 69 No. 69-23',        "Completa"),
    ('IED Boyacá Real',                  'cedboyacareal10@educacionbogota.edu.co',        '6012513904', 'Cl 68 No. 73A-44',       "Única"),
    ('IED Álamos',                       'cedalamos10@educacionbogota.edu.co',            '6012232537', 'Cl 71 No. 94-03',        "Mañana"),
    ('IED Santa María del Lago',         'cedsantamariadella10@educacionbogota.edu.co',   '6012239634', 'Kr 73 No. 75A-30',       "Tarde"),
    ('IED Tabora',                       'cedtabora10@educacionbogota.edu.co',            '6014343238', 'Cl 74 No. 76A-30',       "Completa"),
    ('IED Florencia',                    'cedflorencia10@educacionbogota.edu.co',         '6012245700', 'Cl 75 No. 89-05',        "Única"),
    ('IED Bolivia',                      'cedrepdebolivia10@educacionbogota.edu.co',      '6012400595', 'Cl 82 No. 103A-40',      "Mañana"),
    ('IED Robert F Kennedy',             'coldirobertfkenned10@educacionbogota.edu.co',   '6012501625', 'Av. Boyacá No. 75B-01',  "Tarde"),
    ('IED Las Ferias',                   'cedlasferias10@educacionbogota.edu.co',         '6012400268', 'Cl 74A No. 69P-38',      "Completa"),
    ('IED Rodolfo Llinás',               'cedrodolfollinas10@educacionbogota.edu.co',     '6012291625', 'Cl 71 No. 89A-40',       "Única"),
    ('IED Antonio Nariño',               'cedantonionarino10@educacionbogota.edu.co',     '6014352125', 'Cl 92 No. 92-30',        "Mañana"),
    ('IED Lucila Rubio de Laverde',      'cedlucilarubiode10@educacionbogota.edu.co',     'NULL',       'Cl 66A No. 120-10',      "Tarde"),
    ('IED Nestor Forero Alcala',         'coldinestorforeroa10@educacionbogota.edu.co',   '6012245700', 'Kr 70C Bis No. 71-33',   "Completa"),
    ('IED Nidia Quintero de Turbay',     'cednidiaquinterode10@educacionbogota.edu.co',   '6014311894', 'Cl 75 No. 90-75',        "Única"),
    ('IED Nueva Constitucion',           'cednuevaconstituci10@educacionbogota.edu.co',   '6014353457', 'Kr 107B No. 74B-31',     "Mañana"),
    ('IED General Santander',            'cedgeneralsantande10@educacionbogota.edu.co',   '6014310575', 'Cl 68B No. 124-20',      "Tarde"),
    ('IED Guillermo Leon Valencia',      'cedguillermoleonv10@educacionbogota.edu.co',    '6014361066', 'Cl 75 No. 74A-40',       "Completa"),
    ('IED Jorge Gaitan Cortes',          'cedjorgegaitancor10@educacionbogota.edu.co',    '6012510255', 'Cl 70 No. 80-45',        "Única"),
    ('IED La Palestina',                 'cedlapalestina10@educacionbogota.edu.co',       '6014300302', 'Cl 68 No. 77-10',        "Mañana"),
    ('IED Republica de China',           'cedrepdechina10@educacionbogota.edu.co',        '6012241604', 'Kr 91 No. 82-20',        "Tarde"),
    ('IED Jose Asuncion Silva',          'coldijoseasuncions10@educacionbogota.edu.co',   '6012512811', 'Kr 91 No. 89-54',        "Completa"),
    ('IED Manuel Cepeda Vargas',         'cedmanuelcepedavar10@educacionbogota.edu.co',   '6014339893', 'Cl 78 No. 121A-12',      "Única"),
    ('IED El Porvenir',                  'cedelporvenir10@educacionbogota.edu.co',        '6014389025', 'Kr 121 No. 75D-20',      "Tarde"),
]


RESOLUCIONES_CAMBIO = [
    "Revisión en proceso",
    "Documentos pendientes de verificación",
    "Información enviada al equipo técnico",
    "Solicitud en cola de atención",
    "Documentos recibidos y en evaluación",
    "Se requiere documentación adicional",
    None,   # A veces sin resolución adicional
    None,
]


# ===========================================================================================
# UTILIDADES
# ===========================================================================================

def generar_id_ticket(numero: int) -> str:
    return f"EDU-{numero:06d}"


def fecha_random() -> datetime:
    return datetime.now() - timedelta(days=random.randint(0, 60))


def calcular_prioridad():
    gp = random.choice(list(GRUPO_PRIORIDAD.keys()))
    es = random.choice(list(ESTRATO_PRIORIDAD.keys()))
    tc = random.choice(list(TIPO_AFECTACION.keys()))
    prioridad = GRUPO_PRIORIDAD[gp] + ESTRATO_PRIORIDAD[es] + TIPO_AFECTACION[tc]
    return prioridad, gp, es, tc


def escape_sql(text: str) -> str:
    """Escapa comillas simples para evitar romper literales SQL."""
    return text.replace("'", "''")


def obtener_usuario_por_estudiante(estudiante_id: int) -> int:
    """
    Mapea un ID de estudiante a su acudiente (usuario).

    Lógica:
      • Los IDs de persona, usuario y datos_adicionales crecen juntos de a 1 por acudiente.
      • Por cada acudiente se crean ESTUDIANTES_POR_USUARIO estudiantes cuyo
        id_estudiante también es secuencial.
      • Fórmula:
            índice_acudiente = (estudiante_id - ID_ESTUDIANTE_INICIAL) // ESTUDIANTES_POR_USUARIO
            usuario_id       = ID_USUARIO_INICIAL + índice_acudiente

    """
    indice = (estudiante_id - ID_ESTUDIANTE_INICIAL) // ESTUDIANTES_POR_USUARIO
    return ID_USUARIO_INICIAL + indice


# ===========================================================================================
# GENERADOR DE COMENTARIOS
# ===========================================================================================

def generar_comentarios(ticket_id: str, estado_final: int, usuario_id: int, tecnico_id: int, titulo: str, fecha_creacion: datetime) -> str:
    """
    Genera los INSERTs de TBL_TICKET_COMENTARIO para un ticket dado.

    Reglas:
      1. Siempre se inserta el comentario genérico de creación (≡ sp_ticket_crear).
      2. Para estados > 1 se simulan las transiciones intermedias
         (≡ sp_ticket_panel_estado_actualizar — Cambio de Estado).
      3. Para estados finales (6, 7, 8) se agrega el comentario de cierre
         siguiendo la lógica de los SPs correspondientes.
    """
    bloques = []
    ts = fecha_creacion     # timestamp progresivo

    def fmts(dt: datetime) -> str:
        return dt.strftime("%Y-%m-%d %H:%M:%S")

    def insert_comentario(tipo: str, comentario: str, es_interno: int, fk_usuario: int, fecha: datetime) -> str:
        return (
            f"INSERT INTO TBL_TICKET_COMENTARIO "
            f"(Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket, Fecha_Comentario) VALUES (\n"
            f"    '{tipo}', '{escape_sql(comentario)}', {es_interno}, {fk_usuario}, '{ticket_id}', '{fmts(fecha)}'\n"
            f");"
        )

    # ------------------------------------------------------------------
    # 1. Comentario automático de creación (siempre — sp_ticket_crear)
    # ------------------------------------------------------------------
    msg_creacion = f"[Nueva Solicitud] Ticket creado: {titulo}"
    bloques.append(insert_comentario("Nueva Solicitud", msg_creacion, 1, usuario_id, ts))

    if estado_final == 1:
        return "\n".join(bloques)

    # ------------------------------------------------------------------
    # 2. Transiciones intermedias (sp_ticket_panel_estado_actualizar)
    #    Simulamos el recorrido 1 → 2 → ... → estado_pre_cierre
    # ------------------------------------------------------------------

    # Para estados finales, elige aleatoriamente desde qué estado intermedio
    # (1..5) se hace la transición final, para que no siempre sean "abierto→rechazado".
    if estado_final in ESTADOS_FINALES:
        max_pre = min(5, estado_final - 1)
        estado_pre_cierre = random.randint(1, max_pre) if max_pre > 1 else 1
    else:
        estado_pre_cierre = estado_final

    for state_num in range(2, estado_pre_cierre + 1):
        ts += timedelta(hours=random.randint(2, 48))
        prev_nombre = ESTADO_NOMBRES[state_num - 1]
        new_nombre  = ESTADO_NOMBRES[state_num]
        resolucion  = random.choice(RESOLUCIONES_CAMBIO)

        msg = f"[Cambio de Estado] {prev_nombre} → {new_nombre}"
        if resolucion:
            msg += f" | Resolución: {resolucion}"

        bloques.append(insert_comentario("Cambio de Estado", msg, 1, tecnico_id, ts))

    # Si el estado no es final, ya terminamos
    if estado_final not in ESTADOS_FINALES:
        return "\n".join(bloques)

    # ------------------------------------------------------------------
    # 3. Comentario de cierre según el tipo de estado final
    # ------------------------------------------------------------------
    ts += timedelta(hours=random.randint(4, 72))
    prev_nombre = ESTADO_NOMBRES[estado_pre_cierre]

    # ── Estado 6: Rechazado ──────────────────────────────────────────
    if estado_final == 6:
        if random.random() < 0.5:
            # sp_ticket_rechazar_abandonado → público (Es_Interno = 0)
            msg = (
                "El ticket ha sido RECHAZADO automáticamente por abandono. "
                "No se recibió respuesta del usuario en el plazo de 3 días hábiles "
                "establecido tras la notificación del cupo disponible."
            )
            bloques.append(insert_comentario("Cierre Solicitud", msg, 0, tecnico_id, ts))
        else:
            # sp_ticket_panel_estado_actualizar → interno (Es_Interno = 1)
            msg = (
                f"[Cierre Solicitud] {prev_nombre} → Rechazado "
                "| Resolución: Información no verídica o incompleta. "
                "Se procede al cierre del ticket."
            )
            bloques.append(insert_comentario("Cierre Solicitud", msg, 1, tecnico_id, ts))

    # ── Estado 7: Cancelado a Petición ──────────────────────────────
    elif estado_final == 7:
        # sp_ticket_panel_estado_actualizar → interno
        msg = (
            f"[Cierre Solicitud] {prev_nombre} → Cancelado a Petición "
            "| Resolución: El usuario solicitó el cierre voluntario del ticket."
        )
        bloques.append(insert_comentario("Cierre Solicitud", msg, 1, tecnico_id, ts))

    # ── Estado 8: Solucionado ────────────────────────────────────────
    elif estado_final == 8:
        if random.random() < 0.70:
            # sp_ticket_usuario_confirmar_cupo → público (Es_Interno = 0)
            col = random.choice(COLEGIOS)
            grado_nombre = random.choice(list(GRADOS.values()))
            msg = (
                "El usuario ha CONFIRMADO la asignación del cupo. El ticket queda SOLUCIONADO.\\n\\n"
                "Resumen del cupo asignado:\\n"
                f"  Institución : {col[0]}\\n"
                f"  Dirección   : {col[3]}\\n"
                f"  Teléfono    : {col[2]}\\n"
                f"  Correo      : {col[1]}\\n"
                f"  Grado       : {grado_nombre}\\n"
                f"  Jornada     : {col[4]}"
                
            )
            bloques.append(insert_comentario("Cierre Solicitud", msg, 0, tecnico_id, ts))
        else:
            # sp_ticket_panel_estado_actualizar → interno
            msg = (
                f"[Cierre Solicitud] {prev_nombre} → Solucionado "
                "| Resolución: Cupo asignado y proceso completado exitosamente."
            )
            bloques.append(insert_comentario("Cierre Solicitud", msg, 1, tecnico_id, ts))

    return "\n".join(bloques)


# ===========================================================================================
# GENERADOR PRINCIPAL
# ===========================================================================================

class GeneradorTickets:

    def __init__(self):
        self.ticket_counter = ID_TICKET_INICIAL
        self.ticket_final   = ID_TICKET_FINAL

    def generar_ticket(self, estudiante_id: int) -> str:
        while self.ticket_counter <= self.ticket_final:
            ticket_id = generar_id_ticket(self.ticket_counter)

            # ── Relación correcta estudiante → acudiente ────────────────
            usuario_id = obtener_usuario_por_estudiante(estudiante_id)

            tecnico_id = random.choice(TECNICOS)
            estado     = random.choice(ESTADOS_TICKET)

            prioridad, gp, es, tc = calcular_prioridad()

            grado_id     = random.choice(list(GRADOS.keys()))
            grado_nombre = GRADOS[grado_id]

            fecha_creacion = fecha_random()

            # Fecha de cierre solo en estados finales
            fecha_cierre = None
            if estado in ESTADOS_FINALES:
                fecha_cierre = fecha_creacion + timedelta(days=random.randint(1, 10))

            titulo = f"Solicitud de Cupo — Estudiante {estudiante_id} — {grado_nombre}"
            descripcion = "Solicitud generada automáticamente para pruebas del sistema."

            def fmt(dt):
                return dt.strftime("%Y-%m-%d %H:%M:%S")

            # ── INSERT TBL_TICKET ────────────────────────────────────────
            sql_ticket = (
                f"\n-- ================== TICKET {ticket_id} | "
                f"Usuario {usuario_id} | Estudiante {estudiante_id} ==================\n\n"
                f"INSERT INTO TBL_TICKET VALUES (\n"
                f"    '{ticket_id}', '{escape_sql(titulo)}', '{escape_sql(descripcion)}',\n"
                f"    '{fmt(fecha_creacion)}', "
                f"{f"'{fmt(fecha_cierre)}'" if fecha_cierre else 'NULL'},\n"
                f"    {prioridad}, {usuario_id}, {tecnico_id}, {estudiante_id},\n"
                f"    {tc}, {random.choice(COLEGIOS_ID)}, {random.choice(JORNADAS)}, NULL,\n"
                f"    {estado}, {random.choice(BARRIOS)}, {random.choice(TIEMPO_RESIDENCIA)}, 1\n"
                f");\n"
            )

            # ── INSERTs TBL_TICKET_COMENTARIO ────────────────────────────
            sql_comentarios = generar_comentarios(
                ticket_id      = ticket_id,
                estado_final   = estado,
                usuario_id     = usuario_id,
                tecnico_id     = tecnico_id,
                titulo         = titulo,
                fecha_creacion = fecha_creacion,
            )

            self.ticket_counter += 1
            return sql_ticket + sql_comentarios + "\n"
        return ""  # No más tickets por generar

    def generar_todos(self) -> str:
        script = ""
        total_estudiantes = TOTAL_USUARIOS * ESTUDIANTES_POR_USUARIO

        for i in range(total_estudiantes):
            estudiante_id = ID_ESTUDIANTE_INICIAL + i
            script += self.generar_ticket(estudiante_id)

        return script


# ===========================================================================================
# EJECUCIÓN
# ===========================================================================================

def main():
    gen = GeneradorTickets()
    sql = gen.generar_todos()

    nombre_archivo = f"datos_tickets_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
    with open(nombre_archivo, "w", encoding="utf-8") as f:
        f.write(sql)

    print(f"Tickets generados correctamente: {nombre_archivo}")


if __name__ == "__main__":
    main()