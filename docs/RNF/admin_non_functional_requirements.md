# Requerimientos No Funcionales del Módulo de Administración (Admin)

## RNF-ADM-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Solo administradores con MFA activo pueden acceder a todas las funciones del módulo.

## RNF-ADM-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: Las operaciones críticas (crear usuario, cambiar estado) deben tener tokens CSRF.

## RNF-ADM-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Las contraseñas de nuevas cuentas deben cumplir requisitos mínimos de complejidad.

## RNF-ADM-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: Los cambios de estado deben registrarse en auditoría con usuario y timestamp.

## RNF-ADM-SEC-005
CATEGORIA: Seguridad
REQUERIMIENTO: Los reportes exportados deben ser seguros contra inyección de código en documentos.

## RNF-ADM-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El dashboard debe cargar en menos de 2 segundos incluyendo gráficos.

## RNF-ADM-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: El listado de tickets debe soportar paginación eficiente con cientos de registros.

## RNF-ADM-PERF-003
CATEGORIA: Rendimiento
REQUERIMIENTO: Los filtros de tickets deben procesarse en menos de 500ms.

## RNF-ADM-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El historial de auditoría debe cargarse rápidamente con paginación.

## RNF-ADM-PERF-005
CATEGORIA: Rendimiento
REQUERIMIENTO: Las exportaciones de reportes deben iniciarse en menos de 2 segundos.

## RNF-ADM-PERF-006
CATEGORIA: Rendimiento
REQUERIMIENTO: Los catálogos (colegios, usuarios) deben usar índices de base de datos.

## RNF-ADM-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: Las interfaces de administración deben ser claras con tablas y formularios bien estructurados.

## RNF-ADM-USAB-002
CATEGORIA: Usabilidad
REQUERIMIENTO: Los formularios de creación debe validar en tiempo real y mostrar errores claros.

## RNF-ADM-USAB-003
CATEGORIA: Usabilidad
REQUERIMIENTO: Los botones de acción (crear, editar, eliminar) deben ser fácilmente identificables.

## RNF-ADM-USAB-004
CATEGORIA: Usabilidad
REQUERIMIENTO: La paginación debe mostrar rango de resultados y permite ir a página específica.

## RNF-ADM-USAB-005
CATEGORIA: Usabilidad
REQUERIMIENTO: Los filtros deben ser intuitivos y mostrar valores seleccionados actualmente.

## RNF-ADM-AVAIL-001
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los cambios de estado deben ser transaccionales para evitar inconsistencias.

## RNF-ADM-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las operaciones de creación de usuario deben usar rollback en caso de error.

## RNF-ADM-AVAIL-003
CATEGORIA: Disponibilidad
REQUERIMIENTO: La gestión de jornadas y cupos debe mantener consistencia de datos.

## RNF-ADM-AVAIL-004
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los errores de base de datos deben mostrar mensajes genéricos sin exponer detalles técnicos.

## RNF-ADM-AVAIL-005
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los formularios parcialmente completados deben preservarse en caso de error.

## RNF-ADM-MAINT-001
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los servicios deben separar lógica de filtrado, ordenamiento y paginación.

## RNF-ADM-MAINT-002
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los formularios deben reutilizar validadores comunes.

## RNF-ADM-MAINT-003
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los algoritmos de ordenamiento deben estar documentados y testables.

## RNF-ADM-MAINT-004
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los procedimientos almacenados de administración deben tener documentación clara.

## RNF-ADM-MAINT-005
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe evitar duplicación de lógica de exportación.

## RNF-ADM-COMPAT-001
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los reportes exportados deben ser compatibles con Microsoft Excel y LibreOffice.

## RNF-ADM-COMPAT-002
CATEGORIA: Compatibilidad
REQUERIMIENTO: Las interfaces deben funcionar en navegadores modernos de escritorio.

## RNF-ADM-COMPAT-003
CATEGORIA: Compatibilidad
REQUERIMIENTO: Las fechas deben exportarse con formato local (DD/MM/YYYY).

## RNF-ADM-PORT-001
CATEGORIA: Portabilidad
REQUERIMIENTO: Los límites de paginación deben ser configurables.

## RNF-ADM-PORT-002
CATEGORIA: Portabilidad
REQUERIMIENTO: Los procedimientos de exportación deben usar formatos estándar.

## RNF-ADM-ETH-001
CATEGORIA: Ética
REQUERIMIENTO: Los reportes no deben contener información sensible de contraseñas o tokens.

## RNF-ADM-ETH-002
CATEGORIA: Ética
REQUERIMIENTO: Los datos de usuarios no deben compartirse sin propósito administrativo.

## RNF-ADM-ETH-003
CATEGORIA: Ética
REQUERIMIENTO: Las acciones de cambio de estado deben ser auditables y trazables.
