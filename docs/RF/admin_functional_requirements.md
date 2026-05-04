# Requerimientos Funcionales del Módulo de Administración (Admin)

## RF-ADM-001
NOMBRE DEL REQUERIMIENTO: Dashboard administrativo
CARACTERISTICAS: Visualización de métricas principales, gráficos de actividad semanal y listado de últimas solicitudes.
DESCRIPCION: El sistema debe mostrar un panel con resumen de métricas clave y tendencias de actividad.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-001, RNF-ADM-AVAIL-002

## RF-ADM-002
NOMBRE DEL REQUERIMIENTO: Listar todos los tickets
CARACTERISTICAS: Vista paginada de tickets con filtros por estado, grado y tipo de afectación.
DESCRIPCION: El administrador debe poder visualizar y filtrar todos los tickets del sistema.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-004, RNF-ADM-AVAIL-002

## RF-ADM-003
NOMBRE DEL REQUERIMIENTO: Crear nueva cuenta de usuario
CARACTERISTICAS: Formulario para registrar acudientes, técnicos o administradores con datos completos y validaciones.
DESCRIPCION: El administrador debe poder crear nuevas cuentas de usuario con diferentes roles.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-SEC-003, RNF-ADM-USAB-002

## RF-ADM-004
NOMBRE DEL REQUERIMIENTO: Crear nuevo estudiante
CARACTERISTICAS: Formulario de registro de estudiante con datos académicos, personales y vinculación a acudiente.
DESCRIPCION: El administrador debe poder registrar nuevos estudiantes en el sistema.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-SEC-003, RNF-ADM-AVAIL-002

## RF-ADM-005
NOMBRE DEL REQUERIMIENTO: Gestionar estado de usuarios
CARACTERISTICAS: Toggle de estado activo/inactivo para acudientes con control de transacciones.
DESCRIPCION: El administrador debe poder activar o desactivar cuentas de usuario.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-004, RNF-ADM-AVAIL-003

## RF-ADM-006
NOMBRE DEL REQUERIMIENTO: Gestionar estado de estudiantes
CARACTERISTICAS: Toggle de estado activo/inactivo para estudiantes con impacto en tickets asociados.
DESCRIPCION: El administrador debe poder cambiar el estado de estudiantes.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-004, RNF-ADM-AVAIL-003

## RF-ADM-007
NOMBRE DEL REQUERIMIENTO: Listar y gestionar técnicos
CARACTERISTICAS: Vista de funcionarios técnicos con capacidad de activar/desactivar y exportar reportes.
DESCRIPCION: El administrador debe poder gestionar cuentas de técnicos del sistema.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-005

## RF-ADM-008
NOMBRE DEL REQUERIMIENTO: Listar y gestionar administradores
CARACTERISTICAS: Vista de otros administradores con control de estado.
DESCRIPCION: El administrador debe poder ver y gestionar otras cuentas de administrador.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-USAB-001

## RF-ADM-009
NOMBRE DEL REQUERIMIENTO: Exportar reporte de acceso de usuarios
CARACTERISTICAS: Generación de documento con historial de login y actividad de usuarios.
DESCRIPCION: El sistema debe permitir exportar reportes de acceso en formato compatible.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-PERF-005, RNF-ADM-AVAIL-002

## RF-ADM-010
NOMBRE DEL REQUERIMIENTO: Exportar reporte de acciones realizadas
CARACTERISTICAS: Reporte de acciones de usuarios incluyendo cambios y modificaciones.
DESCRIPCION: El administrador debe poder exportar un historial completo de acciones del sistema.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-PERF-005, RNF-ADM-AVAIL-002

## RF-ADM-011
NOMBRE DEL REQUERIMIENTO: Exportar listado de acudientes
CARACTERISTICAS: Descarga de datos de acudientes en formato Excel o PDF.
DESCRIPCION: El sistema debe permitir exportar información de acudientes registrados.
PRIORIDAD: Baja
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-PERF-006, RNF-ADM-AVAIL-002

## RF-ADM-012
NOMBRE DEL REQUERIMIENTO: Exportar listado de estudiantes
CARACTERISTICAS: Descarga de datos de estudiantes con información académica.
DESCRIPCION: El administrador debe poder exportar información de estudiantes del sistema.
PRIORIDAD: Baja
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-PERF-006, RNF-ADM-AVAIL-002

## RF-ADM-013
NOMBRE DEL REQUERIMIENTO: Historial y auditoría del sistema
CARACTERISTICAS: Visualización de todos los eventos registrados en el sistema con timestamps.
DESCRIPCION: El sistema debe mostrar un historial completo de actividades y cambios.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-004

## RF-ADM-014
NOMBRE DEL REQUERIMIENTO: Exportar historial de auditoría
CARACTERISTICAS: Descarga del historial completo para análisis externo.
DESCRIPCION: El administrador debe poder exportar logs de auditoría del sistema.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-PERF-005, RNF-ADM-AVAIL-002

## RF-ADM-015
NOMBRE DEL REQUERIMIENTO: Listar colegios
CARACTERISTICAS: Vista de todos los colegios registrados con información de contacto y estado.
DESCRIPCION: El administrador debe poder ver el catálogo completo de colegios.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-006

## RF-ADM-016
NOMBRE DEL REQUERIMIENTO: Agregar nuevo colegio
CARACTERISTICAS: Formulario para registrar institución educativa con datos completos.
DESCRIPCION: El administrador debe poder crear nuevos colegios en el sistema.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-017
NOMBRE DEL REQUERIMIENTO: Editar datos del colegio
CARACTERISTICAS: Actualización de nombre, DANE, email, teléfono, dirección y barrio.
DESCRIPCION: El administrador debe poder modificar información de colegios.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-018
NOMBRE DEL REQUERIMIENTO: Gestionar jornadas de colegio
CARACTERISTICAS: Agregar o remover jornadas (Mañana, Tarde, Noche, etc.) del colegio.
DESCRIPCION: El sistema debe permitir configurar qué jornadas ofrece cada colegio.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-003

## RF-ADM-019
NOMBRE DEL REQUERIMIENTO: Gestionar matriz de cupos
CARACTERISTICAS: Configuración de cupos disponibles por grado, nivel educativo y jornada.
DESCRIPCION: El administrador debe poder establecer la capacidad de cupos por nivel y jornada.
PRIORIDAD: Alta
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-003

## RF-ADM-020
NOMBRE DEL REQUERIMIENTO: Cambiar estado del colegio
CARACTERISTICAS: Activar o desactivar colegio para impedir o permitir nuevas asignaciones.
DESCRIPCION: El administrador debe poder cambiar el estado activo/inactivo de un colegio.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-004, RNF-ADM-AVAIL-003

## RF-ADM-021
NOMBRE DEL REQUERIMIENTO: Crear tipo de afectación
CARACTERISTICAS: Formulario para agregar nueva categoría de vulnerabilidad con nivel de prioridad.
DESCRIPCION: El administrador debe poder crear nuevos tipos de afectación para usar en tickets.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-022
NOMBRE DEL REQUERIMIENTO: Editar tipo de afectación
CARACTERISTICAS: Modificación de nombre, descripción y nivel de prioridad.
DESCRIPCION: El administrador debe poder actualizar configuración de tipos de afectación.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-023
NOMBRE DEL REQUERIMIENTO: Cambiar estado de tipo de afectación
CARACTERISTICAS: Activar o desactivar tipo de afectación.
DESCRIPCION: El administrador debe poder habilitar o deshabilitar tipos de afectación.
PRIORIDAD: Baja
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-004, RNF-ADM-AVAIL-002

## RF-ADM-024
NOMBRE DEL REQUERIMIENTO: Crear grupo preferencial
CARACTERISTICAS: Formulario para agregar grupo especial con prioridad asignada.
DESCRIPCION: El sistema debe permitir crear nuevos grupos preferenciales para clasificación.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-025
NOMBRE DEL REQUERIMIENTO: Editar grupo preferencial
CARACTERISTICAS: Modificación de nombre, descripción y prioridad del grupo.
DESCRIPCION: El administrador debe poder actualizar grupos preferenciales.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-026
NOMBRE DEL REQUERIMIENTO: Crear estrato socioeconómico
CARACTERISTICAS: Agregar categoría de estrato con nivel de prioridad.
DESCRIPCION: El administrador debe poder crear nuevos estratos para clasificación socioeconómica.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-027
NOMBRE DEL REQUERIMIENTO: Editar estrato socioeconómico
CARACTERISTICAS: Modificación de datos y prioridad del estrato.
DESCRIPCION: El administrador debe poder actualizar información de estratos.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-SEC-001, RNF-ADM-AVAIL-002

## RF-ADM-028
NOMBRE DEL REQUERIMIENTO: Panel de configuración general
CARACTERISTICAS: Vista centralizada con pestañas para afectaciones, grupos y estratos.
DESCRIPCION: El sistema debe mostrar un panel de control para gestionar catálogos del sistema.
PRIORIDAD: Media
REQUERIMIENTO NO FUNCIONAL: RNF-ADM-USAB-001, RNF-ADM-PERF-001
