# generador_tickets.py

import random
from datetime import datetime, timedelta

# -----------------------------
# CONFIGURACIÓN BASE
# -----------------------------

ID_USUARIO_INICIAL = 10
TOTAL_USUARIOS = 1000
ESTUDIANTES_POR_USUARIO = 2

ID_ESTUDIANTE_INICIAL = 10

ID_TICKET_INICIAL = 100  # EDU-000100

TECNICOS = list(range(7000, 7201))

ESTADOS_TICKET = list(range(1, 9))
TIPO_AFECTACION = {
    1: 40,
    2: 35,
    3: 20,
    4: 15,
    5: 5
}

ESTRATO_PRIORIDAD = {
    1: 60,
    2: 50,
    3: 40,
    4: 30
}

GRUPO_PRIORIDAD = {
    1: 0,
    2: 30,
    3: 25,
    4: 25,
    5: 20,
    6: 20
}

GRADOS = {
    1: "Pre jardín", 2: "Transición", 3: "Primero", 4: "Segundo",
    5: "Tercero", 6: "Cuarto", 7: "Quinto", 8: "Sexto",
    9: "Septimo", 10: "Octavo", 11: "Noveno",
    12: "Decimo", 13: "Once"
}

BARRIOS = list(range(1, 37))
JORNADAS = list(range(1, 7))
COLEGIOS = list(range(1, 31))
TIEMPO_RESIDENCIA = list(range(1, 5))


# -----------------------------
# UTILIDADES
# -----------------------------

def generar_id_ticket(numero):
    return f"EDU-{numero:06d}"


def fecha_random():
    now = datetime.now()
    delta = timedelta(days=random.randint(0, 60))
    return now - delta


def calcular_prioridad():
    gp = random.choice(list(GRUPO_PRIORIDAD.keys()))
    es = random.choice(list(ESTRATO_PRIORIDAD.keys()))
    tc = random.choice(list(TIPO_AFECTACION.keys()))

    prioridad = (
        GRUPO_PRIORIDAD[gp] +
        ESTRATO_PRIORIDAD[es] +
        TIPO_AFECTACION[tc]
    )

    return prioridad, gp, es, tc


def obtener_usuario_por_estudiante(estudiante_id):
    return ((estudiante_id - ID_ESTUDIANTE_INICIAL) // ESTUDIANTES_POR_USUARIO) + ID_USUARIO_INICIAL


# -----------------------------
# GENERADOR PRINCIPAL
# -----------------------------

class GeneradorTickets:

    def __init__(self):
        self.ticket_counter = ID_TICKET_INICIAL

    def generar_ticket(self, estudiante_id):
        ticket_id = generar_id_ticket(self.ticket_counter)

        usuario = obtener_usuario_por_estudiante(estudiante_id)

        tecnico = random.choice(TECNICOS)
        estado = random.choice(ESTADOS_TICKET)

        prioridad, gp, es, tc = calcular_prioridad()

        grado = random.choice(list(GRADOS.keys()))
        nombre_grado = GRADOS[grado]

        fecha_creacion = fecha_random()

        # Si es estado final → tiene cierre
        fecha_cierre = None
        if estado in [6, 7, 8]:
            fecha_cierre = fecha_creacion + timedelta(days=random.randint(1, 10))

        descripcion = "Solicitud generada automáticamente para pruebas del sistema."

        sql = f"""
-- ================== TICKET {ticket_id} ==================

INSERT INTO TBL_TICKET VALUES (
'{ticket_id}',
'Solicitud de Cupo — {nombre_grado}',
'{descripcion}',
'{fecha_creacion.strftime("%Y-%m-%d %H:%M:%S")}',
{f"'{fecha_cierre.strftime('%Y-%m-%d %H:%M:%S')}'" if fecha_cierre else "NULL"},
'{prioridad}',
'{usuario}',
'{tecnico}',
'{estudiante_id}',
'{tc}',
'{random.choice(COLEGIOS)}',
'{random.choice(JORNADAS)}',
NULL,
'{estado}',
'{random.choice(BARRIOS)}',
'{random.choice(TIEMPO_RESIDENCIA)}',
1
);
"""

        self.ticket_counter += 1
        return sql

    def generar_todos(self):
        script = ""

        total_estudiantes = TOTAL_USUARIOS * ESTUDIANTES_POR_USUARIO

        for i in range(total_estudiantes):
            estudiante_id = ID_ESTUDIANTE_INICIAL + i
            script += self.generar_ticket(estudiante_id)

        return script


# -----------------------------
# EJECUCIÓN
# -----------------------------

def main():
    gen = GeneradorTickets()
    sql = gen.generar_todos()

    with open("tickets_prueba.sql", "w", encoding="utf-8") as f:
        f.write(sql)

    print("✔ Tickets generados correctamente")


if __name__ == "__main__":
    main()