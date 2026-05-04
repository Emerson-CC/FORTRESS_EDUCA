# Requerimientos No Funcionales del Módulo de Técnicos (Technical)

## RNF-TEC-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: El cambio de contraseña debe validar la contraseña actual del usuario.

## RNF-TEC-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: Las nuevas contraseñas deben cumplir requisitos mínimos de complejidad.

## RNF-TEC-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Las sesiones deben ser gestionadas por tokens JWT con identificadores únicos (JTI).

## RNF-TEC-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: Solo técnicos con MFA activo pueden acceder al módulo.

## RNF-TEC-SEC-005
CATEGORIA: Seguridad
REQUERIMIENTO: Las operaciones de cierre de sesión deben ser transaccionales.

## RNF-TEC-SEC-006
CATEGORIA: Seguridad
REQUERIMIENTO: El historial de auditoría no debe contener información sensible como contraseñas.

## RNF-TEC-SEC-007
CATEGORIA: Seguridad
REQUERIMIENTO: Los filtros deben validarse en servidor para prevenir manipulación de parámetros.

## RNF-TEC-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El dashboard debe cargar en menos de 2 segundos con gráficos incluidos.

## RNF-TEC-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: El listado de tickets debe ser rápido sin paginación siendo optimizado en BD.

## RNF-TEC-PERF-003
CATEGORIA: Rendimiento
REQUERIMIENTO: Los filtros de tickets deben aplicarse en menos de 500ms.

## RNF-TEC-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El historial paginado debe cargar en menos de 1 segundo.

## RNF-TEC-PERF-005
CATEGORIA: Rendimiento
REQUERIMIENTO: Las exportaciones deben iniciarse en menos de 2 segundos.

## RNF-TEC-PERF-006
CATEGORIA: Rendimiento
REQUERIMIENTO: Los ordenamientos deben usar algoritmos eficientes (insertion sort para filtrados, selection sort para prioritarios).

## RNF-TEC-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: El dashboard debe mostrar claramente todos los datos en un formato visual atractivo.

## RNF-TEC-USAB-002
CATEGORIA: Usabilidad
REQUERIMIENTO: Los filtros deben ser intuitivos con valores por defecto ("Todos").

## RNF-TEC-USAB-003
CATEGORIA: Usabilidad
REQUERIMIENTO: La paginación debe mostrar rango de resultados y página actual.

## RNF-TEC-USAB-004
CATEGORIA: Usabilidad
REQUERIMIENTO: Los botones de acción deben tener etiquetas claras en español.

## RNF-TEC-USAB-005
CATEGORIA: Usabilidad
REQUERIMIENTO: Los mensajes de éxito y error deben ser específicos y útiles.

## RNF-TEC-USAB-006
CATEGORIA: Usabilidad
REQUERIMIENTO: Las fechas deben mostrarse en formato local (DD/MM/YYYY).

## RNF-TEC-USAB-007
CATEGORIA: Usabilidad
REQUERIMIENTO: El formulario de cambio de contraseña debe validar en tiempo real.

## RNF-TEC-AVAIL-001
CATEGORIA: Disponibilidad
REQUERIMIENTO: El cierre de sesión debe ser inmediato sin retrasos perceptibles.

## RNF-TEC-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los errores de base de datos deben manejarse sin exponer detalles técnicos.

## RNF-TEC-AVAIL-003
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los datos del dashboard deben tener fallback en caso de error de consultas.

## RNF-TEC-AVAIL-004
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los filtros deben preservarse si hay errores de paginación.

## RNF-TEC-AVAIL-005
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las operaciones críticas deben usar rollback en caso de fallo.

## RNF-TEC-MAINT-001
CATEGORIA: Mantenibilidad
REQUERIMIENTO: La lógica de filtrado debe estar separada en funciones reutilizables.

## RNF-TEC-MAINT-002
CATEGORIA: Mantenibilidad
REQUERIMIENTO: La lógica de ordenamiento debe estar separada y documentada.

## RNF-TEC-MAINT-003
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los servicios deben usar inyección de dependencias cuando sea posible.

## RNF-TEC-MAINT-004
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe incluir comentarios explicativos en español.

## RNF-TEC-MAINT-005
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los formatos de fecha deben estar centralizados en constantes.

## RNF-TEC-MAINT-006
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las funciones de conversión (parse_int, parse_fecha) deben estar testables.

## RNF-TEC-COMPAT-001
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los reportes exportados deben ser compatibles con Excel y LibreOffice.

## RNF-TEC-COMPAT-002
CATEGORIA: Compatibilidad
REQUERIMIENTO: Las interfaces deben funcionar en navegadores modernos (Chrome, Firefox, Safari, Edge).

## RNF-TEC-COMPAT-003
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los gráficos deben renderizarse en diferentes resoluciones de pantalla.

## RNF-TEC-COMPAT-004
CATEGORIA: Compatibilidad
REQUERIMIENTO: Las fechas exportadas deben usar formato local consistente.

## RNF-TEC-PORT-001
CATEGORIA: Portabilidad
REQUERIMIENTO: El límite de registros por página debe ser configurable.

## RNF-TEC-PORT-002
CATEGORIA: Portabilidad
REQUERIMIENTO: Los formatos de exportación deben usar estándares abiertos.

## RNF-TEC-ETH-001
CATEGORIA: Ética
REQUERIMIENTO: El historial de auditoría debe ser completo y no permitir borrado de registros.

## RNF-TEC-ETH-002
CATEGORIA: Ética
REQUERIMIENTO: Las acciones de cierre de sesión deben ser auditables y trazables.

## RNF-TEC-ETH-003
CATEGORIA: Ética
REQUERIMIENTO: Los datos personales en reportes deben anonimizarse según regulaciones.
