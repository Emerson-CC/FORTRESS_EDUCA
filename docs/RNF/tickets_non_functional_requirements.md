# Requerimientos No Funcionales del Módulo de Tickets (Ticket Ad)

## RNF-TICK-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Solo técnicos y administradores con sesión activa pueden acceder al panel de tickets.

## RNF-TICK-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: Los filtros de cupo deben usarse con tokens firmados para evitar manipulación de parámetros.

## RNF-TICK-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Todas las acciones críticas deben validarse con CSRF y estado de sesión antes de procesarse.

## RNF-TICK-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: Los comentarios internos deben marcarse claramente y no exponerse al usuario final.

## RNF-TICK-SEC-005
CATEGORIA: Seguridad
REQUERIMIENTO: Los archivos cargados deben validarse por extensión y tamaño antes de almacenarse.

## RNF-TICK-SEC-006
CATEGORIA: Seguridad
REQUERIMIENTO: La descarga de documentos debe verificar existencia y permisos antes de enviar el archivo.

## RNF-TICK-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El panel de ticket debe renderizarse en menos de 2 segundos en condiciones normales.

## RNF-TICK-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: La validación de formularios de documentos y estado debe ser rápida y responsiva.

## RNF-TICK-PERF-003
CATEGORIA: Rendimiento
REQUERIMIENTO: Las descargas de documentos deben iniciarse en menos de 1 segundo.

## RNF-TICK-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El filtrado de cupos debe usar consultas optimizadas para no retrasar la navegación.

## RNF-TICK-PERF-005
CATEGORIA: Rendimiento
REQUERIMIENTO: Las listas desplegables de catálogos deben cargarse eficientemente desde la base de datos.

## RNF-TICK-PERF-006
CATEGORIA: Rendimiento
REQUERIMIENTO: El sistema debe reutilizar catálogos de estados, jornadas y tipos de documento.

## RNF-TICK-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: El panel de ticket debe presentar información organizada en pestañas o secciones claras.

## RNF-TICK-USAB-002
CATEGORIA: Usabilidad
REQUERIMIENTO: Los mensajes de validación deben indicar al técnico qué corregir y por qué.

## RNF-TICK-USAB-003
CATEGORIA: Usabilidad
REQUERIMIENTO: Los estados del ticket y acciones disponibles deben mostrarse con etiquetas comprensibles.

## RNF-TICK-USAB-004
CATEGORIA: Usabilidad
REQUERIMIENTO: El filtrado de cupos debe ser intuitivo con selección de barrio, colegio y jornada.

## RNF-TICK-USAB-005
CATEGORIA: Usabilidad
REQUERIMIENTO: El usuario debe ver claramente cuándo un ticket ha sido cerrado por abandono automático.

## RNF-TICK-AVAIL-001
CATEGORIA: Disponibilidad
REQUERIMIENTO: El proceso de cierre automático de tickets abandonados debe ejecutarse sin interrumpir al técnico.

## RNF-TICK-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las operaciones de actualización de estado y comentarios deben usar rollback en caso de error.

## RNF-TICK-AVAIL-003
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las confirmaciones de cupo y cancelaciones deben manejar fallas sin dejar datos inconsistentes.

## RNF-TICK-AVAIL-004
CATEGORIA: Disponibilidad
REQUERIMIENTO: El sistema debe mostrar mensajes claros si un recurso (ticket, documento) no existe.

## RNF-TICK-MAINT-001
CATEGORIA: Mantenibilidad
REQUERIMIENTO: La lógica del panel debe separarse de la presentación en servicios y controladores.

## RNF-TICK-MAINT-002
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los formularios deben reutilizar validadores comunes para evitar duplicación.

## RNF-TICK-MAINT-003
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las funciones utilitarias de filtrar cupos y firmar tokens deben ser testables.

## RNF-TICK-MAINT-004
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe documentar claramente los estados del ticket y la lógica de negocio.

## RNF-TICK-COMPAT-001
CATEGORIA: Compatibilidad
REQUERIMIENTO: El panel debe funcionar en navegadores modernos con soporte para HTML5 y formularios de archivos.

## RNF-TICK-COMPAT-002
CATEGORIA: Compatibilidad
REQUERIMIENTO: Las descargas deben funcionar con nombres de archivos en múltiples charset.

## RNF-TICK-PORT-001
CATEGORIA: Portabilidad
REQUERIMIENTO: Los límites de tamaño de archivo deben poder configurarse desde variables de entorno.

## RNF-TICK-PORT-002
CATEGORIA: Portabilidad
REQUERIMIENTO: Los catálogos de datos deben poder migrarse entre entornos con procedimientos almacenados.

## RNF-TICK-ETH-001
CATEGORIA: Ética
REQUERIMIENTO: Los documentos y comentarios deben usarse solo para la gestión de cupos y no para otros fines.

## RNF-TICK-ETH-002
CATEGORIA: Ética
REQUERIMIENTO: Los datos de usuarios y tickets deben protegerse contra accesos indebidos por personal no autorizado.
