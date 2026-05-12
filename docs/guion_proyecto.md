# Guion del Proyecto Fortress Educa

**Duración aproximada: 5 minutos**

## 1. Nombre del proyecto

**Fortress Educa**

---

## 2. Presentación del aplicativo

### Descripción
Fortress Educa es una plataforma web desarrollada con **Flask y MySQL** para centralizar y hacer más eficiente el proceso de asignación de cupos educativos en colegios públicos. Está diseñada especialmente para atender a familias y estudiantes vulnerables, como víctimas del conflicto armado, desplazados y poblaciones en riesgo social.

La aplicación actúa como una herramienta administrativa y de seguimiento, conectando a los acudientes con los equipos de administración y técnicos mediante un sistema de solicitudes tipo ticket.

### Funcionamiento general

1. **Inicio y acceso**
   - El sitio inicia en una página pública con información del servicio.
   - Un acudiente puede registrarse, iniciar sesión y enviar solicitudes educativas.
   - El sistema protege autenticación con **Google reCAPTCHA**, **hash de contraseñas SALT+PEPPER**, **JWT** y **protección CSRF**.

2. **Roles principales**
   - **Acudiente / usuario final**: registra estudiantes, envía solicitudes de cupo, consulta el estado de sus tickets y administra su perfil.
   - **Administrador**: controla casos, gestiona cuentas, configura colegios y cupos, y revisa auditorías e informes.
   - **Técnico**: revisa casos técnicos, consulta historial y monitorea seguridad.

3. **Flujo de solicitudes**
   - El acudiente crea una solicitud de cupo usando un formulario que incluye datos del estudiante y acompañante.
   - La solicitud se convierte en un ticket que se registra en base de datos mediante procedimientos almacenados.
   - El equipo administrativo o técnico analiza el caso, filtra cupos disponibles, asigna una opción y confirma el resultado.
   - El acudiente puede ver el avance del ticket, descargar documentos y recibir notificaciones.

4. **Seguridad y gestión de sesión**
   - El app almacena tokens JWT en cookies seguras y emplea sesiones con límite de varias sesiones activas.
   - El usuario puede ver y cerrar sesiones activas desde el centro de seguridad.
   - La aplicación considera la configuración de MFA para usuarios técnicos y administradores, y permite activarlo o desactivarlo para acudientes.

---

## 3. Funcionalidad

### Módulo público

- Página de bienvenida con navegación hacia login y registro.
- Políticas de privacidad y términos de uso.

### Módulo de autenticación

- Registro de nuevos acudientes.
- Inicio de sesión para usuarios, administradores y técnicos.
- Recuperación de contraseña con envío de código y verificación.
- Configuración y verificación de MFA.
- Cierre de sesión seguro.

### Módulo de gestión de solicitudes y tickets

- Dashboard de usuario con estado de solicitudes.
- Creación de nuevas solicitudes de cupo para estudiantes.
- Visualización y seguimiento de tickets por ID.
- Descarga de documentos asociados a la solicitud.
- Adjuntar comentarios y archivos a los tickets.
- Control de estados de los tickets: pendiente, asignado, resuelto, cancelado.

### Módulo administrativo

- Panel administrativo con vista de casos y filtros.
- Exportación de datos de casos y auditorías.
- Gestión de cuentas de acudientes, estudiantes, técnicos y administradores.
- Control de estado de usuarios y estudiantes.
- Gestión de colegios, jornadas y cupos disponibles.
- Configuración de factores de afectación y otros parámetros del sistema.

### Módulo técnico

- Panel técnico con casos asignados.
- Historial de auditoría y exportación de registros.
- Centro de seguridad para cambiar contraseña y cerrar sesiones.

### Seguridad avanzada

- **reCAPTCHA** en registro y en login tras varios intentos fallidos.
- **MFA** con aplicación de autenticación para roles críticos.
- **Protección de contraseñas** con hash robusto y pepper externo.
- **JWT** para la gestión de sesiones de usuario.
- **CSRFProtect** para formularios.
- **No-cache** en respuestas HTML para evitar datos sensibles en el navegador.

---

## 4. Alcance del proyecto

### Qué cubre Fortress Educa

- Centraliza la recepción y seguimiento de solicitudes de cupo.
- Permite gestionar alumnos, acudientes y funcionarios en un solo sistema.
- Proporciona controles de seguridad clave para autenticación y datos.
- Gestiona la administración de cupos en colegios y jornadas.
- Genera reportes y permite exportar datos importantes de acceso y acciones.
- Integra capa de auditoría de acciones sobre tickets, sesiones y cuentas.

### Qué no cubre (al menos en la versión actual)

- No es una solución de inscripción masiva totalmente automatizada para todos los colegios del país.
- No se incluyen modelos de calificación académica o evaluaciones pedagógicas.
- La integración real con infraestructura de pago o con aplicaciones de mensajería externas no aparece en el código.

---

## 5. Conclusiones del proyecto

- Fortress Educa es una solución web sólida para apoyar procesos de reinserción educativa de poblaciones vulnerables.
- Su arquitectura modular basada en **Flask**, **blueprints**, **controladores**, **servicios** y **repositorios** facilita el mantenimiento y la ampliación.
- El sistema combina gestión de tickets, seguridad de acceso y auditoría para ofrecer un proceso transparente y confiable.
- Al incluir roles diferenciados (usuario, técnico, administrador), permite cubrir tanto el frente de atención ciudadana como el de control operativo.
- El uso de variables de entorno y configuración en `.env` mejora la seguridad y la adaptabilidad entre entornos de desarrollo y producción.
- En conjunto, el proyecto demuestra cómo la tecnología puede modernizar el acceso a la educación y dar soporte a poblaciones en condición de vulnerabilidad.

---

## 6. Estructura técnica clave (breve)

- `run.py`: arranca la aplicación Flask.
- `app/__init__.py`: configura la aplicación, cargas de entorno, blueprints, JWT y CSRF.
- `app/settings.py`: define configuración de seguridad, JWT, correo, sesión y base de datos.
- `app/blueprints/*/routes.py`: define las rutas para cada módulo funcional.
- `app/controllers/*`: actúan como intermediarios entre rutas y servicios.
- `app/services/*`: implementan la lógica de negocio.
- `app/repositories/*`: realizan las consultas y la conexión con la base de datos.
- `templates/` y `static/`: contienen las vistas y los recursos frontend.

---

### Recomendación para la presentación

- Abrir con el nombre y propósito social del proyecto.
- Mostrar brevemente los roles y el flujo principal de un ticket.
- Destacar la seguridad y la arquitectura modular.
- Cerrar con el impacto social y la capacidad de escalar a AWS.
