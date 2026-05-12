# Funciones Principales del Sistema Fortress Educa

## 1. Autenticación Multi-Rol
Gestiona el acceso al sistema para tres tipos de usuario distintos: acudientes, técnicos y administradores. Valida credenciales, verifica roles, maneja intentos fallidos con limitación de acceso y requiere reCAPTCHA tras múltiples intentos. Incluye recuperación de contraseña mediante código de 6 dígitos enviado por email y auditoría de accesos.

## 2. Gestión de Autenticación Multi-Factor (MFA/TOTP)
Proporciona autenticación de dos factores opcional mediante TOTP compatible con apps autenticadoras (Google Authenticator, Microsoft Authenticator). Genera códigos QR para configuración inicial, valida códigos temporales durante login, y permite activación/desactivación desde el centro de seguridad del usuario.

## 3. Gestión de Sesiones JWT
Maneja la creación, renovación e invalidación de tokens JWT (access tokens y refresh tokens) para mantener sesiones seguras. Genera identificadores únicos (JTI) para cada sesión, valida tokens en cada solicitud, permite cerrar sesiones individuales o todas simultáneamente, y proporciona visibilidad de sesiones activas.

## 4. Creación y Seguimiento de Solicitudes de Cupo
Facilita que los acudientes creen solicitudes de asignación de cupo mediante un formulario multi-paso guiado. Recopila datos del estudiante, tipo de afectación, ubicación, preferencias educativas, documentos adjuntos y aceptación de términos. Previene múltiples solicitudes activas simultáneamente y calcula automáticamente puntajes de prioridad.

## 5. Panel de Gestión de Tickets Técnico
Proporciona a los técnicos una interfaz unificada para visualizar y gestionar tickets asignados con pestañas de información completa, estado, comentarios, documentos y asignación de cupos. Incluye datos del solicitante y estudiante, histórico de cambios y opciones de acción.

## 6. Asignación de Cupos
Permite a los técnicos filtrar cupos disponibles por barrio, colegio y jornada usando tokens seguros contra manipulación, confirmar asignaciones con validación, autorizar confirmaciones por usuario, y cancelar asignaciones devolviendo cupos al inventario. Mantiene consistencia de datos mediante transacciones.

## 7. Gestión de Usuarios y Cuentas
Permite a administradores crear nuevas cuentas de acudientes, técnicos y administradores con datos completos y validaciones. Incluye activación/desactivación de cuentas, gestión de roles, auditoría de cambios y exportación de reportes de usuarios. Valida unicidad de email y documento.

## 8. Registro y Gestión de Estudiantes
Facilita el registro de estudiantes con datos personales, académicos, de contacto y vinculación a acudientes. Incluye validación de duplicados por documento, edición de perfiles, cambio de estado, y asociación con solicitudes de cupo. Acudientes pueden registrar sus propios estudiantes.

## 9. Administración de Colegios
Permite crear, listar, editar y gestionar información de instituciones educativas incluyendo nombre, DANE, email, teléfono, dirección y ubicación geográfica. Incluye gestión de jornadas activas (Mañana, Tarde, Noche), configuración de matriz de cupos por grado y jornada, y cambio de estado de operatividad.

## 10. Configuración de Catálogos del Sistema
Permite a administradores crear, editar y gestionar catálogos que definen el comportamiento del sistema: tipos de afectación (vulnerabilidades), grupos preferenciales para clasificación, y estratos socioeconómicos. Cada catálogo incluye nivel de prioridad que influye en el puntaje de solicitudes.

## 11. Dashboard Analytics y Métricas
Proporciona paneles personalizados para cada tipo de usuario mostrando métricas clave, últimas solicitudes, gráficos de actividad semanal (nuevas solicitudes vs cupos asignados) y contadores por estado. Incluye datos específicos según rol: acudientes ven sus solicitudes, técnicos sus tickets, administradores el sistema completo.

## 12. Historial de Auditoría y Trazabilidad
Mantiene registro completo de eventos del sistema incluyendo login, cambios de estado, comentarios, asignaciones de cupos, carga de documentos y cambios de datos. Incluye filtrado por tipo de evento, rango de fechas y paginación. Permite exportación para análisis externo y auditoría legal.

## 13. Centro de Seguridad Centralizado
Proporciona a todos los usuarios un panel centralizado para gestionar su seguridad: cambio de contraseña con validación de contraseña actual, configuración/desactivación de MFA, visualización de sesiones activas y cierre de sesiones individual o total por dispositivo.

## 14. Sistema de Gestión de Documentos
Maneja carga, validación y descarga segura de documentos adjuntos (PDF, JPG, PNG) con límites de tamaño (5MB). Permite a usuarios cargar documentación de solicitudes y a técnicos adjuntar reportes técnicos. Incluye validación de tipo de archivo, almacenamiento seguro y descarga auténtica.

## 15. Sistema de Comentarios y Comunicación
Facilita comunicación bidireccional entre técnicos y acudientes mediante comentarios en tickets. Permite comentarios públicos (visibles al acudiente) e internos (solo para personal técnico). Incluye información del autor, timestamp y edición con auditoría de cambios.

## 16. Filtrado, Búsqueda y Ordenamiento
Proporciona capacidades avanzadas de filtrado para tickets (por estado, grado, afectación) con ordenamiento inteligente: por prioridad cuando no hay filtros activos, por fecha cuando hay filtros. Incluye búsqueda en historial de auditoría y validación server-side de parámetros.

## 17. Gestión Automática de Tickets Abandonados
Detecta automáticamente tickets sin respuesta del usuario durante más de 3 días en estado de espera, los cierra como rechazados y registra la acción en auditoría. Mantiene el flujo de trabajo actualizado y libera cupos para reasignación.

## 18. Exportación de Reportes
Genera documentos Excel/PDF con datos del sistema: listados de usuarios, estudiantes, historial de auditoría, reportes de acceso, reportes de acciones y estadísticas. Utiliza utilidades de exportación seguras contra inyección de código y formatea datos con estándares locales.

## 19. Validación y Sanitización de Datos
Realiza validación exhaustiva de todas las entradas del usuario (email, teléfono, documento, fechas) antes de procesarlas. Implementa sanitización contra inyección SQL y XSS, validación de formularios con CSRF protection, y manejo de errores que no expone información técnica.

## 20. Control de Acceso Basado en Roles (RBAC)
Implementa un sistema granular de permisos donde cada rol (acudiente, técnico, administrador) tiene acceso solo a funcionalidades y datos permitidos. Utiliza decoradores en rutas para validar roles y tokens JWT, redirige a dashboards específicos según rol, y audita intentos de acceso no autorizado.
