# Requerimientos No Funcionales del Módulo de Aplicación (Aplication)

## RNF-APP-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Solo acudientes con rol validado pueden acceder al módulo de aplicación.

## RNF-APP-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: El acudiente solo puede ver y modificar datos de sus propios estudiantes y solicitudes.

## RNF-APP-SEC-003
CATEGORIA: Seguridad
REQUERIMIENTO: Los archivos cargados deben validarse por tipo MIME y extensión para prevenir ejecución de código.

## RNF-APP-SEC-004
CATEGORIA: Seguridad
REQUERIMIENTO: Los documentos descargables deben validar que el usuario sea el propietario de la solicitud.

## RNF-APP-SEC-005
CATEGORIA: Seguridad
REQUERIMIENTO: Los identificadores de solicitud y estudiante deben ser opacos o encriptados para evitar enumeración.

## RNF-APP-SEC-006
CATEGORIA: Seguridad
REQUERIMIENTO: Las operaciones de modificación de datos deben registrarse en auditoría.

## RNF-APP-SEC-007
CATEGORIA: Seguridad
REQUERIMIENTO: Los datos de contacto del acudiente deben validarse antes de almacenarse.

## RNF-APP-SEC-008
CATEGORIA: Seguridad
REQUERIMIENTO: Las fechas de nacimiento deben ser coherentes con la edad del estudiante.

## RNF-APP-SEC-009
CATEGORIA: Seguridad
REQUERIMIENTO: Los comentarios en solicitudes deben sanitizarse para prevenir XSS.

## RNF-APP-SEC-010
CATEGORIA: Seguridad
REQUERIMIENTO: El sistema debe prevenir que se carguen documentos maliciosos usando antivirus o validación de contenido.

## RNF-APP-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: El dashboard debe cargar en menos de 2 segundos incluyendo cálculos de prioridad.

## RNF-APP-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: La carga de formularios multi-paso debe ser inmediata sin consultas innecesarias.

## RNF-APP-PERF-003
CATEGORIA: Rendimiento
REQUERIMIENTO: La descarga de archivos debe iniciarse en menos de 1 segundo.

## RNF-APP-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El listado de solicitudes debe cargar rápidamente incluso con cientos de solicitudes.

## RNF-APP-PERF-005
CATEGORIA: Rendimiento
REQUERIMIENTO: Las consultas de estudiantes deben usar índices de base de datos.

## RNF-APP-PERF-006
CATEGORIA: Rendimiento
REQUERIMIENTO: Los datos de listas (barrios, colegios) deben cachease por sesión.

## RNF-APP-PERF-007
CATEGORIA: Rendimiento
REQUERIMIENTO: La paginación debe usarse en listados con más de 50 items.

## RNF-APP-PERF-008
CATEGORIA: Rendimiento
REQUERIMIENTO: La carga de archivos debe mostrar progreso visual para archivos grandes.

## RNF-APP-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: El formulario de solicitud debe guiar al usuario paso a paso con validación clara.

## RNF-APP-USAB-002
CATEGORIA: Usabilidad
REQUERIMIENTO: Los mensajes de error deben indicar qué campo falló y por qué en formularios multi-paso.

## RNF-APP-USAB-003
CATEGORIA: Usabilidad
REQUERIMIENTO: El timeline visual debe ser comprensible con colores y etiquetas claras.

## RNF-APP-USAB-004
CATEGORIA: Usabilidad
REQUERIMIENTO: Los botones de acción (descargar, comentar) deben estar claramente visibles y accesibles.

## RNF-APP-USAB-005
CATEGORIA: Usabilidad
REQUERIMIENTO: El acudiente debe poder navegar fácilmente entre la solicitud, el perfil y la seguridad.

## RNF-APP-USAB-006
CATEGORIA: Usabilidad
REQUERIMIENTO: Las fechas deben presentarse en formato local entendible (DD/MM/YYYY).

## RNF-APP-USAB-007
CATEGORIA: Usabilidad
REQUERIMIENTO: Los estados de solicitud deben ser claros y en lenguaje que entienda el usuario no técnico.

## RNF-APP-USAB-008
CATEGORIA: Usabilidad
REQUERIMIENTO: El sistema debe indicar claramente cuándo se guardaron cambios con feedback visual.

## RNF-APP-USAB-009
CATEGORIA: Usabilidad
REQUERIMIENTO: Los campos obligatorios deben estar marcados visualmente.

## RNF-APP-USAB-010
CATEGORIA: Usabilidad
REQUERIMIENTO: El perfil del estudiante debe mostrar información de forma organizada en pestañas o secciones.

## RNF-APP-AVAIL-001
CATEGORIA: Disponibilidad
REQUERIMIENTO: La pérdida de conexión durante la carga de archivos debe permitir reintentar.

## RNF-APP-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: El formulario multi-paso debe preservar datos si hay error en un paso.

## RNF-APP-AVAIL-003
CATEGORIA: Disponibilidad
REQUERIMIENTO: La información de solicitud debe ser recuperable si la sesión expira.

## RNF-APP-AVAIL-004
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los comentarios deben quedar guardados incluso si hay error posterior.

## RNF-APP-AVAIL-005
CATEGORIA: Disponibilidad
REQUERIMIENTO: El sistema debe manejar errores de base de datos sin perder datos de solicitud.

## RNF-APP-AVAIL-006
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las transacciones de registro de estudiante deben ser atómicas.

## RNF-APP-AVAIL-007
CATEGORIA: Disponibilidad
REQUERIMIENTO: El acceso denegado debe redirigir a página apropiada sin exponer errores técnicos.

## RNF-APP-MAINT-001
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los servicios de aplicación deben separar lógica de negocio de presentación.

## RNF-APP-MAINT-002
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los validadores de formulario deben reutilizar funciones de validación comunes.

## RNF-APP-MAINT-003
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los procedimientos almacenados deben documentarse con parámetros y valores de retorno.

## RNF-APP-MAINT-004
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe incluir comentarios en áreas complejas.

## RNF-APP-MAINT-005
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las funciones de utilidad (cálculo de prioridad, validación) deben ser testables.

## RNF-APP-MAINT-006
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los cambios de datos deben incluir auditoría completa.

## RNF-APP-MAINT-007
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los servicios compartidos de seguridad deben reutilizarse entre módulos.

## RNF-APP-MAINT-008
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las constantes (tamaños de archivo, estados) deben estar centralizadas.

## RNF-APP-COMPAT-001
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los formularios deben funcionar en navegadores mobile con pantallas pequeñas.

## RNF-APP-COMPAT-002
CATEGORIA: Compatibilidad
REQUERIMIENTO: La carga de archivos debe funcionar en navegadores sin soporte para características avanzadas.

## RNF-APP-COMPAT-003
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los PDFs deben descargarse con nombres legibles y encoding correcto.

## RNF-APP-COMPAT-004
CATEGORIA: Compatibilidad
REQUERIMIENTO: El formato de fecha debe ser compatible con entrada en navegadores legacy.

## RNF-APP-COMPAT-005
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los datos deben sincronizarse correctamente entre navegadores del mismo usuario.

## RNF-APP-PORT-001
CATEGORIA: Portabilidad
REQUERIMIENTO: El módulo debe usar rutas relativas para archivos sin depender de configuración de ruta.

## RNF-APP-PORT-002
CATEGORIA: Portabilidad
REQUERIMIENTO: Los almacenamientos de archivos deben ser configurables (local, cloud).

## RNF-APP-PORT-003
CATEGORIA: Portabilidad
REQUERIMIENTO: El sistema debe manejar diferentes formatos de fecha según configuración local.

## RNF-APP-ETH-001
CATEGORIA: Ética
REQUERIMIENTO: Los datos de estudiantes menores deben protegerse con consentimiento del acudiente.

## RNF-APP-ETH-002
CATEGORIA: Ética
REQUERIMIENTO: Los comentarios y comunicaciones deben ser privados entre acudiente y sistema.

## RNF-APP-ETH-003
CATEGORIA: Ética
REQUERIMIENTO: Los datos de solicitud no deben compartirse con terceros sin consentimiento explícito.

## RNF-APP-ETH-004
CATEGORIA: Ética
REQUERIMIENTO: Las decisiones automatizadas (prioridad) deben ser transparentes y auditables.
