# Requerimientos No Funcionales del Módulo de Autenticación (Auth)

## RNF-SEC-001
CATEGORIA: Seguridad
REQUERIMIENTO: Las contraseñas deben almacenarse usando algoritmos de hashing seguros con salt único por usuario.

## RNF-SEC-002
CATEGORIA: Seguridad
REQUERIMIENTO: Los secrets de MFA deben almacenarse de forma segura en la base de datos, codificados apropiadamente.

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

## RNF-SEC-008
CATEGORIA: Seguridad
REQUERIMIENTO: Los datos de sesión deben ser validados en cada solicitud para prevenir manipulación.

## RNF-SEC-009
CATEGORIA: Seguridad
REQUERIMIENTO: Las transacciones de base de datos deben usar commit/rollback apropiados para mantener consistencia.

## RNF-SEC-010
CATEGORIA: Seguridad
REQUERIMIENTO: El MFA debe usar TOTP estándar compatible con apps como Google Authenticator y Microsoft Authenticator.

## RNF-SEC-011
CATEGORIA: Seguridad
REQUERIMIENTO: Los códigos TOTP deben validarse dentro de una ventana temporal segura.

## RNF-SEC-012
CATEGORIA: Seguridad
REQUERIMIENTO: Los códigos de recuperación de contraseña deben expirar en 10 minutos.

## RNF-SEC-013
CATEGORIA: Seguridad
REQUERIMIENTO: El acceso a rutas debe estar protegido por decoradores que validen roles y tokens JWT.

## RNF-SEC-014
CATEGORIA: Seguridad
REQUERIMIENTO: Los usuarios solo deben acceder a funcionalidades correspondientes a su rol.

## RNF-PERF-001
CATEGORIA: Rendimiento
REQUERIMIENTO: Las operaciones de login deben completarse en menos de 2 segundos bajo carga normal.

## RNF-PERF-002
CATEGORIA: Rendimiento
REQUERIMIENTO: La validación de formularios debe ser rápida y visible para el usuario final.

## RNF-PERF-003
CATEGORIA: Rendimiento
REQUERIMIENTO: La generación de códigos QR para MFA debe completarse en menos de 1 segundo.

## RNF-PERF-004
CATEGORIA: Rendimiento
REQUERIMIENTO: El sistema debe manejar al menos 100 usuarios concurrentes sin degradación significativa.

## RNF-PERF-005
CATEGORIA: Rendimiento
REQUERIMIENTO: Las consultas a base de datos deben usar procedimientos almacenados optimizados.

## RNF-PERF-006
CATEGORIA: Rendimiento
REQUERIMIENTO: El sistema debe usar cache apropiado para datos de formulario frecuentemente consultados.

## RNF-PERF-007
CATEGORIA: Rendimiento
REQUERIMIENTO: Las validaciones deben realizarse tanto en cliente como en servidor para mejorar la experiencia de usuario.

## RNF-PERF-008
CATEGORIA: Rendimiento
REQUERIMIENTO: Los formularios deben soportar validaciones en tiempo real cuando sea adecuado.

## RNF-USAB-001
CATEGORIA: Usabilidad
REQUERIMIENTO: Los formularios deben tener etiquetas claras y mensajes de ayuda contextual.

## RNF-USAB-002
CATEGORIA: Usabilidad
REQUERIMIENTO: Los mensajes de error deben ser específicos, útiles y presentados en español.

## RNF-USAB-003
CATEGORIA: Usabilidad
REQUERIMIENTO: El sistema debe proporcionar feedback visual inmediato al usuario.

## RNF-USAB-004
CATEGORIA: Usabilidad
REQUERIMIENTO: Los códigos QR para MFA deben ser visibles y fáciles de escanear.

## RNF-USAB-005
CATEGORIA: Usabilidad
REQUERIMIENTO: Los formularios deben ser accesibles mediante teclado y lectores de pantalla.

## RNF-USAB-006
CATEGORIA: Usabilidad
REQUERIMIENTO: Los colores deben tener suficiente contraste para usuarios con discapacidades visuales.

## RNF-USAB-007
CATEGORIA: Usabilidad
REQUERIMIENTO: Los campos de formulario deben usar atributos de accesibilidad y auto-complete apropiados.

## RNF-USAB-008
CATEGORIA: Usabilidad
REQUERIMIENTO: Las redirecciones después de acciones exitosas deben ser claras y consistentes.

## RNF-USAB-009
CATEGORIA: Usabilidad
REQUERIMIENTO: El sistema debe recordar la página de origen para redirigir correctamente después del login.

## RNF-USAB-010
CATEGORIA: Usabilidad
REQUERIMIENTO: El usuario debe poder navegar fácilmente entre login, registro y recuperación de contraseña.

## RNF-AVAIL-001
CATEGORIA: Disponibilidad
REQUERIMIENTO: El sistema debe manejar errores de base de datos sin exponer información técnica.

## RNF-AVAIL-002
CATEGORIA: Disponibilidad
REQUERIMIENTO: Las operaciones críticas deben tener manejo de excepciones completo.

## RNF-AVAIL-003
CATEGORIA: Disponibilidad
REQUERIMIENTO: El sistema debe usar rollback automático en caso de errores de transacción.

## RNF-AVAIL-004
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los servicios de email deben tener un manejo de errores adecuado ante fallos SMTP.

## RNF-AVAIL-005
CATEGORIA: Disponibilidad
REQUERIMIENTO: En sesión expirada, el sistema debe redirigir al login adecuado manteniendo el contexto.

## RNF-AVAIL-006
CATEGORIA: Disponibilidad
REQUERIMIENTO: Los formularios parcialmente completados deben preservarse durante errores de validación.

## RNF-AVAIL-007
CATEGORIA: Disponibilidad
REQUERIMIENTO: El sistema debe permitir reintentar operaciones fallidas sin pérdida de datos.

## RNF-MAINT-001
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe estar organizado en capas claras: rutas, controladores, servicios y repositorios.

## RNF-MAINT-002
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las funciones deben tener responsabilidades únicas y bien definidas.

## RNF-MAINT-003
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El sistema debe ser testeable con dependencias inyectables.

## RNF-MAINT-004
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe incluir comentarios explicativos en español.

## RNF-MAINT-005
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las funciones complejas deben tener docstrings detallados.

## RNF-MAINT-006
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los procedimientos almacenados deben estar documentados.

## RNF-MAINT-007
CATEGORIA: Mantenibilidad
REQUERIMIENTO: El código debe ser testeable con mocks para dependencias externas.

## RNF-MAINT-008
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Las validaciones deben cubrir casos edge.

## RNF-MAINT-009
CATEGORIA: Mantenibilidad
REQUERIMIENTO: Los flujos críticos deben tener tests de integración.

## RNF-COMPAT-001
CATEGORIA: Compatibilidad
REQUERIMIENTO: El sistema debe funcionar en navegadores modernos: Chrome, Firefox, Safari y Edge.

## RNF-COMPAT-002
CATEGORIA: Compatibilidad
REQUERIMIENTO: Debe haber soporte para versiones móviles de los navegadores principales.

## RNF-COMPAT-003
CATEGORIA: Compatibilidad
REQUERIMIENTO: Las interfaces deben ser responsivas para móviles y tablets.

## RNF-COMPAT-004
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los códigos QR deben ser legibles en diferentes tamaños de pantalla.

## RNF-COMPAT-005
CATEGORIA: Compatibilidad
REQUERIMIENTO: La integración con reCAPTCHA debe usar la versión más reciente de la API.

## RNF-COMPAT-006
CATEGORIA: Compatibilidad
REQUERIMIENTO: Los correos deben usar formato HTML compatible con clientes comunes.

## RNF-PORT-001
CATEGORIA: Portabilidad
REQUERIMIENTO: El sistema debe funcionar en entornos Windows con Python 3.8+.

## RNF-PORT-002
CATEGORIA: Portabilidad
REQUERIMIENTO: Las dependencias deben estar especificadas en requirements.txt con versiones compatibles.

## RNF-PORT-003
CATEGORIA: Portabilidad
REQUERIMIENTO: La configuración debe ser externa y no hardcodeada.

## RNF-ETH-001
CATEGORIA: Ética
REQUERIMIENTO: Los datos personales deben recopilarse solo con consentimiento explícito.

## RNF-ETH-002
CATEGORIA: Ética
REQUERIMIENTO: La información de auditoría debe usarse solo para seguridad y no para rastreo invasivo.

## RNF-ETH-003
CATEGORIA: Ética
REQUERIMIENTO: Los datos sensibles deben anonimizarse en logs de auditoría.

## RNF-ETH-004
CATEGORIA: Ética
REQUERIMIENTO: El sistema debe cumplir con regulaciones de protección de datos aplicables.

## RNF-ETH-005
CATEGORIA: Ética
REQUERIMIENTO: Los términos y condiciones deben ser claros y legalmente válidos.