DROP DATABASE IF EXISTS FORTRESS_EDUCA_DB;
CREATE DATABASE FORTRESS_EDUCA_DB;

USE FORTRESS_EDUCA_DB;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                         TABLAS PARA DATOS DEMOGRAFICOS Y DEMAS
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_localidad
-- Localidades de Bogotá. Actualmente alzance reducido a Engativá

DROP TABLE IF EXISTS tbl_localidad;

CREATE TABLE tbl_localidad (
    ID_Localidad TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Localidad VARCHAR(30) UNIQUE NOT NULL,
    Estado_Localidad TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_barrio
-- Barios situados en la localidad de Engativá

DROP TABLE IF EXISTS tbl_barrio;

CREATE TABLE tbl_barrio (
    ID_Barrio INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Barrio VARCHAR(30) UNIQUE NOT NULL,
    FK_ID_Localidad TINYINT NOT NULL,
    Estado_Barrio TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Barrio_Localidad FOREIGN KEY (FK_ID_Localidad) REFERENCES tbl_localidad(ID_Localidad) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_tiempo_residencia
-- Periodos de tiempo de recidencia

DROP TABLE IF EXISTS tbl_tiempo_residencia;

CREATE TABLE tbl_tiempo_residencia (
    ID_Tiempo_Residencia TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tiempo VARCHAR(40) UNIQUE NOT NULL,
    Estado_T_Residencia TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_genero
-- Generos de una persona (nacimiento / biologico)

DROP TABLE IF EXISTS tbl_genero;

CREATE TABLE tbl_genero (
    ID_Genero TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Genero VARCHAR(30) UNIQUE NOT NULL,
    Estado_Genero TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_parentesco
-- Relación jurídica entre personas (Acudiente / Estudiante)

DROP TABLE IF EXISTS tbl_parentesco;

CREATE TABLE tbl_parentesco (
    ID_Parentesco TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Parentesco VARCHAR(30) NOT NULL,
    Tipo_Usuario ENUM('ACUDIENTE','ESTUDIANTE') NOT NULL,
    Estado_Parentesco TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_grupo_preferencial
-- Grupo, usualmente minoritario, cuyos integrantes presentan una condición de vulnerabilidad 

DROP TABLE IF EXISTS tbl_grupo_preferencial;

CREATE TABLE tbl_grupo_preferencial (
    ID_Grupo_Preferencial TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Grupo_Preferencial VARCHAR(30) UNIQUE NOT NULL,
    Descripcion_Grupo_Preferencial VARCHAR(150) NOT NULL,
    Nivel_Prioridad_GP TINYINT(2) NOT NULL,
    Estado_Grupo_Preferencial TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_estrato
-- Estratos validos en Colombia

DROP TABLE IF EXISTS tbl_estrato;

CREATE TABLE tbl_estrato (
    ID_Estrato TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Estrato VARCHAR(10) UNIQUE NOT NULL,
    Descripcion_Estrato VARCHAR(150) NOT NULL,
    Nivel_Prioridad_E TINYINT(2) NOT NULL,
    Estado_Estrato TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_tipo_identificacion
-- Tipos de documentos validos en Colombia

DROP TABLE IF EXISTS tbl_tipo_identificacion;

CREATE TABLE tbl_tipo_identificacion (
    ID_Tipo_Iden TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Iden VARCHAR(30) NOT NULL,
    Tipo_Usuario ENUM('ACUDIENTE','ESTUDIANTE') NOT NULL,
    Estado_Identificacion TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                         TABLAS PARA EL SISTEMA REPORTE DE ERRORES DE LA PÁGINA (PENDIENTE)
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------
-- Estructura de tabla para la tabla TBL_TIPO_ERROR
-- Lista de posibles afectaciones / problemas de la página


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_ticket_PAGINA
-- Registro de los errores de la pagina reportados por los usuarios



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                         TABLAS PARA EL SISTEMA DE DATOS ACADEMICOS
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_colegio
-- Colegios disponibles de la localidad de Engativá

DROP TABLE IF EXISTS tbl_colegio;

CREATE TABLE tbl_colegio (
    ID_Colegio INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Colegio VARCHAR(100) UNIQUE NOT NULL,
    Codigo_DANE VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(255) NULL,
    Telefono VARCHAR(45) NULL,
    Direccion_Colegio VARCHAR(100) UNIQUE NOT NULL,
    FK_ID_Barrio INT NOT NULL,
    Estado_Colegio TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Colegio_Barrio FOREIGN KEY (FK_ID_Barrio) REFERENCES tbl_barrio(ID_Barrio) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_grado
-- Grados disponibles segun sistema de educación básica y media de Colombia

DROP TABLE IF EXISTS tbl_grado;

CREATE TABLE tbl_grado (
    ID_Grado TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Grado VARCHAR(30) UNIQUE NOT NULL,
    Nivel_Educativo VARCHAR(30) NOT NULL,
    Estado_Grado TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_jornada
-- Jornadas dispobles segun sistema de educación de Colombia

DROP TABLE IF EXISTS tbl_jornada;

CREATE TABLE tbl_jornada (
    ID_Jornada TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Jornada VARCHAR(20) NOT NULL UNIQUE,
    Estado_Jornada TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_cupos
-- Cupos disponibles de cada grado de cada colegio

DROP TABLE IF EXISTS tbl_cupos;

CREATE TABLE tbl_cupos (
    ID_Cupos INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_Grado TINYINT NOT NULL,
    FK_ID_Colegio INT NOT NULL,
    FK_ID_Jornada TINYINT NOT NULL,
    Cupos_Disponibles TINYINT(3),
    Cupos_Reservados TINYINT(3) DEFAULT 0,
    Estado_Cupos TINYINT(1) NOT NULL DEFAULT 1,
    
    CONSTRAINT FK_Cupos_Grado FOREIGN KEY (FK_ID_Grado) REFERENCES tbl_grado(ID_Grado) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Cupos_Colegio FOREIGN KEY (FK_ID_Colegio) REFERENCES tbl_colegio(ID_Colegio) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Cupos_Jornada FOREIGN KEY (FK_ID_Jornada) REFERENCES tbl_jornada(ID_Jornada) ON DELETE NO ACTION ON UPDATE CASCADE,
    UNIQUE KEY ux_cupos_colegio_grado_jornada (FK_ID_Colegio, FK_ID_Grado, FK_ID_Jornada)
) ENGINE=InnoDB;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                         TABLAS PARA EL SISTEMA DE USUARIOS
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_rol
-- Roles del sistema que determinan el alcance y las funciones permitidas para el usuario

DROP TABLE IF EXISTS tbl_rol;

CREATE TABLE tbl_rol (
    ID_Rol TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Rol VARCHAR(50) UNIQUE NOT NULL,
    Descripcion_Rol VARCHAR(150) NOT NULL,
    Estado_Rol TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_persona
-- Datos principales del usuario / estudiante

DROP TABLE IF EXISTS tbl_persona;

CREATE TABLE tbl_persona (
    ID_Persona INT AUTO_INCREMENT PRIMARY KEY,
    Num_Doc_Persona VARCHAR(30) UNIQUE NOT NULL,
    Primer_Nombre VARCHAR(50) NOT NULL,
    Segundo_Nombre VARCHAR(50),
    Primer_Apellido VARCHAR(50) NOT NULL,
    Segundo_Apellido VARCHAR(50),
    Fecha_Nacimiento DATE NOT NULL,
    Estado_Persona TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_datos_adicionales
-- Datos de cotacto, demograficos y personales relevantes

DROP TABLE IF EXISTS tbl_datos_adicionales;

CREATE TABLE tbl_datos_adicionales (
    ID_Datos_Adicionales INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefono VARCHAR(45) UNIQUE NOT NULL,

    FK_ID_Parentesco TINYINT NOT NULL,
    FK_ID_Tipo_Iden TINYINT NOT NULL,
    FK_ID_Persona INT UNIQUE NOT NULL,
    FK_ID_Genero TINYINT NOT NULL,
    FK_ID_Grupo_Preferencial TINYINT NOT NULL,
    FK_ID_Estrato TINYINT NOT NULL,
    FK_ID_Barrio INT NOT NULL,

    Estado_Datos_Adicionales TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_DatosAd_Parentesco FOREIGN KEY (FK_ID_Parentesco) REFERENCES tbl_parentesco(ID_Parentesco) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DatosAd_Identificacion FOREIGN KEY (FK_ID_Tipo_Iden) REFERENCES tbl_tipo_identificacion(ID_Tipo_Iden) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DatosAd_Persona FOREIGN KEY (FK_ID_Persona) REFERENCES tbl_persona(ID_Persona) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DatosAd_Genero FOREIGN KEY (FK_ID_Genero) REFERENCES tbl_genero(ID_Genero) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DatosAd_GP FOREIGN KEY (FK_ID_Grupo_Preferencial) REFERENCES tbl_grupo_preferencial(ID_Grupo_Preferencial) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DatosAd_Estrato FOREIGN KEY (FK_ID_Estrato) REFERENCES tbl_estrato(ID_Estrato) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DatosAd_Barrio FOREIGN KEY (FK_ID_Barrio) REFERENCES tbl_barrio(ID_Barrio) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_usuario
-- Datos de credenciales, seguridad y preferencias de configuraciones 

DROP TABLE IF EXISTS tbl_usuario;

CREATE TABLE tbl_usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Usuario VARCHAR(255) UNIQUE NOT NULL,
    
    Contraseña_Hash VARCHAR(255) NOT NULL,
    Ultimo_Cambio_Contraseña DATETIME NULL DEFAULT NULL,

    Ultimo_Login DATETIME NULL DEFAULT NULL,
    Intentos_Fallidos INT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

    Doble_Factor_Activo ENUM('ACTIVE','INACTIVE') DEFAULT 'INACTIVE',
    MFA_Fecha_Configuracion DATETIME NULL DEFAULT NULL, 
    MFA_Secret VARCHAR(64) NULL DEFAULT NULL,
    MFA_Secret_Temp VARCHAR(64) NULL DEFAULT NULL,

    Notificaciones_Email TINYINT(1) NOT NULL DEFAULT 0,
    Notificaciones_Navegador TINYINT(1) NOT NULL DEFAULT 0,
    
    Aceptacion_Terminos ENUM('ACCEPTED','REJECTED') DEFAULT 'REJECTED',

    FK_ID_Persona INT UNIQUE NOT NULL,
    FK_ID_Rol TINYINT NOT NULL,

    Estado_Usuario TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Usuario_Persona FOREIGN KEY (FK_ID_Persona) REFERENCES tbl_persona(ID_Persona) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (FK_ID_Rol) REFERENCES tbl_rol(ID_Rol) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_estudiante
-- Datos academicos y personales relevantes del estudiante

DROP TABLE IF EXISTS tbl_estudiante;

CREATE TABLE tbl_estudiante (
    ID_Estudiante INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_Tipo_Iden TINYINT NOT NULL,

    FK_ID_Persona INT UNIQUE NOT NULL,
    FK_ID_Grado_Actual TINYINT NOT NULL,
    FK_ID_Grado_Proximo TINYINT NULL,
    FK_ID_Colegio_Anterior INT NOT NULL,

    FK_ID_Genero TINYINT NOT NULL,
    FK_ID_Grupo_Preferencial TINYINT NOT NULL,

    FK_ID_Acudiente INT NOT NULL,
    FK_ID_Parentesco_Es TINYINT NOT NULL,
    
    Estado_Estudiante TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Estudiante_Identificacion FOREIGN KEY (FK_ID_Tipo_Iden) REFERENCES tbl_tipo_identificacion(ID_Tipo_Iden) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Estudiante_Persona FOREIGN KEY (FK_ID_Persona) REFERENCES tbl_persona(ID_Persona) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Estudiante_Grado_Actual FOREIGN KEY (FK_ID_Grado_Actual) REFERENCES tbl_grado(ID_Grado) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Estudiante_Grado_Proximo FOREIGN KEY (FK_ID_Grado_Proximo) REFERENCES tbl_grado(ID_Grado) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Estudiante_Colegio_Anterior FOREIGN KEY (FK_ID_Colegio_Anterior) REFERENCES tbl_colegio(ID_Colegio) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Estudiante_Genero FOREIGN KEY (FK_ID_Genero) REFERENCES tbl_genero(ID_Genero) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Estudiante_GP FOREIGN KEY (FK_ID_Grupo_Preferencial) REFERENCES tbl_grupo_preferencial(ID_Grupo_Preferencial) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Estudiante_Acudiente FOREIGN KEY (FK_ID_Acudiente) REFERENCES tbl_usuario(ID_Usuario) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Estudiante_Parentesco FOREIGN KEY (FK_ID_Parentesco_Es) REFERENCES tbl_parentesco(ID_Parentesco) ON DELETE NO ACTION ON UPDATE CASCADE

) ENGINE=InnoDB;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                         TABLAS PARA EL SISTEMA DE TICKETS
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_estado_ticket
-- Diferentes estados / etapas que puede tener un ticket (abierto, pendiente, cerrado, etc.)

DROP TABLE IF EXISTS tbl_estado_ticket;

CREATE TABLE tbl_estado_ticket (
    ID_Estado_Ticket TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Estado VARCHAR(50) UNIQUE NOT NULL,
    Estado_Final TINYINT(1) NOT NULL,
    Estado_Estado_Ticket TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_tipo_afectacion
-- Lista de las afectaciones por las cuales se crea el ticket

DROP TABLE IF EXISTS tbl_tipo_afectacion;

CREATE TABLE tbl_tipo_afectacion (
    ID_Tipo_Afectacion TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Afectacion VARCHAR(60) UNIQUE NOT NULL,
    Descripcion_Afectacion VARCHAR(150) NOT NULL,
    Nivel_Prioridad_TC TINYINT(2) NOT NULL,
    Estado_Afectacion TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_ticket
-- Datos para la validación del ticket y proceder con la asignación de cupo

DROP TABLE IF EXISTS tbl_ticket;

CREATE TABLE tbl_ticket (
    ID_Ticket VARCHAR(10) PRIMARY KEY,
    Titulo_Ticket VARCHAR(150) NOT NULL,
    Descripcion_Ticket TEXT NOT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_Cierre DATETIME,
    Puntaje_Prioridad INT NOT NULL, -- Determinado por el Backend

    FK_ID_Usuario_Creador INT NOT NULL,
    FK_ID_Usuario_Tecnico INT,

    FK_ID_Estudiante INT NOT NULL,
    FK_ID_Tipo_Afectacion TINYINT NOT NULL,

    FK_ID_Colegio_Preferencia INT NULL,
    FK_ID_Jornada_Preferencia TINYINT NOT NULL,

    FK_ID_Cupo_Asignado INT NULL,

    FK_ID_Estado_Ticket TINYINT NOT NULL,
    FK_ID_Barrio INT NOT NULL,

    FK_ID_Tiempo_Residencia TINYINT NULL,
    Estado_Ticket TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Ticket_UsuarioCreador FOREIGN KEY (FK_ID_Usuario_Creador) REFERENCES tbl_usuario(ID_Usuario) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Ticket_UsuarioTecnico FOREIGN KEY (FK_ID_Usuario_Tecnico) REFERENCES tbl_usuario(ID_Usuario) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Ticket_Estudiante FOREIGN KEY (FK_ID_Estudiante) REFERENCES tbl_estudiante(ID_Estudiante) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Ticket_Afectacion FOREIGN KEY (FK_ID_Tipo_Afectacion) REFERENCES tbl_tipo_afectacion(ID_Tipo_Afectacion) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Ticket_Colegio FOREIGN KEY (FK_ID_Colegio_Preferencia) REFERENCES tbl_colegio(ID_Colegio) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Ticket_Jornada FOREIGN KEY (FK_ID_Jornada_Preferencia) REFERENCES tbl_jornada(ID_Jornada) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Ticket_Cupo_Asignado FOREIGN KEY (FK_ID_Cupo_Asignado) REFERENCES tbl_cupos(ID_Cupos) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Ticket_Estado FOREIGN KEY (FK_ID_Estado_Ticket) REFERENCES tbl_estado_ticket(ID_Estado_Ticket) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Ticket_Barrio FOREIGN KEY (FK_ID_Barrio) REFERENCES tbl_barrio(ID_Barrio) ON DELETE NO ACTION ON UPDATE CASCADE,

    CONSTRAINT FK_Ticket_TiempoResidencia FOREIGN KEY (FK_ID_Tiempo_Residencia) REFERENCES tbl_tiempo_residencia(ID_Tiempo_Residencia) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_ticket_comentario
-- Tabla independiente para los comentarios de un ticket creado

DROP TABLE IF EXISTS tbl_ticket_comentario;

CREATE TABLE tbl_ticket_comentario (
    ID_Ticket_Comentario INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Evento VARCHAR(20) NOT NULL, -- Nueva Solicitud, Comentario, Cambio Estado, Documento Subido, Cambio Tecnico, Cupo Asignado, Cierre Solicitud
    Comentario TEXT NOT NULL, -- Detalle
    Fecha_Comentario DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Es_Interno TINYINT(1) NOT NULL, -- Interno (1), Publico (0). Visibilidad en el sisteama

    FK_ID_Usuario INT NOT NULL,
    FK_ID_Ticket VARCHAR(10) NOT NULL,

    Estado_Comentario_Ticket TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_TicketComentario_Usuario FOREIGN KEY (FK_ID_Usuario) REFERENCES tbl_usuario(ID_Usuario) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_TicketComentario_Ticket FOREIGN KEY (FK_ID_Ticket) REFERENCES tbl_ticket(ID_Ticket) ON DELETE NO ACTION ON UPDATE CASCADE

) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_tipo_documento
-- Clasificación de los tipos de documentos (pdf, jpg, png, etc.)

DROP TABLE IF EXISTS tbl_tipo_documento;

CREATE TABLE tbl_tipo_documento (
    ID_Tipo_Doc TINYINT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Doc VARCHAR(30) NOT NULL,
    Estado_Documentos TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_documento_ticket
-- Documentos de los usuarios asociados a un tickets, cada documento es una entrada (incluso si es del mismo ticket)

DROP TABLE IF EXISTS tbl_documento_ticket;

CREATE TABLE tbl_documento_ticket (
    ID_Doc_Ticket INT AUTO_INCREMENT PRIMARY KEY,
    
    FK_ID_Ticket VARCHAR(10) NOT NULL,
    FK_ID_Tipo_Doc TINYINT NOT NULL,

    Archivo MEDIUMBLOB NOT NULL,
    Nombre_Original VARCHAR(100) NOT NULL,
    Fecha_Subida DATETIME DEFAULT CURRENT_TIMESTAMP,

    Estado_Documentos TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_DocumentoTicket_Ticket FOREIGN KEY (FK_ID_Ticket) REFERENCES tbl_ticket(ID_Ticket) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_DocumentoTicket_TipoDoc FOREIGN KEY (FK_ID_Tipo_Doc) REFERENCES tbl_tipo_documento(ID_Tipo_Doc) ON DELETE NO ACTION ON UPDATE CASCADE

) ENGINE=InnoDB;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                         TABLAS PARA AUDITORIA DEL PROGRAMA
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_auditoria
-- Registro de moficaciones importantes a tablas importantes

DROP TABLE IF EXISTS tbl_auditoria;

CREATE TABLE tbl_auditoria (
    ID_Auditoria BIGINT AUTO_INCREMENT PRIMARY KEY,

    Tabla_Afectada VARCHAR(100) NOT NULL,
    Tipo_Evento VARCHAR(20), -- CREATE, READ, UPDATE, DELETE, LOGIN, PASSWORD_CHANGE, DELETE_STUDENT, ACCOUNT_CLOSED   

    ID_Registro_Afectado VARCHAR(50) NOT NULL,

    Datos_Antiguo JSON NULL,
    Datos_Nuevos JSON NULL,

    Fecha_Auditoria DATETIME DEFAULT CURRENT_TIMESTAMP,

    IP_Usuario VARCHAR(50) NOT NULL,
    User_Agent VARCHAR(255) NULL,

    FK_ID_Usuario INT NOT NULL,

    Estado_Auditoria TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Auditoria_Usuario FOREIGN KEY (FK_ID_Usuario) REFERENCES tbl_usuario(ID_Usuario) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB;


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_sesion_activa
-- Registro de todas las sesiones (abiertas / cerradas) de los usuarios 

DROP TABLE IF EXISTS tbl_sesion_activa;

CREATE TABLE tbl_sesion_activa (
    ID_Sesion BIGINT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_Usuario INT NOT NULL,
    JTI VARCHAR(64) NOT NULL UNIQUE,
    Dispositivo VARCHAR(255) NULL,
    IP VARCHAR(50) NULL,
    Fecha_Inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    Ultimo_Acceso DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Activa TINYINT(1) DEFAULT 1,

    Estado_Sesion_Activa TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Sesion_Usuario FOREIGN KEY (FK_ID_Usuario) REFERENCES tbl_usuario(ID_Usuario) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB;

ALTER TABLE tbl_sesion_activa ADD INDEX idx_jti (JTI);


-- --------------------------------------------------------
-- Estructura de tabla para la tabla tbl_auditoria_sesion
-- Registro de todas las acciones relacionadas con el ingreso a la pagina

DROP TABLE IF EXISTS tbl_auditoria_sesion;
 
CREATE TABLE tbl_auditoria_sesion (
    ID_Auditoria BIGINT AUTO_INCREMENT PRIMARY KEY,

    FK_ID_Usuario INT NULL,
    IP_Usuario VARCHAR(45) NOT NULL,
    Tipo_Evento VARCHAR(45) NOT NULL,
    -- LOGIN, LOGIN_MFA, LOGOUT, PENDING_MFA, AD_FAILED_LOGIN, US_FAILED_LOGIN, FAILED_LOGIN, FAILED_MFA
    Fecha_Evento DATETIME DEFAULT CURRENT_TIMESTAMP,
    User_Agent VARCHAR(255) NOT NULL,

    Estado_Auditoria_Sesion TINYINT(1) NOT NULL DEFAULT 1,

    CONSTRAINT FK_Auditoria_Sesion_Usuario FOREIGN KEY (FK_ID_Usuario) REFERENCES tbl_usuario(ID_Usuario) ON DELETE CASCADE ON UPDATE CASCADE

) ENGINE=InnoDB;