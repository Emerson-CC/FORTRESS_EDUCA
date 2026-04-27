USE FORTRESS_EDUCA_DB;

-- -----------------------------------------------------
-- TBL_LOCALIDAD
-- -----------------------------------------------------

INSERT INTO TBL_LOCALIDAD (ID_Localidad, Nombre_Localidad) VALUES
    (1, 'Engativá'), 
    (2, 'Otra');


-- -----------------------------------------------------
-- TBL_BARRIO
-- -----------------------------------------------------

INSERT INTO TBL_BARRIO (ID_Barrio, Nombre_Barrio, FK_ID_Localidad) VALUES
    (1, 'Engativá Centro', 1), 
    (2, 'Garcés Navas', 1), 
    (4, 'Minuto de Dios', 1), 
    (5, 'Villas de Granada', 1), 
    (6, 'La Estrada', 1), 
    (7, 'Santa Helenita', 1), 
    (8, 'Boyacá Real', 1), 
    (9, 'Álamos Norte', 1), 
    (10, 'Álamos Sur', 1), 
    (11, 'Las Ferias', 1), 
    (12, 'Santa Rosita', 1), 
    (13, 'Bolivia', 1), 
    (14, 'Normandía', 1), 
    (15, 'Normandía Occidental', 1), 
    (16, 'Villa Luz', 1), 
    (17, 'Santa Cecilia', 1), 
    (18, 'El Luján', 1), 
    (19, 'La Clarita', 1), 
    (20, 'Florencia', 1), 
    (21, 'La Granja', 1), 
    (22, 'Marandú', 1), 
    (23, 'Villa Gladys', 1), 
    (24, 'San Ignacio', 1), 
    (25, 'Los Álamos', 1), 
    (26, 'Santa María del Lago', 1), 
    (27, 'Tabora', 1), 
    (28, 'El Cortijo', 1), 
    (29, 'Granjas del Dorado', 1), 
    (30, 'Villa Teresita', 1), 
    (31, 'Villa Clavel', 1), 
    (32, 'Bonanza', 1), 
    (33, 'Quirigua', 1),
    (34, 'La Serena', 1),
    (35, 'El Muelle', 1),
    (36, 'San Jorge', 1);

-- -----------------------------------------------------
-- TBL_GENERO
-- -----------------------------------------------------

INSERT INTO TBL_GENERO (ID_Genero, Nombre_Genero) VALUES
    (1, 'Masculino'), 
    (2, 'Femenino'), 
    (3, 'Otro');


-- -----------------------------------------------------
-- TBL_GRUPO_PREFERENCIAL
-- -----------------------------------------------------

INSERT INTO TBL_GRUPO_PREFERENCIAL (ID_Grupo_Preferencial, Nombre_Grupo_Preferencial, Descripcion_Grupo_Preferencial, Nivel_Prioridad_GP) VALUES
    (1, 'Ninguno', 'Persona que no pertenece a ningún grupo poblacional con enfoque diferencial específico.', 0), 
    (2, 'Comunidad Indígena', 'Pertenencia a pueblos originarios con reconocimiento étnico y cultural.', 30), 
    (3, 'Afrocolombiano', 'Persona que se reconoce como parte de comunidades negras, mulatas o afrodescendientes.', 25), 
    (4, 'Refugiado', 'Persona que busca protección internacional debido a temores fundados de persecución en su país.', 25), 
    (5, 'LGBTQ+', 'Pertenencia a sectores sociales con orientaciones sexuales e identidades de género diversas.', 20), 
    (6, 'Pobreza Extrema', 'Situación en la cual los ingresos no son suficientes para cubrir la canasta básica de alimentos.', 20);


-- -----------------------------------------------------
-- TBL_ESTRATO
-- -----------------------------------------------------

INSERT INTO TBL_ESTRATO (ID_Estrato, Nombre_Estrato, Descripcion_Estrato, Nivel_Prioridad_E) VALUES
    (1, 'Estrato 1', 'Nivel socioeconómico bajo-bajo, correspondiente a usuarios con menores recursos.', 60), 
    (2, 'Estrato 2', 'Nivel socioeconómico bajo, asignado a viviendas con recursos limitados.', 50), 
    (3, 'Estrato 3', 'Nivel socioeconómico medio-bajo, con acceso básico a servicios y condiciones estables.', 40), 
    (4, 'Estrato 4', 'Nivel socioeconómico medio, correspondiente a zonas con capacidad de pago estándar.', 30);


-- -----------------------------------------------------
-- TBL_PARENTESCO
-- -----------------------------------------------------

INSERT INTO TBL_PARENTESCO (ID_Parentesco, Nombre_Parentesco, Tipo_Usuario) VALUES
    (1, 'Hijo', 'ESTUDIANTE'), 
    (2, 'Hija', 'ESTUDIANTE'), 
    (3, 'Sobrino/a', 'ESTUDIANTE'), 
    (4, 'Hermano/a', 'ESTUDIANTE'), 
    (5, 'Nieto/a', 'ESTUDIANTE'), 
    (6, 'Hijo Adoptivo', 'ESTUDIANTE'), 
    (7, 'Hija Adoptiva', 'ESTUDIANTE'), 
    (8, 'Otro ', 'ESTUDIANTE'), 
    (9, 'Padre', 'ACUDIENTE'), 
    (10, 'Madre', 'ACUDIENTE'), 
    (11, 'Tío/a', 'ACUDIENTE'), 
    (12, 'Abuelo/a', 'ACUDIENTE'), 
    (13, 'Hermano/a Mayor', 'ACUDIENTE'), 
    (14, 'Tutor Legal', 'ACUDIENTE'), 
    (15, 'Otro', 'ACUDIENTE');


-- -----------------------------------------------------
-- TBL_TIPO_DOCUMENTO_IDENTIDAD
-- -----------------------------------------------------

INSERT INTO TBL_TIPO_IDENTIFICACION (ID_Tipo_Iden, Nombre_Tipo_Iden, Tipo_Usuario) VALUES
    (1, 'Cedula de Ciudadania', 'ACUDIENTE'), 
    (2, 'Cedula de Extranjeria', 'ACUDIENTE'), 
    (3, 'Tarjeta de Identidad', 'ESTUDIANTE'), 
    (4, 'Registro Civil', 'ESTUDIANTE');


-- -----------------------------------------------------
-- TBL_GRADO
-- -----------------------------------------------------

INSERT INTO TBL_GRADO (ID_Grado, Nombre_Grado, Nivel_Educativo) VALUES
    (1, 'Pre jardín', 'Preescolar'), 
    (2, 'Transición', 'Preescolar'), 
    (3, 'Primero', 'Primaria'), 
    (4, 'Segundo', 'Primaria'), 
    (5, 'Tercero', 'Primaria'), 
    (6, 'Cuarto', 'Primaria'), 
    (7, 'Quinto', 'Primaria'), 
    (8, 'Sexto', 'Secundaria'), 
    (9, 'Septimo', 'Secundaria'), 
    (10, 'Octavo', 'Secundaria'), 
    (11, 'Noveno', 'Secundaria'), 
    (12, 'Decimo', 'Bachiller'), 
    (13, 'Once', 'Bachiller');


-- -----------------------------------------------------
-- TBL_COLEGIO
-- -----------------------------------------------------

INSERT INTO TBL_COLEGIO (ID_Colegio, Nombre_Colegio, Codigo_DANE, Email, Telefono, Direccion_Colegio, FK_ID_Barrio) VALUES
-- Bloque Inicial corregido
    (1, 'No Aplica', 'N/A', NULL, NULL, 'N/A', 1),
    (2, 'IED Juan del Corral', '111001009580', 'intdijuandelcorral10@educacionbogota.edu.co', '6012503781', 'Kr 69B No. 79A-42', 11),
    (3, 'IED Magdalena Ortega de Nariño', '111001017795', 'lnalmagdalenaorteg10@educacionbogota.edu.co', '6012400968', 'Kr 69B No. 78A-36', 11),
    (4, 'IED República de Colombia', '111001009971', 'coldirepdecolombia10@educacionbogota.edu.co', '6012509683', 'Cl 68 No. 69-10', 6),
    (5, 'IED Garcés Navas', '111001033979', 'escdgarcesnavasii10@educacionbogota.edu.co', '6012275473', 'Kr 104A No. 76B-09', 2),
    (6, 'Colegio Minuto de Dios Siglo XXI', '311001052018', 'colegio@minutodedios.edu.co', '6014304411', 'Tv 74 No. 81C-05', 4),
    (7, 'IED Villas de Granada', '111001107875', 'cedvillasdegranada10@educacionbogota.edu.co', '6014316104', 'Cl 78 No. 114A-25', 5),
    (8, 'IED La Estrada', '111001015415', 'cedlaestrada10@educacionbogota.edu.co', '6012316491', 'Cl 69 No. 69-23', 6),
    (9, 'IED Boyacá Real', '111001015385', 'cedboyacareal10@educacionbogota.edu.co', '6012513904', 'Cl 68 No. 73A-44', 8),
    (10, 'IED Álamos', '111001015199', 'cedalamos10@educacionbogota.edu.co', '6012232537', 'Cl 71 No. 94-03', 25),
    (11, 'IED Santa María del Lago', '111001012459', 'cedsantamariadella10@educacionbogota.edu.co', '6012239634', 'Kr 73 No. 75A-30', 26),
    (12, 'IED Tabora', '111001012483', 'cedtabora10@educacionbogota.edu.co', '6014343238', 'Cl 74 No. 76A-30', 27),
    (13, 'IED Florencia', '111001035521', 'cedflorencia10@educacionbogota.edu.co', '6012245700', 'Cl 75 No. 89-05', 20),
    (14, 'IED Bolivia', '111001094030', 'cedrepdebolivia10@educacionbogota.edu.co', '6012400595', 'Cl 82 No. 103A-40', 13),
    (15, 'IED Robert F Kennedy', '111001009521', 'coldirobertfkenned10@educacionbogota.edu.co', '6012501625', 'Av. Boyacá No. 75B-01', 32),
    (16, 'IED Las Ferias', '111001014605', 'cedlasferias10@educacionbogota.edu.co', '6012400268', 'Cl 74A No. 69P-38', 11),
    (17, 'IED Rodolfo Llinás', '111001104329', 'cedrodolfollinas10@educacionbogota.edu.co', '6012291625', 'Cl 71 No. 89A-40', 33),
    (18, 'IED Antonio Nariño', '111001006483', 'cedantonionarino10@educacionbogota.edu.co', '6014352125', 'Cl 92 No. 92-30', 33),
    (19, 'IED Lucila Rubio de Laverde', '111002800155', 'cedlucilarubiode10@educacionbogota.edu.co', NULL, 'Cl 66A No. 120-10', 35),
    (20, 'IED Nestor Forero Alcala', '111001015181', 'coldinestorforeroa10@educacionbogota.edu.co', '6012245700', 'Kr 70C Bis No. 71-33', 32),
    (21, 'IED Nidia Quintero de Turbay', '111265000078', 'cednidiaquinterode10@educacionbogota.edu.co', '6014311894', 'Cl 75 No. 90-75', 34),
    (22, 'IED Nueva Constitucion', '111001093157', 'cednuevaconstituci10@educacionbogota.edu.co', '6014353457', 'Kr 107B No. 74B-31', 36),
    (23, 'IED General Santander', '111001013447', 'cedgeneralsantande10@educacionbogota.edu.co', '6014310575', 'Cl 68B No. 124-20', 1),
    (24, 'IED Guillermo Leon Valencia', '111001012394', 'cedguillermoleonv10@educacionbogota.edu.co', '6014361066', 'Cl 75 No. 74A-40', 34),
    (25, 'IED Jorge Gaitan Cortes', '111001012424', 'cedjorgegaitancor10@educacionbogota.edu.co', '6012510255', 'Cl 70 No. 80-45', 36),
    (26, 'IED La Palestina', '111265000051', 'cedlapalestina10@educacionbogota.edu.co', '6014300302', 'Cl 68 No. 77-10', 27),
    (27, 'IED Republica de China', '111001043818', 'cedrepdechina10@educacionbogota.edu.co', '6012241604', 'Kr 91 No. 82-20', 33),
    (28, 'IED Jose Asuncion Silva', '111001011771', 'coldijoseasuncions10@educacionbogota.edu.co', '6012512811', 'Kr 91 No. 89-54', 33),
    (29, 'IED Manuel Cepeda Vargas', '111001103730', 'cedmanuelcepedavar10@educacionbogota.edu.co', '6014339893', 'Cl 78 No. 121A-12', 35),
    (30, 'IED El Porvenir', '111001109151', 'cedelporvenir10@educacionbogota.edu.co', '6014389025', 'Kr 121 No. 75D-20', 35);


-- -----------------------------------------------------
-- TBL_JORNADA
-- -----------------------------------------------------

INSERT INTO TBL_JORNADA (ID_Jornada, Nombre_Jornada) VALUES
    (1, 'Mañana'), 
    (2, 'Tarde'), 
    (3, 'Nocturna'),
    (4, 'Única'),
    (5, 'Completa'),
    (6, 'Fin de Semana');


-- -----------------------------------------------------
-- TBL_CUPOS
-- -----------------------------------------------------

INSERT INTO TBL_CUPOS (FK_ID_Grado, FK_ID_Colegio, FK_ID_Jornada, Cupos_Disponibles) VALUES
    (1, 6, 1, 40), 
    (2, 9, 2, 35), 
    (3, 8, 1, 38), 
    (4, 2, 2, 30), 
    (7, 3, 1, 42), 
    (2, 4, 2, 33), 
    (7, 5, 1, 36), 
    (7, 6, 2, 28), 
    (5, 7, 1, 30), 
    (1, 8, 1, 27), 
    (2, 9, 2, 29), 
    (7, 10, 1, 34), 
    (7, 11, 2, 26), 
    (5, 12, 1, 31);


-- -----------------------------------------------------
-- TBL_ROL
-- -----------------------------------------------------

INSERT INTO TBL_ROL (ID_Rol, Nombre_Rol, Descripcion_Rol) VALUES
    (1, 'Sistema', 'Usuario generico que representa el sistema'), 
    (2, 'Acudiente', 'Persona encargada de registrar estudiantes y la creación de sus respectivos ticktes'), 
    (3, 'Tecnico', 'Resolvera tickets'), 
    (4, 'Admin', 'Encargado de la pagina'), 
    (5, 'Desconocido', 'Usuario generico para exepciones en la auditoria');


-- -----------------------------------------------------
-- TBL_TIPO_AFECTACION
-- -----------------------------------------------------

INSERT INTO TBL_TIPO_AFECTACION (ID_Tipo_Afectacion, Nombre_Afectacion, Descripcion_Afectacion, Nivel_Prioridad_TC) VALUES
    (1, 'Desplazamiento Forzado', 'Persona obligada a abandonar su hogar debido a situaciones de violencia o conflicto.', 40), 
    (2, 'Víctima del Conflicto Armado', 'Individuo que ha sufrido daños por infracciones al Derecho Internacional Humanitario.', 35), 
    (3, 'Vulnerabilidad Económica', 'Situación de precariedad financiera que limita el acceso a necesidades básicas.', 20), 
    (4, 'No Escolarizado', 'Persona que no se encuentra vinculada formalmente al sistema educativo.', 15), 
    (5, 'Otro', 'Cualquier otro tipo de afectación que no se encuentre clasificada en las categorías anteriores.', 5);



-- -----------------------------------------------------
-- TBL_ESTADO_TICKET
-- -----------------------------------------------------

INSERT INTO TBL_ESTADO_TICKET (ID_Estado_Ticket, Nombre_Estado, Estado_Final) VALUES
    (1, 'Abierto', 0), 
    (2, 'En Revisión', 0), 
    (3, 'Validación de Documentos', 0), 
    (4, 'Pendiente Acción de Usuario', 0), -- Si se solicita al usuario enviar/confirmar un documento y/o información
    (5, 'Asignación de Cupo', 0), 
    (6, 'Rechazado', 1), -- La inforación no es veridica/correcta/apropiada o el usuario abandono el ticket
    (7, 'Cancelado a Petición', 1), -- El usuario solicita el cierre del ticket
    (8, 'Solucionado', 1);


-- -----------------------------------------------------
-- TBL_TIEMPO_RESIDENCIA
-- -----------------------------------------------------

INSERT INTO TBL_TIEMPO_RESIDENCIA (ID_Tiempo_Residencia, Nombre_Tiempo) VALUES
    (1, 'Menos de 1 mes'), 
    (2, '1 a 6 meses'), 
    (3, '6 meses a 1 año'), 
    (4, 'Más de 1 año');


-- -----------------------------------------------------
-- TBL_TIPO_DOCUMENTO
-- -----------------------------------------------------

INSERT INTO TBL_TIPO_DOCUMENTO (ID_Tipo_Doc, Nombre_Tipo_Doc) VALUES
    (1, 'Documento Acudiente'), 
    (2, 'Documento Menor'), 
    (3, 'Certificado Académico'), 
    (4, 'Documento Víctima');


-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- USUARIO GENERAL DEL SISTEMA
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (1, '000000010000000', 'System', '-', 'User', '-', '2000-01-01', 1);

INSERT INTO TBL_USUARIO (ID_Usuario, Nombre_Usuario, Contraseña_Hash, FK_ID_Persona, FK_ID_Rol) VALUES 
    (1, 'system@audit', "$argon2id$v=19$m=65536, t=3, p=4$zrLKUtV7jF6NS1gi5VyvhA$XrhMZLWBgYSjWJGkRMDcIU84dbGNAhmyQGdWsNFQxgU", 1, 1);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- USUARIO GENERAL DE AUDITORIA
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (2, '000000020000000', 'Unknown', '-', 'User', '-', '2000-01-01', 1);

INSERT INTO TBL_USUARIO (ID_Usuario, Nombre_Usuario, Contraseña_Hash, FK_ID_Persona, FK_ID_Rol) VALUES 
    (2, 'unknown@audit', "$argon2id$v=19$m=65536, t=3, p=4$zrLKUtV7jF6NS1gi5VyvhA$XrhMZLWBgYSjWJGkRMDcIU84dbGNAhmyQGdWsNFQxgl", 2, 5);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- USUARIO PRUEBA: USUARIO ADMIN N°1
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (3, '1010101101', 'Fortress', NULL, 'Educa', NULL, '2005-08-26', '1');

INSERT INTO TBL_DATOS_ADICIONALES (ID_Datos_Adicionales, Email, Telefono, FK_ID_Parentesco, FK_ID_Tipo_Iden, FK_ID_Persona, FK_ID_Genero, FK_ID_Grupo_Preferencial, FK_ID_Estrato, FK_ID_Barrio, Estado_Datos_Adicionales) VALUES 
    (3, 'fortress.educa@gmail.com', '3213397085', '15', '1', '3', '1', '1', '1', '16', '1');

INSERT INTO TBL_USUARIO (ID_Usuario, Nombre_Usuario, Contraseña_Hash, Ultimo_Cambio_Contraseña, Ultimo_Login, Intentos_Fallidos, Fecha_Creacion, Doble_Factor_Activo, MFA_Fecha_Configuracion, MFA_Secret, MFA_Secret_Temp, Notificaciones_Email, Notificaciones_Navegador, Aceptacion_Terminos, FK_ID_Persona, FK_ID_Rol, Estado_Usuario) VALUES 
    (3, 'fortress.educa@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$CbNaBHYhF5D+Llo3F4gYLQ$EqZN3qrgTsEUQwe7ZpSgTBSBAOijwkUw+M42Gqmkoio', NULL, '2026-04-17 02:06:16', '0', '2026-04-17 02:01:41', 'INACTIVE', NULL, NULL, NULL, '0', '0', 'ACCEPTED', '3', '4', '1');


-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- USUARIO PRUEBA: USUARIO TÉCNICO N°1
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (4, '1019762928', 'Emerson', 'Daniel', 'Caicedo', 'Cobos', '2000-01-01', 1);

INSERT INTO TBL_DATOS_ADICIONALES (ID_Datos_Adicionales, Email, Telefono, FK_ID_Parentesco, FK_ID_Tipo_Iden, FK_ID_Persona, FK_ID_Genero, FK_ID_Grupo_Preferencial, FK_ID_Estrato, FK_ID_Barrio, Estado_Datos_Adicionales) VALUES 
    (4, 'edcaicedoc@sanmateo.edu.co', '3213397584', '13', '1', '4', '1', '3', '3', '18', 1);

INSERT INTO TBL_USUARIO (ID_Usuario, Nombre_Usuario, Contraseña_Hash, Ultimo_Cambio_Contraseña, Ultimo_Login, Intentos_Fallidos, Fecha_Creacion, Doble_Factor_Activo, MFA_Fecha_Configuracion, MFA_Secret, MFA_Secret_Temp, Notificaciones_Email, Notificaciones_Navegador, Aceptacion_Terminos, FK_ID_Persona, FK_ID_Rol, Estado_Usuario) VALUES 
    (4, 'edcaicedoc@sanmateo.edu.co', '$argon2id$v=19$m=65536,t=3,p=4$CbNaBHYhF5D+Llo3F4gYLQ$EqZN3qrgTsEUQwe7ZpSgTBSBAOijwkUw+M42Gqmkoio', '2026-04-14 11:44:39', '2026-04-16 06:13:17', '0', '2026-03-30 23:07:59', 'ACTIVE', '2026-04-14 12:43:47', 'PWHFBTGG3SXTCWGBE6QI5GG6KUZKV2O5', NULL, '0', '0', 'ACCEPTED', '4', '3', '1');

-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- USUARIO PRUEBA: USUARIO NORMAL N°1
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (5, '54269132', 'Luis', 'Felipe', 'Gonzalez', 'Mogollon', '2000-01-01', 1);

INSERT INTO TBL_DATOS_ADICIONALES (ID_Datos_Adicionales, Email, Telefono, FK_ID_Parentesco, FK_ID_Tipo_Iden, FK_ID_Persona, FK_ID_Genero, FK_ID_Grupo_Preferencial, FK_ID_Estrato, FK_ID_Barrio, Estado_Datos_Adicionales) VALUES 
    (5, 'danicaicedo2005@gmail.com', '3152512350', '9', '1', '5', '1', '4', '3', '19', 1);

INSERT INTO TBL_USUARIO (ID_Usuario, Nombre_Usuario, Contraseña_Hash, Ultimo_Cambio_Contraseña, Ultimo_Login, Intentos_Fallidos, Fecha_Creacion, Doble_Factor_Activo, MFA_Fecha_Configuracion, MFA_Secret, MFA_Secret_Temp, Notificaciones_Email, Notificaciones_Navegador, Aceptacion_Terminos, FK_ID_Persona, FK_ID_Rol, Estado_Usuario) VALUES 
    (5, 'danicaicedo2005@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$CbNaBHYhF5D+Llo3F4gYLQ$EqZN3qrgTsEUQwe7ZpSgTBSBAOijwkUw+M42Gqmkoio', '2026-04-15 15:11:51', '2026-04-15 16:56:45', '0', '2026-04-03 17:09:56', 'INACTIVE', NULL, NULL, NULL, '0', '0', 'ACCEPTED', '5', '2', '1');

-- -----------------------------------------------------
-- ESTUDIANTE PRUEBA N°1
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (6, '1524524213', 'Luis', 'Alejandro', 'Narvaez', 'Talavera', '2015-11-19', 1);

INSERT INTO TBL_ESTUDIANTE (ID_Estudiante, FK_ID_Tipo_Iden, FK_ID_Persona, FK_ID_Grado_Actual, FK_ID_Grado_Proximo, FK_ID_Colegio_Anterior, FK_ID_Genero, FK_ID_Grupo_Preferencial, FK_ID_Acudiente, FK_ID_Parentesco_Es, Estado_Estudiante) VALUES 
    (1, '3', '6', '6', '7', '9', '1', '4', '5', '6', 1);


-- -----------------------------------------------------
-- ESTUDIANTE PRUEBA N°2
-- -----------------------------------------------------

INSERT INTO TBL_PERSONA (ID_Persona, Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona) VALUES 
    (7, '1064298354', 'Andres', 'Felipe', 'Saenz', 'Gutierrez', '2008-06-19', 1);

INSERT INTO TBL_ESTUDIANTE (ID_Estudiante, FK_ID_Tipo_Iden, FK_ID_Persona, FK_ID_Grado_Actual, FK_ID_Grado_Proximo, FK_ID_Colegio_Anterior, FK_ID_Genero, FK_ID_Grupo_Preferencial, FK_ID_Acudiente, FK_ID_Parentesco_Es, Estado_Estudiante) VALUES 
    (2, '3', '7', '10', '11', '11', '1', '1', '5', '6', 1);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- TICKET PRUEBA PRUEBA
-- -----------------------------------------------------
INSERT INTO tbl_ticket (ID_Ticket, Titulo_Ticket, Descripcion_Ticket, Fecha_Creacion, Fecha_Cierre, Puntaje_Prioridad, FK_ID_Usuario_Creador, FK_ID_Usuario_Tecnico, FK_ID_Estudiante, FK_ID_Tipo_Afectacion, FK_ID_Colegio_Preferencia, FK_ID_Jornada_Preferencia, FK_ID_Cupo_Asignado, FK_ID_Estado_Ticket, FK_ID_Barrio, FK_ID_Tiempo_Residencia, Estado_Ticket) VALUES 
    ('EDU-000001', 'Solicitud de Cupo — Andres Saenz — Octavo', 'Por el conflicto armado en el departamento del Meta tubimos que abandonar nuestro hogar. No reubicaron en Bogotá en la localidad de Engativa y actualmente ya contamos con recursos para continuar con la educacion de nuestro hijo.', '2026-04-19 03:13:38', NULL, '40', '5', '4', '2', '1', NULL, '1', NULL, '4', '4', '4', '1');
