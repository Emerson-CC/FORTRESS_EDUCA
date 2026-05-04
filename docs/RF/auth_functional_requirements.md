# Requerimientos Funcionales del Módulo de Autenticación (Auth)

## RF-AUTH-001
NOMBRE DEL REQUERIMIENTO: Inicio de sesión multi-rol
CARACTERISTICAS: Formulario de login con validación de usuario, contraseña y rol; rutas separadas para acudiente, administrador y técnico.
DESCRIPCION: El sistema debe permitir el acceso solo a usuarios registrados y validar que cada uno acceda mediante la ruta correspondiente a su tipo de cuenta.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-004, RNF-SEC-007, RNF-AVAIL-002

## RF-AUTH-002
NOMBRE DEL REQUERIMIENTO: Validación de credenciales y estado de cuenta
CARACTERISTICAS: Verificación del usuario contra la base de datos, comparación de contraseña hash y validación del rol asignado.
DESCRIPCION: El sistema debe comprobar que las credenciales ingresadas sean correctas y que el usuario tenga permisos adecuados antes de iniciar sesión.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-001, RNF-SEC-006, RNF-AVAIL-002

## RF-AUTH-003
NOMBRE DEL REQUERIMIENTO: Protección contra login automatizado
CARACTERISTICAS: Conteo de intentos fallidos y despliegue de reCAPTCHA tras 3 intentos.
DESCRIPCION: Después de múltiples intentos fallidos, el sistema debe exigir una comprobación adicional para reducir el riesgo de ataques de fuerza bruta.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-004, RNF-SEC-007

## RF-AUTH-004
NOMBRE DEL REQUERIMIENTO: Registro de acudientes
CARACTERISTICAS: Formulario de registro con datos personales, de contacto y seguridad; selección de barrio, tipo de documento y parentesco.
DESCRIPCION: El sistema debe permitir crear nuevas cuentas de acudiente con información completa y validaciones en el servidor.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-006, RNF-AVAIL-006

## RF-AUTH-005
NOMBRE DEL REQUERIMIENTO: Verificación de unicidad de usuario
CARACTERISTICAS: Comprobación de existencia de email y documento en la base de datos antes de registrar.
DESCRIPCION: El sistema debe evitar duplicados para los campos email y documento, mostrando mensajes claros si ya existen.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-005, RNF-AVAIL-002

## RF-AUTH-006
NOMBRE DEL REQUERIMIENTO: Validación reCAPTCHA en registro
CARACTERISTICAS: Integración de reCAPTCHA en la página de registro y validación del token server-side.
DESCRIPCION: El formulario de registro debe requerir verificación humana para reducir registros automatizados o maliciosos.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-004, RNF-SEC-007

## RF-AUTH-007
NOMBRE DEL REQUERIMIENTO: Recuperación de contraseña por email
CARACTERISTICAS: Formulario de solicitud de recuperación, envío de correo electrónico y manejo de flujo por pasos.
DESCRIPCION: El sistema debe permitir a los usuarios recuperar su contraseña mediante código enviado a su correo registrado.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-003, RNF-AVAIL-002, RNF-AVAIL-004

## RF-AUTH-008
NOMBRE DEL REQUERIMIENTO: Proceso de recuperación con código de 6 dígitos
CARACTERISTICAS: Generación de código aleatorio, almacenamiento temporal en sesión, expiración a 10 minutos y validación de código.
DESCRIPCION: El sistema debe asegurar que solo el propietario del correo pueda cambiar la contraseña, mediante un código temporal y verificación estructurada.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-006, RNF-SEC-012, RNF-AVAIL-006

## RF-AUTH-009
NOMBRE DEL REQUERIMIENTO: Soporte de MFA con TOTP
CARACTERISTICAS: Configuración de autenticación de dos factores opcional mediante TOTP compatible con apps autenticadoras.
DESCRIPCION: El sistema debe permitir activar MFA para ofrecer un segundo factor de autenticación adicional al ingreso.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-010, RNF-SEC-011

## RF-AUTH-010
NOMBRE DEL REQUERIMIENTO: Verificación de código TOTP durante login
CARACTERISTICAS: Formulario de MFA tras login inicial, validación del código y redirección al dashboard correspondiente.
DESCRIPCION: Los usuarios con MFA activo deben completar un segundo paso de autenticación antes de acceder a su sesión.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-010, RNF-SEC-013

## RF-AUTH-011
NOMBRE DEL REQUERIMIENTO: Configuración de MFA mediante QR
CARACTERISTICAS: Generación de secreto temporal, creación de URI OTPAuth y presentación del código QR para escaneo.
DESCRIPCION: El sistema debe crear el QR necesario para que el usuario configure su app autenticadora y luego confirme el código generado.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-010, RNF-AVAIL-002

## RF-AUTH-012
NOMBRE DEL REQUERIMIENTO: Gestión de sesiones con JWT
CARACTERISTICAS: Uso de access token y refresh token, almacenamiento de cookies JWT y validación server-side.
DESCRIPCION: El sistema debe mantener la sesión activa de manera segura mediante tokens JWT en lugar de depender solo de sesiones tradicionales.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-003, RNF-SEC-013, RNF-AVAIL-002

## RF-AUTH-013
NOMBRE DEL REQUERIMIENTO: Emisión de access y refresh tokens
CARACTERISTICAS: Generación de access token con expiración y refresh token separado para renovar la sesión.
DESCRIPCION: El sistema debe crear ambos tokens para garantizar la seguridad y la continuidad de la sesión sin exponer credenciales.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-003, RNF-SEC-013

## RF-AUTH-014
NOMBRE DEL REQUERIMIENTO: Cierre seguro de sesión
CARACTERISTICAS: Invalidación de tokens JWT, cierre de sesión en la base de datos y limpieza de sesión local.
DESCRIPCION: El sistema debe asegurar que al cerrar sesión el usuario quede completamente desautenticado y no pueda reutilizar tokens anteriores.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-008, RNF-AVAIL-002

## RF-AUTH-015
NOMBRE DEL REQUERIMIENTO: Autorización por roles
CARACTERISTICAS: Validación de permisos según rol y redirección a dashboards específicos para cada tipo de usuario.
DESCRIPCION: El sistema debe restringir funcionalidades de acuerdo a los roles de usuario: acudiente, administrador y técnico.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-013, RNF-SEC-014

## RF-AUTH-016
NOMBRE DEL REQUERIMIENTO: Registro de eventos de auditoría
CARACTERISTICAS: Auditoría de intentos de login, MFA, cambios de contraseña y registro de usuarios.
DESCRIPCION: El sistema debe generar eventos de auditoría cada vez que ocurra una acción relevante de seguridad para rastreo y análisis.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-009, RNF-ETH-003

## RF-AUTH-017
NOMBRE DEL REQUERIMIENTO: Detalle de información de auditoría
CARACTERISTICAS: Captura de ID de usuario, IP, User-Agent, timestamp y tipo de evento.
DESCRIPCION: El sistema debe incluir datos suficientes en los logs para identificar acciones de seguridad sin exponer datos sensibles.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-009, RNF-ETH-003

## RF-AUTH-018
NOMBRE DEL REQUERIMIENTO: Validación de formatos de entrada
CARACTERISTICAS: Validaciones para email, contraseña, documento, teléfono y fecha de nacimiento.
DESCRIPCION: El sistema debe asegurar que todas las entradas de usuario cumplan formatos válidos antes de procesarlas.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-006, RNF-USAB-002

## RF-AUTH-019
NOMBRE DEL REQUERIMIENTO: Protección CSRF
CARACTERISTICAS: Uso de tokens CSRF en formularios Flask-WTF y manejo de errores CSRF.
DESCRIPCION: El sistema debe evitar ataques de falsificación de solicitudes entre sitios autenticados.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-007

## RF-AUTH-020
NOMBRE DEL REQUERIMIENTO: Sanitización de entradas para XSS
CARACTERISTICAS: Control de formularios sanitizados, validación de datos y escape en salidas HTML.
DESCRIPCION: El sistema debe prevenir la inyección de scripts maliciosos desde datos ingresados por el usuario.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-006, RNF-ETH-003
