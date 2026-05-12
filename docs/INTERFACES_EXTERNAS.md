# Especificación de Interfaces Externas - Fortress Educa

**Versión:** 8.3  
**Fecha:** Mayo 2026  
**Proyecto:** Sistema de Gestión de Cupos Educativos - Fortress Educa  
**Propósito:** Definición de las interfaces externas del sistema basadas en la arquitectura implementada

---

## Tabla de Contenidos

1. [Interfaces de Usuario](#interfaces-de-usuario)
2. [Interfaces de Hardware](#interfaces-de-hardware)
3. [Interfaces de Software](#interfaces-de-software)
4. [Interfaces de Comunicación](#interfaces-de-comunicación)

---

## 1. Interfaces de Usuario

### 1.1 Descripción General

Las interfaces de usuario de Fortress Educa son web-based y responden a los requerimientos de diferentes perfiles de usuarios del sistema. La aplicación utiliza un enfoque multi-layout que se adapta a cada rol de usuario.

### 1.2 Componentes de Interfaz por Rol

#### 1.2.1 Interfaz Pública (Ciudadano/Acudiente)

**Ubicación:** `app/templates/layout_public.html`

**Características:**
- Acceso sin autenticación inicial
- Información sobre el programa Fortress Educa
- Acceso a solicitudes de cupos educativos
- Visualización de requisitos y documentos necesarios

**Elementos principales:**
- Barra de navegación principal
- Sección de inicio (Home)
- Formularios de solicitud iniciales
- Información institucional

**Usuarios:** Ciudadanos, acudientes, tutores

---

#### 1.2.2 Interfaz de Aplicante

**Ubicación:** `app/templates/layout_aplication.html`

**Características:**
- Acceso autenticado para usuarios registrados
- Gestión de solicitudes de cupos
- Seguimiento del estado de solicitudes
- Configuración de perfil personal
- Registro de datos del estudiante

**Elementos principales:**
- Dashboard personal
- Formularios de registro de estudiantes (`forms/aplication_forms.py`)
- Estado de solicitudes
- Mensajería y notificaciones
- Configuración de cuenta

**Funcionalidades:**
- Crear nueva solicitud de cupo
- Subir documentos requeridos
- Ver historial de solicitudes
- Configurar autenticación MFA
- Cambiar contraseña

**Usuarios:** Acudientes y solicitantes registrados

---

#### 1.2.3 Interfaz de Administración

**Ubicación:** `app/templates/layout_admin.html`

**Características:**
- Panel administrativo para gestión del sistema
- Gestión de colegios y disponibilidad de cupos
- Revisión y validación de solicitudes
- Gestión de usuarios administrativos
- Reportes y estadísticas

**Elementos principales:**
- Dashboard administrativo
- Gestión de cuentas de usuarios
- Configuración de colegios
- Validación de solicitudes
- Historial de cambios (auditoría)
- Generación de reportes

**Funcionalidades:**
- ABM (Alta, Baja, Modificación) de colegios
- Asignación de cupos por institución
- Aprobación/rechazo de solicitudes
- Gestión de usuarios del sistema
- Exportación de datos
- Configuración de seguridad

**Usuarios:** Administradores del sistema

---

#### 1.2.4 Interfaz Técnica

**Ubicación:** `app/templates/layout_technical.html`

**Características:**
- Panel para personal técnico/soporte
- Monitoreo del sistema
- Gestión de incidencias técnicas
- Revisión de logs del sistema

**Elementos principales:**
- Dashboard técnico
- Monitor de estado del sistema
- Gestión de tickets técnicos
- Información de sesiones activas

**Funcionalidades:**
- Seguimiento de incidencias
- Monitoreo de disponibilidad
- Revisión de logs de auditoría
- Gestión de solicitudes de soporte

**Usuarios:** Personal técnico, soporte

---

#### 1.2.5 Interfaz de Gestión de Tickets

**Ubicación:** `app/templates/layout_tickets.html`

**Características:**
- Sistema de tickets para seguimiento de casos
- Gestión de incidencias y consultas

**Elementos principales:**
- Listado de tickets
- Creación de nuevo ticket
- Seguimiento de estado
- Asignación de responsables

**Usuarios:** Ciudadanos, personal administrativo y técnico

---

### 1.3 Componentes HTML/CSS Compartidos

**Ubicación:** `app/templates/includes/`

- Headers y footers compartidos
- Elementos de navegación
- Componentes de formularios
- Tabla de usuarios y solicitudes
- Alertas y notificaciones

---

### 1.4 Elementos de Seguridad en Interfaz

- **Token CSRF:** Protección en todos los formularios
- **reCAPTCHA:** Validación anti-bot en formularios públicos
- **Indicador de sesión:** Información del usuario conectado
- **Control de inactividad:** Logout automático tras 55 minutos

---

## 2. Interfaces de Hardware

### 2.1 Requisitos de Servidor

#### 2.1.1 Procesador
- **Mínimo:** Intel Core i5 o equivalente AMD Ryzen 5
- **Recomendado:** Intel Core i7 o AMD Ryzen 7
- **Núcleos:** Mínimo 4 núcleos
- **Velocidad:** Mínimo 2.4 GHz

#### 2.1.2 Memoria RAM
- **Desarrollo:** Mínimo 8 GB
- **Producción:** Mínimo 16 GB
- **Recomendado:** 32 GB para optimización

#### 2.1.3 Almacenamiento
- **Mínimo:** 500 GB SSD (RAID 1 recomendado en producción)
- **Sistema operativo:** 50 GB
- **Aplicación:** 20 GB
- **Base de datos:** 200 GB
- **Backups y logs:** 150-200 GB

#### 2.1.4 Interfaz de Red
- **Velocidad mínima:** 1 Gbps (Gigabit Ethernet)
- **Redundancia:** Se recomienda 2 NICs en configuración de alta disponibilidad
- **Conectividad:** Acceso a internet para servicios externos

---

### 2.2 Requisitos de Cliente (Usuario)

#### 2.2.1 Computadora Personal
- **Procesador:** Mínimo Dual-core a 1.5 GHz
- **Memoria RAM:** Mínimo 2 GB
- **Almacenamiento:** Mínimo 500 MB libres
- **Conexión:** Internet banda ancha (2 Mbps mínimo)

#### 2.2.2 Dispositivos Móviles
- **Smartphones:** iOS 12+ o Android 8+
- **Tablets:** iPad 5ª generación o equivalente Android
- **RAM:** Mínimo 2 GB
- **Almacenamiento:** Mínimo 50 MB libres
- **Conexión:** 3G, 4G, LTE o WiFi

#### 2.2.3 Periféricos
- **Navegador web moderno:** Chrome, Firefox, Safari, Edge
- **Cámara web:** Para verificación de identidad (opcional)
- **Lector de códigos de barras:** Para procesos administrativos (opcional)

---

### 2.3 Infraestructura de Base de Datos

- **Servidor MySQL:** Mínimo 4 núcleos, 8 GB RAM
- **Almacenamiento:** SSD de 200+ GB
- **Conexión:** Puerto 3306 (estándar MySQL)
- **SSL/TLS:** Soporte para conexiones cifradas

---

### 2.4 Infraestructura de Correo

- **Servidor SMTP:** Compatible con servidores estándar
- **Puerto:** 587 (TLS) o 465 (SSL)
- **Capacidad:** Mínimo 100 emails/día

---

## 3. Interfaces de Software

### 3.1 Stack Tecnológico Principal

#### 3.1.1 Framework Web
- **Framework:** Flask 3.1.3
- **Lenguaje:** Python 3.9+
- **Gestor de paquetes:** pip

#### 3.1.2 Base de Datos
- **SGBD:** MySQL (versión 8.0 o superior)
- **Conector:** mysql-connector-python
- **Interfaz:** SQL nativa

---

### 3.2 Servicios Externos Integrados

#### 3.2.1 Servicio de Seguridad - Google reCAPTCHA

**Interfaz:** `app/security/recaptcha_controller.py`

**Endpoint:** `https://www.google.com/recaptcha/api/siteverify`

**Método:** POST

**Parámetros:**
```json
{
  "secret": "RECAPTCHA_SECRET_KEY",
  "response": "token_generado_por_cliente"
}
```

**Respuesta:**
```json
{
  "success": true/false,
  "challenge_ts": "timestamp",
  "hostname": "hostname",
  "score": 0.0-1.0,
  "action": "action_name"
}
```

**Timeout:** 5 segundos

**Uso:** Validación anti-bot en formularios públicos

**Variables de configuración:**
- `RECAPTCHA_SITE_KEY` (frontend)
- `RECAPTCHA_SECRET_KEY` (backend)

---

#### 3.2.2 Servicio de Correo Electrónico - SMTP

**Interfaz:** `app/utils/extensions_utils.py`

**Librería:** Flask-Mail

**Configuración:**
```python
MAIL_SERVER = os.getenv("MAIL_SERVER")
MAIL_PORT = int(os.getenv("MAIL_PORT", 587))
MAIL_USE_TLS = True
MAIL_USERNAME = os.getenv("MAIL_USERNAME")
MAIL_PASSWORD = os.getenv("MAIL_PASSWORD")
MAIL_DEFAULT_SENDER = os.getenv("MAIL_DEFAULT_SENDER")
```

**Funcionalidades:**
- Envío de confirmaciones de cuenta
- Notificaciones de estado de solicitudes
- Recuperación de contraseña
- Alertas del sistema

**Protocolos soportados:** SMTP con TLS/SSL

---

#### 3.2.3 Autenticación - JWT (JSON Web Token)

**Interfaz:** `app/security/jwt_controller.py`

**Librería:** Flask-JWT-Extended

**Configuración:**
```python
JWT_SECRET_KEY = os.getenv("JWT_SECRET_KEY")
JWT_ACCESS_TOKEN_EXPIRES = timedelta(minutes=55)
JWT_REFRESH_TOKEN_EXPIRES = timedelta(hours=24)
JWT_TOKEN_LOCATION = ["cookies"]
JWT_COOKIE_SECURE = False
JWT_COOKIE_CSRF_PROTECT = False
```

**Ubicación de tokens:** Cookies HTTP

**Duración:**
- Access Token: 55 minutos
- Refresh Token: 24 horas

**Errores manejados:**
- `UnauthorizedError`: Token no proporcionado
- `ExpiredSignatureError`: Token expirado
- `InvalidTokenError`: Token inválido

---

#### 3.2.4 Autenticación Multi-Factor (MFA)

**Interfaz:** `app/security/mfa_controller.py`

**Tipo:** TOTP (Time-based One-Time Password)

**Estándar:** RFC 6238

**Configuración:**
```python
MFA_ISSUER = os.getenv("MFA_ISSUER")
```

**Funcionalidades:**
- Generación de códigos QR
- Validación de códigos OTP
- Respaldo de códigos

---

#### 3.2.5 Protección CSRF

**Interfaz:** Integrada en Flask

**Librería:** Flask-WTF

**Métodos:** Token CSRF en cookies

**Aplicación:** Todos los formularios POST/PUT/DELETE

---

### 3.3 Librerías Python Principales

| Librería | Versión | Propósito |
|----------|---------|-----------|
| Flask | 3.1.3 | Framework web |
| Flask-JWT-Extended | Última | Gestión de JWT |
| Flask-Mail | Última | Envío de correos |
| Flask-WTF | Última | Protección CSRF |
| mysql-connector-python | Última | Conexión a MySQL |
| requests | Última | Llamadas HTTP (reCAPTCHA) |
| pyotp | Última | Implementación TOTP |
| Werkzeug | Última | Seguridad y utilidades |
| Jinja2 | Última | Templating |
| python-dotenv | Última | Gestión de variables de entorno |
| argon2-cffi | 25.1.0 | Hash seguro de contraseñas |

---

### 3.4 Módulos Internos de Software

#### 3.4.1 Repositorios de Datos

**Ubicación:** `app/repositories/`

Cada módulo tiene su repositorio correspondiente:
- `admin_repository.py` - Operaciones administrativas
- `aplication_repository.py` - Solicitudes de aplicantes
- `auth_repository.py` - Autenticación y usuarios
- `technical_repository.py` - Operaciones técnicas
- `tickets_repository.py` - Gestión de tickets
- `home_repository.py` - Página de inicio
- `core_repository.py` - Operaciones comunes
- `utils_repository.py` - Utilidades de datos

**Interfaz:** Procedimientos almacenados en MySQL

---

#### 3.4.2 Controladores

**Ubicación:** `app/controllers/`

Controlan la lógica de aplicación:
- `auth_controller.py` - Autenticación
- `admin_controller.py` - Administración
- `aplication_controller.py` - Gestión de aplicantes
- `technical_controller.py` - Funciones técnicas
- `tickets_controller.py` - Gestión de tickets
- `home_controller.py` - Página principal
- `error_controller.py` - Manejo de errores

---

#### 3.4.3 Servicios Específicos

**Ubicación:** `app/services/{modulo}/`

Servicios de negocio por módulo:
- **admin/** - Gestión de cuentas, colegios, casos, configuración
- **aplication/** - Perfil, registro de estudiantes, solicitud de tickets
- **auth/** - Login, recuperación de contraseña, MFA
- **technical/** - Operaciones técnicas
- **tickets/** - Gestión de tickets

---

#### 3.4.4 Formularios (Forms)

**Ubicación:** `app/forms/`

Validación de datos con WTForms:
- `auth_forms.py` - Formularios de autenticación
- `aplication_forms.py` - Formularios de aplicantes
- `admin_forms.py` - Formularios administrativos
- `technical_forms.py` - Formularios técnicos
- `tickets_forms.py` - Formularios de tickets

---

### 3.5 Blueprints (Módulos de Rutas)

**Ubicación:** `app/blueprints/{modulo}/routes.py`

- `home` - Página principal pública
- `auth` - Autenticación
- `aplication` - Gestión de aplicantes
- `admin` - Panel administrativo
- `technical` - Panel técnico
- `tickets` - Sistema de tickets

---

### 3.6 Utilidades de Software

**Ubicación:** `app/utils/`

- `database_utils.py` - Conexión y gestión de base de datos
- `password_utils.py` - Hash y validación de contraseñas
- `extensions_utils.py` - Inicialización de extensiones
- `audit_utils.py` - Registro de auditoría
- `export_doc_utils.py` - Exportación de documentos
- `validation_utils.py` - Validaciones comunes
- `response_utils.py` - Formato de respuestas
- `decorators/` - Decoradores personalizados

---

## 4. Interfaces de Comunicación

### 4.1 Protocolos de Red

#### 4.1.1 HTTP/HTTPS

**Protocolo principal:** HTTP/HTTPS

**Versión:** HTTP/1.1, HTTP/2 soportados

**Puerto predeterminado:**
- Desarrollo: 5000 (HTTP)
- Producción: 80 (HTTP), 443 (HTTPS)

**Seguridad:**
- HTTPS obligatorio en producción
- Certificados SSL/TLS válidos requeridos
- HSTS (HTTP Strict Transport Security) implementado

**Headers de seguridad:**
```
Cache-Control: no-store, no-cache, must-revalidate, max-age=0
Pragma: no-cache
Expires: 0
```

---

#### 4.1.2 MySQL/TCP

**Protocolo:** TCP/IP

**Puerto:** 3306 (estándar)

**Seguridad:**
- SSL/TLS opcional pero recomendado
- Autenticación usuario/contraseña
- Timeout de conexión: 10 segundos

**Características:**
- Reconexión automática
- Pool de conexiones
- Manejo de errores de conexión

---

#### 4.1.3 SMTP/TCP

**Protocolo:** SMTP con TLS

**Puerto:** 587 (TLS) o 465 (SSL)

**Autenticación:** Usuario y contraseña

**Timeout:** Por defecto del servidor SMTP

---

### 4.2 Formatos de Datos

#### 4.2.1 JSON

**Uso principal:** 
- Respuestas de APIs
- Configuración
- Comunicación con servicios externos

**Ejemplo - Respuesta reCAPTCHA:**
```json
{
  "success": true,
  "challenge_ts": "2026-05-07T10:30:00Z",
  "hostname": "fortress-educa.local",
  "score": 0.9,
  "action": "submit"
}
```

---

#### 4.2.2 HTML/Jinja2

**Uso:** Templating de vistas

**Ubicación:** `app/templates/`

**Características:**
- Variables dinámicas
- Herencia de templates
- Filtros y funciones

**Ejemplo de contexto:**
```html
{{ user.nombre_acudiente }}
{{ user.iniciales }}
```

---

#### 4.2.3 SQL

**Uso:** Comunicación con base de datos

**Tipo:** Procedimientos almacenados (Stored Procedures)

**Ejemplo de interfaz:**
```python
cursor.callproc('nombre_sp', params)
```

---

#### 4.2.4 Cookies HTTP

**Tokens JWT:**
```
Set-Cookie: access_token=<token>; HttpOnly; Secure; SameSite=Strict
Set-Cookie: refresh_token=<token>; HttpOnly; Secure; SameSite=Strict
```

**Duraciones:**
- Access Token: 55 minutos
- Refresh Token: 24 horas

**Seguridad:**
- HttpOnly: Previene acceso desde JavaScript
- Secure: Solo se transmite por HTTPS
- SameSite: Previene CSRF

---

#### 4.2.5 Sesiones HTTP

**Almacenamiento:** Del lado del servidor

**Duración máxima:** 24 horas

**Configuración:**
```python
PERMANENT_SESSION_LIFETIME = timedelta(minutes=55)
MAX_SESSION_DURATION = timedelta(hours=24)
SESSION_MAX_ACTIVAS = 3  # Máximo 3 sesiones simultáneas
```

**Datos almacenados:**
```python
{
  "nombre_acudiente": str,
  "iniciales": str,
  "nombre_admin": str,
  "iniciales_admin": str,
  "nombre_technical": str,
  "iniciales_technical": str,
}
```

---

### 4.3 APIs Externas

#### 4.3.1 Google reCAPTCHA API

**Endpoint:** https://www.google.com/recaptcha/api/siteverify

**Método:** POST

**Headers requeridos:**
```
Content-Type: application/x-www-form-urlencoded
```

**Parámetros de entrada:**
- `secret`: Clave secreta del servidor
- `response`: Token del cliente

**Parámetros de salida:**
- `success`: Booleano
- `score`: 0.0 a 1.0 (v3)
- `action`: Nombre de la acción
- `challenge_ts`: Timestamp del desafío
- `hostname`: Hostname donde fue validado
- `error-codes`: Array de errores si existen

**Timeout:** 5 segundos

**Gestión de errores:** Retorna False en caso de excepción

---

### 4.4 Puertos de Red

| Servicio | Puerto | Protocolo | Descripción |
|----------|--------|-----------|-------------|
| Aplicación Web | 5000 | HTTP | Desarrollo |
| Aplicación Web | 80 | HTTP | Producción |
| Aplicación Web | 443 | HTTPS | Producción seguro |
| MySQL | 3306 | TCP | Base de datos |
| SMTP | 587 | TCP | Correo (TLS) |
| SMTP | 465 | TCP | Correo (SSL) |

---

### 4.5 Autenticación y Autorización

#### 4.5.1 Flujo de Autenticación

```
Usuario → Formulario Login → Validación reCAPTCHA
   ↓
Verificación Credenciales (BD)
   ↓
Generación JWT (access + refresh tokens)
   ↓
Almacenamiento en Cookies
   ↓
Creación de Sesión (servidor)
   ↓
Redirect a Panel Correspondiente
```

#### 4.5.2 Flujo MFA

```
Token JWT válido
   ↓
¿MFA habilitado?
   ├─ SÍ → Solicitar código TOTP
   │  ↓
   │  Validar código OTP
   │  ↓
   │  Extender sesión
   │
   └─ NO → Acceso directo
```

---

### 4.6 Manejo de Errores en Comunicación

#### 4.6.1 Errores HTTP

| Código | Descripción | Acción |
|--------|-------------|--------|
| 200 | OK | Procesamiento exitoso |
| 302 | Redirect | Redirección a otra ruta |
| 400 | Bad Request | Validación fallida de datos |
| 401 | Unauthorized | Autenticación requerida |
| 403 | Forbidden | Autorización insuficiente |
| 404 | Not Found | Recurso no existe |
| 500 | Server Error | Error interno del servidor |
| 503 | Service Unavailable | Base de datos no disponible |

#### 4.6.2 Errores de Conexión

**Base de datos:**
- Reconexión automática
- Timeout: 10 segundos
- Registro de intentos fallidos

**Correo electrónico:**
- Reintentos configurables
- Timeout por defecto del servidor
- Logging de errores

**reCAPTCHA:**
- Timeout: 5 segundos
- Retorno False en caso de fallo
- Registro de excepciones

---

### 4.7 Configuración de Variables de Entorno

**Ubicación:** `.env` (raíz del proyecto)

```
# Seguridad
SECRET_KEY=dev-secret
RECAPTCHA_SITE_KEY=<key>
RECAPTCHA_SECRET_KEY=<key>
PASSWORD_PEPPER=<pepper>
MFA_ISSUER=Fortress Educa

# JWT
JWT_SECRET_KEY=<key>

# Email
MAIL_SERVER=<servidor>
MAIL_PORT=587
MAIL_USE_TLS=True
MAIL_USERNAME=<usuario>
MAIL_PASSWORD=<contraseña>
MAIL_DEFAULT_SENDER=noreply@fortress-educa.edu

# Base de Datos
DB_HOST=localhost
DB_PORT=3306
DB_USER=<usuario>
DB_PASSWORD=<contraseña>
DB_NAME=fortress_educa_db
DB_SSL=false

# Sesiones
SESSION_MAX_ACTIVAS=3
```

---

### 4.8 Auditoría y Logging

**Componente:** `app/utils/audit_utils.py`

**Eventos registrados:**
- Login exitosos y fallidos
- Cambios en solicitudes
- Operaciones administrativas
- Errores del sistema
- Accesos denegados

**Formato:** Logs almacenados en base de datos

**Nivel de detalle:** Timestamp, usuario, acción, resultado, IP

---

## 5. Matriz de Integración de Interfaces

| Interfaz | Tipo | Protocolo | Autenticación | Disponibilidad |
|----------|------|-----------|---------------|----------------|
| UI Pública | Usuario | HTTPS | reCAPTCHA | Pública |
| UI Aplicante | Usuario | HTTPS | JWT + MFA | Privada |
| UI Administración | Usuario | HTTPS | JWT + MFA | Privada |
| UI Técnica | Usuario | HTTPS | JWT + MFA | Privada |
| Base de Datos | Software | MySQL TCP | Usuario/Pass | Privada |
| Correo SMTP | Software | SMTP TLS | Usuario/Pass | Externa |
| reCAPTCHA | Software | HTTPS | API Key | Externa |
| Hardware Servidor | Hardware | Ethernet | N/A | Privada |
| Hardware Cliente | Hardware | Ethernet/WiFi | N/A | Pública |

---

## 6. Conclusiones

Fortress Educa implementa una arquitectura multi-capa con interfaces bien definidas que permiten:

1. **Escalabilidad:** Módulos independientes e integrados
2. **Seguridad:** Múltiples capas de autenticación y validación
3. **Usabilidad:** Interfaces adaptadas por rol de usuario
4. **Confiabilidad:** Manejo robusto de errores y reconexiones
5. **Auditoría:** Registro completo de operaciones

Las interfaces externas están documentadas y configuradas para permitir una comunicación segura y eficiente entre los diferentes componentes del sistema.

---

**Documento preparado por:** Sistema de Análisis Técnico  
**Última actualización:** Mayo 2026  
**Estado:** Completo
