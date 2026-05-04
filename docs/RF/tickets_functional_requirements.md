# Requerimientos Funcionales del Módulo de Tickets (Ticket Ad)

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

## RF-TICK-006
NOMBRE DEL REQUERIMIENTO: Autorizar confirmación de cupo por usuario
CARACTERISTICAS: Acción de autorización posterior del cupo por parte del usuario, con flujo de confirmación técnico.
DESCRIPCION: El sistema debe permitir que el técnico confirme la aceptación del cupo por parte del usuario.
PRIORIDAD: Media
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

## RF-TICK-012
NOMBRE DEL REQUERIMIENTO: Cargar catálogo de estados y tipos de documento
CARACTERISTICAS: Select fields dinámicos con datos de la base de datos para estados de ticket y tipos de documento.
DESCRIPCION: El sistema debe poblar las opciones de formulario desde catálogos actualizados de la base de datos.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TICK-PERF-006, RNF-TICK-MAINT-001
