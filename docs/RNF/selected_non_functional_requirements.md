# Requerimientos No Funcionales Principales por Módulo

## Auth

## RNF-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Las contraseñas deben almacenarse usando algoritmos de hashing seguros con salt único por usuario.

## RNF-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Los tokens JWT deben contener solo información necesaria y expirar en tiempos razonables.

## RNF-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: El sistema debe implementar protección contra ataques de fuerza bruta mediante límites de intentos y reCAPTCHA.

## RNF-SEC-005
CATEGORIA: Seguridad
REQUERIMIENTO: Los mensajes de error no deben revelar información sensible sobre la existencia de usuarios o contraseñas.

## RNF-SEC-006
CATEGORIA: Seguridad
REQUERIMIENTO: Todas las entradas de usuario deben ser sanitizadas para prevenir inyección SQL y XSS.

## RNF-SEC-007
CATEGORIA: Seguridad
REQUERIMIENTO: El sistema debe validar tokens CSRF en todos los formularios POST.

## RNF-SEC-013
CATEGORIA: Seguridad
REQUERIMIENTO: El acceso a rutas debe estar protegido por decoradores que validen roles y tokens JWT.

## RNF-SEC-014
CATEGORIA: Seguridad
REQUERIMIENTO: Los usuarios solo deben acceder a funcionalidades correspondientes a su rol.

## RNF-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las operaciones críticas deben tener manejo de excepciones completo.

## RNF-AVAIL-006
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las transacciones de registro de estudiante deben ser atómicas.

## Aplication

## RNF-APP-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: El acudiente solo puede ver y modificar datos de sus propios estudiantes y solicitudes.

## RNF-APP-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Los archivos cargados deben validarse por tipo MIME y extensión para prevenir ejecución de código.

## RNF-APP-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: Los documentos descargables deben validar que el usuario sea el propietario de la solicitud.

## RNF-APP-SEC-009
CATEGORIA: Seguridad
REQUERIMIENTO: Los comentarios en solicitudes deben sanitizarse para prevenir XSS.

## RNF-APP-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El dashboard debe cargar en menos de 2 segundos incluyendo cálculos de prioridad.

## RNF-APP-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: La carga de formularios multi-paso debe ser inmediata sin consultas innecesarias.

## RNF-APP-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El listado de solicitudes debe cargar rápidamente incluso con cientos de solicitudes.

## RNF-APP-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: El formulario de solicitud debe guiar al usuario paso a paso con validación clara.

## RNF-APP-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: El formulario multi-paso debe preservar datos si hay error en un paso.

## RNF-APP-AVAIL-006
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las transacciones de registro de estudiante deben ser atómicas.

## Admin

## RNF-ADM-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Solo administradores con MFA activo pueden acceder a todas las funciones del módulo.

## RNF-ADM-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Las contraseñas de nuevas cuentas deben cumplir requisitos mínimos de complejidad.

## RNF-ADM-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: Los cambios de estado deben registrarse en auditoría con usuario y timestamp.

## RNF-ADM-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El dashboard debe cargar en menos de 2 segundos incluyendo gráficos.

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

## RNF-ADM-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las operaciones de creación de usuario deben usar rollback en caso de error.

## Technical

## RNF-TEC-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: El cambio de contraseña debe validar la contraseña actual del usuario.

## RNF-TEC-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: Las nuevas contraseñas deben cumplir requisitos mínimos de complejidad.

## RNF-TEC-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Las sesiones deben ser gestionadas por tokens JWT con identificadores únicos (JTI).

## RNF-TEC-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El dashboard debe cargar en menos de 2 segundos con gráficos incluidos.

## RNF-TEC-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: El listado de tickets debe ser rápido sin paginación siendo optimizado en BD.

## RNF-TEC-PERF-003
CATEGORIA: Rendimiento
REQUERIMIENTO: Los filtros de tickets deben aplicarse en menos de 500ms.

## RNF-TEC-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: El dashboard debe mostrar claramente todos los datos en un formato visual atractivo.

## RNF-TEC-USAB-002
CATEGORIA: Usabilidad
REQUERIMIENTO: Los filtros deben ser intuitivos con valores por defecto ("Todos").

## RNF-TEC-AVAIL-001
CATEGORIA: Disponibilidad
REQUERIMIENTO: El cierre de sesión debe ser inmediato sin retrasos perceptibles.

## RNF-TEC-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los errores de base de datos deben manejarse sin exponer detalles técnicos.

## Tickets

## RNF-TICK-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Solo técnicos y administradores con sesión activa pueden acceder al panel de tickets.

## RNF-TICK-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: Los filtros de cupo deben usarse con tokens firmados para evitar manipulación de parámetros.

## RNF-TICK-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Todas las acciones críticas deben validarse con CSRF y estado de sesión antes de procesarse.

## RNF-TICK-SEC-005
CATEGORIA: Seguridad
REQUERIMIENTO: Los archivos cargados deben validarse por extensión y tamaño antes de almacenarse.

## RNF-TICK-SEC-006
CATEGORIA: Seguridad
REQUERIMIENTO: La descarga de documentos debe verificar existencia y permisos antes de enviar el archivo.

## RNF-TICK-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El panel de ticket debe renderizarse en menos de 2 segundos en condiciones normales.

## RNF-TICK-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El filtrado de cupos debe usar consultas optimizadas para no retrasar la navegación.

## RNF-TICK-PERF-006
CATEGORIA: Rendimiento
REQUERIMIENTO: El sistema debe reutilizar catálogos de estados, jornadas y tipos de documento.

## RNF-TICK-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: El panel de ticket debe presentar información organizada en pestañas o secciones claras.

## RNF-TICK-AVAIL-003
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las confirmaciones de cupo y cancelaciones deben manejar fallas sin dejar datos inconsistentes.
