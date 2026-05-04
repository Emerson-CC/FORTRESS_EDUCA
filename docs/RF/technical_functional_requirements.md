# Requerimientos Funcionales del Módulo de Técnicos (Technical)

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

## RF-TEC-004
NOMBRE DEL REQUERIMIENTO: Filtrar tickets por grado
CARACTERISTICAS: Filtro por grado actual o próximo del estudiante del ticket.
DESCRIPCION: El técnico debe poder filtrar tickets según el nivel educativo.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-002, RNF-TEC-PERF-003

## RF-TEC-005
NOMBRE DEL REQUERIMIENTO: Filtrar tickets por tipo de afectación
CARACTERISTICAS: Aplicar filtro de tipo de vulnerabilidad o afectación en los tickets.
DESCRIPCION: El técnico debe poder filtrar según el tipo de afectación solicitada.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-002, RNF-TEC-PERF-003

## RF-TEC-006
NOMBRE DEL REQUERIMIENTO: Ordenamiento por prioridad
CARACTERISTICAS: Cuando no hay filtros activos, los tickets se ordenan por puntaje de prioridad descendente.
DESCRIPCION: El sistema debe mostrar primero los tickets más urgentes cuando no hay filtros.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-PERF-002, RNF-TEC-USAB-001

## RF-TEC-007
NOMBRE DEL REQUERIMIENTO: Ordenamiento por fecha
CARACTERISTICAS: Cuando hay filtros activos, los tickets se ordenan por fecha de creación ascendente.
DESCRIPCION: El sistema debe mostrar tickets por orden de llegada cuando se aplican filtros.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-PERF-002, RNF-TEC-USAB-001

## RF-TEC-008
NOMBRE DEL REQUERIMIENTO: Ver historial de auditoría
CARACTERISTICAS: Visualización de todos los eventos de auditoría del sistema relevantes para el técnico.
DESCRIPCION: El técnico debe poder ver el historial de actividades del sistema.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-001, RNF-TEC-PERF-004, RNF-TEC-AVAIL-002

## RF-TEC-009
NOMBRE DEL REQUERIMIENTO: Filtrar historial por tipo de evento
CARACTERISTICAS: Filtrar auditoría por categoría de evento (Nueva Solicitud, Comentario, Cambio Estado, etc.).
DESCRIPCION: El técnico debe poder buscar eventos específicos en el historial.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-002, RNF-TEC-PERF-004

## RF-TEC-010
NOMBRE DEL REQUERIMIENTO: Filtrar historial por rango de fechas
CARACTERISTICAS: Aplicar filtro de fecha desde y hasta en el historial de auditoría.
DESCRIPCION: El técnico debe poder acotarsus búsquedas de auditoría en rangos de tiempo.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-002, RNF-TEC-PERF-004

## RF-TEC-011
NOMBRE DEL REQUERIMIENTO: Paginación del historial
CARACTERISTICAS: Listado de historial con 20 registros por página.
DESCRIPCION: El sistema debe paginar el historial para mejorar rendimiento.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-001, RNF-TEC-PERF-004, RNF-TEC-USAB-003

## RF-TEC-012
NOMBRE DEL REQUERIMIENTO: Exportar historial de auditoría
CARACTERISTICAS: Descargar historial completo en formato compatible (Excel o PDF).
DESCRIPCION: El técnico debe poder exportar el historial para análisis externo.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-PERF-005, RNF-TEC-COMPAT-001

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

## RF-TEC-019
NOMBRE DEL REQUERIMIENTO: Centro de seguridad
CARACTERISTICAS: Panel centralizado para gestionar contraseña y sesiones.
DESCRIPCION: El técnico debe acceder a todas sus opciones de seguridad desde una sola página.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-TEC-USAB-001, RNF-TEC-SEC-002
