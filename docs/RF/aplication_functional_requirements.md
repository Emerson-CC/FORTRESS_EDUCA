# Requerimientos Funcionales del Módulo de Aplicación (Aplication)

## RF-APP-001
NOMBRE DEL REQUERIMIENTO: Panel principal de acudiente
CARACTERISTICAS: Visualización de resumen de solicitudes activas, estudiantes registrados y estado de procesos; gráficos de prioridad.
DESCRIPCION: El sistema debe mostrar un dashboard que presente información relevante del acudiente incluyendo el estado de sus solicitudes de cupo.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-PERF-001, RNF-AVAIL-002

## RF-APP-002
NOMBRE DEL REQUERIMIENTO: Crear nueva solicitud de cupo
CARACTERISTICAS: Formulario multi-paso que recopila: estudiante, tipo de afectación, ubicación, preferencias educativas, documentos y términos.
DESCRIPCION: El sistema debe permitir al acudiente crear una solicitud de asignación de cupo para un estudiante mediante un asistente guiado.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-006, RNF-AVAIL-006

## RF-APP-003
NOMBRE DEL REQUERIMIENTO: Validación de pasos del formulario de solicitud
CARACTERISTICAS: Validación progresiva de cada paso, manejo de datos en sesión y redirección al paso incompleto.
DESCRIPCION: El sistema debe validar los datos de cada paso del formulario y permitir navegación solo cuando hay coherencia.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-002, RNF-SEC-006, RNF-AVAIL-006

## RF-APP-004
NOMBRE DEL REQUERIMIENTO: Carga de documentos en solicitud
CARACTERISTICAS: Soporte para múltiples archivos (PDF, JPG, PNG), límites de tamaño y validación de extensiones.
DESCRIPCION: El sistema debe permitir cargar documentos adjuntos para la solicitud de cupo con validaciones de tipo y tamaño.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-006, RNF-AVAIL-002, RNF-PERF-002

## RF-APP-005
NOMBRE DEL REQUERIMIENTO: Verificación de solicitud activa
CARACTERISTICAS: Prevención de múltiples solicitudes activas simultáneamente para el mismo estudiante.
DESCRIPCION: El sistema debe verificar que no haya solicitudes activas previas antes de permitir una nueva solicitud.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-009, RNF-AVAIL-002

## RF-APP-006
NOMBRE DEL REQUERIMIENTO: Listar solicitudes por acudiente
CARACTERISTICAS: Vista de todas las solicitudes del acudiente con filtros por estado y ordenamiento por fecha.
DESCRIPCION: El sistema debe mostrar un listado completo de las solicitudes realizadas por el acudiente.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-PERF-004, RNF-AVAIL-002

## RF-APP-007
NOMBRE DEL REQUERIMIENTO: Ver detalle de solicitud
CARACTERISTICAS: Visualización del estado, documentos, comentarios y timeline del proceso de solicitud.
DESCRIPCION: El sistema debe mostrar toda la información y el historial de una solicitud específica.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-008, RNF-AVAIL-002

## RF-APP-008
NOMBRE DEL REQUERIMIENTO: Timeline visual del proceso
CARACTERISTICAS: Representación gráfica de los pasos del proceso con estados completados, activos y pendientes.
DESCRIPCION: El sistema debe mostrar visualmente el progreso de la solicitud en cada etapa del proceso.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-003, RNF-USAB-004, RNF-PERF-001

## RF-APP-009
NOMBRE DEL REQUERIMIENTO: Descarga de documentos
CARACTERISTICAS: Descarga segura de archivos adjuntos a las solicitudes con validación de permisos.
DESCRIPCION: El sistema debe permitir descargar documentos cargados en las solicitudes solo al acudiente propietario.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-008, RNF-SEC-014, RNF-AVAIL-002

## RF-APP-010
NOMBRE DEL REQUERIMIENTO: Sistema de comentarios en solicitudes
CARACTERISTICAS: Agregar, visualizar y gestionar comentarios en las solicitudes con información del usuario.
DESCRIPCION: El sistema debe permitir comunicación bidireccional mediante comentarios en el seguimiento de solicitudes.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-002, RNF-SEC-006, RNF-AVAIL-002

## RF-APP-011
NOMBRE DEL REQUERIMIENTO: Registrar nuevo estudiante
CARACTERISTICAS: Formulario completo con datos personales, académicos, de contacto y validaciones.
DESCRIPCION: El sistema debe permitir registrar nuevos estudiantes asociados al acudiente con toda su información.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-006, RNF-AVAIL-006

## RF-APP-012
NOMBRE DEL REQUERIMIENTO: Verificación de estudiante duplicado
CARACTERISTICAS: Comprobación de existencia previa del estudiante por documento.
DESCRIPCION: El sistema debe evitar registrar el mismo estudiante múltiples veces.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-005, RNF-AVAIL-002

## RF-APP-013
NOMBRE DEL REQUERIMIENTO: Ver perfil del acudiente
CARACTERISTICAS: Visualización de datos personales, de contacto y adicionales del acudiente.
DESCRIPCION: El sistema debe mostrar la información completa del perfil del acudiente.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-008, RNF-AVAIL-002

## RF-APP-014
NOMBRE DEL REQUERIMIENTO: Editar perfil del acudiente
CARACTERISTICAS: Modificación de datos personales, de contacto, estrato, género, grupo preferencial y barrio.
DESCRIPCION: El sistema debe permitir actualizar la información del perfil del acudiente con validaciones.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-006, RNF-AVAIL-006

## RF-APP-015
NOMBRE DEL REQUERIMIENTO: Ver perfil del estudiante
CARACTERISTICAS: Visualización de datos académicos, personales y de contacto del estudiante.
DESCRIPCION: El sistema debe mostrar la información completa de los estudiantes asociados al acudiente.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-008, RNF-AVAIL-002

## RF-APP-016
NOMBRE DEL REQUERIMIENTO: Editar datos del estudiante
CARACTERISTICAS: Modificación de género, grupo preferencial, grados, colegio anterior y datos académicos.
DESCRIPCION: El sistema debe permitir actualizar la información del estudiante con validaciones.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-006, RNF-AVAIL-006

## RF-APP-017
NOMBRE DEL REQUERIMIENTO: Centro de seguridad del acudiente
CARACTERISTICAS: Acceso centralizado a cambio de contraseña, configuración de MFA y gestión de sesiones.
DESCRIPCION: El sistema debe proporcionar un panel de control para todas las opciones de seguridad del acudiente.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-013, RNF-AVAIL-002

## RF-APP-018
NOMBRE DEL REQUERIMIENTO: Cambiar contraseña desde perfil
CARACTERISTICAS: Validación de contraseña actual, nueva contraseña y confirmación con requisitos de complejidad.
DESCRIPCION: El sistema debe permitir cambiar la contraseña desde la sección de seguridad del acudiente.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-001, RNF-SEC-006, RNF-USAB-002

## RF-APP-019
NOMBRE DEL REQUERIMIENTO: Configurar MFA desde perfil
CARACTERISTICAS: Generación de QR, escaneo en app autenticadora y confirmación del código.
DESCRIPCION: El sistema debe permitir al acudiente configurar autenticación de dos factores desde seguridad.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-010, RNF-SEC-011, RNF-AVAIL-002

## RF-APP-020
NOMBRE DEL REQUERIMIENTO: Desactivar MFA desde perfil
CARACTERISTICAS: Verificación de código TOTP para desactivar MFA y prevenir acceso no autorizado.
DESCRIPCION: El sistema debe permitir desactivar MFA requiriendo verificación adicional.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-010, RNF-SEC-013, RNF-AVAIL-002

## RF-APP-021
NOMBRE DEL REQUERIMIENTO: Listar sesiones activas
CARACTERISTICAS: Visualización de sesiones activas con dispositivo, ubicación, fecha y opción de cierre.
DESCRIPCION: El sistema debe mostrar todas las sesiones activas del acudiente para control de seguridad.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-USAB-001, RNF-SEC-008, RNF-AVAIL-002

## RF-APP-022
NOMBRE DEL REQUERIMIENTO: Cerrar sesión específica
CARACTERISTICAS: Invalidación de token JWT de sesión específica sin afectar otras sesiones.
DESCRIPCION: El sistema debe permitir cerrar una sesión individual del acudiente.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-013, RNF-AVAIL-002

## RF-APP-023
NOMBRE DEL REQUERIMIENTO: Cerrar todas las sesiones
CARACTERISTICAS: Invalidación de todos los tokens JWT activos del acudiente.
DESCRIPCION: El sistema debe permitir cerrar todas las sesiones activas del acudiente de una vez.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-013, RNF-AVAIL-002

## RF-APP-024
NOMBRE DEL REQUERIMIENTO: Cargar estudiantes en formulario de solicitud
CARACTERISTICAS: Listado dinámico de estudiantes registrados del acudiente en el primer paso del asistente.
DESCRIPCION: El sistema debe mostrar solo los estudiantes pertenecientes al acudiente en el formulario de solicitud.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-PERF-006, RNF-USAB-001, RNF-AVAIL-002

## RF-APP-025
NOMBRE DEL REQUERIMIENTO: Validación de edad mínima para solicitud
CARACTERISTICAS: Restricción de solicitudes para estudiantes menores de edad específica.
DESCRIPCION: El sistema debe validar que los estudiantes cumplan con requisitos de edad para crear solicitud.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-006, RNF-AVAIL-002

## RF-APP-026
NOMBRE DEL REQUERIMIENTO: Cálculo de puntaje de prioridad
CARACTERISTICAS: Asignación automática de puntaje basado en tipo de afectación y condiciones socioeconómicas.
DESCRIPCION: El sistema debe calcular automáticamente la prioridad de cada solicitud según criterios definidos.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-PERF-002, RNF-AVAIL-002
