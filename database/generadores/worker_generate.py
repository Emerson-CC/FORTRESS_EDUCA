import random
from faker import Faker

from datetime import datetime, timedelta

from argon2 import PasswordHasher

# ===========================================================================================
# CONFIGURACION BASE
# ===========================================================================================

# Datos base
fake = Faker("es_CO")

TOTAL_USUARIOS = 200

BARRIOS = list(range(1, 36))
GENEROS = [1, 2]
ESTRATOS = [1, 2, 3]
PARENTESCO = "15"

# ===========================================================================================
# HASH DE CONTRASEÑA
# ===========================================================================================

ph = PasswordHasher(
    time_cost=3,
    memory_cost=65536,
    parallelism=4,
    hash_len=32,
    salt_len=16
)

def aplicar_pepper(password: str) -> str:
    pepper = 'asd231D54d54uiDFSAD654dsa1'
    if isinstance(pepper, bytes):
        pepper = pepper.decode("utf-8")
    return password + pepper

def hashear(password: str) -> str:
    return ph.hash(aplicar_pepper(password))



# ===========================================================================================
# GENERADOR DE CONTRASEÑA Y CORREO
# ===========================================================================================

def generar_email(nombre1, nombre2, apellido1, apellido2):
    base = (
        nombre1[0].lower() +
        (nombre2[0].lower() if nombre2 else "") +
        apellido1.lower() +
        (apellido2[0].lower() if apellido2 else "")
    )
    return f"{base}{random.randint(1,9999)}@gmail.com"

def generar_password(email):
    base = email.split("@")[0].upper()
    return f"{base}fortress**00"



# ===========================================================================================
# GENERADOR DE SQL
# ===========================================================================================

class GeneradorDatos:

    def __init__(self):
        self.id_persona = 7000
        self.id_usuario = 7000
        self.id_datos = 7000

    def fecha_random(self, inicio=1980, fin=2010):
        start = datetime(inicio, 1, 1)
        end = datetime(fin, 12, 31)
        return start + timedelta(days=random.randint(0, (end - start).days))

    def generar_funcionario(self):
        nombre1 = fake.first_name()
        nombre2 = fake.first_name()
        apellido1 = fake.last_name()
        apellido2 = fake.last_name()

        email = generar_email(nombre1, nombre2, apellido1, apellido2)
        password = generar_password(email)
        hash_pass = hashear(password)

        persona_id = self.id_persona
        usuario_id = self.id_usuario
        datos_id = self.id_datos

        id_rol = 3 # 2 Acudiente, 3 Tecnico, 4 Admin
        

        sql = f"""
-- ================== ACUDIENTE {usuario_id} ==================

INSERT INTO TBL_PERSONA VALUES (
    {persona_id}, '{random.randint(10000000,99999999)}', '{nombre1}', '{nombre2}', '{apellido1}', '{apellido2}', '{self.fecha_random().date()}', 1
);

INSERT INTO TBL_DATOS_ADICIONALES VALUES (
    {datos_id}, '{email}', '3{random.randint(100000000,999999999)}', '{PARENTESCO}', '1', '{persona_id}', '{random.choice(GENEROS)}', '1', '{random.choice(ESTRATOS)}', '{random.choice(BARRIOS)}', 1
);

INSERT INTO TBL_USUARIO VALUES (
    {usuario_id}, '{email}', '{hash_pass}', NOW(), NULL, 0, NOW(), 'INACTIVE', NULL, NULL, NULL, 0, 0, 'ACCEPTED', '{persona_id}', {id_rol}, 1
);
"""
        self.id_persona += 1
        self.id_usuario += 1
        self.id_datos += 1

        return sql, usuario_id


    
# ===========================================================================================
# SCRIPT PRINCIPAL
# ===========================================================================================

def generar_dataset(cantidad_usuarios):
    gen = GeneradorDatos()
    script_final = ""

    for _ in range(cantidad_usuarios):
        sql_acudiente, user_id = gen.generar_funcionario()
        script_final += sql_acudiente

    nombre_archivo = f"datos_tecnico_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"

    with open(nombre_archivo, "w", encoding="utf-8") as f:
        f.write(script_final)

    print(f"Script generado correctamente: {nombre_archivo}")


if __name__ == "__main__":
    generar_dataset(TOTAL_USUARIOS)