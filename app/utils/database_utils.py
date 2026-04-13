import mysql.connector
from mysql.connector import Error

from app.settings import Config_DB

class ConnectionDB:
    def __init__(self):
        self.config = {
            "host": Config_DB.DB_HOST,
            "port": Config_DB.DB_PORT,
            "user": Config_DB.DB_USER,
            "password": Config_DB.DB_PASSWORD,
            "database": Config_DB.DB_NAME,
        }
        self.connection = None
        self.connect()

    def connect(self):
        try:
            self.connection = mysql.connector.connect(**self.config)
            if self.connection.is_connected():
                print("[INFO] Conexión a MySQL establecida.")
        except Error as e:
            print(f"[ERROR] No se pudo conectar a MySQL: {e}")
            self.connection = None

    def ensure_connection(self):
        if self.connection is None or not self.connection.is_connected():
            self.connect()

    def call_procedure(self, nombre_sp, params=None, commit=False):
        self.ensure_connection()
        if params is None:
            params = ()
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.callproc(nombre_sp, params)
            resultados = []
            for result in cursor.stored_results():
                resultados.extend(result.fetchall())
            if commit:
                self.connection.commit()
            cursor.close()
            return resultados if resultados else None
        except Error as e:
            print(f"[ERROR] Fallo ejecutando SP '{nombre_sp}': {e}")
            return None

    def rollback(self):
        try:
            if self.connection and self.connection.is_connected():
                self.connection.rollback()
        except Error as e:
            print(f"[ERROR] Fallo al hacer rollback: {e}")

    def commit(self):
        try:
            if self.connection and self.connection.is_connected():
                self.connection.commit()
        except Error as e:
            print(f"[ERROR] Fallo al hacer commit: {e}")

    def close(self):
        if self.connection and self.connection.is_connected():
            self.connection.close()
            print("[INFO] Conexión a MySQL cerrada.")


db = ConnectionDB()
