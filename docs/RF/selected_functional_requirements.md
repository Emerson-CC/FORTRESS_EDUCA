# Requerimientos Funcionales Principales por Módulo

## Auth

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
NOMBRE DEL REQUERIMIENTO: Recuperación de contraseña por email con código temporal
CARACTERISTICAS: Formulario de solicitud de recuperación, envío de correo electrónico y generación de código de 6 dígitos con expiración de 10 minutos.
DESCRIPCION: El sistema debe permitir a los usuarios recuperar su contraseña mediante un código enviado a su correo registrado y validar que el código sea válido y temporal.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-003, RNF-SEC-006, RNF-AVAIL-002

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

## RF-AUTH-015
NOMBRE DEL REQUERIMIENTO: Autorización por roles
CARACTERISTICAS: Validación de permisos según rol y redirección a dashboards específicos para cada tipo de usuario.
DESCRIPCION: El sistema debe restringir funcionalidades de acuerdo a los roles de usuario: acudiente, administrador y técnico.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-013, RNF-SEC-014

## Aplication

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

## RF-APP-009
NOMBRE DEL REQUERIMIENTO: Descarga de documentos
CARACTERISTICAS: Descarga segura de archivos adjuntos a las solicitudes con validación de permisos.
DESCRIPCION: El sistema debe permitir descargar documentos cargados en las solicitudes solo al acudiente propietario.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-SEC-008, RNF-SEC-014, RNF-AVAIL-002

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

## Admin

## RF-ADM-001
NOMBRE DEL REQUERIMIENTO: Dashboard administrativo
CARACTERISTICAS: Visualización de métricas principales, gráficos de actividad semanal y listado de últimas solicitudes.
DESCRIPCION: El sistema debe mostrar un panel con resumen de métricas clave y tendencias de actividad.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-001, RNF-ADM-AVAIL-002

## RF-ADM-002
NOMBRE DEL REQUERIMIENTO: Listar todos los tickets
CARACTERISTICAS: Vista paginada de tickets con filtros por estado, grado y tipo de afectación.
DESCRIPCION: El administrador debe poder visualizar y filtrar todos los tickets del sistema.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-004, RNF-ADM-AVAIL-002

## RF-ADM-003
NOMBRE DEL REQUERIMIENTO: Crear nueva cuenta de usuario
CARACTERISTICAS: Formulario para registrar acudientes, técnicos o administradores con datos completos y validaciones.
DESCRIPCION: El administrador debe poder crear nuevas cuentas de usuario con diferentes roles.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-SEC-003, RNF-ADM-USAB-002

## RF-ADM-004
NOMBRE DEL REQUERIMIENTO: Crear nuevo estudiante
CARACTERISTICAS: Formulario de registro de estudiante con datos académicos, personales y vinculación a acudiente.
DESCRIPCION: El administrador debe poder registrar nuevos estudiantes en el sistema.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-SEC-003, RNF-ADM-AVAIL-002

## RF-ADM-005
NOMBRE DEL REQUERIMIENTO: Gestionar estado de usuarios
CARACTERISTICAS: Toggle de estado activo/inactivo para acudientes con control de transacciones.
DESCRIPCION: El administrador debe poder activar o desactivar cuentas de usuario.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-004, RNF-ADM-AVAIL-003

## RF-ADM-007
NOMBRE DEL REQUERIMIENTO: Listar y gestionar técnicos
CARACTERISTICAS: Vista de funcionarios técnicos con capacidad de activar/desactivar y exportar reportes.
DESCRIPCION: El administrador debe poder gestionar cuentas de técnicos del sistema.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-005

## RF-ADM-009
NOMBRE DEL REQUERIMIENTO: Exportar reporte de acceso de usuarios
CARACTERISTICAS: Generación de documento con historial de login y actividad de usuarios.
DESCRIPCION: El sistema debe permitir exportar reportes de acceso en formato compatible.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-PERF-005, RNF-ADM-AVAIL-002

## RF-ADM-015
NOMBRE DEL REQUERIMIENTO: Listar colegios
CARACTERISTICAS: Vista de todos los colegios registrados con información de contacto y estado.
DESCRIPCION: El administrador debe poder ver el catálogo completo de colegios.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-006

## RF-ADM-016
NOMBRE DEL REQUERIMIENTO: Agregar nuevo colegio
CARACTERISTICAS: Formulario para registrar institución educativa con datos completos.
DESCRIPCION: El administrador debe poder crear nuevos colegios en el sistema.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-019
NOMBRE DEL REQUERIMIENTO: Gestionar matriz de cupos
CARACTERISTICAS: Configuración de cupos disponibles por grado, nivel educativo y jornada.
DESCRIPCION: El administrador debe poder establecer la capacidad de cupos por nivel y jornada.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-003

## Technical

## RF-TEC-001
NOMBRE DEL REQUERIMIENTO: Dashboard de técnico
CARACTERISTICAS: Visualización de métricas propias del técnico, gráfico de actividad semanal y últimas solicitudes asignadas.
DESCRIPCION: El sistema debe mostrar un panel personalizado con información relevante al técnico autenticado.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-001, RNF-TEC-PERF-001, RNF-TEC-AVAIL-002

## RF-TEC-002
NOMBRE DEL REQUERIMIENTO: Listar tickets asignados
CARACTERISTICAS: Visualización de todos los tickets asignados al técnico autenticado sin límites de cantidad.
DESCRIPCION: El técnico debe poder ver todos sus tickets en una sola página o vista compilada.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-001, RNF-TEC-PERF-002, RNF-TEC-AVAIL-002

## RF-TEC-003
NOMBRE DEL REQUERIMIENTO: Filtrar tickets por estado
CARACTERISTICAS: Aplicar filtro de estado del ticket en la lista del técnico.
DESCRIPCION: El técnico debe poder filtrar sus tickets por estado actual.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-002, RNF-TEC-PERF-003

## RF-TEC-006
NOMBRE DEL REQUERIMIENTO: Ordenamiento por prioridad
CARACTERISTICAS: Cuando no hay filtros activos, los tickets se ordenan por puntaje de prioridad descendente.
DESCRIPCION: El sistema debe mostrar primero los tickets más urgentes cuando no hay filtros.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-PERF-002, RNF-TEC-USAB-001

## RF-TEC-013
NOMBRE DEL REQUERIMIENTO: Cambiar contraseña
CARACTERISTICAS: Formulario seguro para cambiar contraseña con validación de contraseña actual.
DESCRIPCION: El técnico debe poder cambiar su contraseña en el centro de seguridad.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-SEC-001, RNF-TEC-SEC-002, RNF-TEC-USAB-002

## RF-TEC-014
NOMBRE DEL REQUERIMIENTO: Ver sesiones activas
CARACTERISTICAS: Listado de todas las sesiones activas del técnico autenticado.
DESCRIPCION: El técnico debe poder ver dónde está conectado.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-SEC-003, RNF-TEC-USAB-001

## RF-TEC-015
NOMBRE DEL REQUERIMIENTO: Cerrar sesión individual
CARACTERISTICAS: Opción para cerrar una sesión específica sin afectar las demás.
DESCRIPCION: El técnico debe poder desconectarse de un dispositivo específico.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-SEC-003, RNF-TEC-AVAIL-001

## RF-TEC-016
NOMBRE DEL REQUERIMIENTO: Cerrar todas las sesiones
CARACTERISTICAS: Opción para cerrar simultáneamente todas las sesiones activas.
DESCRIPCION: El técnico debe poder desconectarse de todos los dispositivos.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-SEC-003, RNF-TEC-AVAIL-001

## RF-TEC-017
NOMBRE DEL REQUERIMIENTO: Visualización de métricas de tickets
CARACTERISTICAS: Muestra contadores de tickets en diferentes estados.
DESCRIPCION: El técnico debe poder ver estadísticas rápidas de sus tickets.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-001, RNF-TEC-PERF-001

## RF-TEC-018
NOMBRE DEL REQUERIMIENTO: Gráfico de actividad semanal
CARACTERISTICAS: Visualización de nuevas solicitudes y cupos asignados por día.
DESCRIPCION: El sistema debe mostrar tendencia de actividad del técnico en los últimos 7 días.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-PERF-001, RNF-TEC-USAB-001

## Tickets

## RF-TICK-001
NOMBRE DEL REQUERIMIENTO: Panel de ticket técnico
CARACTERISTICAS: Vista detallada de ticket con pestañas de información, estado, comentarios, documentos y asignación de cupo.
DESCRIPCION: El sistema debe permitir al técnico visualizar todos los datos relevantes de un ticket en un único panel.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-001, RNF-TICK-USAB-001, RNF-TICK-PERF-001

## RF-TICK-002
NOMBRE DEL REQUERIMIENTO: Cambio de estado del ticket
CARACTERISTICAS: Formulario de selección de estado, fecha de cierre opcional y comentario de resolución.
DESCRIPCION: El técnico debe poder actualizar el estado del ticket y registrar la resolución correspondiente.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-003, RNF-TICK-AVAIL-002

## RF-TICK-003
NOMBRE DEL REQUERIMIENTO: Agregar comentarios al ticket
CARACTERISTICAS: Comentarios públicos e internos con validación de contenido y tipo de visibilidad.
DESCRIPCION: El sistema debe permitir a los técnicos añadir comentarios para comunicación interna o registro de sucesos.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-004, RNF-TICK-USAB-002

## RF-TICK-004
NOMBRE DEL REQUERIMIENTO: Filtrado de cupos disponibles
CARACTERISTICAS: Selección de barrio, colegio y jornada con token seguro para evitar manipulación de parámetros.
DESCRIPCION: El técnico debe poder filtrar cupos disponibles para un ticket según ubicación y jornada.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-002, RNF-TICK-PERF-004

## RF-TICK-005
NOMBRE DEL REQUERIMIENTO: Confirmar asignación de cupo
CARACTERISTICAS: Validación de accionar de confirmación con token CSRF y registro de asignación en la base de datos.
DESCRIPCION: El técnico debe poder asignar un cupo al ticket validando disponibilidad y confirmando la operación.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-003, RNF-TICK-AVAIL-003

## RF-TICK-007
NOMBRE DEL REQUERIMIENTO: Cancelar asignación de cupo
CARACTERISTICAS: Opción de reversión de asignación con liberación del cupo y retorno a estado de asignación.
DESCRIPCION: El técnico debe poder cancelar un cupo asignado y devolver el ticket al flujo de asignación.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-003, RNF-TICK-AVAIL-003

## RF-TICK-008
NOMBRE DEL REQUERIMIENTO: Subir documentos técnicos
CARACTERISTICAS: Carga de archivos PDF, JPG, JPEG o PNG con validación de tamaño y tipo.
DESCRIPCION: El sistema debe permitir adjuntar documentación adicional al ticket desde el panel técnico.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-005, RNF-TICK-PERF-002

## RF-TICK-009
NOMBRE DEL REQUERIMIENTO: Descargar documento adjunto
CARACTERISTICAS: Descarga segura de archivos adjuntos con validación de acceso y nombres legibles.
DESCRIPCION: El técnico debe poder descargar documentos cargados en el ticket para revisar evidencia o soporte.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-SEC-006, RNF-TICK-PERF-003

## RF-TICK-010
NOMBRE DEL REQUERIMIENTO: Gestión automática de tickets abandonados
CARACTERISTICAS: Detección periódica, cierre automático y auditoría de tickets sin respuesta.
DESCRIPCION: El sistema debe detectar y cerrar tickets abandonados para mantener el flujo de trabajo actualizado.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-AVAIL-001, RNF-TICK-AVAIL-005

## RF-TICK-011
NOMBRE DEL REQUERIMIENTO: Mostrar datos de acudiente y estudiante
CARACTERISTICAS: Visualización de información del solicitante y del estudiante asociado al ticket.
DESCRIPCION: El panel debe incluir datos del acudiente y del estudiante para contextualizar las decisiones técnicas.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-USAB-001, RNF-TICK-SEC-001
