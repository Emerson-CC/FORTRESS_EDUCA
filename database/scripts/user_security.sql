USE FORTRESS_EDUCA_DB;

-- ============================================================
-- ACTIVAR EL PLUGIN DE VALIDACIÓN DE CONTRASEÑAS
-- ============================================================

INSTALL PLUGIN validate_password SONAME 'validate_password.so';

SET GLOBAL validate_password_policy = STRONG;
SET GLOBAL validate_password_length = 12;
SET GLOBAL validate_password_mixed_case_count = 1;
SET GLOBAL validate_password_number_count = 1;
SET GLOBAL validate_password_special_char_count = 1;


-- ============================================================
-- ASEGURAR EL USUARIO ROOT
-- ============================================================
-- Cambiar la contraseña del root a una más segura

ALTER USER 'root'@'localhost'
    IDENTIFIED WITH caching_sha2_password
    BY '6rW(86J2nFW!$p44qKt'
    FAILED_LOGIN_ATTEMPTS 5
    PASSWORD_LOCK_TIME 1;

FLUSH PRIVILEGES;


-- ============================================================
-- USUARIO DE APLICACIÓN (reemplaza a root)
-- ============================================================

DROP USER IF EXISTS 'fortress_app'@'127.0.0.1';
DROP USER IF EXISTS 'fortress_app'@'localhost';

-- Usuario para la aplicación Python — solo desde localhost

CREATE USER 'fortress_app'@'127.0.0.1'
    IDENTIFIED WITH mysql_native_password
    BY '6c_@t063!G$V+tCJ8RkqG2*'
    FAILED_LOGIN_ATTEMPTS 5
    PASSWORD_LOCK_TIME 1;

-- Espejo para conexiones por nombre de host
CREATE USER 'fortress_app'@'localhost'
    IDENTIFIED WITH mysql_native_password 
    BY '6c_@t063!G$V+tCJ8RkqG2*'
    FAILED_LOGIN_ATTEMPTS 5
    PASSWORD_LOCK_TIME 1;


-- ============================================================
-- ASIGNAR SOLO LOS PERMISOS NECESARIOS
-- ============================================================
-- Permisos mínimos: solo sobre fortress_educa_db

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
    ON fortress_educa_db.*
    TO 'fortress_app'@'127.0.0.1';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
    ON fortress_educa_db.*
    TO 'fortress_app'@'localhost';

-- Sin acceso a mysql, information_schema, performance_schema, sys
REVOKE ALL PRIVILEGES ON *.* FROM 'fortress_app'@'127.0.0.1';
REVOKE ALL PRIVILEGES ON *.* FROM 'fortress_app'@'localhost';

-- Re-aplicar solo los permisos correctos
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
    ON fortress_educa_db.*
    TO 'fortress_app'@'127.0.0.1';

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
    ON fortress_educa_db.*
    TO 'fortress_app'@'localhost';

FLUSH PRIVILEGES;


-- ============================================================
-- LIMITAR RECURSOS POR USUARIO (anti fuerza bruta / DoS)
-- ============================================================
ALTER USER 'fortress_app'@'127.0.0.1'
    WITH MAX_QUERIES_PER_HOUR 5000
         MAX_UPDATES_PER_HOUR 2000
         MAX_CONNECTIONS_PER_HOUR 500
         MAX_USER_CONNECTIONS 20;

ALTER USER 'fortress_app'@'localhost'
    WITH MAX_QUERIES_PER_HOUR 5000
         MAX_UPDATES_PER_HOUR 2000
         MAX_CONNECTIONS_PER_HOUR 500
         MAX_USER_CONNECTIONS 20;

ALTER USER 'root'@'localhost'
    WITH MAX_USER_CONNECTIONS 5;

FLUSH PRIVILEGES;


-- ============================================================
-- PASO 8: TABLA DE AUDITORÍA (registro de acciones críticas)
-- ============================================================

CREATE TABLE IF NOT EXISTS audit_log (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    evento VARCHAR(100) NOT NULL,
    usuario_db VARCHAR(100) NOT NULL DEFAULT (CURRENT_USER()),
    ip_origen VARCHAR(45) NOT NULL DEFAULT '0.0.0.0',
    tabla_afectada VARCHAR(100) NULL,
    detalle TEXT NULL,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_evento (evento),
    INDEX idx_fecha (fecha_hora),
    INDEX idx_usuario (usuario_db)
) ENGINE=InnoDB
  COMMENT='Registro de auditoría de seguridad';


-- ============================================================
-- PROCEDIMIENTO ALMACENADO PARA REGISTRAR AUDITORÍA
-- ============================================================

DROP PROCEDURE IF EXISTS sp_registrar_auditoria;

DELIMITER $$
CREATE PROCEDURE sp_registrar_auditoria(
    IN p_evento VARCHAR(100),
    IN p_ip_origen VARCHAR(45),
    IN p_tabla_afectada VARCHAR(100),
    IN p_detalle TEXT
)
BEGIN
    INSERT INTO audit_log (evento, usuario_db, ip_origen, tabla_afectada, detalle)
    VALUES (p_evento, CURRENT_USER(), p_ip_origen, p_tabla_afectada, p_detalle);
END $$
DELIMITER ;


-- ============================================================
-- VERIFICACIÓN FINAL — muestra el estado de seguridad
-- ============================================================

SELECT
    user AS 'Usuario',
    host AS 'Host permitido',
    password_expired AS 'Pass expirada',
    password_lifetime AS 'Días vigencia',
    account_locked AS 'Cuenta bloqueada',
    plugin AS 'Método auth'
FROM mysql.user
WHERE user IN ('root', 'fortress_app', 'fortress_readonly')
ORDER BY user, host;

SELECT
    user AS 'Usuario',
    host AS 'Host',
    db AS 'Base de datos',
    Select_priv AS 'SELECT',
    Insert_priv AS 'INSERT',
    Update_priv AS 'UPDATE',
    Delete_priv AS 'DELETE',
    Execute_priv AS 'EXECUTE'
FROM mysql.db
WHERE user IN ('fortress_app', 'fortress_readonly')
ORDER BY user;


-- ============================================================
-- COMANDOS UTILES
-- ============================================================

-- Si se bloquea la cuenta
ALTER USER 'fortress_app'@'localhost' ACCOUNT UNLOCK;
FLUSH PRIVILEGES;

-- Verificar si la cuenta se desbloqueo
SELECT user, host, account_locked, password_expired 
FROM mysql.user 
WHERE user = 'fortress_app';

-- Reestablecer contraseña
ALTER USER 'fortress_app'@'localhost' 
    IDENTIFIED BY '6c_@t063!G$V+tCJ8RkqG2*';
FLUSH PRIVILEGES;