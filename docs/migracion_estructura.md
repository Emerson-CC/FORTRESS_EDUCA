# Migración a Nueva Estructura del Proyecto

## Introducción
Este documento explica cómo adaptar el proyecto actual de Flask a la nueva estructura propuesta. La estructura actual está organizada de manera funcional con módulos separados, mientras que la nueva estructura adopta un patrón más modular con blueprints, controladores, servicios, repositorios y otras capas bien definidas.

## Análisis de la Estructura Actual vs. Nueva
La estructura actual tiene los siguientes elementos principales:
- `app/modules/` con subcarpetas para admin, dashboard_user y home, cada una con forms, models, routes y services.
- `app/core/` con decoradores, manejadores de errores, extensiones, etc.
- `app/security/` con lógica de autenticación y seguridad.
- `app/database/` con conexiones y backups.
- `app/utils/` con utilidades.
- `app/static/` y `app/templates/` con archivos estáticos y plantillas.
- `docs/`, `tests/`, `aws/`, `env/`, etc.

La nueva estructura introduce:
- Blueprints para organizar rutas y vistas.
- Controladores para lógica de negocio.
- Modelos, servicios, repositorios y estructuras de datos separadas.
- Reorganización de templates y static.

## Carpetas a Conservar, Crear y Eliminar

### Carpetas a Conservar (pero reorganizar contenido)
- `app/static/` → Conservar y mover a `app/static/` (ya existe, pero reorganizar subcarpetas si es necesario).
- `app/templates/` → Conservar y reorganizar en subcarpetas como `includes`, `pagina`, `auth`, `aplicacion/*`.
- `docs/` → Conservar tal cual.
- `tests/` → Conservar y posiblemente mover algunos tests a `database/pruebas`.
- `requirements.txt` → Conservar en la raíz.
- `run.py` → Conservar en la raíz.
- `app/__init__.py` → Conservar.
- `app/settings.py` → Conservar.

### Carpetas a Crear
- `database/pruebas/` → Nueva carpeta para pruebas de base de datos (mover backups SQL aquí si son para pruebas).
- `app/blueprints/pagina/` → Para el blueprint de la página principal (equivalente a home).
- `app/blueprints/auth/` → Para autenticación (integrar security aquí).
- `app/blueprints/aplicacion/` → Para la aplicación principal (equivalente a dashboard_user).
- `app/blueprints/admin/` → Para administración (equivalente a admin).
- `app/controllers/` → Nueva carpeta para controladores (lógica de negocio de routes).
- `app/models/` → Nueva carpeta para modelos (mover models de modules aquí).
- `app/services/` → Nueva carpeta para servicios (mover services de modules aquí).
- `app/repositories/` → Nueva carpeta para repositorios (parte de database logic).
- `app/data_structures/` → Nueva carpeta para estructuras de datos (posiblemente de core o utils).
- `app/utils/` → Conservar y mover contenido actual aquí.
- `app/templates/includes/` → Subcarpeta para componentes reutilizables.
- `app/templates/pagina/` → Para templates de página principal.
- `app/templates/auth/` → Para templates de autenticación.
- `app/templates/aplicacion/tickets/` → Para templates de tickets.
- `app/templates/aplicacion/usuarios/` → Para templates de usuarios.
- `app/templates/aplicacion/reportes/` → Para templates de reportes.

### Carpetas a Eliminar
- `app/modules/` → Eliminar después de mover contenido a blueprints, controllers, models, services.
- `app/core/` → Eliminar después de distribuir contenido en controllers, utils, data_structures.
- `app/security/` → Eliminar después de integrar en blueprints/auth y services.
- `app/database/` → Conservar conexiones, pero mover backups a `database/pruebas/`.
- `aws/` → Si no es necesario, eliminar o mover a docs si es documentación.
- `env/` → Conservar si es el entorno virtual, pero no es parte de la estructura del proyecto.

## Organización de Archivos Actuales

### Archivos en la Raíz
- `requirements.txt` → Conservar.
- `run.py` → Conservar.

### app/
- `__init__.py` → Conservar.
- `settings.py` → Conservar.

#### De app/core/
- `decorators.py` → Mover a `app/utils/`.
- `error_config.py` → Mover a `app/controllers/` o integrar en blueprints.
- `error_handlers.py` → Mover a `app/controllers/`.
- `extensions.py` → Mover a `app/utils/` o `app/__init__.py`.
- `regexs.py` → Mover a `app/utils/`.
- `utils.py` → Mover a `app/utils/`.

#### De app/database/
- `connection_db_v2.py` → Mover a `app/repositories/`.
- `connection_db.py` → Mover a `app/repositories/`.
- `FORTRESS_EDUCA_DB_BACKUP_2.sql` → Mover a `database/pruebas/`.
- `fortress_educa_db_backup.sql` → Mover a `database/pruebas/`.

#### De app/modules/admin/
- `forms.py` → Mover a `app/blueprints/admin/`.
- `models.py` → Mover a `app/models/`.
- `routes.py` → Convertir en controlador y mover a `app/controllers/`, crear blueprint en `app/blueprints/admin/`.
- `service.py` → Mover a `app/services/`.

#### De app/modules/dashboard_user/
- `forms.py` → Mover a `app/blueprints/aplicacion/`.
- `models.py` → Mover a `app/models/`.
- `routes.py` → Convertir en controlador y mover a `app/controllers/`, crear blueprint en `app/blueprints/aplicacion/`.
- `services.py` → Mover a `app/services/`.

#### De app/modules/home/
- `forms.py` → Mover a `app/blueprints/pagina/`.
- `models.py` → Mover a `app/models/`.
- `routes.py` → Convertir en controlador y mover a `app/controllers/`, crear blueprint en `app/blueprints/pagina/`.
- `services.py` → Mover a `app/services/`.

#### De app/security/
- `hash.py` → Mover a `app/services/` o `app/utils/`.
- `jwt_handler.py` → Mover a `app/services/`.
- `mfa_handler.py` → Mover a `app/services/`.
- `models.py` → Mover a `app/models/`.
- `recaptcha.py` → Mover a `app/services/`.
- `session.py` → Mover a `app/services/`.

#### De app/static/
- Conservar estructura: `css/`, `js/`, `img/` → Ya coincide con la nueva.

#### De app/templates/
- `layout_admin.html` → Mover a `app/templates/includes/`.
- `layout_dashboard.html` → Mover a `app/templates/includes/`.
- `layout_public.html` → Mover a `app/templates/includes/`.
- `admin/*` → Mover a `app/templates/admin/` (pero nueva estructura no tiene admin/, así que integrar en aplicacion o crear si necesario).
- `components/*` → Mover a `app/templates/includes/`.
- `dashboard_users/*` → Mover a `app/templates/aplicacion/`.
- `errors/*` → Mover a `app/templates/includes/` o crear subcarpeta.
- `home/*` → Mover a `app/templates/pagina/`.

#### De app/utils/
- `dataframe_manager.py` → Mover a `app/utils/`.
- `PRUEBA.PY` → Mover a `app/utils/` o eliminar si es temporal.

#### De tests/
- Mover tests relevantes a `database/pruebas/` si son de DB.

#### De docs/
- Conservar todo.

## Pasos para la Migración
1. Crear todas las nuevas carpetas listadas.
2. Mover archivos según el mapeo anterior.
3. Actualizar imports en los archivos movidos (e.g., rutas relativas).
4. Refactorizar routes.py en controllers y blueprints.
5. Eliminar carpetas obsoletas.
6. Probar la aplicación después de cada cambio.

## Notas Adicionales
- Los blueprints deben registrar rutas en `app/__init__.py`.
- Asegurarse de que los imports funcionen con la nueva estructura.
- Si hay dependencias cruzadas, ajustar en consecuencia.