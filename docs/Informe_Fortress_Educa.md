# Informe del Proyecto Fortress Educa

## Resultados Obtenidos

El desarrollo de Fortress Educa ha permitido crear una plataforma web funcional diseñada para centralizar el proceso de asignación de cupos educativos en instituciones públicas. La arquitectura implementada consolida un sistema robusto que integra componentes técnicos de frontera de seguridad, garantizando la protección de datos personales de menores en condición de vulnerabilidad.

En el componente de backend, se ha desarrollado exitosamente una aplicación con Flask que implementa una arquitectura modular basada en blueprints (home, auth, aplication, tickets, admin, technical). Cada módulo posee controladores dedicados que orquestan la lógica de negocio mediante servicios especializados, permitiendo la separación de responsabilidades y facilitando el mantenimiento y escalabilidad del código. La integración con MySQL proporciona persistencia confiable de datos con múltiples niveles de integridad referencial.

En seguridad de aplicaciones, se implementó un sistema multicapa que incluye hashing de contraseñas mediante Argon2id, que aplica parámetros robustos como 3 iteraciones temporales, 64 MB de memoria y 16 bytes de salt automático. Complementariamente, se incorporó autenticación basada en tokens JWT para control de acceso, junto con validación reCAPTCHA en formularios críticos para prevenir ataques automatizados. Se añadió autenticación multifactor (MFA) con códigos TOTP generados mediante QR, compatible con aplicaciones como Microsoft Authenticator.

En gestión de bases de datos, se estructuró un esquema normalizado con más de 20 tablas que almacenan información demográfica, académica y de seguridad. Se implementaron stored procedures para operaciones complejas como auditoría de sesiones, triggers para registrar cambios en datos críticos, views para simplificar consultas complejas, e índices para optimizar búsquedas frecuentes. El sistema incluye mecanismos de respaldo automático y gestión de transacciones para garantizar la consistencia de datos.

Respecto a estructura de datos, el sistema implementa validaciones exhaustivas mediante expresiones regulares para 8 tipos de datos distintos (nombres, emails, teléfonos, números de identificación, direcciones, contraseñas, códigos TOTP). Se desarrollaron algoritmos de procesamiento para gestionar volúmenes significativos de registros académicos, implementando mecanismos de paginación en reportes y filtrado eficiente de datos. La arquitectura permite consultas optimizadas sobre datos históricos sin degradación de rendimiento.

## Discusión

El desarrollo de Fortress Educa evidenció la importancia de la arquitectura modular en la construcción de sistemas de información complejos. La implementación de blueprints separados para cada dominio de negocio permitió que diferentes funcionalidades (autenticación, administración, gestión de tickets) evolucionaran de forma independiente sin afectar otras partes del sistema. Este enfoque modular facilitó la implementación de medidas de seguridad específicas en puntos críticos.

Un aspecto relevante fue la necesidad de implementar múltiples capas de validación de datos. Las expresiones regulares validaron formatos específicos desde el cliente, mientras que las capas de formulario (WTForms) y servicios proporcionaron validaciones adicionales. Esta estrategia en profundidad redujo significativamente la introducción de datos malformados o maliciosos en la base de datos.

La integración de mecanismos de seguridad avanzados como JWT, MFA y reCAPTCHA demostró que es posible mantener tanto usabilidad como robustez. Sin embargo, estos sistemas requieren configuración cuidadosa: los tokens JWT necesitaban expiración apropiada, los códigos TOTP requerían ventanas de tolerancia temporal, y el reCAPTCHA demandaba balanceo entre protección y experiencia del usuario.

Desde la perspectiva de bases de datos, la normalización del esquema y el uso de stored procedures centralizó la lógica de negocio crítica, facilitando auditoría y mantenimiento. Los triggers permitieron registrar automáticamente cambios en datos sensibles sin reutilizar lógica en múltiples servicios. Los índices fueron fundamentales para mantener rendimiento conforme el volumen de registros académicos y de auditoría crecía.

Finalmente, se comprobó que la sanitización de formularios mediante expresiones regulares personalizado y validadores de WTForms previno efectivamente inyecciones de código y manipulación de datos antes de su almacenamiento.

## Productos Obtenidos

El desarrollo de Fortress Educa generó productos que evidencian la aplicación práctica de los temas vistos y adquiridos durante el semestre. Estos productos respaldan el cumplimiento de los objetivos del proyecto, consolidando el proceso de diseño, desarrollo e implementación del sistema.

**Desde Programación en Entornos Web**, se entregó la aplicación web completa construida con Flask, incluyendo:
- Frontend responsivo con Bootstrap que adapta la interfaz a múltiples dispositivos
- Backend estructurado en blueprints funcionales (home, auth, aplication, tickets, admin, technical)
- Plantillas Jinja2 reutilizables para mantener consistencia visual
- Controladores que orquestan la lógica de negocio y comunican con servicios
- Formularios WTForms integrados con validaciones del lado servidor
- Sistema de rutas Flask que mapea URLs a funcionalidades específicas
- Integración completa con base de datos MySQL mediante ORM y stored procedures

**Desde Seguridad de Aplicaciones**, se implementaron:
- Hashing de contraseñas con Argon2id (3 iteraciones, 64MB memoria, 16 bytes salt)
- Sistema de autenticación con tokens JWT, incluyendo claims de rol para autorización granular
- Autenticación multifactor mediante códigos TOTP con generación de QR
- Validación reCAPTCHA integrada en formularios de login para prevención de ataques de fuerza bruta
- Sanitización de formularios con expresiones regulares personalizadas para 8 tipos de datos
- Controlador de sesiones que valida inactividad y duración máxima de sesiones
- Auditoría de eventos de autenticación (login exitosos/fallidos, cambios de contraseña)
- Protección CSRF integrada mediante FlaskWTF
- Control de acceso basado en roles para limitar funcionalidades por tipo de usuario

**Desde Gestión de Bases de Datos**, se desarrolló:
- Esquema normalizado con 20+ tablas que modelan datos demográficos, académicos y de seguridad
- Stored procedures para operaciones complejas (auditoría de sesiones, cierre de sesiones inactivas, reportes)
- Triggers que registran automáticamente cambios en tablas críticas para auditoría
- Views que simplifican consultas complejas sobre datos históricos y académicos
- Índices en columnas de búsqueda frecuente (emails, números de identificación)
- Transacciones para garantizar consistencia en operaciones multipasos
- Respaldos automáticos de la base de datos
- Gestión de constraints y relaciones de integridad referencial

**Desde Estructura de Datos**, se aplicaron:
- Validaciones de expresiones regulares para nombres, emails, teléfonos, direcciones, números de identificación, códigos TOTP
- Algoritmos de paginación para gestionar grandes volúmenes de registros en reportes
- Sistemas de filtrado y búsqueda eficientes sobre datos académicos
- Almacenamiento estructurado de tokens JWT y secretos TOTP
- Gestión de historial de eventos con ordenamiento y filtrado temporal
- Estructura de datos para control de acceso basado en roles

Estos productos demuestran la consolidación de competencias técnicas en programación web, implementación de seguridad robusta, diseño de bases de datos escalables y manejo eficiente de estructuras de datos complejas.

## Recomendaciones

Tras la finalización del desarrollo de Fortress Educa y evaluación de su funcionamiento, se plantean recomendaciones para fortalecer su sostenibilidad, escalabilidad y adopción institucional:

**En programación web**, se sugiere implementar una versión móvil nativa (iOS/Android) utilizando frameworks como React Native o Flutter, ampliando la accesibilidad de la plataforma para usuarios con acceso principalmente móvil. Asimismo, se recomienda implementar lazy loading y compresión de assets para optimizar tiempos de carga en conexiones lentas.

**En seguridad de aplicaciones**, se propone:
- Implementar autenticación biométrica como complemento a MFA
- Agregar rate limiting más granular a nivel de IP y usuario para prevenir fuerza bruta
- Implementar sistemas de notificación en tiempo real cuando se detecten intentos de acceso anómalos
- Realizar auditorías de seguridad periódicas mediante herramientas como OWASP ZAP
- Encriptar datos sensibles en reposo utilizando AES-256

**En gestión de bases de datos**, se recomienda:
- Implementar replicación de base de datos para alta disponibilidad
- Establecer políticas de retención de datos de auditoría con archivado a largo plazo
- Crear vistas materializadas para reportes frecuentes que demanden alto procesamiento
- Implementar particionamiento de tablas grandes por rango temporal para mejorar rendimiento
- Automatizar análisis de índices no utilizados y limpieza de fragmentación

**En estructura de datos**, se propone:
- Implementar caché distribuido (Redis) para almacenar sesiones y datos consultados frecuentemente
- Agregar algoritmos de predicción para identificar patrones en solicitudes de cupos
- Implementar compresión de datos históricos no consultados frecuentemente
- Desarrollar pipelines ETL para análisis de datos agregados sin afectar producción

**Recomendaciones transversales**:
- Establecer un programa de actualizaciones de seguridad periódicas para dependencias
- Implementar logging centralizado para monitoreo en tiempo real
- Documentar APIs mediante OpenAPI/Swagger para facilitar futuras integraciones
- Crear un entorno de staging que replica exactamente el ambiente de producción para pruebas
- Establecer SLAs para disponibilidad y tiempos de respuesta del sistema