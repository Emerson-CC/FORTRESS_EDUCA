-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fortress_educa_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_auditoria`
--

DROP TABLE IF EXISTS `tbl_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_auditoria` (
  `ID_Auditoria` bigint NOT NULL AUTO_INCREMENT,
  `Tabla_Afectada` varchar(100) NOT NULL,
  `Tipo_Evento` varchar(20) DEFAULT NULL,
  `ID_Registro_Afectado` varchar(50) NOT NULL,
  `Datos_Antiguo` json DEFAULT NULL,
  `Datos_Nuevos` json DEFAULT NULL,
  `Fecha_Auditoria` datetime DEFAULT CURRENT_TIMESTAMP,
  `IP_Usuario` varchar(50) NOT NULL,
  `User_Agent` varchar(255) DEFAULT NULL,
  `FK_ID_Usuario` int NOT NULL,
  `Estado_Auditoria` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Auditoria`),
  KEY `FK_Auditoria_Usuario` (`FK_ID_Usuario`),
  CONSTRAINT `FK_Auditoria_Usuario` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auditoria`
--

LOCK TABLES `tbl_auditoria` WRITE;
/*!40000 ALTER TABLE `tbl_auditoria` DISABLE KEYS */;
INSERT INTO `tbl_auditoria` VALUES (1,'TBL_PERSONA','UPDATE','6','{\"Primer_Nombre\": \"Luis\", \"Segundo_Nombre\": \"Alejandro\", \"Primer_Apellido\": \"Narvaez\", \"Fecha_Nacimiento\": \"2015-11-19\", \"Segundo_Apellido\": \"Talavera\"}','{\"Primer_Nombre\": \"Luis\", \"Segundo_Nombre\": \"Alejandro\", \"Primer_Apellido\": \"Narvaez\", \"Fecha_Nacimiento\": \"2015-11-19\", \"Segundo_Apellido\": \"Talavera\"}','2026-04-19 02:07:01','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(2,'TBL_ESTUDIANTE','UPDATE','1','{\"Genero\": 1, \"Colegio\": 9, \"Grado_Actual\": 6, \"Grado_Proximo\": 7, \"Grupo_Preferencial\": 4}','{\"Genero\": 1, \"Colegio\": 7, \"Grado_Actual\": 11, \"Grado_Proximo\": 12, \"Grupo_Preferencial\": 1}','2026-04-19 02:07:01','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(3,'TBL_PERSONA','UPDATE','6','{\"Primer_Nombre\": \"Luis\", \"Segundo_Nombre\": \"Alejandro\", \"Primer_Apellido\": \"Narvaez\", \"Fecha_Nacimiento\": \"2015-11-19\", \"Segundo_Apellido\": \"Talavera\"}','{\"Primer_Nombre\": \"Luis\", \"Segundo_Nombre\": \"Alejandro\", \"Primer_Apellido\": \"Narvaez\", \"Fecha_Nacimiento\": \"2015-11-19\", \"Segundo_Apellido\": \"Talavera\"}','2026-04-19 02:07:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(4,'TBL_ESTUDIANTE','UPDATE','1','{\"Genero\": 1, \"Colegio\": 7, \"Grado_Actual\": 11, \"Grado_Proximo\": 12, \"Grupo_Preferencial\": 1}','{\"Genero\": 1, \"Colegio\": 2, \"Grado_Actual\": 9, \"Grado_Proximo\": 10, \"Grupo_Preferencial\": 1}','2026-04-19 02:07:18','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(5,'TBL_DATOS_ADICIONALES','UPDATE','5','{\"Grupo\": 4, \"Barrio\": 19, \"Genero\": 1, \"Estrato\": 3, \"Telefono\": \"3152512350\"}','{\"Barrio\": 14, \"Genero\": 1, \"Telefono\": \"3152512360\"}','2026-04-19 02:10:25','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(6,'TBL_PERSONA','CREATE','8',NULL,'{\"Doc\": \"546544\", \"Nombre\": \"Marialis\"}','2026-04-19 02:45:36','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(7,'TBL_ESTUDIANTE','CREATE','3',NULL,'{\"Grado\": 9, \"ID_Persona\": 8}','2026-04-19 02:45:36','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1),(8,'TBL_USUARIO','PASSWORD_CHANGE','5','{\"evento\": \"cambio_password_perfil\"}','{\"resultado\": \"exitoso\"}','2026-04-19 02:58:44','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',5,1);
/*!40000 ALTER TABLE `tbl_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_auditoria_sesion`
--

DROP TABLE IF EXISTS `tbl_auditoria_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_auditoria_sesion` (
  `ID_Auditoria` bigint NOT NULL AUTO_INCREMENT,
  `FK_ID_Usuario` int DEFAULT NULL,
  `IP_Usuario` varchar(45) NOT NULL,
  `Tipo_Evento` varchar(45) NOT NULL,
  `Fecha_Evento` datetime DEFAULT CURRENT_TIMESTAMP,
  `User_Agent` varchar(255) NOT NULL,
  `Estado_Auditoria_Sesion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Auditoria`),
  KEY `FK_Auditoria_Sesion_Usuario` (`FK_ID_Usuario`),
  CONSTRAINT `FK_Auditoria_Sesion_Usuario` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_auditoria_sesion`
--

LOCK TABLES `tbl_auditoria_sesion` WRITE;
/*!40000 ALTER TABLE `tbl_auditoria_sesion` DISABLE KEYS */;
INSERT INTO `tbl_auditoria_sesion` VALUES (1,5,'127.0.0.1','LOGIN','2026-04-19 01:54:32','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(2,5,'127.0.0.1','LOGIN','2026-04-19 01:55:40','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(3,5,'127.0.0.1','LOGIN','2026-04-19 02:58:26','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(4,5,'127.0.0.1','LOGOUT','2026-04-19 03:48:28','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(5,3,'127.0.0.1','FAILED_LOGIN','2026-04-19 04:07:46','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(6,3,'127.0.0.1','FAILED_LOGIN','2026-04-19 04:08:17','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(7,3,'127.0.0.1','PENDING_MFA','2026-04-19 04:09:17','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(8,3,'127.0.0.1','MFA_SETUP_OK','2026-04-19 04:09:45','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(9,3,'127.0.0.1','PENDING_MFA','2026-04-19 04:21:13','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(10,3,'127.0.0.1','FAILED_MFA','2026-04-19 04:21:18','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(11,3,'127.0.0.1','FAILED_MFA','2026-04-19 04:21:20','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(12,3,'127.0.0.1','FAILED_MFA','2026-04-19 04:21:23','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(13,3,'127.0.0.1','FAILED_LOGIN','2026-04-19 04:43:35','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(14,3,'127.0.0.1','PENDING_MFA','2026-04-19 04:43:41','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(15,5,'127.0.0.1','LOGIN','2026-04-19 05:47:51','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(16,5,'127.0.0.1','LOGOUT','2026-04-19 05:49:40','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(17,5,'127.0.0.1','FAILED_LOGIN','2026-04-19 05:50:03','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(18,5,'127.0.0.1','FAILED_LOGIN','2026-04-19 05:50:07','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(19,5,'127.0.0.1','FAILED_LOGIN','2026-04-19 05:50:11','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(20,5,'127.0.0.1','FAILED_LOGIN','2026-04-19 05:55:12','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(21,5,'127.0.0.1','LOGIN','2026-04-19 05:55:27','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(22,5,'127.0.0.1','LOGOUT','2026-04-19 06:06:54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(23,5,'127.0.0.1','PENDING_MFA','2026-04-19 06:07:02','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1),(24,5,'127.0.0.1','LOGIN_MFA','2026-04-19 06:07:10','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36',1);
/*!40000 ALTER TABLE `tbl_auditoria_sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_barrio`
--

DROP TABLE IF EXISTS `tbl_barrio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_barrio` (
  `ID_Barrio` int NOT NULL AUTO_INCREMENT,
  `Nombre_Barrio` varchar(30) NOT NULL,
  `FK_ID_Localidad` tinyint NOT NULL,
  `Estado_Barrio` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Barrio`),
  UNIQUE KEY `Nombre_Barrio` (`Nombre_Barrio`),
  KEY `FK_Barrio_Localidad` (`FK_ID_Localidad`),
  CONSTRAINT `FK_Barrio_Localidad` FOREIGN KEY (`FK_ID_Localidad`) REFERENCES `tbl_localidad` (`ID_Localidad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_barrio`
--

LOCK TABLES `tbl_barrio` WRITE;
/*!40000 ALTER TABLE `tbl_barrio` DISABLE KEYS */;
INSERT INTO `tbl_barrio` VALUES (1,'Engativ√° Centro',1,1),(2,'Garc√©s Navas',1,1),(4,'Minuto de Dios',1,1),(5,'Villas de Granada',1,1),(6,'La Estrada',1,1),(7,'Santa Helenita',1,1),(8,'Boyac√° Real',1,1),(9,'√Ålamos Norte',1,1),(10,'√Ålamos Sur',1,1),(11,'Las Ferias',1,1),(12,'Santa Rosita',1,1),(13,'Bolivia',1,1),(14,'Normand√≠a',1,1),(15,'Normand√≠a Occidental',1,1),(16,'Villa Luz',1,1),(17,'Santa Cecilia',1,1),(18,'El Luj√°n',1,1),(19,'La Clarita',1,1),(20,'Florencia',1,1),(21,'La Granja',1,1),(22,'Marand√∫',1,1),(23,'Villa Gladys',1,1),(24,'San Ignacio',1,1),(25,'Los √Ålamos',1,1),(26,'Santa Mar√≠a del Lago',1,1),(27,'Tabora',1,1),(28,'El Cortijo',1,1),(29,'Granjas del Dorado',1,1),(30,'Villa Teresita',1,1),(31,'Villa Clavel',1,1);
/*!40000 ALTER TABLE `tbl_barrio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_colegio`
--

DROP TABLE IF EXISTS `tbl_colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_colegio` (
  `ID_Colegio` int NOT NULL AUTO_INCREMENT,
  `Nombre_Colegio` varchar(100) NOT NULL,
  `Direccion_Colegio` varchar(100) NOT NULL,
  `FK_ID_Barrio` int NOT NULL,
  `Estado_Colegio` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Colegio`),
  UNIQUE KEY `Nombre_Colegio` (`Nombre_Colegio`),
  UNIQUE KEY `Direccion_Colegio` (`Direccion_Colegio`),
  KEY `FK_Colegio_Barrio` (`FK_ID_Barrio`),
  CONSTRAINT `FK_Colegio_Barrio` FOREIGN KEY (`FK_ID_Barrio`) REFERENCES `tbl_barrio` (`ID_Barrio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_colegio`
--

LOCK TABLES `tbl_colegio` WRITE;
/*!40000 ALTER TABLE `tbl_colegio` DISABLE KEYS */;
INSERT INTO `tbl_colegio` VALUES (1,'No Aplica','N/A',1,1),(2,'Colegio Juan del Corral IED','Kr. 2',1,1),(3,'Colegio Magdalena Ortega de Nari√±o IED','Kr. 3',1,1),(4,'Colegio Rep√∫blica de Colombia IED','Kr. 4',1,1),(5,'Colegio Garc√©s Navas IED','Kr. 5',1,1),(6,'Colegio Minuto de Dios Siglo XXI IED','Kr. 6',1,1),(7,'Colegio Villas de Granada IED','Kr. 7',1,1),(8,'Colegio La Estrada IED','Kr. 8',1,1),(9,'Colegio Boyac√° Real IED','Kr. 9',1,1),(10,'Colegio √Ålamos IED','Kr. 10',1,1),(11,'Colegio Santa Mar√≠a del Lago IED','Kr. 11',1,1),(12,'Colegio Tabora IED','Kr. 12',1,1),(13,'Colegio Florencia IED','Kr. 13',1,1),(14,'Colegio Bolivia IED','Kr. 14',1,1),(15,'Colegio Robert F Kennedy IED','Av. Boyaca',1,1),(16,'Colegio Las Ferias IED','Kr. 15',1,1),(17,'Colegio Rodolfo Llin√°s IED','Kr. 16',1,1),(18,'Colegio Antonio Nari√±o IED','Kr. 17',1,1);
/*!40000 ALTER TABLE `tbl_colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cupos`
--

DROP TABLE IF EXISTS `tbl_cupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cupos` (
  `ID_Cupos` int NOT NULL AUTO_INCREMENT,
  `FK_ID_Grado` tinyint NOT NULL,
  `FK_ID_Colegio` int NOT NULL,
  `FK_ID_Jornada` tinyint NOT NULL,
  `Cupos_Disponibles` tinyint DEFAULT NULL,
  `Estado_Cupos` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Cupos`),
  KEY `FK_Cupos_Grado` (`FK_ID_Grado`),
  KEY `FK_Cupos_Colegio` (`FK_ID_Colegio`),
  KEY `FK_Cupos_Jornada` (`FK_ID_Jornada`),
  CONSTRAINT `FK_Cupos_Colegio` FOREIGN KEY (`FK_ID_Colegio`) REFERENCES `tbl_colegio` (`ID_Colegio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Cupos_Grado` FOREIGN KEY (`FK_ID_Grado`) REFERENCES `tbl_grado` (`ID_Grado`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Cupos_Jornada` FOREIGN KEY (`FK_ID_Jornada`) REFERENCES `tbl_jornada` (`ID_Jornada`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cupos`
--

LOCK TABLES `tbl_cupos` WRITE;
/*!40000 ALTER TABLE `tbl_cupos` DISABLE KEYS */;
INSERT INTO `tbl_cupos` VALUES (1,1,1,1,40,1),(2,2,1,2,35,1),(3,3,2,1,38,1),(4,4,2,2,30,1),(5,1,3,1,42,1),(6,2,4,2,33,1),(7,3,5,1,36,1),(8,4,6,2,28,1),(9,5,7,1,30,1),(10,1,8,1,27,1),(11,2,9,2,29,1),(12,3,10,1,34,1),(13,4,11,2,26,1),(14,5,12,1,31,1);
/*!40000 ALTER TABLE `tbl_cupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datos_adicionales`
--

DROP TABLE IF EXISTS `tbl_datos_adicionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_datos_adicionales` (
  `ID_Datos_Adicionales` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `FK_ID_Parentesco` tinyint NOT NULL,
  `FK_ID_Tipo_Iden` tinyint NOT NULL,
  `FK_ID_Persona` int NOT NULL,
  `FK_ID_Genero` tinyint NOT NULL,
  `FK_ID_Grupo_Preferencial` tinyint NOT NULL,
  `FK_ID_Estrato` tinyint NOT NULL,
  `FK_ID_Barrio` int NOT NULL,
  `Estado_Datos_Adicionales` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Datos_Adicionales`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Telefono` (`Telefono`),
  UNIQUE KEY `FK_ID_Persona` (`FK_ID_Persona`),
  KEY `FK_DatosAd_Parentesco` (`FK_ID_Parentesco`),
  KEY `FK_DatosAd_Identificacion` (`FK_ID_Tipo_Iden`),
  KEY `FK_DatosAd_Genero` (`FK_ID_Genero`),
  KEY `FK_DatosAd_GP` (`FK_ID_Grupo_Preferencial`),
  KEY `FK_DatosAd_Estrato` (`FK_ID_Estrato`),
  KEY `FK_DatosAd_Barrio` (`FK_ID_Barrio`),
  CONSTRAINT `FK_DatosAd_Barrio` FOREIGN KEY (`FK_ID_Barrio`) REFERENCES `tbl_barrio` (`ID_Barrio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DatosAd_Estrato` FOREIGN KEY (`FK_ID_Estrato`) REFERENCES `tbl_estrato` (`ID_Estrato`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DatosAd_Genero` FOREIGN KEY (`FK_ID_Genero`) REFERENCES `tbl_genero` (`ID_Genero`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DatosAd_GP` FOREIGN KEY (`FK_ID_Grupo_Preferencial`) REFERENCES `tbl_grupo_preferencial` (`ID_Grupo_Preferencial`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DatosAd_Identificacion` FOREIGN KEY (`FK_ID_Tipo_Iden`) REFERENCES `tbl_tipo_identificacion` (`ID_Tipo_Iden`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DatosAd_Parentesco` FOREIGN KEY (`FK_ID_Parentesco`) REFERENCES `tbl_parentesco` (`ID_Parentesco`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DatosAd_Persona` FOREIGN KEY (`FK_ID_Persona`) REFERENCES `tbl_persona` (`ID_Persona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_adicionales`
--

LOCK TABLES `tbl_datos_adicionales` WRITE;
/*!40000 ALTER TABLE `tbl_datos_adicionales` DISABLE KEYS */;
INSERT INTO `tbl_datos_adicionales` VALUES (3,'fortress.educa@gmail.com','3213397085',15,1,3,1,1,1,16,1),(4,'edcaicedoc@sanmateo.edu.co','3213397584',13,1,4,1,3,3,18,1),(5,'danicaicedo2005@gmail.com','3152512360',9,1,5,1,4,3,14,1);
/*!40000 ALTER TABLE `tbl_datos_adicionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_documento_ticket`
--

DROP TABLE IF EXISTS `tbl_documento_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_documento_ticket` (
  `ID_Doc_Ticket` int NOT NULL AUTO_INCREMENT,
  `FK_ID_Ticket` varchar(10) NOT NULL,
  `FK_ID_Tipo_Doc` tinyint NOT NULL,
  `Archivo` mediumblob NOT NULL,
  `Nombre_Original` varchar(100) NOT NULL,
  `Fecha_Subida` datetime DEFAULT CURRENT_TIMESTAMP,
  `Estado_Documentos` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Doc_Ticket`),
  KEY `FK_DocumentoTicket_Ticket` (`FK_ID_Ticket`),
  KEY `FK_DocumentoTicket_TipoDoc` (`FK_ID_Tipo_Doc`),
  CONSTRAINT `FK_DocumentoTicket_Ticket` FOREIGN KEY (`FK_ID_Ticket`) REFERENCES `tbl_ticket` (`ID_Ticket`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DocumentoTicket_TipoDoc` FOREIGN KEY (`FK_ID_Tipo_Doc`) REFERENCES `tbl_tipo_documento` (`ID_Tipo_Doc`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_documento_ticket`
--

LOCK TABLES `tbl_documento_ticket` WRITE;
/*!40000 ALTER TABLE `tbl_documento_ticket` DISABLE KEYS */;
INSERT INTO `tbl_documento_ticket` VALUES (1,'EDU-000001',1,_binary '%PDF-1.4\n%ˆ\‰¸\ﬂ\n1 0 obj\n<<\n/Type /Catalog\n/Version /1.4\n/Pages 2 0 R\n/Metadata 3 0 R\n/StructTreeRoot 4 0 R\n/MarkInfo 5 0 R\n/Lang (es-419)\n/ViewerPreferences 6 0 R\n/Outlines 7 0 R\n>>\nendobj\n8 0 obj\n<<\n/Title (EJEMPLO PAGINA)\n/Creator (Canva)\n/Producer (Canva)\n/CreationDate (D:20260416002546+00\'00\')\n/ModDate (D:20260416002545+00\'00\')\n/Keywords (DAHG91L40uI,BAF98ngHi04,0)\n/Author (EMERSON DANIEL CAICEDO COBOS)\n>>\nendobj\n2 0 obj\n<<\n/Type /Pages\n/Kids [9 0 R 10 0 R 11 0 R]\n/Count 3\n>>\nendobj\n3 0 obj\n<<\n/Length 2751\n/Type /Metadata\n/Subtype /XML\n>>\nstream\r\n<?xpacket begin=\"Ôªø\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n  <rdf:Description rdf:about=\"\"\n      xmlns:dc=\"http://purl.org/dc/elements/1.1/\"\n      xmlns:pdf=\"http://ns.adobe.com/pdf/1.3/\"\n      xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"\n      xmlns:pdfuaid=\"http://www.aiim.org/pdfua/ns/id/\"\n    dc:language=\"es-419\"\n    pdf:Producer=\"Canva\"\n    xmp:CreateDate=\"2026-04-16T00:25:46.163Z\"\n    pdfuaid:part=\"1\">\n    <dc:title>\n      <rdf:Alt>\n        <rdf:li xml:lang=\"x-default\">EJEMPLO PAGINA</rdf:li>\n        <rdf:li xml:lang=\"es-419\">EJEMPLO PAGINA</rdf:li>\n      </rdf:Alt>\n    </dc:title>\n  </rdf:Description>\n</rdf:RDF>\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                           \n<?xpacket end=\"w\"?>\r\nendstream\nendobj\n4 0 obj\n<<\n/Type /StructTreeRoot\n/K [12 0 R]\n/ParentTree 13 0 R\n/ParentTreeNextKey 3\n>>\nendobj\n5 0 obj\n<<\n/Marked true\n>>\nendobj\n6 0 obj\n<<\n/Type /ViewerPreferences\n/DisplayDocTitle true\n>>\nendobj\n7 0 obj\n<<\n/Type /Outlines\n/First 14 0 R\n/Last 15 0 R\n/Count 18\n>>\nendobj\n9 0 obj\n<<\n/Type /Page\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 16 0 R\n/XObject <<\n/X4 17 0 R\n/X7 18 0 R\n/X9 19 0 R\n/X10 20 0 R\n/X11 21 0 R\n/X12 22 0 R\n/X13 23 0 R\n/X15 24 0 R\n/X16 25 0 R\n/X17 26 0 R\n/X18 27 0 R\n/X19 28 0 R\n/X20 29 0 R\n/X21 30 0 R\n/X22 31 0 R\n/X23 32 0 R\n/X24 33 0 R\n/X25 34 0 R\n/X26 35 0 R\n/X27 36 0 R\n>>\n/Font 37 0 R\n>>\n/MediaBox [0.0 7.920007 1440.0 817.92]\n/Contents 38 0 R\n/StructParents 0\n/Tabs /S\n/Parent 2 0 R\n/BleedBox [0.0 7.920007 1440.0 817.92]\n/TrimBox [0.0 7.920007 1440.0 817.92]\n/CropBox [0.0 7.920007 1440.0 817.92]\n/Rotate 0\n/Annots []\n>>\nendobj\n10 0 obj\n<<\n/Type /Page\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 39 0 R\n/XObject <<\n/X4 40 0 R\n/X8 41 0 R\n/X9 42 0 R\n/X10 43 0 R\n/X11 44 0 R\n/X12 45 0 R\n/X13 46 0 R\n/X14 47 0 R\n/X15 48 0 R\n/X16 49 0 R\n/X17 50 0 R\n/X18 51 0 R\n/X19 52 0 R\n/X20 53 0 R\n/X21 54 0 R\n/X22 55 0 R\n/X23 56 0 R\n>>\n/Font 57 0 R\n>>\n/MediaBox [0.0 7.920007 1440.0 817.92]\n/Contents 58 0 R\n/StructParents 1\n/Tabs /S\n/Parent 2 0 R\n/BleedBox [0.0 7.920007 1440.0 817.92]\n/TrimBox [0.0 7.920007 1440.0 817.92]\n/CropBox [0.0 7.920007 1440.0 817.92]\n/Rotate 0\n/Annots []\n>>\nendobj\n11 0 obj\n<<\n/Type /Page\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 59 0 R\n/XObject <<\n/X4 60 0 R\n/X7 61 0 R\n/X9 62 0 R\n/X10 63 0 R\n/X11 64 0 R\n/X12 65 0 R\n/X13 66 0 R\n/X14 67 0 R\n/X15 68 0 R\n/X16 69 0 R\n/X17 70 0 R\n/X18 71 0 R\n/X19 72 0 R\n/X20 73 0 R\n/X21 74 0 R\n/X22 75 0 R\n/X23 76 0 R\n/X24 77 0 R\n/X25 78 0 R\n/X26 79 0 R\n>>\n/Font 80 0 R\n>>\n/MediaBox [0.0 7.920007 1440.0 817.92]\n/Contents 81 0 R\n/StructParents 2\n/Tabs /S\n/Parent 2 0 R\n/BleedBox [0.0 7.920007 1440.0 817.92]\n/TrimBox [0.0 7.920007 1440.0 817.92]\n/CropBox [0.0 7.920007 1440.0 817.92]\n/Rotate 0\n/Annots []\n>>\nendobj\n12 0 obj\n<<\n/Type /StructElem\n/S /Document\n/P 4 0 R\n/K [82 0 R 83 0 R 84 0 R]\n>>\nendobj\n13 0 obj\n<<\n/Limits [0 2]\n/Nums [0 [85 0 R 86 0 R 87 0 R 88 0 R 89 0 R 90 0 R 91 0 R 92 0 R 93 0 R 94 0 R\n95 0 R 96 0 R 97 0 R 98 0 R 99 0 R 100 0 R 101 0 R 102 0 R 103 0 R 104 0 R\n105 0 R 106 0 R 107 0 R]\n 1 [108 0 R 109 0 R 110 0 R 111 0 R 112 0 R 113 0 R 114 0 R 115 0 R 116 0 R 117 0 R\n118 0 R 119 0 R 120 0 R 121 0 R 122 0 R 123 0 R 124 0 R]\n 2 [125 0 R 126 0 R 127 0 R 128 0 R 129 0 R 130 0 R 131 0 R 132 0 R 133 0 R 134 0 R\n135 0 R 136 0 R 137 0 R 138 0 R 139 0 R 140 0 R 141 0 R 142 0 R 143 0 R 144 0 R]\n]\n>>\nendobj\n14 0 obj\n<<\n/Title (TITULO TICKET)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Next 145 0 R\n>>\nendobj\n15 0 obj\n<<\n/Title (USUARIO)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 146 0 R\n/First 147 0 R\n/Last 148 0 R\n/Count -34\n>>\nendobj\n16 0 obj\n<<\n/G3 149 0 R\n/G8 150 0 R\n/G14 151 0 R\n>>\nendobj\n17 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 152 0 R\n>>\n/BBox [0 0 1127 3069]\n/Group 153 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\—3∂¥07µ∞T0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\Ã,ç\Õ,,ísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»x#S33KsÖ¢TÆ4Æ@.W_g.\0ﬁÖ\›\r\nendstream\nendobj\n18 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 154 0 R\n>>\n/BBox [0 0 4405 2004]\n/Group 155 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2◊≥025510T0P0P@Ù\ÃML\ÃM\r,-Ù\ÃÃç\Õ,LísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tS3c#S3Ö¢TÆ4Æ@.W_g.\0Æzj\r\nendstream\nendobj\n19 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 156 0 R\n>>\n/BBox [0 0 807 167]\n/Group 157 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù\ÃML\ÃM\r,-Ù,-\Õ\Ã-M\ÕLísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\„\ÿ\r\nendstream\nendobj\n20 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 158 0 R\n>>\n/BBox [0 0 807 167]\n/Group 159 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@ÙL\r,\råççÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»pC#s#S3Ö¢TÆ4Æ@.W_g.\0\≈\0û\r\nendstream\nendobj\n21 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 160 0 R\n>>\n/BBox [0 0 807 167]\n/Group 161 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù-MåçM-MÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\„\Ã\ﬁ\r\nendstream\nendobj\n22 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 162 0 R\n>>\n/BBox [0 0 807 167]\n/Group 163 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù,\Ã--,å,Ù,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\È\Î\r\nendstream\nendobj\n23 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 164 0 R\n>>\n/BBox [0 0 807 167]\n/Group 165 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù,ååÕç\rL\ÃÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\‚O\⁄\r\nendstream\nendobj\n24 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 166 0 R\n>>\n/BBox [0 0 4405 606]\n/Group 167 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\“3636≤∞0Q0P0P@Ù\ÃML\ÃM\r,-Ùå-Õç\Õ,ísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»pC3c#S3Ö¢TÆ4Æ@.W_g.\0∏/Ñ\r\nendstream\nendobj\n25 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 168 0 R\n>>\n/BBox [0 0 1127 485]\n/Group 169 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2‘≥∞∞017µP0P0P@Ù\Õ-ç,\r\Ã\ÕÙ,M,MÃå,,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xSK3#S3Ö¢TÆ4Æ@.W_g.\0\€|\—\r\nendstream\nendobj\n26 0 obj\n<<\n/Length 107\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 170 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 171 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\ÃMMå-MLçísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|CS3#S3Ö¢TÆ4Æ@.W_g.\0ì\r\nendstream\nendobj\n27 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 172 0 R\n>>\n/BBox [0 0 1127 409]\n/Group 173 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\‘3µ42≥∞01Q0P0P@\‚\Íö[\ZY\Zòõ+\Ë[òöõZ*$\ÁrÈôô\Z* à wtë¢t.}wcÖÙb.}«¢íÃ¥\ƒ\‰\'_g.ê˘\Ê\Ê\nF¶f\nE©\\i\\Å\\Ææ\Œ\\\0\‹\r\nendstream\nendobj\n28 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 174 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 175 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\Ã,ç\Õ,,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\ÎÆ\ﬂ\r\nendstream\nendobj\n29 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 176 0 R\n>>\n/BBox [0 0 1127 522]\n/Group 177 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\“30636≥4V0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\rç\ÕL\ÃM\ÃísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|SSc#S3Ö¢TÆ4Æ@.W_g.\0\›\Ô\∆\r\nendstream\nendobj\n30 0 obj\n<<\n/Length 107\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 178 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 179 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙåM-\r-\r-,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|CS3#S3Ö¢TÆ4Æ@.W_g.\03\r\nendstream\nendobj\n31 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 180 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 181 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙL-\Õ-\Ã\r\rísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Í\‹\‹\r\nendstream\nendobj\n32 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 182 0 R\n>>\n/BBox [0 0 1127 193]\n/Group 183 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ,L\rMLLåísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Á∂\”\r\nendstream\nendobj\n33 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 184 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 185 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙL,åLMå-MísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Îr\ﬁ\r\nendstream\nendobj\n34 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 186 0 R\n>>\n/BBox [0 0 2290 484]\n/Group 187 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2‘≥∞∞017µP0P0P@Ù\Ã,\ÕM\Õ-ÙÕççç--LísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\ÿt#C##S3Ö¢TÆ4Æ@.W_g.\0ÿõ∂\r\nendstream\nendobj\n35 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 188 0 R\n>>\n/BBox [0 0 946 154]\n/Group 189 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3µ¥470≥∞T0P0P@Ù\Ã\Ã\rç-\ÃÃçÙ,\Õ-\rå-\rísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCSsS#S3Ö¢TÆ4Æ@.W_g.\0ıç¯\r\nendstream\nendobj\n36 0 obj\n<<\n/Length 103\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 190 0 R\n>>\n/BBox [0 0 209 182]\n/Group 191 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“370≥064Q0P0PÄsÙ\Ã\Ã\rç-\ÃÃçÙÕççç--LísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»p#K#S3Ö¢TÆ4Æ@.W_g.\0z\r\nendstream\nendobj\n37 0 obj\n<<\n/F5 192 0 R\n/F6 193 0 R\n>>\nendobj\n38 0 obj\n<<\n/Length 2682\n/Filter /FlateDecode\n>>\nstream\r\nxú\Ì\\mè\≈\rè\‘wˇˆ+ \Ì\nU|∂\«\„±\’(		T®Åìä‘æ©BA≠(!˝˛\’\Ï\„ˇag\Ê.\rEπù\›Òx<?{<∂\Á^ÄÉ∑\Zl∞π¸hî¿\…›ö\Á//\◊Ωz˝Øo˛Ò¸uÛ\Ë≥«á¸µ\"bBäÕ´˛˙\·\·˚√ì\œ^«ñ\ﬁÙ\”ÛjÚ\ﬂ/>\Èxı\Ì\·˙ì\–|˚\„er∆Ü\–0S˛¶%˚\Ï\Ï\Ì2\—1@jÄî<4(¢á\‘±\Z≥55Ar£ëùójßÜ\‘rØ\ÃFn¿\ÃF˜\√\ƒFf˛îïÎØ§˘¯á¢J\≈Ãä¡™\\f˚/qx:¸£õ\√ı\”\ÿpÑöõo˙πﬁß\∆∂<ÇHsÛ\‚pu/}\–\‹¸˚@HLà\‹`sÛı\·◊á˘MTJ®ôªõØãÆ\ÓY\◊n ¡c\Z?ø\Óöêhp∂°ùªvá\ƒ1©ÕøiõbÚêt$æõ\À˜∫<ôX§°Üˆ(Q\√8\ÏﬂØ\∆LÜt:ìõÖLå°]Fj•<ÒY&§sÑX£NÑÆ\ÓQ\À#D\'I:Úˇ¡ fGLñ\‰TÃå@—îFÒ\ƒ\ÓsÖ\ƒG)c˜q\03¢Iñ\Ôv\'ê$\Œ$¨@¡Y{ÅM35&\Ó\“SyÄ\ËÒ\·,/Ö)ê˚Å§Ç,Û®£T\"r‘∞\¬daRg‘ßØèYî8~˝˛†	I,•åëEJß*≤\ZA:C!~¶«™)Fµ⁄©ˆ\n¢`\‰mï˘˘qØ\ÓΩS£8ö@∞≈ªù)ŒÖÇø_A?FhmS/¥Im01\Ÿú¢=(Ÿï?kÆ¶\Œg∏Q@NÖV∞=GT≠ÚR†R\Z4¨≥òq\\ß\ﬂâ\Z’Éj\ÂP\"Ûn\≈\n¶‘¢û£¸/\‡<ã∫∞{K\Ì=°ùZZ•e‘™ƒèv©¢J‚üó3◊òÉ=;™Å{LïÙ§\0\Ôn˚\"ÙàÅkßtø\«BR1g≠\≈Nâ˘˘_¿T¡?\€Mg~©ñv\ﬂ∫C\Ám\ÔWpß\ZñPY2ªePZîùä>˘P\ÀB.Ñbß∂¢g{ÌÖ´ãw:\ﬂ?ˆ\Ë\‰\Õxtë!uŒæ¯¢O∑0n¡ßõ]ø˝Æa\·,±\ÏÜ\‹\÷#ü\ÔP\ƒ\‰¸®Öı+LËùä\’3ìºçh\Z\\ì\“\"ïfTZ\Ìªò\“⁄±˙≠\Zû\‹\·i\Á!)6bä)h#Çí07å Ñ˘Ëçê\ÂNª\√7i1|31\‘\≈_»ò;é⁄ç& \n˙Z\Áú\ÃR\«\Ê\‚]Äàl-$nH–Å,S\√\Œ0dæ\‹>èñÅìypº\ÀIt±®Oπy\‡˙≥\«˙∏¡\Ê\·\√\Ê\—«è◊üˇ˝óØ_˝\Á˘\Î\Ê¡Éæ≠ÏïâvM\Áñp£7Urp˜zY{\«-πoÙºP@K<˙ LQ-¨\·\√y«∑D˜Ò•\‡jR\—HP\"pWk,\ÎAà\¬\riÑ<yîíë†D´Fb\ŒP¯VC11•¿\‚f-S∫K¡\Z[’ã™\‘+8d\Â\n±SÆíü[Xó>J\»`öp˝zGÁ£ª:¿\Ë)™ìCDø¿TXÜT\ÓW\r)\¬%LÕ±§\ŸNoÉ\”e˜≠`\‚*0qÇ(:\·iaI\nP(qˆ\ÂˆŸ£\‚y~\Œ&\◊\ƒ^v\‚~\nΩtò\"r	»åqöπg=4i	ö≥L\Ì¿\ÊLˇ≠\‡u\‡$à©ç˘æep\ﬁYH\ÏnP[“ï[Ç6\"Xr\ﬂ\r\⁄‹≥¥º\⁄Y¶vÄv¶ˇV\–Jh!˘ëE]éw^ pßΩ{≥\€˘∂]ò9\Á˘N\‹\‰ûı∏	K∏ôejnf˙o\≈M¨\¬\r	af\ﬂe¡V\‹ˇùßéªéu^º+ôR‘ÜR®ñ\œ#l\‡§$MÜòÇ\Ê\\Ç@qlQ2Åı\“\„wi{+\ÊsX\ÓΩ	¿ü“à]\≈\»\\ú*0x\Ï¢\ÂxûB;€ÅˆF˚öCH.vô\Ê\ÎU9Br¢#¡±ZàX£∞\”-ƒñ*\≈\0)\Î±Ìãë*+ä\".D7˜Ö\Áä<b{gó\ƒ\ÊzÆtiuô$YÄ\‡zãe≤™eäÄ˝Q\ÎR\Z%\œ\◊\Àóo˛Û¬ògrè¢s8|∑\Ô¨\n>çÄπoΩ\‰ΩNA\‡H\Ó£uu ëà¥˙.|˛&`MB\⁄\€\ﬁ∞óëHø±õHôÉ%\„=C`ø˜¡ç4/\‹(rÛ›Å<¥\œ˘ˇæc	AR˜bz\Ïﬂ≥‰≥ç≤w\Ôß\«˛Ω`ó¨ç˘ı¯‘Ω≈ÜªV\ÔZª6≥ìF≥∂ïíú4\ÁÁñÇ\‚)\r≈∂=àû¥\Á\Á\‹.\·t\Ã¸ú\€#ùõüsª\‚\È∏˘˘ªæ\ÓÙ˙í\Àx˘Ø2≠ì\È¶+)O}$es\◊Z\Ã\Ó˜©+|x\Õw‘Æ^Eq[i-ßêA\ÌÒ∏\‘W,ÄàóYRk;\Ó\„H+8\ÍíY\Î5\–s\›7\«\ÎÚ+Ñî7r\”\ŒZØîmZN{•\Z\‡Ç˛\ﬁJ Lrf∑ú˝ê8“ê£RÖx\ÓRw\∆\\N4\ŒÛr‹í:ò\Èæ:õrräÇ4\‘\⁄t≤!E	ëë\Ê≥:b@\ƒGà¸4Ø\€\È7˘]˛nÏõüüv\œ¸QO\'Nm¯x(ûæ(˜Oä,ûT˚\ÁΩ.±q*U˚\'≈∫µ¥ç5ˇ\«\\≈¶w.6W¸èΩ7/e]\‰~*∑ç∫´\⁄v\◊ \‹N\ﬁ\È∏~˝\‚æ+\’‘óÄg/åBÆ^ZI˙ûG)oãLñÄoqYd=^wc§7\»w~g\‰BuÒı\È>Ig~ΩO≤©†`äîã;(\Ëâ7ô dﬂøÑEBØ#/¶ Kl≈ñ°|\–\€≈©ˇf(\÷E\Õ\«2P\Á_|\Ë9∏D0D\ÁK3á•]R§nì\‰\≈bÅß¡ âß\Õ–ölFVº\Â>9x=\Î˚\‰Ö\À)A¥ú\‰\⁄\ÏrFJu+∞ò+T\·ré\›\ÂˇóI¸\Î!\Î\‚=\’j\–^Ù68ú\ﬁ;ää»èéJ\Ì\Õ÷©å›ø\÷y\Ï\—\‡Ωc9|\◊˜\À\ŒgvXÛ˜«é\ÈÒ8apjãé®j\0ã$;é™u~/f≠\n,\Ì_ﬁ©˚fıZè≠\œ\ﬁ\Èâ\Ì!yp ~bWz~v∑©Œëi¶ ñoLmF¶ô\÷!s\„ù\Ëñˆ#\”\∆ÓõëπûNXπ‘ÉÛ◊ªA?ÅªA}\"ëY@\rπa\Õ\◊S\»Q3p±4<™`ñ∂S\»£ìÆlç\Œ\ÿsØÇπ)¥éÛ‹ô2\ﬂwIØdøˆïS\›M\·ÙJY\”%ù?é\ÈA2¥dï\’/;\Ô\ÓùX}>\ﬁ¡$ï;\\!$SX\Ì¢lJe\Â˚dpõZ\‰p7\’K\Á°\Õ”úN$ü7\‘m\Í£\‹:%\–D\“\ƒ\Ë\…Àµ\r9zY¸(\‡sT‹ô(µù\Íl\◊bcû´úmy¢ıÚ\Œõãè+3\n\¬\ÌUë¸b©\Ó©P∆¥;˜±Û6Dâ˛¿ˇˇ®ø\ÊGõ!&êh9◊é\ÌVJ(Øﬂ°S.S9\'´#ò\≈\–ƒæ˛H∂WÉN›ó1&å\◊]◊ê\€˚ãówop%¥.Ü\Ìk\“\“h{†ø∫˜€ñFÇ¸ãU\‚t%\Îi7\"F\√I\Õ˛<ˇ˚{>\Ê\√\Ë~§N*üGLvI˘wi-+\ÂìqPF«©¥\‰ãq\√vcüt˛o#˘Ñ®q<¡˛\ÓÏåñ\ÎG\ƒLÛØNH	ê9ıPD\‚õ;s$ö#∞≠\ﬁ\Á\»Ú≠@yıs0Y\’◊á˙µ\Z\‰ˆ\Ï_°r\ﬂ$\r\nendstream\nendobj\n39 0 obj\n<<\n/G3 194 0 R\n/G7 195 0 R\n>>\nendobj\n40 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 196 0 R\n>>\n/BBox [0 0 1127 3069]\n/Group 197 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\—3∂¥07µ∞T0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\Ã,ç\Õ,,ísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»x#S33KsÖ¢TÆ4Æ@.W_g.\0ﬁÖ\›\r\nendstream\nendobj\n41 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 198 0 R\n>>\n/BBox [0 0 807 167]\n/Group 199 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù\ÃML\ÃM\r,-Ù,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\Ê$\‰\r\nendstream\nendobj\n42 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 200 0 R\n>>\n/BBox [0 0 807 167]\n/Group 201 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@ÙL\r,\råççÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»pC#s#S3Ö¢TÆ4Æ@.W_g.\0\≈\0û\r\nendstream\nendobj\n43 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 202 0 R\n>>\n/BBox [0 0 807 167]\n/Group 203 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù-MåçM-MÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\„\Ã\ﬁ\r\nendstream\nendobj\n44 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 204 0 R\n>>\n/BBox [0 0 807 167]\n/Group 205 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù,\Ã--,å,Ù,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\È\Î\r\nendstream\nendobj\n45 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 206 0 R\n>>\n/BBox [0 0 807 167]\n/Group 207 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù,ååÕç\rL\ÃÙ,-\Õ\Ã-M\ÕLísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\ﬂ7\Œ\r\nendstream\nendobj\n46 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 208 0 R\n>>\n/BBox [0 0 1127 485]\n/Group 209 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2‘≥∞∞017µP0P0P@Ù\Õ-ç,\r\Ã\ÕÙ,M,MÃå,,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xSK3#S3Ö¢TÆ4Æ@.W_g.\0\€|\—\r\nendstream\nendobj\n47 0 obj\n<<\n/Length 107\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 210 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 211 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\ÃMMå-MLçísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|CS3#S3Ö¢TÆ4Æ@.W_g.\0ì\r\nendstream\nendobj\n48 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 212 0 R\n>>\n/BBox [0 0 1127 409]\n/Group 213 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\‘3µ42≥∞01Q0P0P@\‚\Íö[\ZY\Zòõ+\Ë[òöõZ*$\ÁrÈôô\Z* à wtë¢t.}wcÖÙb.}«¢íÃ¥\ƒ\‰\'_g.ê˘\Ê\Ê\nF¶f\nE©\\i\\Å\\Ææ\Œ\\\0\‹\r\nendstream\nendobj\n49 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 214 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 215 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\Ã,ç\Õ,,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\ÎÆ\ﬂ\r\nendstream\nendobj\n50 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 216 0 R\n>>\n/BBox [0 0 1127 522]\n/Group 217 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\“30636≥4V0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\rç\ÕL\ÃM\ÃísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|SSc#S3Ö¢TÆ4Æ@.W_g.\0\›\Ô\∆\r\nendstream\nendobj\n51 0 obj\n<<\n/Length 107\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 218 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 219 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙåM-\r-\r-,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|CS3#S3Ö¢TÆ4Æ@.W_g.\03\r\nendstream\nendobj\n52 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 220 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 221 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙL-\Õ-\Ã\r\rísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Í\‹\‹\r\nendstream\nendobj\n53 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 222 0 R\n>>\n/BBox [0 0 1127 193]\n/Group 223 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ,L\rMLLåísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Á∂\”\r\nendstream\nendobj\n54 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 224 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 225 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙL,åLMå-MísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Îr\ﬁ\r\nendstream\nendobj\n55 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 226 0 R\n>>\n/BBox [0 0 2155 2738]\n/Group 227 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰≤\–3146046U0P0P@Ù\ÃML\ÃM\r,-Ù\ÃÃç\Õ,LísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»t#S3c#SÖ¢TÆ4Æ@.W_g.\0ßºX\r\nendstream\nendobj\n56 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 228 0 R\n>>\n/BBox [0 0 2155 2738]\n/Group 229 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰≤\–3146046U0P0P@Ù\ÃMMç\Õ\r\r,Ù\ÃÃç\Õ,LísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»t#S3c#SÖ¢TÆ4Æ@.W_g.\0•Q\r\nendstream\nendobj\n57 0 obj\n<<\n/F5 230 0 R\n/F6 231 0 R\n>>\nendobj\n58 0 obj\n<<\n/Length 2542\n/Filter /FlateDecode\n>>\nstream\r\nxú\Ì[[è∑\r6–∑\”˝\Ê!≠\◊)¨%)ä¢ÄÖÅ¨oIQ\'\Ÿx€∏Ä˚P8u\–N`\◊˝ˇÖ\Ê>{Ü3£\Ÿ5ú6õ Ä≠HE}$?qx\ﬁ˘TˇSA\’˝Ò_£KòíVØ\ﬁ\ﬁN?˜˛üØˇ˛\Í}u˛\Ï\·!\œ\0®ºè°z˜è\√wü~<<~ˆˆ\‡R®\Â\rzı\ÊÄU˛˜€ß\Ì\ﬁ˝p8}\Í´˛=#AÖ†ê%øÆ\≈^.>Æç(\Í\0cÚ\Ô ˘X!í8P\"≠<Ht1)ˆ\Íº=`Ω9V(öWe5Ú\0d5ö?jdÂß™úæ\‡\Í\—O¶\r,ÖBVE›™]f\◊/i8\›˛¸Úp˙$Tú˜\’\Â\Îˆ¨˜±J\ﬁy“ºsu˘\Êpr\'ﬁ´.ˇu@vÄÑ\0TAu˘˝\·|í˘ˇDÇ$kw˘Ωπ\‡\‰é6\„\Íÿß˚\ÈßÕ∞w\»\‚i7N\ÕxrëBî\‘\rˇ™bÚQz\·\≈Z˛æY\\ä\ \Z∞w\›x\‡ æ\ﬂˆ\ÂIøÅäß?æúÅÄid$G\‡\Îk\ƒ\⁄ Éû∂ ôîIêA\–\…¨ı!p!!G\Èıø◊ô9Dç<53Å√†ÇΩyB3]\\$Ωï°ô\Ïù*\‚`\ÀOõ\…\—q\‰\‰ØXX˙D\“\Zl8©:Øú∑R\Œ\0Rx0´ãq$	ø\Îîå\ﬁÛ≤é\“[%\0Ò+J\Zá∫\"}ò=VëC?˚n\Á	ë5\∆å°båS)ÑÜ\Á&Pp∫\‚\«\"1—ΩGmDúb‚†´\ \œ\Ô{r\Áì=é#\—1\‘x\◊+és\‰\‡ww\»¡’±è∞5\⁄\‡6	u\0é¨∏Úá\Ó\ŒE%\—‹àä)0Æ`ª{\\\’≈êbm\Í;’âU)¨\ÀoÉDp$yëù¿Û\Èéå±F=˛?æ¿y|°¯≠ÒVP°\◊zrµ”ívne\È#Fñ≤eô\ﬁŒ¥\'$®Û!e¢\Í©≈î\Â\'ºõÙÖ\…A\n\‡i\Ôë\Ó∑Xà¬öHˆb\«R~˛\∆0e≥b9ÛWµ|±eWòíkÿñO\Ì\r∫°ÖJ+T\€¿∫îBG8\‘—µ\‡\n!–∏-Àï\\{D~Ò§Û\Óò\—ÒáatÅ\\l\»>ßEN∑∞Ø¡\ÈfÔØú\Z\Zoâe\Zr]F>ø¿\ƒ\‰¸Æ\∆˝˙d\«\Ì);\ÂúF$v\‘ƒ∫$\ÎD\÷m\ﬂƒë÷û\’\Â\—¯≤+\ﬂp}é°-w†U\Ã\–CºG¿êF’õ£Ç\…UKì8_”Å\ \0)ıë*dH5KÑ\‡°ü5xnW}fïòúÉV+?%iJ?_Puvv˙\Ï·óè*®<®\Œ=<ú~ı”è\œﬂø˚œ´˜\’\ŸY;fì ñ\Ê†Òj\‡\ŸH^,>YJjJ˜µ2˜•\Á\·≥tLùm QønÑ\œ\Êy¶%ø¯µ`0;¥}2¢KI¥\“\Ï>0U(¡\Â\√\œUT5/Z-©ŒïUu±¨:´î8\‚§Z+%E\÷\…\ÿ\Í^∏ÀΩ|rŸπ|húÀ¢ï∆Ω¥E9r*÷ü|7Ùπ©˜ÇLQ\Â	ìêé0\Âó!ï\◊\ÌÜTZÇ‘úFí\√Ù64/ﬂä%⁄Ö%ä.∞pZ∏	f…§¨\"_é\Ã\◊Û\\H\ﬁS\È(Ñ˝P\Ëh0¡à\…ab\ÃñëôW\ÓF&\¬4gï*¿\Ê\Ã˙≠\‡Ù˚¿â.ƒ∫\¬˙ë¡yc®õA≠\Â+\◊m\0Tß1•b\–\Êï˚AãK†ùU™\0¥\·x˝V\–Ú.\–2∏òFuπ∫xÑ¿\¬x˜a≥˘∂$LìS\ _§qìW\Ó\«\r-\·fV©\‹Ã¨ﬂäõ∞7\»nÑô≤\ B¨0\ÿ\·£\„¶+ãG}∫0Ω¡*åˆï¸´\Ì}tâSww∞z«ú¢\’›ë\ÌC¨\ﬂ\÷\„1\—*T¨\Ï\÷[_\ÊñoE¨\ÏC,`Ü¨JŸïè@€ìßu¨\Œ\Í;òôí\ÊG8˜\ÿ\·\n:Øh\"áö>´r\‰l\Ïö\Ë*L∞\Â;≥|+r\‚\‰6\Ëb˜Å•au@\n\‡¿G\0b\0äêSÄÄs\0zíØm:\'ˇø<Ø_õˇ˛§˘;}\ﬁ\ 	\√<\Ï:fézº¢ÄÛ\Z&-^\—ERäVãW\ÿwïac£\◊X´Pqìº6∑yı´∑ﬁ§\Óã}ãEê¢ã¢M®>{\¬q\œ\“Q\n)™w¥m?\‚\—\Á/V+ï«´\\y±Cpàtç¡Y»æ.¡6\0\›xü\‡AiÇÜ\¬&‹∂n*j\œ!ÛÙ2a3Å\–yÑ,(\"§}Xå±8Q+\‘\n\Â\Á\—f$\Î7\◊U˜}∑\Ëø¸\'˙\≈¯ø\n.fp\‡C¢\„(Védﬁô\"óãˆÛ:uAéS\‹-\ÓlF^3Mvúg=MÒÕÄ\—Õïñ\Õ|3\‡Œó\ bç\€\–i\ﬂ\Ïó/\⁄ˇõ¡¸õ™\‹0ıj\'≠Èµ£õ©•â@\Á#:)\rÕ¨)eh˛´©cKC}jie7Ø]ó©g¶´y˛òñé˜Ò•5i®àw\Zê\ﬁ\"˚h-÷â\rï ØwXæŸΩˆäc®\»Å¯ôuq˛\œ5\–^E¶™8\÷\‹$ªô™≤ôã\≈`C•rd\À7#s_5x\‘⁄ÇÛ∂Ùg\–z‘ìêkl\—KE˘\Â=rÆ£âãâ¨ñVﬁáÒ\≈¬µó˙]Å∑\È\‘ ΩˇÆ-≤Æ◊ë>\Àe\…\0\‡5¯*vòµ\"\—\0¨H»≠˙›úàe\«ÛÉ\„\Ì+ßsïñ\Ó\œ\Õ88\Ô`\Í\Îâ_t—î •Qˇ≤WîtTI∞¶óäøòˇ%ŸìfòÖ!Üˇ©M5ô\Ÿx\Ó3\ƒ##s¸•ó¢§ê\÷\Zõ^æ\Ï\ÊG\…\‹gcoÊëøY\€\Z\⁄ˇ±K\€\Z•\”Xá\›`≤\·;\≈y˚ù\"8JJQu∫\ÈûrWR3Õì;øÆeDó\‰Ü~µoöíîw!$AY±äeDCäe\„\Í,8Zª~\◊zAb§~\r\Ì/äPm7ÑX{Z‡≤óNê`\ËM5vùL`ÆuÄaheµ¶O0ÿØ¸–∞\Ã¶M\„~\’y%é˘\ﬂs\Z¶°\«\◊\ÿ\“P\Èÿä~à≤\÷˘\r\È\÷\›\ÕÙ\Î\— ¶~¯7\”,\ÔcTI(U¨πÉ@:Å\Áño\ ˙\„∂\Ô\€mª\Õa∑9\Ï6á≠[†î∞M¢ıÜ\‘iD\Îo\Ô\Õsß	y†Å\ π\„\“\»ìL~5c\‚≠\ÈÜx#ìoH¡£$tù$ºû&\r\«\◊:j®(\Ãx¶ôì¢¶π$\‹K˛m;H†~˛g£˚y^HFºO”®∫◊†ÒÒ\ÂRBEh_Ö7\ƒ{π\Ê_;\È¢\Z\”<BG\”ˇ÷å£SéJ´Ö∆Ø\Á/M\ÎØ3C∫Åh\À\∆Û\‰π¡∂oHIk˙Xºá3bÄe\·∞∆™\ƒ4∏\—~$]\√\’-e,\ﬂ3®µ%~Úr˜\√\œ\'≠C=6PP∏≠u™ı≥ék+∑>\‹^\”/∂´\Êã\’\«r=\√^÷ÆFÙ1§\’4£RX*S≈òm?*3∫5}\¬¿¨\À¡\Œd0˜X∑`∑\„¯8yKwO€ã\√C\r\Ë£\r\nendstream\nendobj\n59 0 obj\n<<\n/G3 232 0 R\n/G8 233 0 R\n>>\nendobj\n60 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 234 0 R\n>>\n/BBox [0 0 1127 3069]\n/Group 235 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\—3∂¥07µ∞T0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\Ã,ç\Õ,,ísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»x#S33KsÖ¢TÆ4Æ@.W_g.\0ﬁÖ\›\r\nendstream\nendobj\n61 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 236 0 R\n>>\n/BBox [0 0 4405 1457]\n/Group 237 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\’3≥∞∞437R0P0P@Ù\ÃML\ÃM\r,-Ù\ÃÃç\Õ,LísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tss#S3Ö¢TÆ4Æ@.W_g.\0ø≠î\r\nendstream\nendobj\n62 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 238 0 R\n>>\n/BBox [0 0 807 167]\n/Group 239 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù\ÃML\ÃM\r,-Ù,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\Ê$\‰\r\nendstream\nendobj\n63 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 240 0 R\n>>\n/BBox [0 0 807 167]\n/Group 241 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@ÙL\r,\råççÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»pC#s#S3Ö¢TÆ4Æ@.W_g.\0\≈\0û\r\nendstream\nendobj\n64 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 242 0 R\n>>\n/BBox [0 0 807 167]\n/Group 243 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù-MåçM-MÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\„\Ã\ﬁ\r\nendstream\nendobj\n65 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 244 0 R\n>>\n/BBox [0 0 807 167]\n/Group 245 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù,\Ã--,å,Ù,-\Õ\Ã-M\ÕLísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\Â\Ó\ﬂ\r\nendstream\nendobj\n66 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 246 0 R\n>>\n/BBox [0 0 807 167]\n/Group 247 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3313±4≥∞T0P0P@Ù,ååÕç\rL\ÃÙ,-\Õ\Ã-M\ÕLísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tC#s#S3Ö¢TÆ4Æ@.W_g.\0\‚O\⁄\r\nendstream\nendobj\n67 0 obj\n<<\n/Length 104\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 248 0 R\n>>\n/BBox [0 0 4405 1200]\n/Group 249 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\—3≥01212W0P0P@Ù\ÃML\ÃM\r,-Ùååç\råçååísπÙ,L\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»tK#S3Ö¢TÆ4Æ@.W_g.\0∞4o\r\nendstream\nendobj\n68 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 250 0 R\n>>\n/BBox [0 0 1127 485]\n/Group 251 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2‘≥∞∞017µP0P0P@Ù\Õ-ç,\r\Ã\ÕÙ,M,MÃå,,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xSK3#S3Ö¢TÆ4Æ@.W_g.\0\€|\—\r\nendstream\nendobj\n69 0 obj\n<<\n/Length 107\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 252 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 253 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\ÃMMå-MLçísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|CS3#S3Ö¢TÆ4Æ@.W_g.\0ì\r\nendstream\nendobj\n70 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 254 0 R\n>>\n/BBox [0 0 1127 409]\n/Group 255 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\‘3µ42≥∞01Q0P0P@\‚\Íö[\ZY\Zòõ+\Ë[òöõZ*$\ÁrÈôô\Z* à wtë¢t.}wcÖÙb.}«¢íÃ¥\ƒ\‰\'_g.ê˘\Ê\Ê\nF¶f\nE©\\i\\Å\\Ææ\Œ\\\0\‹\r\nendstream\nendobj\n71 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 256 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 257 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\Ã,ç\Õ,,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\ÎÆ\ﬂ\r\nendstream\nendobj\n72 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 258 0 R\n>>\n/BBox [0 0 1127 522]\n/Group 259 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰2\“30636≥4V0P0P@Ù\Õ-ç,\r\Ã\ÕÙ\rç\ÕL\ÃM\ÃísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|SSc#S3Ö¢TÆ4Æ@.W_g.\0\›\Ô\∆\r\nendstream\nendobj\n73 0 obj\n<<\n/Length 107\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 260 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 261 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙåM-\r-\r-,ísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»|CS3#S3Ö¢TÆ4Æ@.W_g.\03\r\nendstream\nendobj\n74 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 262 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 263 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙL-\Õ-\Ã\r\rísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Í\‹\‹\r\nendstream\nendobj\n75 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 264 0 R\n>>\n/BBox [0 0 1127 193]\n/Group 265 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙ,L\rMLLåísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Á∂\”\r\nendstream\nendobj\n76 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 266 0 R\n>>\n/BBox [0 0 1127 192]\n/Group 267 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰\“3717µ021Q0P0P@Ù\Õ-ç,\r\Ã\ÕÙL,åLMå-MísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xCS3#S3Ö¢TÆ4Æ@.W_g.\0\Îr\ﬁ\r\nendstream\nendobj\n77 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 268 0 R\n>>\n/BBox [0 0 2658 236]\n/Group 269 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰“≥4433065W0P0P@Ù\Ã-Lç\rå\ÃÙÃçç\Õ\ÕÕçísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»t#K#S3Ö¢TÆ4Æ@.W_g.\0\À2®\r\nendstream\nendobj\n78 0 obj\n<<\n/Length 106\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 270 0 R\n>>\n/BBox [0 0 2658 220]\n/Group 271 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰“≥0571157R0P0P@Ù\Ã-Lç\rå\ÃÙ\ÃMMå-MLçísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»xcK#S3Ö¢TÆ4Æ@.W_g.\0\È>\ﬁ\r\nendstream\nendobj\n79 0 obj\n<<\n/Length 105\n/Type /XObject\n/Subtype /Form\n/Resources <<\n/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]\n/ExtGState 272 0 R\n>>\n/BBox [0 0 2658 236]\n/Group 273 0 R\n/Filter /FlateDecode\n>>\nstream\r\nxú+\‰“≥4433065W0P0P@Ù\Ã-Lç\rå\ÃÙ,å\r\Õ-\Ã\r\rísπÙ\ÃL\rDê;∫HQ:óæª±Bz1óæcQIfZbrâÇìØ3\»t#K#S3Ö¢TÆ4Æ@.W_g.\0\ Ûß\r\nendstream\nendobj\n80 0 obj\n<<\n/F5 274 0 R\n/F6 275 0 R\n>>\nendobj\n81 0 obj\n<<\n/Length 2449\n/Filter /FlateDecode\n>>\nstream\r\nxú\Ì\\[è∑\r6ê∑\”˛Ö\0Ûê\÷N\nkyïD¿0\ﬂ\‘n\‹l?Ù•p\Í†í¿é˚ˇ\Õı\\Üsf¥k¯í80∞+KE}§>Qúº\ﬁbkˇ4\–@s{ˇ◊å)ö\Â\ÊÂèª◊ªãØﬂº˝œ´Ω|\€\‹{zWzG\0hòì6o˛Ω˚\Ó´\›OªáO\Ô\Ô^\Ô8 i+o˙\È\Âè;l\ {\‹ˇ\Êá\›\≈cn~¯eF2\ZAÉê°H~’ä}æ{˛~ï\Ë¿ò`2nP9D\0\„\‘ Rêâr\√SHñqT\Áı\€…±¡òÀ®¢FiÄ¢F˜√§FQ˛Pïã\“<¯ŸµÅßêUr8kó\ŸÒK\ZN\ÔrwÒH\“¿\‹\\æ\Í\◊z\„¿î\À\"\ÕÂèª[7“ó\Õ\Âw(êÄ\Zh.ø\ﬂ\›∂x∑¸K\n1A,\⁄]~\Ô∏u#w\Ì9õ¶±˚E\◊\Ã%≤Q⁄©k∑êHS¥°˘≥∂9M\∆)é\¬7k˘\«nÄKY≤\‚\–Üvç<N˚\œ[\„92p:ú¯\·\Â\\##n∑[+Oz˙Ç\‚ú 5NÇn\›¿VÇ†Üí\‚®ˇóÉô\r \Â$áf&®9\‚h\Ì∫«êt¥2tù9\‰å8\ŸÚãÆs\ní\ƒ¯\»\¬1 \≈\ﬁ`\”Js\‡,f\“Kπ`zwVgI˛0(òòeY\«8ZEÅ4Ú%ùEIüz\Ô´(:ˆæ9xBíú\“\∆0+	¶C\Ÿ\rñ.Pà˘qåI5\Ê⁄•ˆCF\Õgïüü˜÷ç\œk\'¶ \–\‚=9ŒâÉﬂ¨êØ\Z\⁄\ÿG\ÿmrHÑyéº∏Úßa\œcéFG∏â(ô\nû¡ˆâ\¬xVGä7)™ì\‰Lz^~$4Dç\∆1Vû\0ûò/*v0•ı§Ú	o‡ºäæ∞yΩˆ^\–FØe\n≠\”R\‹\ \”\':ßîá(\œ¸Ûv¶öêê´¢\ \‘c\ Û\ﬁ\›ÒÖ¿òjótª\«Bäíçb-v<\Â\Áw|S?\€,g~´ñ7v\€öÖém±ı;∏\—\r=Tz°b≥\rºM\Ÿ\Ë\Ëá:\Ÿ¨†:∑ïxt÷ûPÖ_=Èºπ\œ\Ë\‰\›0:•ê:≤/∂\»\È\Êu8\›\Ï˛mßÜ\Œ]bôÜ\\ïë\œp19?´≥ŒÇ>ØÿΩ,!K9Fb\Z®â∑Iﬁäº›æé%ùªVøóK\√\√\À!}#\Ì:$i#YBÑƒ±©B\—8©\ÿ\\˙F0óQõÛ7i13i\‘%`0u*µ\'\rc\0∞siúc1Kyú<ó\n\0@Y4s¢,`.\“@É2p\—\‡\€ı\Îh8X\Èu.¢KF=°\ÊŒùãß˜ˇ¸†Å\Ê\Ó\›\ÊﬁÉ˚ªãg?ˇÙ\Ì\€7ˇ{˘∂πsßoÛiô\ƒn°\È8Æ§S\√\›J≥∂\Œ\Îqâwzap(®ß£\r∂Å§1Ûy#|5\œ|=˘õ\Ô/\◊D7J`\¬`sìã∞\n55î≈ÉxAû\rsÅ\¬\÷äI©H,\ÁV©∏\…¡k\›´‹ã-\Áb\Ìú\À#∫ŒæÙiB\n9&8	Ω¶\“u\›`\‚!™ò–ÇÇù`äó!U\∆UC\na	Ss*\≈ß\◊¡\Èt¯Z0Qò(ï8\·iaK(∏Yúmè\€\‚ë{°üã\…5…óç∏ür/&\—ö	2Uó°YF\÷Có†9´\‘lŒå_NÆ\'Mm\“˜=ÉÛ\⁄rb◊ÉZ\œWÆZ\Ã!\'≥Õ†-#\ÎAKK†ùUjhg∆Ø≠TÅV $€ã®\À	\œnåw\Ôˆ8_w\n£ÖL\Âë|#n\ \»z\‹nfï⁄ÄõôÒkq£U∏A	{ò\ŸvEYà˝\ﬂx\Î∏\Ód\Á\…ƒõ^S\\orµ\‰^Fà1¢\—,`å\Ë^F †:»Æ¨;°\ƒ)òò\Ó\◊¡H\Ê b	èêª_Sn(5πxÅZ°Qó\È9_ 47|≠\≈:\',^îc\ÁEgû\ ÷ü\ÁN Ù\Ícxæ´ªıdf≤\\2\‚F\Z4ú—´û*C\Í∞W\"g_\'m\–`Õ≠zf¯Z\‰§5»ëC\ÿ`H\√3TG4Å2\0G\0N\0$\0î†úb\0\0˜\0\ËQŸ∂\√>\Â\ﬂJøql˘˝Q˜;}\›\À—©\r\ÓuE\'ïp)B\‡¨Öp)$ îºB∏°n+ó”©ÛZi#\›y∫∫nΩv\'s]Q4n™C\Ÿ4	µk7‹Ø\Ï:9\’6\Â`˙\‚®ëÀªﬁôl\Ë1}_¨£ú\‚\0]°år<πÆñ≤@\◊^Mπá ´B\–ThŸÖÉ\ﬂ\n-W%\⁄Áêà\Â\—90%å†\ÍA¡Í∞∏ú\Óu\‘\“V°rc[ç\ƒi¸\Í\\o\›[\ XaÙ´/èx~.¿jt\Z\Â¿;#E\ÍéHZL˙::\rAN,≠Ü\÷$`5≤ä\«\‰¿y\Œì\'|S1\Õ%˘≥öo*¶∫X\Ãm::U\Õq¯¢˝øôÃø*Òá^bo˙<\–M\Îib†{{t2v4≥•î\⁄˝m©cOC\ŸzZ9Ù\Î\«\ÍY\Ëj\ÈøOK˜\Á\·Å“∫44FYQ6\‹\'b¨£¥òtT⁄æΩ\”\’\ÓUóªN\⁄^êÒÅ’∫~te\∆\«\»\Ã9…•îx52séu\»\\\Ã3:*mG\Ê4|52\Î\‘{U≥=8+ö˝\0äf{Ñ+@àòï\ QBb¢¶|Ggnà%DÖ\»sWÄvP óSìÆZm™|U2pN\ƒj®\◊\Â‘ô$¥\ÏY˙Ñ†ó\ﬂs\¬\“¸ï|a\ÔΩ8∂1{b∂ú	Zz5Dé∞Q\»)dM\÷p\Í3\¬\Âí^,>\·s	\„¯Uê}\¬ \ÍÚ\√“îÜ	ü\‹°≥\Œﬂµ\Õ)î/Òt*\·˚¶SëÉ™Eõˇ\“)dmT˝›îTé˝Líf•LV|\‡,\‘˘\…–ù¿\Ãpv\÷d2.Èª∂=T\ #±˚{\◊≥Å\¬\ÿ˛bˇ#V\‚Ò\Õ\‡\—(^3Lõ\ÁH?ê¢27k∂=öπ\¬SM\Â(æ∏®úõı¿d\ÏåtØ˚sGº≥QéiˆA£≥\÷WÙldí á˘\'*¨ü\€kG¡\«{V4û¸\‘[ø#\›€ªŸÖ˛uÆÒ˜~üWˆHF[Ç\—\ÂµOF¥¸\ÿ\Ëj\’~ıπ\Ê\√˚9	´)F™´Qjs6ïY\‚\Â˜\Íµ1ız\Íê?ˆh›ö8d.Oˆ(¥¶\ \∆Úã®´VÖE¨\∆w\›k\Ze\rd1\Á≥\⁄\›N\Ôï|s\Í\„z\ﬂ\œWø|\n§~\Œ;Tã\'à\‰Jˆ>ç\ﬂ\Ã\ﬁ\Ìä\Ï˝\”-©\€˛ù°w\–¡8.?´ü\¬8ÙE\‚˝ı4û\'∫~@\„¡‰åî54~oπ$kØ›õu\rç«â æòˇ\—\\Å\≈OBº97Z`ü\ƒL\ﬂ:≥~d$~2Ó≥≥˛\"˜që¯Ω{\Ôç\‚\ÍÛ\›ˇTùö¸\r\nendstream\nendobj\n82 0 obj\n<<\n/Type /StructElem\n/S /Part\n/P 12 0 R\n/Pg 9 0 R\n/K [98 0 R 100 0 R 102 0 R 103 0 R 99 0 R 97 0 R 96 0 R 101 0 R 95 0 R 85 0 R\n86 0 R 90 0 R 87 0 R 88 0 R 89 0 R 276 0 R 107 0 R 104 0 R 106 0 R 105 0 R]\n>>\nendobj\n83 0 obj\n<<\n/Type /StructElem\n/S /Part\n/P 12 0 R\n/Pg 10 0 R\n/K [117 0 R 119 0 R 121 0 R 122 0 R 118 0 R 116 0 R 115 0 R 120 0 R 114 0 R 108 0 R\n109 0 R 113 0 R 110 0 R 111 0 R 112 0 R 123 0 R 124 0 R]\n>>\nendobj\n84 0 obj\n<<\n/Type /StructElem\n/S /Part\n/P 12 0 R\n/Pg 11 0 R\n/K [134 0 R 136 0 R 138 0 R 139 0 R 135 0 R 133 0 R 132 0 R 137 0 R 131 0 R 125 0 R\n126 0 R 130 0 R 127 0 R 128 0 R 129 0 R 144 0 R 141 0 R 142 0 R 143 0 R 140 0 R]\n>>\nendobj\n85 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (TARJETAS DE NAVEGACION)\n/E (TARJETAS DE NAVEGACION)\n/Pg 9 0 R\n/K [0]\n>>\nendobj\n86 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (COMENTARIOS)\n/E (COMENTARIOS)\n/Pg 9 0 R\n/K [1]\n>>\nendobj\n87 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (INFO ACUDIENTE)\n/E (INFO ACUDIENTE)\n/Pg 9 0 R\n/K [2]\n>>\nendobj\n88 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (INFO ESTUDIANTE)\n/E (INFO ESTUDIANTE)\n/Pg 9 0 R\n/K [3]\n>>\nendobj\n89 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (DOCUMENTOS)\n/E (DOCUMENTOS)\n/Pg 9 0 R\n/K [4]\n>>\nendobj\n90 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T <415349474E414349D34E204355504F>\n/E <415349474E414349D34E204355504F>\n/Pg 9 0 R\n/K [5]\n>>\nendobj\n91 0 obj\n<<\n/Type /StructElem\n/S /H1\n/P 277 0 R\n/T (FECHA)\n/E (FECHA)\n/Pg 9 0 R\n/K [6]\n>>\nendobj\n92 0 obj\n<<\n/Type /StructElem\n/S /H1\n/P 278 0 R\n/T (COMENTARIO)\n/E (COMENTARIO)\n/Pg 9 0 R\n/K [7]\n>>\nendobj\n93 0 obj\n<<\n/Type /StructElem\n/S /H1\n/P 279 0 R\n/T (INTRERNO)\n/E (INTRERNO)\n/Pg 9 0 R\n/K [8]\n>>\nendobj\n94 0 obj\n<<\n/Type /StructElem\n/S /H1\n/P 280 0 R\n/T (USUARIO)\n/E (USUARIO)\n/Pg 9 0 R\n/K [9]\n>>\nendobj\n95 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (RESOLUCION)\n/E (RESOLUCION)\n/Pg 9 0 R\n/K [10]\n>>\nendobj\n96 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (ESTADO \\(LISTA DESPLEGABLE\\))\n/E (ESTADO \\(LISTA DESPLEGABLE\\))\n/Pg 9 0 R\n/K [11]\n>>\nendobj\n97 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (ID NOMBRE)\n/E (ID NOMBRE)\n/Pg 9 0 R\n/K [12]\n>>\nendobj\n98 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (TITULO TICKET)\n/E (TITULO TICKET)\n/Pg 9 0 R\n/K [13]\n>>\nendobj\n99 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T <444553435249504349D34E>\n/E <444553435249504349D34E>\n/Pg 9 0 R\n/K [14]\n>>\nendobj\n100 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (ID)\n/E (ID)\n/Pg 9 0 R\n/K [15]\n>>\nendobj\n101 0 obj\n<<\n/Type /StructElem\n/S /P\n/P 82 0 R\n/E (FECHA CIERRE \\(VACIA POR DEFECTO\\))\n/Pg 9 0 R\n/K [16]\n>>\nendobj\n102 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (FECHA APERTURA)\n/E (FECHA APERTURA)\n/Pg 9 0 R\n/K [17]\n>>\nendobj\n103 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (PUNTAJE PRIORIDAD)\n/E (PUNTAJE PRIORIDAD)\n/Pg 9 0 R\n/K [18]\n>>\nendobj\n104 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (CUADRO DE TEXTO PARA NUEVO COMENTARIO)\n/E (CUADRO DE TEXTO PARA NUEVO COMENTARIO)\n/Pg 9 0 R\n/K [19]\n>>\nendobj\n105 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (AGREGAR COMENTAIO)\n/E (AGREGAR COMENTAIO)\n/Pg 9 0 R\n/K [20]\n>>\nendobj\n106 0 obj\n<<\n/Type /StructElem\n/S /H3\n/P 82 0 R\n/T (INTERNO \\(check box\\))\n/E (INTERNO \\(check box\\))\n/Pg 9 0 R\n/K [21]\n>>\nendobj\n107 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 82 0 R\n/T (COMENTARIO)\n/E (COMENTARIO)\n/Pg 9 0 R\n/K [22]\n>>\nendobj\n108 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (TARJETAS DE NAVEGACION)\n/E (TARJETAS DE NAVEGACION)\n/Pg 10 0 R\n/K [0]\n>>\nendobj\n109 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (COMENTARIOS)\n/E (COMENTARIOS)\n/Pg 10 0 R\n/K [1]\n>>\nendobj\n110 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (INFO ACUDIENTE)\n/E (INFO ACUDIENTE)\n/Pg 10 0 R\n/K [2]\n>>\nendobj\n111 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (INFO ESTUDIANTE)\n/E (INFO ESTUDIANTE)\n/Pg 10 0 R\n/K [3]\n>>\nendobj\n112 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (DOCUMENTOS)\n/E (DOCUMENTOS)\n/Pg 10 0 R\n/K [4]\n>>\nendobj\n113 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T <415349474E414349D34E204355504F>\n/E <415349474E414349D34E204355504F>\n/Pg 10 0 R\n/K [5]\n>>\nendobj\n114 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (RESOLUCION)\n/E (RESOLUCION)\n/Pg 10 0 R\n/K [6]\n>>\nendobj\n115 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (ESTADO \\(LISTA DESPLEGABLE\\))\n/E (ESTADO \\(LISTA DESPLEGABLE\\))\n/Pg 10 0 R\n/K [7]\n>>\nendobj\n116 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (ID NOMBRE)\n/E (ID NOMBRE)\n/Pg 10 0 R\n/K [8]\n>>\nendobj\n117 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (TITULO TICKET)\n/E (TITULO TICKET)\n/Pg 10 0 R\n/K [9]\n>>\nendobj\n118 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T <444553435249504349D34E>\n/E <444553435249504349D34E>\n/Pg 10 0 R\n/K [10]\n>>\nendobj\n119 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (ID)\n/E (ID)\n/Pg 10 0 R\n/K [11]\n>>\nendobj\n120 0 obj\n<<\n/Type /StructElem\n/S /P\n/P 83 0 R\n/E (FECHA CIERRE \\(VACIA POR DEFECTO\\))\n/Pg 10 0 R\n/K [12]\n>>\nendobj\n121 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (FECHA APERTURA)\n/E (FECHA APERTURA)\n/Pg 10 0 R\n/K [13]\n>>\nendobj\n122 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 83 0 R\n/T (PUNTAJE PRIORIDAD)\n/E (PUNTAJE PRIORIDAD)\n/Pg 10 0 R\n/K [14]\n>>\nendobj\n123 0 obj\n<<\n/Type /StructElem\n/S /H3\n/P 83 0 R\n/T <507265666572656E63696173207920417369676E616369F36E20286D69736D6120657374727563747572612071756520656E207469636B65742064657461696C29>\n/E <507265666572656E63696173207920417369676E616369F36E20286D69736D6120657374727563747572612071756520656E207469636B65742064657461696C29>\n/Pg 10 0 R\n/K [15]\n>>\nendobj\n124 0 obj\n<<\n/Type /StructElem\n/S /H3\n/P 83 0 R\n/T <507265666572656E63696173207920417369676E616369F36E20286D69736D6120657374727563747572612079206461746F732071756520656E207469636B65742064657461696C2C207065726F20657374612076657A206C6F732063616D706F7320736F6E206C6973746120646573706C656761626C65732C20636F6E20756E2063616D706F20616C2066696E616C206C6C616D61646F206375706F29>\n/E <507265666572656E63696173207920417369676E616369F36E20286D69736D6120657374727563747572612079206461746F732071756520656E207469636B65742064657461696C2C207065726F20657374612076657A206C6F732063616D706F7320736F6E206C6973746120646573706C656761626C65732C20636F6E20756E2063616D706F20616C2066696E616C206C6C616D61646F206375706F29>\n/Pg 10 0 R\n/K [16]\n>>\nendobj\n125 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (TARJETAS DE NAVEGACION)\n/E (TARJETAS DE NAVEGACION)\n/Pg 11 0 R\n/K [0]\n>>\nendobj\n126 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (COMENTARIOS)\n/E (COMENTARIOS)\n/Pg 11 0 R\n/K [1]\n>>\nendobj\n127 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (INFO ACUDIENTE)\n/E (INFO ACUDIENTE)\n/Pg 11 0 R\n/K [2]\n>>\nendobj\n128 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (INFO ESTUDIANTE)\n/E (INFO ESTUDIANTE)\n/Pg 11 0 R\n/K [3]\n>>\nendobj\n129 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (DOCUMENTOS)\n/E (DOCUMENTOS)\n/Pg 11 0 R\n/K [4]\n>>\nendobj\n130 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T <415349474E414349D34E204355504F>\n/E <415349474E414349D34E204355504F>\n/Pg 11 0 R\n/K [5]\n>>\nendobj\n131 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (RESOLUCION)\n/E (RESOLUCION)\n/Pg 11 0 R\n/K [6]\n>>\nendobj\n132 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (ESTADO \\(LISTA DESPLEGABLE\\))\n/E (ESTADO \\(LISTA DESPLEGABLE\\))\n/Pg 11 0 R\n/K [7]\n>>\nendobj\n133 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (ID NOMBRE)\n/E (ID NOMBRE)\n/Pg 11 0 R\n/K [8]\n>>\nendobj\n134 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (TITULO TICKET)\n/E (TITULO TICKET)\n/Pg 11 0 R\n/K [9]\n>>\nendobj\n135 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T <444553435249504349D34E>\n/E <444553435249504349D34E>\n/Pg 11 0 R\n/K [10]\n>>\nendobj\n136 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (ID)\n/E (ID)\n/Pg 11 0 R\n/K [11]\n>>\nendobj\n137 0 obj\n<<\n/Type /StructElem\n/S /P\n/P 84 0 R\n/E (FECHA CIERRE \\(VACIA POR DEFECTO\\))\n/Pg 11 0 R\n/K [12]\n>>\nendobj\n138 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (FECHA APERTURA)\n/E (FECHA APERTURA)\n/Pg 11 0 R\n/K [13]\n>>\nendobj\n139 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (PUNTAJE PRIORIDAD)\n/E (PUNTAJE PRIORIDAD)\n/Pg 11 0 R\n/K [14]\n>>\nendobj\n140 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (SUBIR ARCHIVOP)\n/E (SUBIR ARCHIVOP)\n/Pg 11 0 R\n/K [15]\n>>\nendobj\n141 0 obj\n<<\n/Type /StructElem\n/S /H3\n/P 84 0 R\n/T (SUBIR DOCUMENTO \\(misma estructura que en ticket detail\\))\n/E (SUBIR DOCUMENTO \\(misma estructura que en ticket detail\\))\n/Pg 11 0 R\n/K [16]\n>>\nendobj\n142 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (TIPO DE DOCUMENTO)\n/E (TIPO DE DOCUMENTO)\n/Pg 11 0 R\n/K [17]\n>>\nendobj\n143 0 obj\n<<\n/Type /StructElem\n/S /H2\n/P 84 0 R\n/T (SELECCIONAR ARCHIVO)\n/E (SELECCIONAR ARCHIVO)\n/Pg 11 0 R\n/K [18]\n>>\nendobj\n144 0 obj\n<<\n/Type /StructElem\n/S /H3\n/P 84 0 R\n/T (DOCUMENTOS  \\(misma estructura que en ticket detail\\))\n/E (DOCUMENTOS  \\(misma estructura que en ticket detail\\))\n/Pg 11 0 R\n/K [19]\n>>\nendobj\n145 0 obj\n<<\n/Title (ID)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 14 0 R\n/Next 281 0 R\n>>\nendobj\n146 0 obj\n<<\n/Title (INTRERNO)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 282 0 R\n/Next 15 0 R\n>>\nendobj\n147 0 obj\n<<\n/Title (COMENTARIO)\n/Dest [9 0 R /Fit]\n/Parent 15 0 R\n/Next 283 0 R\n>>\nendobj\n148 0 obj\n<<\n/Title (SUBIR ARCHIVOP)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 284 0 R\n>>\nendobj\n149 0 obj\n<<\n/ca 1\n/BM /Normal\n>>\nendobj\n150 0 obj\n<<\n/CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 2\n/ML 4\n/SA true\n/BM /Normal\n>>\nendobj\n151 0 obj\n<<\n/CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 4\n/ML 4\n/SA true\n/BM /Normal\n>>\nendobj\n152 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n153 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n154 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n155 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n156 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n157 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n158 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n159 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n160 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n161 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n162 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n163 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n164 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n165 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n166 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n167 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n168 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n169 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n170 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n171 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n172 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n173 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n174 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n175 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n176 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n177 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n178 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n179 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n180 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n181 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n182 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n183 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n184 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n185 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n186 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n187 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n188 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n189 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n190 0 obj\n<<\n/G3 149 0 R\n>>\nendobj\n191 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n192 0 obj\n<<\n/Type /Font\n/Subtype /Type0\n/BaseFont /AAAAAA+OpenSans-Regular\n/Encoding /Identity-H\n/DescendantFonts [285 0 R]\n/ToUnicode 286 0 R\n>>\nendobj\n193 0 obj\n<<\n/Type /Font\n/Subtype /Type0\n/BaseFont /BAAAAA+OpenSans-Bold\n/Encoding /Identity-H\n/DescendantFonts [287 0 R]\n/ToUnicode 288 0 R\n>>\nendobj\n194 0 obj\n<<\n/ca 1\n/BM /Normal\n>>\nendobj\n195 0 obj\n<<\n/CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 2\n/ML 4\n/SA true\n/BM /Normal\n>>\nendobj\n196 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n197 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n198 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n199 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n200 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n201 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n202 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n203 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n204 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n205 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n206 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n207 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n208 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n209 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n210 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n211 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n212 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n213 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n214 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n215 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n216 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n217 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n218 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n219 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n220 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n221 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n222 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n223 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n224 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n225 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n226 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n227 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n228 0 obj\n<<\n/G3 194 0 R\n>>\nendobj\n229 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n230 0 obj\n<<\n/Type /Font\n/Subtype /Type0\n/BaseFont /AAAAAA+OpenSans-Regular\n/Encoding /Identity-H\n/DescendantFonts [289 0 R]\n/ToUnicode 290 0 R\n>>\nendobj\n231 0 obj\n<<\n/Type /Font\n/Subtype /Type0\n/BaseFont /BAAAAA+OpenSans-Bold\n/Encoding /Identity-H\n/DescendantFonts [291 0 R]\n/ToUnicode 292 0 R\n>>\nendobj\n232 0 obj\n<<\n/ca 1\n/BM /Normal\n>>\nendobj\n233 0 obj\n<<\n/CA 1\n/ca 1\n/LC 0\n/LJ 0\n/LW 2\n/ML 4\n/SA true\n/BM /Normal\n>>\nendobj\n234 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n235 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n236 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n237 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n238 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n239 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n240 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n241 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n242 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n243 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n244 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n245 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n246 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n247 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n248 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n249 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n250 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n251 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n252 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n253 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n254 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n255 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n256 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n257 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n258 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n259 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n260 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n261 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n262 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n263 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n264 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n265 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n266 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n267 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n268 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n269 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n270 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n271 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n272 0 obj\n<<\n/G3 232 0 R\n>>\nendobj\n273 0 obj\n<<\n/Type /Group\n/S /Transparency\n/I true\n>>\nendobj\n274 0 obj\n<<\n/Type /Font\n/Subtype /Type0\n/BaseFont /AAAAAA+OpenSans-Regular\n/Encoding /Identity-H\n/DescendantFonts [293 0 R]\n/ToUnicode 294 0 R\n>>\nendobj\n275 0 obj\n<<\n/Type /Font\n/Subtype /Type0\n/BaseFont /BAAAAA+OpenSans-Bold\n/Encoding /Identity-H\n/DescendantFonts [295 0 R]\n/ToUnicode 296 0 R\n>>\nendobj\n276 0 obj\n<<\n/Type /StructElem\n/S /Table\n/P 82 0 R\n/Pg 9 0 R\n/K [297 0 R 298 0 R 299 0 R 300 0 R 301 0 R 302 0 R 303 0 R]\n>>\nendobj\n277 0 obj\n<<\n/Type /StructElem\n/S /TH\n/P 297 0 R\n/A [304 0 R 0]\n/K 91 0 R\n>>\nendobj\n278 0 obj\n<<\n/Type /StructElem\n/S /TH\n/P 297 0 R\n/A [305 0 R 0]\n/K 92 0 R\n>>\nendobj\n279 0 obj\n<<\n/Type /StructElem\n/S /TH\n/P 297 0 R\n/A [306 0 R 0]\n/K 93 0 R\n>>\nendobj\n280 0 obj\n<<\n/Type /StructElem\n/S /TH\n/P 297 0 R\n/A [307 0 R 0]\n/K 94 0 R\n>>\nendobj\n281 0 obj\n<<\n/Title (FECHA APERTURA)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 145 0 R\n/Next 308 0 R\n>>\nendobj\n282 0 obj\n<<\n/Title (COMENTARIO)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 309 0 R\n/Next 146 0 R\n>>\nendobj\n283 0 obj\n<<\n/Title (CUADRO DE TEXTO PARA NUEVO COMENTARIO)\n/Dest [9 0 R /Fit]\n/Parent 15 0 R\n/Prev 147 0 R\n/First 310 0 R\n/Last 310 0 R\n/Count -1\n/Next 311 0 R\n>>\nendobj\n284 0 obj\n<<\n/Title (SELECCIONAR ARCHIVO)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 312 0 R\n/Next 148 0 R\n>>\nendobj\n285 0 obj\n<<\n/Type /Font\n/FontDescriptor 313 0 R\n/BaseFont /AAAAAA+OpenSans-Regular\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo 314 0 R\n/W [0 [600.09766 0 0 259.76563]\n 11 12 295.89844 36 [632.8125 647.94922 630.85938 729.00391 556.15234 516.11328 728.02734 737.79297 0 267.08984\n613.76953 519.04297 902.83203 753.90625 778.80859 602.05078 0 618.16406 548.82813 553.22266\n728.02734 595.21484 0 577.14844]\n 69 [612.79297 476.07422 0 561.03516 0 0 613.76953 0 0 524.90234\n0 0 0 604.00391]\n 91\n[523.92578]\n 149 [778.80859]\n 918 [278.80859]\n]\n/DW 0\n>>\nendobj\n286 0 obj\n<<\n/Length 321\n/Filter /FlateDecode\n>>\nstream\r\nxú]í\…nÉ0Ü\Ô~\nõCd\«,\rBJ†H∫®4@\ÏÅZ*\∆2ŒÅ∑Ø\–D\Í¡ñ>\œˆœåY\ŸTç—û≤7\…<\ÌµQ\Ê\È\Ê$\–+⁄êÉ†JKøQ∏\Â\ÿY\¬ ¶jó\Ÿ\√ÿò~\"yN)˚ÑA\œ\ﬁ-ÙÈ§¶+\Ï{w\nú6}∫îÌé∞ˆf\Ìå`<\Â§(®Çû∞Úµ≥o\›îÖ∞}£¿x\Ìó˝•l_ã*PçúÃ∂ì\‡:3\0\…9Áº†y]\◊uA¿®ˆ£ÆΩ¸\Ó\\é\nös.x±Rtî\≈\«@iÇÑ∂t≥Ω ù%©FB\œgÙÃí@U¥Rî•Å\‚,®\€t$™M`\n^¢:\Ã$b$¥\≈|¨E\ÿG|\¬>∞fîa;%\„cå\nR±)¿ö\Î®÷ï\ﬁ˜ oŒÅÒa\Ôaˆ\Î‘µÅ˚◊∞ì]£\÷ÛÅÛ£(\r\nendstream\nendobj\n287 0 obj\n<<\n/Type /Font\n/FontDescriptor 315 0 R\n/BaseFont /BAAAAA+OpenSans-Bold\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo 316 0 R\n/W [0 [600.09766 0 0 259.76563]\n 29 [285.15625]\n 36 [689.94141 671.875 637.20703 740.23438 560.05859 548.82813 0 765.13672 0 0\n664.0625 564.94141 942.87109 812.98828 795.89844 0 0 660.15625 550.78125 579.10156\n755.85938]\n 149 [795.89844]\n 918 [331.05469]\n]\n/DW 0\n>>\nendobj\n288 0 obj\n<<\n/Length 291\n/Filter /FlateDecode\n>>\nstream\r\nxú]ëKn\√ Ü˜úÇe≤à¿êT±dYJ\ÏZÚ¢\’\ÕªH5Fò,|˚ä!M•.\0}Û¯gòaU[∑\÷\ \ﬁ˝¨:t0V{X\ÊõW@Ø0\ZK2AµQ\·Nx´©wÑUm›≠KÄ©µ\√LäÇRˆ£YÇ_\È\Ê§\Á+l	{Û\Zº±#\›\\™nKXws\Ó&∞ÅrRñT\√@Xı“ª\◊~\ 0m\◊j∞¡Ñuw©∫øà\œ\’\»Y\ÍF\Õ\Z\◊+ΩÅús^“¢iö¶$`ı?ˇ!e]ı\’{åñ%-8ºåî\’HÚÑ$\ŒH˚#R~@™e$ô?%_éU\ÓzÚW˝—å\ÿ\'˘<EgI˜9U\…xF£LÚÚà\œA\‹uìR¸H¯cJ\Í\Ê=ÿÄ[¡\…ƒôè≈π\Ÿ≈¨x~\0óè\Ÿ\r\nendstream\nendobj\n289 0 obj\n<<\n/Type /Font\n/FontDescriptor 317 0 R\n/BaseFont /AAAAAA+OpenSans-Regular\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo 318 0 R\n/W [0 [600.09766 0 0 259.76563]\n 11 12 295.89844 15 [245.11719]\n 36 [632.8125 647.94922 630.85938 729.00391 556.15234 516.11328 728.02734 737.79297 0 267.08984\n613.76953 519.04297 902.83203 753.90625 778.80859 602.05078 0 618.16406 548.82813 553.22266\n728.02734 595.21484]\n 68\n[556.15234 612.79297 476.07422 612.79297 561.03516 338.86719 547.85156 0 252.92969 0\n524.90234 252.92969 930.17578 613.76953 604.00391 612.79297 612.79297 408.20313 477.05078 353.02734\n613.76953 500.97656 0 0 503.90625 467.77344]\n 149 [778.80859]\n 181 [604.00391]\n 918 [278.80859]\n]\n/DW 0\n>>\nendobj\n290 0 obj\n<<\n/Length 323\n/Filter /FlateDecode\n>>\nstream\r\nxú]í\ÀnÉ0E˜˛\n/ìEdáWäÑê(ã>Tö f†ñä±å≥\‡\Ô+fÚê∫0\÷ﬂôπöAuY\Ìπ¯tìj¿Û^õ\Œ¡<]ù~ÅA∂xßïø~\’\ÿZ&ä∫lñ\Ÿ\√Xõ~bY∆π¯ÇA\œ\ﬁ-|s\Ï¶lô¯p8mæ9Õñâ\Êj\Ì/å`<ó,\œy=\≈[k\ﬂ\€∏¿¥]›ÅÒ\⁄/ªs\—<ﬂã \Ô…çö:òm´¿µf\0ñI)eŒ≥™™™úÅ\È˛Ω\'îu\È\’O\ÎP\Ê<ì2ê9RET ERí\"•1R\"ùà*§0Mê¢{ﬁ™ÓΩû\÷N(ìT7x¡JADDo—ûÇ%RH\Ó¢#C\Í¶x\≈ôå\ÓÙJ\È\—+IHôú0S€òJ\Ó^\…\›:™u•è=®´s`<\ÓgøN]x¸\Zv≤k\÷z˛\0MÖ£p\r\nendstream\nendobj\n291 0 obj\n<<\n/Type /Font\n/FontDescriptor 319 0 R\n/BaseFont /BAAAAA+OpenSans-Bold\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo 320 0 R\n/W [0 [600.09766 0 0 259.76563]\n 29 [285.15625]\n 36 [689.94141 671.875 637.20703 740.23438 560.05859 548.82813]\n 46 [664.0625 564.94141 942.87109 812.98828 795.89844 0 0 660.15625 550.78125 579.10156]\n 149 [795.89844]\n918 [331.05469]\n]\n/DW 0\n>>\nendobj\n292 0 obj\n<<\n/Length 284\n/Filter /FlateDecode\n>>\nstream\r\nxú]ë\Õj\ƒ Ä\Ô>\≈wãFw[!∞M\Z»°?4\›Htí\nç\„ÚˆE\›n°ïoú˘FZµuk¥˙\ÓŸ°áQ\Âp]ÆN\"8iC2JK£∏Àπ∑ÑVm\›m´«π5\„BäÄ~\‡§W\Ô6ÿù\’2\‡û\–7ß\–i3¡\ÓRu{Bª´µ\ﬂ8£Ò¿HYÇ¬ë\–Í•∑Ø˝å@cŸ°Uhºˆ\€\·RuüõE\‡ë≥‘ç\\Æ∂ó\Ëz3!)c¨Ñ¢iö¶$h‘ø˚c™\ZF˘’ªò-J(\„¨î’ë\ƒ9R~äTã@\"àtÃ£˜føæ˚Û¸òÑy\ Œ¢â?\'/O¡ßI/\„q\‚7o2Ö\÷√à\ÔsëW\Á\–¯¯qa\n\⁄\‡˝´\ÏbCUX?%xç\r\nendstream\nendobj\n293 0 obj\n<<\n/Type /Font\n/FontDescriptor 321 0 R\n/BaseFont /AAAAAA+OpenSans-Regular\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo 322 0 R\n/W [0 [600.09766 0 0 259.76563]\n 11 12 295.89844 36 [632.8125 647.94922 630.85938 729.00391 556.15234 516.11328 728.02734 737.79297 0 267.08984\n613.76953 519.04297 902.83203 753.90625 778.80859 602.05078 0 618.16406 548.82813 553.22266\n728.02734 595.21484]\n 68 [556.15234 0 476.07422 612.79297 561.03516 0 0 0 252.92969 0\n524.90234 252.92969 930.17578 613.76953 0 0 612.79297 408.20313 477.05078 353.02734\n613.76953]\n 149\n[778.80859]\n 918 [278.80859]\n]\n/DW 0\n>>\nendobj\n294 0 obj\n<<\n/Length 321\n/Filter /FlateDecode\n>>\nstream\r\nxú]íMnÉ0Ö˜>Öó\…\"≤1ê	!%P$˝Qi@`†ñä±å≥\‡ˆ3i\"u\Ëøô˜4F\‰UQ\Ìπ¯pS[É\ÁΩ6ùÉy∫π¯mX†xß[\'|∑ccô»´¢^fce˙â•)\Á\‚={∑Õ©õÆ∞e\‚\›u\‡¥¯\Êí\◊[&Íõµ?0ÇÒ\\≤,\„ÙL‰Øç}kF\‡\€vU\∆kø\Ï.y˝T|-∏B(M;u0€¶◊òX*•îOÀ≤,3¶˚wS◊µoøá\Í0„©îJf+E\“>  â§$F*¬ï\¬dè%\Ërüw¯õ˛sFô§IÍàìπ(:ã\»LH!\ÂâNX\…3L+äu∑>R∫êä/$	®x\∆bLF1)¡=+•[ó≥^\‚cÛ\Ì\Õ90o\Z∑Ω\ÓYx¸v≤k\◊˙¸?†U\r\nendstream\nendobj\n295 0 obj\n<<\n/Type /Font\n/FontDescriptor 323 0 R\n/BaseFont /BAAAAA+OpenSans-Bold\n/Subtype /CIDFontType2\n/CIDToGIDMap /Identity\n/CIDSystemInfo 324 0 R\n/W [0 [600.09766 0 0 259.76563]\n 29 [285.15625]\n 36 [689.94141 671.875 637.20703 740.23438 560.05859 548.82813]\n 46 [664.0625 564.94141 942.87109 812.98828 795.89844 0 0 660.15625 550.78125 579.10156]\n 149 [795.89844]\n918 [331.05469]\n]\n/DW 0\n>>\nendobj\n296 0 obj\n<<\n/Length 284\n/Filter /FlateDecode\n>>\nstream\r\nxú]ë\Õj\ƒ Ä\Ô>\≈wãFw[!∞M\Z»°?4\›Htí\nç\„ÚˆE\›n°ïoú˘FZµuk¥˙\ÓŸ°áQ\Âp]ÆN\"8iC2JK£∏Àπ∑ÑVm\›m´«π5\„BäÄ~\‡§W\Ô6ÿù\’2\‡û\–7ß\–i3¡\ÓRu{Bª´µ\ﬂ8£Ò¿HYÇ¬ë\–Í•∑Ø˝å@cŸ°Uhºˆ\€\·RuüõE\‡ë≥‘ç\\Æ∂ó\Ëz3!)c¨Ñ¢iö¶$h‘ø˚c™\ZF˘’ªò-J(\„¨î’ë\ƒ9R~äTã@\"àtÃ£˜føæ˚Û¸òÑy\ Œ¢â?\'/O¡ßI/\„q\‚7o2Ö\÷√à\ÔsëW\Á\–¯¯qa\n\⁄\‡˝´\ÏbCUX?%xç\r\nendstream\nendobj\n297 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [277 0 R 278 0 R 279 0 R 280 0 R]\n>>\nendobj\n298 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [325 0 R 326 0 R 327 0 R 328 0 R]\n>>\nendobj\n299 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [329 0 R 330 0 R 331 0 R 332 0 R]\n>>\nendobj\n300 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [333 0 R 334 0 R 335 0 R 336 0 R]\n>>\nendobj\n301 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [337 0 R 338 0 R 339 0 R 340 0 R]\n>>\nendobj\n302 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [341 0 R 342 0 R 343 0 R 344 0 R]\n>>\nendobj\n303 0 obj\n<<\n/Type /StructElem\n/S /TR\n/P 276 0 R\n/K [345 0 R 346 0 R 347 0 R 348 0 R]\n>>\nendobj\n304 0 obj\n<<\n/O /Table\n/Scope /Column\n>>\nendobj\n305 0 obj\n<<\n/O /Table\n/Scope /Column\n>>\nendobj\n306 0 obj\n<<\n/O /Table\n/Scope /Column\n>>\nendobj\n307 0 obj\n<<\n/O /Table\n/Scope /Column\n>>\nendobj\n308 0 obj\n<<\n/Title (PUNTAJE PRIORIDAD)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 281 0 R\n/Next 349 0 R\n>>\nendobj\n309 0 obj\n<<\n/Title (FECHA)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 350 0 R\n/Next 282 0 R\n>>\nendobj\n310 0 obj\n<<\n/Title (INTERNO \\(check box\\))\n/Dest [9 0 R /Fit]\n/Parent 283 0 R\n>>\nendobj\n311 0 obj\n<<\n/Title (AGREGAR COMENTAIO)\n/Dest [9 0 R /Fit]\n/Parent 15 0 R\n/Prev 283 0 R\n/Next 351 0 R\n>>\nendobj\n312 0 obj\n<<\n/Title (TIPO DE DOCUMENTO)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 352 0 R\n/Next 284 0 R\n>>\nendobj\n313 0 obj\n<<\n/Type /FontDescriptor\n/FontName /AAAAAA+OpenSans-Regular\n/Flags 4\n/Ascent 1068.84766\n/Descent -292.96875\n/StemV 45.898438\n/CapHeight 713.86719\n/ItalicAngle 0\n/FontBBox [-549.80469 -270.99609 1204.10156 1047.85156]\n/FontFile2 353 0 R\n>>\nendobj\n314 0 obj\n<<\n/Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0\n>>\nendobj\n315 0 obj\n<<\n/Type /FontDescriptor\n/FontName /BAAAAA+OpenSans-Bold\n/Flags 4\n/Ascent 1068.84766\n/Descent -292.96875\n/StemV 83.984375\n/CapHeight 713.86719\n/ItalicAngle 0\n/FontBBox [-619.14063 -292.96875 1318.84766 1068.84766]\n/FontFile2 354 0 R\n>>\nendobj\n316 0 obj\n<<\n/Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0\n>>\nendobj\n317 0 obj\n<<\n/Type /FontDescriptor\n/FontName /AAAAAA+OpenSans-Regular\n/Flags 4\n/Ascent 1068.84766\n/Descent -292.96875\n/StemV 45.898438\n/CapHeight 713.86719\n/ItalicAngle 0\n/FontBBox [-549.80469 -270.99609 1204.10156 1047.85156]\n/FontFile2 355 0 R\n>>\nendobj\n318 0 obj\n<<\n/Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0\n>>\nendobj\n319 0 obj\n<<\n/Type /FontDescriptor\n/FontName /BAAAAA+OpenSans-Bold\n/Flags 4\n/Ascent 1068.84766\n/Descent -292.96875\n/StemV 83.984375\n/CapHeight 713.86719\n/ItalicAngle 0\n/FontBBox [-619.14063 -292.96875 1318.84766 1068.84766]\n/FontFile2 356 0 R\n>>\nendobj\n320 0 obj\n<<\n/Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0\n>>\nendobj\n321 0 obj\n<<\n/Type /FontDescriptor\n/FontName /AAAAAA+OpenSans-Regular\n/Flags 4\n/Ascent 1068.84766\n/Descent -292.96875\n/StemV 45.898438\n/CapHeight 713.86719\n/ItalicAngle 0\n/FontBBox [-549.80469 -270.99609 1204.10156 1047.85156]\n/FontFile2 357 0 R\n>>\nendobj\n322 0 obj\n<<\n/Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0\n>>\nendobj\n323 0 obj\n<<\n/Type /FontDescriptor\n/FontName /BAAAAA+OpenSans-Bold\n/Flags 4\n/Ascent 1068.84766\n/Descent -292.96875\n/StemV 83.984375\n/CapHeight 713.86719\n/ItalicAngle 0\n/FontBBox [-619.14063 -292.96875 1318.84766 1068.84766]\n/FontFile2 358 0 R\n>>\nendobj\n324 0 obj\n<<\n/Registry (Adobe)\n/Ordering (Identity)\n/Supplement 0\n>>\nendobj\n325 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 298 0 R\n>>\nendobj\n326 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 298 0 R\n>>\nendobj\n327 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 298 0 R\n>>\nendobj\n328 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 298 0 R\n>>\nendobj\n329 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 299 0 R\n>>\nendobj\n330 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 299 0 R\n>>\nendobj\n331 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 299 0 R\n>>\nendobj\n332 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 299 0 R\n>>\nendobj\n333 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 300 0 R\n>>\nendobj\n334 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 300 0 R\n>>\nendobj\n335 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 300 0 R\n>>\nendobj\n336 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 300 0 R\n>>\nendobj\n337 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 301 0 R\n>>\nendobj\n338 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 301 0 R\n>>\nendobj\n339 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 301 0 R\n>>\nendobj\n340 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 301 0 R\n>>\nendobj\n341 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 302 0 R\n>>\nendobj\n342 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 302 0 R\n>>\nendobj\n343 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 302 0 R\n>>\nendobj\n344 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 302 0 R\n>>\nendobj\n345 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 303 0 R\n>>\nendobj\n346 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 303 0 R\n>>\nendobj\n347 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 303 0 R\n>>\nendobj\n348 0 obj\n<<\n/Type /StructElem\n/S /TD\n/P 303 0 R\n>>\nendobj\n349 0 obj\n<<\n/Title <444553435249504349D34E>\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 308 0 R\n/Next 359 0 R\n>>\nendobj\n350 0 obj\n<<\n/Title (DOCUMENTOS)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 360 0 R\n/Next 309 0 R\n>>\nendobj\n351 0 obj\n<<\n/Title (TITULO TICKET)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 311 0 R\n/Next 361 0 R\n>>\nendobj\n352 0 obj\n<<\n/Title (DOCUMENTOS)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 362 0 R\n/First 363 0 R\n/Last 364 0 R\n/Count -2\n/Next 312 0 R\n>>\nendobj\n353 0 obj\n<<\n/Length 5185\n/Length1 12652\n/Filter /FlateDecode\n>>\nstream\r\nxú\ÌZ{|’Ωˇû\«\Ã>≥Ø\Ïn+d6\√.\“$ÜdC Äf%≥â($\ƒ\Ó†\Ô.$T 5¯®ñ\ZµZ¢B-(-®Ëµö˙ò(.¡\"≠QëãØkµˆ\·µXZ¥>[vrù\ŸML®ˆﬁ∂üO\Ô7øCf\Œ˘˝\Œ˘˝~\Á˜ö≥√Ä\0p†â≥[J\ÀW?s\’\Ì\0π@bÒÚdß`2Ωê#\0nY|\È*\…97ˇnÄ\ﬁ\0`˚íŒ•ÀøùLπ˚\Ô”é•…ÆN¯ 8¿µÙ¢o.πvC\Ál†‡∏∏£=\Ÿf}lq\'@\0*;:⁄ì9/Xñd6ÄI\ÀW]~\Áa\œR¿˚C¿q\ﬁE+\'ùo\ÁnÑ~¿4uyÚÚNa*µ8@Zë\\\ﬁxºÚÄ\œ\»ù+ªV\r.\√Äú§\”;/n\Ô¨Ÿπ\ÈnÄMàfXë\”\‡ ú \0€å¯qP∏PäÛ\0\‚¿0c∂ÉKtû_0ØO\ﬂX\Ó?∂Eª“≤]«å∂\Ÿ¿êqo~˚@~ﬂú≥?5[\Ãe`Z\Ÿ:˝˛j\—Ø€í~’≤›ºÄth)Oëõ!\0\¬!êÇÃù¿Ú°ôRõ(2ÅS\ ıπ#eñù\ﬁRÉ($º,h^|«ºû\∆%ê\€u\ZoR∫eå\ƒ\ÿ#`\«\Z\0\·É¶†1\Ã\√9àc1\⁄—Å±ó\„\Â¡Acı\…814¢q,\ZM¸/Ω±πô˚®ˆ\‰â\÷9D/ÚpñêB.R¬æ\—T\ﬁ\0/6\0Éá\rü_5Ø~R\»=~\À\‡{\⁄uÉ\–\Ó<å|m˜ﬂñˆUêÒ\÷\·jºÖ[qn\ƒmXÉ´â=@Ù6K∞Ajï\»\ƒ÷Ç\÷Z0ë8\'VO|h\"õ\€.8≥)R\–T*W∏ZCëI≠\„rL|∞@dÉç±HA¨>TêÒ¥\nÑµÚk-`\ƒ…™\ŸCåùQ?Æ\‡èıDé∂û	¥˙#æV7q∂∫\"\ŒVßÛl\'-p\ÓwRßs\–IEJ\–J\"h]â´˛\Ó\ÈˆÅÙìõ˚¥5ıõõõTÀºsU≤F\rµ\Ë\◊\Ë¸Ö™∏FE\Î\¬s\„}Ñ‹®\\∑~=\ÊLhR\À[\‚™4AiR\€Z\‚™kBüsîÆÆ¢¢ÛªV]R§√™¢ÆUE#¡Êüü±í	ı(\‚\0\„¡lü¿Éf˚‹ò\Ì3T\œ\Á(ƒål_@æìz_Ñ\‡lt¢+–Ç$V†%hF;ñ\‚\\Ñ$.\∆9h\«\≈\Ë\¬2¨\ƒ\nH(\√)(\√\‘\·u\“JÈÑïC3g°ß£5òı?J=˙kµXÜ•XÜUXÜ+–é6HhC´êÑÑ\≈XâN|≥:∞\ÍÛª\ 1\’–§$\€+C1$úÅïXâ•∏\ÌêPÉï∏ù\∆5i\◊˜{äa˚Ç/mç∏\‰\Ôl;àì\Ã%k\…ròŒ¶\À\Èr˙}˙4}õI\Ï\Îl+{ÉΩ¡\'Û+¯6˛ˇå&L˘íˆmaó∞K\Ã@≠—Æ…∂ß˛™}¸è4ì\Áüjì\∆\⁄Xkcm¨˝?mU\—3\Œ]®\ƒ[¥4œüwˆYs\œljå5úQ_W[3\ÁÙhıißŒû5≥j\∆Ù\ ieSKO))>yr84I.\‰{\›.ß#\«fµòM¢¿%(ñTí®SYHr\◊\'\Â:9\ŸPR,\’\Âw‘ñ\◊\…ı	UJJj}B\Âaπ°¡@\…IUJHj8©J\…\ËÑ\ZMJ\ÍífF33£\√3âKöçŸ∫YR˜\’\ R?Y8?.K\Í˙ZYë\‘˜å˛\\£\œ\√\∆ ßVVÇ¡íb\…\–J\◊V™S\Î/\Ì\Ë©K‘ñì>õµFÆi∑ñ£\œj´ëkl%\≈POñ;˚\»…ß£COÆõ\ŸGa\Œ\—≈™,TólS\ÁÕè\◊\’ÇA•§8¶:\‰ZÉÑ\ZÉ•*÷®&É•¥LWÎ§æ\‚\'zn\ËwaQ¢\»\ﬁ&∑%œã´,©î˜∞∫ûû\Ô™\Ó\"uä\\´Nπ\‚ù¸í\‚∫vµXÆ≠SãtÆM\Õ\√röæIT!‰í•ûO°íÑ¸\ﬁ\·—òd#Ü\\üBÔ™¥F%\ÕÒ†Åzπ>\—\”S/Kı=âûdˇ`˜\"Yr\…=}v{Og]BR1/Æídˇ\‡c\Îj˝\rä\ÍJtêôJv\Îı\ÕMj\Ó¸s\„*\r\’KIïÖT™ñÉ3A˜úy_EÜj™QE\›\¬¡†nÜu˝Q,*)™\›Û„ô±ÑEÅá--RTö\–)OQ|≠:•{à2º<!KäõZ\‚=*\≈\⁄\‰∫ejt]R\Ì^§J\…t\«\».\’Ò\Á@P\ÓÒ∏•™R≈ò+©,k[&©BXıU#®<¨/\Èq«ü3∑˜=*ª=Rï,Uï\Í|\Í\‰∫Dˆﬂ•˘j˜\"©§Xm(\ ¬Ç∏\Z≠ï\Í\‘h2Î±∫æ©•ur]2°íƒ≤Z√ôj©‹©z\Â9\√\ﬁ\’’™[\÷7ñdó©\ﬁ\Zâ\≈\ŸUjiùëWR]O¢6£Ç\ŒKûﬂÖ\»\‡o˙*§¿#T@©\’\'˚k\‚*\◊ı\ƒ€ñ®â@õ*%ñHÒ@Pç**I*rº]\—\√Nv©S~0ÇC1beAº©Enöø0>#´HÜ†≥„°∫\ÿ\»Ò@Üç*ÑTs\»,\≈iÄ)*πT!$’´<$œô≠Úêj\nôUS»•ä¨∏sfKq¿\–lu\ o\‘)R]{mvû>\≈T\–√©¶aàõ®Uí®iï`Jä©\ CRV∞*ÑÃ∫QÜH,$©<dVi®¶¡@\È∂\Ã◊É^ä\À\Ì≤\"wHjt^\\ﬂõn\√\ Yc6\œ˙j¡®\—cï´6-\Ë\∆T\Îã#ç´ûaåáá\r\'êcCd©\«,7µÙ\Ë\Ã\Â,C®4S°áptÜ;`\‘=°\Â˙§,π§˙LB˜ÙE£z2w\Ã‘ô»±∂π%>€ò\›\‘_∏Bó\ÂAiZ0ß§∏èbNüL\÷\ÃÔãí5-\„ª\\Ä¥fA¸aJhMbé\“7â¨ô\ﬂ%QKu¨é\‘í>\–95\«¶fc~`W\Ë6®\‹@\„\≈˝\Œ<Ñ#X\‹O38WFP\ÿ\≈\‚~û°Dáfs,\Ó7gp\›ŒÄ>\Ë&ãZÖ®9jâ\⁄i\rÙı∞5?F\0¡#víC}›¥¶\Ÿ@˜ì\Ó>K4êô\—\râf4\\\”˙Ö\Ë÷ÖÒG\Ï\»!\„™(\ Jä\ÎÚ;\‰&˝±R\'µ\ÈÅÚ-•£\'°\Ë\…øJC*\rï»ßA•Úi}Ñäv\’*∑\œQmÚ_≠\„´3xQ«õ\‰9*Òìœów´¥fûJÙ87î]™4~ \–\„zO˜îRTR\‹\„˙]	ﬂáΩCoe®˜oøµ°Á£ôûèSˇ±w>ˇ;\\ÄPä¡é\’¬´\‡]\‡A/cµ.=\‰¡?Ñ>¶*àfà≥∞ö\»\–˘G\‡m∏Ä/áGxèÒß2º˘∂°O¯ªP\Ÿ~t˝’ôª\—?u∏˘¢oå_˝b\ﬁWÚ-\√\‰ø\«ˇmd\ÌøJ÷â†˚\‚ˇJˆå¡å¡å¡å¡å¡¸\ÎÅ\Œ\¬\0®˛€í[ÖL\Ì\‰L†úôÄ\“Ú\“)çîF ¶\Ê\›¡\ÈAwp/ã\ﬂ\ŸAøô˛Æê:\⁄\ÿ¡Ç†Y\€MÉB\n98)j7¡\ ¡N\€d\∆P]\Ìˆê™*wƒ≠≥py¶GD\ÍÛzÚ\‰0m˛¡\∆\Ì7o∏e\›\ﬂ\€BÀàÖº¯\‡^≠¸ì¥\ \«{\…\œÙ/2N\’vS˚Wn5¡\ná\”\ ¯\‰\—\\âãö\‰Jœ¥\n:9\‚˜P˚6ﬁ±\Óñ\r7o\◊\Ÿjüi3\Ô\›Mûˇ\‡Ú\‚ﬁá¥≤\Ã%ÇK\ÿ\r®äN§õô˙æ7qó\”AcäMp8∏¿¿=®éT{™J=UE\√›ûº™≤©Ad2â\¬¬ìE\„âT:µ\„~:\Á&Z≠µ˜eˇî˚\…≠T\ÿ}¥ñ^@û9gu¢Kõ¶ˇ\Ó\Â{Ñ»ÉÑX4ú\À\'Xù\„\∆9¨\‹\‰\‡¡B≥3ﬂôﬂ®8ù8\∆5*Ú\Z0T!ø∫\»\ÌAU~©qs{H^FüåiÉ˜yEìèªΩ\\\Ê\À+ßUÑe\Ÿ\Ì\Œˆ\»V\"æaô´˝\Â}çˆí¸\€\‘\'éí≤æGv˛DH=∏˚ö˚\∆Y´¥7ü˛%´˝\∆ıW.OoHøµv\„ön\›´Û˝\¬Û#ı2á\◊\‚`y˘\ƒ∑â1≈ñ;¨ü°T\ŸTR∑ëÚ\È>Qñ\‡ÆLäî\Áô\¬l÷á\⁄!íÛ\ŸmO\ﬂ˙k\Ìq\Ì\Œ˚Hı\Î\Ôo∏Gàh?\’iø\’~>˝˚Ud\rYˆ6Y–ø`\„Y\0\’-&ƒÖ\Ãp\„\‰®\◊a|.\·\…r\ZÅqG£¢{iH˙1Å`\–î¿\\\ \Óà!Æ]¶›§]Hû ≠\‰ä\⁄oµ\ﬂ˝e?ôJ\ \È!mìvµê“Æ\◊~D&í\¬cù§H\ﬂÛ\0¿é)\ÿ03Z Z≠Ñ\√L∏=G¥\ƒQ$î\n1Ö2bç)\ƒs¢{≤Æ)õ™+\·\À˛±#\«∞\“ÙïÙ¸Ùvzùê⁄¨MŸî>8Bí\Â\—Ò\"@òô0´\ÌAT©yH\È\Íb/§6ßm\ŒzN8Ux}^Û8J3?i1\ÏvwL±s!/¶π_πtã£¸®˜]ñOwŸô\‰\√Ul\”vh7\Ó$Òwˇ‹úü\Ì\‘>\’^!Aí\Îm\’\“U°0YG\⁄\ﬁ!_ÙúM¥\'µÉ\⁄\Î⁄ã2y2≥w°¿∞r$:\ŒBÃúr\ÏfS\Ãf¡*2\"iÒTïé\»\¬\·Õªew\ƒtGÑÇ\ﬁ\„Zo/£ΩTM\œR\Èçt@\⁄U§√®\"¢96≥\Ÿ\·¥01Öô˝\Í,u^¨pÚ4§ºrö;\‚ˆäˆÛ+œòªxi\Ô\⁄UÅ\r\ﬁÀø!§é\∆˜\»\∆?dh¸µ®O\◊V†6´Æ15ñë\⁄VçÚ1äí·áûMˇÒ∂\ﬁ^∫y ΩÉ>≥&˝îêJ\—W\”◊çàQ∏h\",¶¿ÛÖ∫Üæ∫	ÇæÅ^=îéæ≥%≥V¸Ü˛\Ì £˘fAmGéò\„ı´õâ6s@‘ï”µÀ´:—îDˆ˚‹≤;H\"$\‚ñ\›\”e\¬\Êi.≥c+\Ÿo&/kΩ≥f\\[^9~æê:\÷\»SGŸÉ\€˜˝(\Î\«j!Nâ˙,¢h\"N\'Lp{l\Ã\‰43b\Ziï\—.\Ã\néêHòNwGÑ\Í\'èˇ\÷\Ï\⁄˙õ`¶z;˛ı\«˜\n©c3$T\Õ\Œ\–kÇ\’{Ñ}∞!OØ	\ÿEà\„Ú-æòb\·\ÃSX\Óó◊ÑL\‹J .O§\‹\„vQπê\n{¥≠\⁄\”z9\"	RKfëE«∫\“~|\‰/}ú¶oiwj+\»:\“A\⁄\…Z≠SªC˚Om)\'_#ìIô∂/SüxáëΩTD\«[At@DÆ\◊\ ´U4ô<çäââ\'\‰\Ôê\r ¶/ ∫\Â%\…Vmﬁ°\–\ﬁ\ﬂKÆ§ì“∂\€\ﬁ~n\œ¿nˇ’ü\“{ÖT:∞Ò\Œ\r7f+#\ﬂ/§`á\r\—P!\‘nqõlV´\…Bπ?œíÉ4*99î1_La\ÃF\r/|\Âc\ƒ\–\∆–Ñ˚\\ëIhH!\“\’K6êB¥7\»˙mõ∂ˇ–é{¸¯[4ëæCHΩ∏_˚’íÙJö\ÿx\”M∫Ap¡\‡aNÖ\Á1	\—¿\ƒ\\;êü+P\ÿ>ë˘˝Åò\‚\Á\Ã2\ Iï-\ƒ\ÀeiÚ4ø?#><9ûVQô©<Ö¢\œ\Î˜\Á˘˝újøˇ@;~\√\¬W:z\Ô?ı¶ç/<§xc\Á¥G¸\›[g\\∑ˆ\‡‰∫ΩØ\◊\‹.æ∫\Î\ÃdsE\Ï\Ÿ;\Ô{v\ﬁ-gÆZzfr~YÛn\ﬂ\ÂÅ/R0aR\‘\"\∆\Ã\„,¶°zã\»3M/6”Çæ ]◊´ïÒ≠L(\ÿl\‘\ÿ\«\„Ñ\‹E\›.b5SÆ\«mf<\'¶\Ï##\—\Ì\’c\–(4ôä#å\”^“éhG¥_˜>˚\‰ÆgÖ\‘Ò≥éjo\È8{x˝Œßü\Èg˝ô\ÔE˘SB\nVåè\⁄∑\€\Ãú1]—à\'ìWeSIÑ\Ë\Á^\Âtnﬂô˛\ﬁÙ\';»ºôÖìf\Í\«5ùÛ][∂\ﬂ	¢øaÁõå:&G=\\lVàz\„z„£ãòë¶D&˙Å\'B¯¶Ω\⁄eZ\ÁrPõµõ\\HV<™Õ¢◊¶W\”\„Ù±Ù\„¥&}¶ù\Í\‡a~â\ËE.\nP-¥\Ê\Â9ùˆ	\ÃŒ§`\Ï>è\€\Í!éØWD?ºı\n\\£Ç!í?‚åó5[6a√ìeì^JΩ¶Heûô0°æ˛ß_ª∞o∂]æ\Ï≥y\’Ωõ∂Ùﬁ∂i_®˝B˚H˚H{ı\Ï\Êı¢Wª˛™ˆª\◊=ı\Óª?ˇıÅ\◊^\“˝\◊5xò≠\„\ÁeN7N\∆|ñü\'\Ê\‘+¢ûz˛O7Bˆt\„\œ3Ö√≤dxq∫O§K\ﬁ◊éÀßgo+âLø¶\\{¯Æ;\÷ﬁº\¬KB\ƒNrIqa\ﬁzˇ\Ìú\Á^üıΩ*P]*˜ÛêãÒò-»∑\Ê\Ÿs[\ŸIÅ<[ΩíóQÙ\Z*8F©0Ú\Ÿ©å\«\Á˙3äà¨P4+\¬Ù™èµwâ\À?H\Áª\Ó\Ì{ æıá\ﬂ\ŸÍ†ß\ﬁ\‡%\'±ê⁄áøZ∂˜\Ÿ\∆[\¬Aˆª˚o\›˙#\›*¿kE/¸˙3\Ÿa7õ-[¸y˘ã\«\√\Îè\À\nX|zÄT’ê!?\Èi\‚Æ0≤\‘=\‰£\ Hπ\ﬂ\Áf€Æ∏\ÊÅ\€\Ôπ\«l-{t\’¿\0}\Ê˙\Ô\Ï~-˝î\Ë’¶¥\Œ8˚‹ü˛Gz⁄ê\Ï	¢.TF.á\’j≥ôE.òπ\€c\\.≥ôôl>\Ê\Ã\ƒ|iï;Rù1FUV<©úÆG\È\–Û\÷k\"ä\‚d\—3Z-ys@[Ω˙\ÓªÕ¥\Ï\‘\≈\‰2≠$ΩéäiKD\ÔÒüO\Ô\ zd?v\‰\ÎOï\\\‰ò`\Z?\Œ\ÍØW¨.\Ê™WòˇKü*raòN\”]\02ãr°\»iΩˇΩwæE\Ï\Ô$\Œ\„è\ﬂ{\◊]˜\›˜\Ôw\›CC\⁄\'\⁄\À=Ñ>@\Ï§H{Q;ˆ\“/\ﬂ|˘¿/^\—ˇ◊âõyl(å∫MÇ\"\ÿs,åòm>Nú\'§d6âëô˝⁄µèì ë~¢]K6\Ï\÷ˆi\œ\Ì¶e4O;è‹ù>î\ﬁOvkµ d-ˇÛàAXêõ≤p´çw[P:~\ﬂPÈ®¨úÒâ¢I&kßÆîû+~0∫ítöz∫\ÔÙ=ÉÉôßÆ©ãÜQ.%V\“Û#4(ÑQ4\r\Ÿ\”\È2~G∫S\‡a˙π\≈\»\‰Ãâe†W/Cüó≤ˇ‘ù∞\Z\r\nendstream\nendobj\n354 0 obj\n<<\n/Length 4056\n/Length1 11244\n/Filter /FlateDecode\n>>\nstream\r\nxú\ÌYp[’ô˛\Œ}\ÈmK≤,;\ƒ˜\ÊFJ≤ñCâÉB¿7∂•8±í¯ô\Í&¡ï€±YB\‹8	ÕÉ\÷)Ñ§JR\Ë¿\À>\ B\ÀP¶\«!£*4ª\›\Ì.Å\Õ0\√tÜí\›.	\›\Œ\0Kâ}µ{Æd\„P∫è\Ó\Ãvg\◊ˇoù˚üˇ?ˇ\„¸ˇ\Œ\’\» \0\ 0\ÈMΩıM_õ:Ú@\Óêﬁ±+3\∆I\“JÄ|h\Œ˜\Ôï+\"5˜\\Ä\'á\«v\Ó˙\—¯w˜ŒìÄ\Â\‚\Œ\Ã¯¨\0∏¿πÛ\÷\√˜≠1¶\0ﬂ≠Äm\—\»Pf\–\\w\'@∂h î-≥\'\0r=Ä\≈#ªˆ~ı∂S.∏ˆ^†l€≠ªwd˛\"˚\ÿ n,\rª2_qµ\0> ﬂñ\Ÿ5T˝^Ù#Äˇ \€\«vè\Ô-åb \’L>∂gh\Ï\€\‘<LV\ÿîÉ\0¸É\»¬èDpp£\€\0\‚\0RT\n\√\Ã\ﬁ\0¨ß¶ü\0ÏßÆ8çˆSå3¯MYÜº˙P\Í\À\Â´?≤⁄¨¶\‰|k\’#\Ï˘Z\›?ºv\≈9˝Ñ˝îïi\€¿Õ®ä\Â\‹9àÄ¯∞HmÒ…øÇa2e\Â8áU\‚EÅ\„`&\Œ\"4Æ\ÈmÉØJµÜwYOq)\‰;L&à9ñSÉò{ú¿j\ÈÜ\€\‰\ÀXÖ\÷a˙Òj°P\‚¨A:\—\√8Ö∑\ÊÛ«≥{∂œÜP\«? ˘Pà9Taüò/\\ùa\0U8.ô˘ù\r\≈*ß\Ó/ºo\‹S∏hú+\\Ç\◊\ÿ¸Ö˘ˇ°òkºãè	H^\≈i\¬\·cˆ¡eºÖ\”\0\È¥6•C\Óó	\ﬂ_\€¡˜/\‰µ]I\Ì¶\rÉµìÉµ°\Â\Ó˛`tqˇÇäB≠E(\‘J|°vCra\Ì`í$Æ⁄ä®∑_$|ø\Â˚kyRŒ∑OÛº‘ôx)ÒFÇW£ã˙Øâ˙˝\—\ ~)\ÔwG\À˚ü.πúk(\'$ä˛\›¯:û\∆/!∏A&¸D$yr\Ôd_o]]g\ﬁR\ËÈ§∂Æ≠îß¡^6j\›[®tú¢\À\÷\‘$!\ﬂ“èû:Ö\÷k;iSoä\ \◊\Íùt∞7E\›\◊N˙—™èè◊çè\◊1\ﬂÀû\Ê0\’\0,\ÿ¬∫@∞ÿÉJ4ÅwïhvZóh\◊acâp\röJ¥àj‘îh	5\06aC∏\rΩ\»\‡6å#ÇV\Ï∆≠\ƒfa\∆1ä›∏\r2\Zq\Z\—0´!\œ\Í»≥:3kn@#÷†m∏\·\ﬂÒ0Û¸Mã\Ì\≈Nåb/FqCÑåAd∞\»ÿÅ\›\√\Ï1Wç`/d|2ö\–`zèî®FÑ!c-vc7v\‚VAFvc\∆\Ã1c\⁄gªª\Œ\Ïæ≈ø3nª\n! ≠\‰\09C\ﬁ&os\’&~â\€œù\„˛Öèôxíø$xÖµøGºÂøÖá\Áq\Áq\ÁÒˇ)~[[ªuãû\Í\Ô\Î\Ì\È\Ó⁄¥qC≤s˝∫éµâx{[\Î\Z≠\Â¶Wﬂ∞*v˝\ \Êç\rı\◊E\¬KóÑÇã\’EJmµ\œ\„./s9\Ï6´Eû#Àî§\„î ûDFç´ôéHXéWè¥G\¬q5ë¶rF¶â4BjGá\…R3TN\À4î°rf;MµåLá?∑R+Æ\‘fW∑º\Z´ôU¶\⁄U9O∂tßTôûjWuô^6\È\r&-ÑÃâ´]\’%ñÕ®X¥rú&ˆèd\„\ÈˆHòL:\Ïmj€ê=∆§\›—¶∂9\"a–•\Í\ÿ$Yz1	ni|\’$´ãπ•|0û§]›©x{@QÙHx-S\€M\⁄LìTj£”§<\ B\«	y2¸\\ˆdﬁç\Ì\È:\Á†:òŸñ¢|FèÑ≥|<õ=F=utô\⁄Nó|ß:é—∞\⁄ßu\Ãjgœ¨ü\Œ\œ\\*›™ú˝î§\’ÀóÆ\ÊdJ)\Ë˛å§\\%=)ÖA °&\“\ŸlBï\Ÿt6ì/LlWe∑öùt:≥cÒ¥L—ï¢$ì/<{\"@\'u\ÍNèêUziÎâûNZ—Ω5Eπ`B\…P>H˘`ã™\\P<≥k∫~õ\‘\“F%ñaEai8ë◊∞=V\ËDw™8ó±=p\ZZ}ùNπ4ì<7#©\Ïgíâ…¨zZU\"\·\Œ\ﬁTñ\n¡uÉj|îj\'2tb;ï3∑∞¬®nZˆq@Q≥^è´\◊Õµ2\ÂÉ\ÎGe*Ü®ƒ¥\Ê*P!\ƒT≤nsRˆqÒq9ê•B\»\„ïc™´gv\‚j<]˙\€?RM\'∂Àë0\Ì®+6B_äj\ÌrújôR\≈\‚ì\rıq5ûISím7ãI\Î\’1\ÍS[g´\À¬äèˆ¶Lïí\ZıµQ§wî¥h}\‹<Wr<\À:\Ì?[ âz\‰§>≤*\ÓTªSg-\\ú\\.ûâb9Ùvf\ÿﬂñ¢|(ûM\r\”\⁄t`ê\ \Èa9P®¶Sí\—\’‘ê\ŒZTu\”ef#\Èf_ı•:{\’\Œ\Ó-©\ÎKAÃúåŒåö\n\ÕP1H≠A´ú\‚ºNÖ†õäA9AÖ†⁄∫ö\nAj	Z©%\Ë¶RëÀöºuµú\"Ã¨¶\À.\“er|®Ω¥éÕØ2*≤\÷kÎò±&±)%È∂éÄ¢+EàÑ9*\Âíc*≠¨\03\">(S!h•\\∞≠\√d±ºW≥¨\ )uH\’\’ôj])∂7ñ≥\"•dòı)’µ\Ô™ŸúdE\¬Jg\ﬂ\ÏÑ%ì&\ÍsìK◊öÛ\Ÿi\«\Á\ƒ\Îf\ƒr÷™vˆfôqµdîÆ£`\ÌÆ]\Ô	ò˜\Î5ëQe∑ú(vLvR\”X∑∞Êê≥\Í∫¡¨⁄õZmÆ\Ó\ÏI\›8\»|y\—I:˚Z#\·I≠ì*9\ﬁ=©ë\„Ω[Rg›Ä|º/uö#\\[∫Uü\\Léwß\Œ Äfr9\∆eL6ëŸÑY\ÍIù\Ê¨\Ê˙¿Y\rò0•Ç\…0\Á;Ú&\œ:\√#ÿë\Áä<w\—Q\»t§Å√éºPîh3´\Ï\»[ãº	ìg\¬$X\ 4ª®Y5õ\Ê\‰\\\\`í0\÷iQ≥>K\0¡3N\‚\"Å\…	Æ≠\«d\Á\…ƒ§MWL¿F¥bÑ\«˚?s›ø%ıå.0G]\◊[D\¬Ò\ÍµìΩÇ\‚Ú kî\√˙H6≠≥\√?ÂÇîJ‘õ@9ı¶I\¬INjWáZ©Cme¸\∆o)Ú%∆∑®≠î¯…ø©OPÆ≠ã\÷[Sä\Í¶r\Õ˘@\÷}ôUJØãÑ≥\Ów#\‡< \ÿ\≈xX∞Ps\nº\»Òú\’&†æ©>\ÍÒíX\ÃıD*è≤RÒ(\œÛ\Î¶~8\¬ò>&\Ê>]?\"ºp\ÿWxóº*å√Å*Ñ¥\nØ$9Å\ÍÚ\ >Ω\‹m\„˚t[Z\ÍP\›R\Á!QO‘¥∑rys¥\…_\Èì\‘E!\œzﬂñÕΩ[∑ıÙmcœõª˚∂\›”∑9’≥i´Œü`D∑û*˛.\'\œ¡\⁄4ÖsÒVIt8x¿b)\Á°\Ã\≈%uóãwà<x/Z¢-Qo¨æ\Ë\ﬂDo\Ãçzc1o,\÷ÿ†\nØÖ.¥D‚Öï∑Løãqö\»!Nö6\ÓZï?%€å\Ôä\Á>m\Á\“\‰ı√ã\'˚≠/ä9î£\Z26kaã\œ\'5éEÓööÚr\≈\Í^\‡^∞Aw∫âãwª\ÀQ^ì\‘ÀΩ®N\Í\‡gR\‚E¨∫˛\À7õ\‘gFYÑ\ﬁÀº,T˙$K•\ﬂ_\ÈTÖDõöW,©™\«cRJû¸=YI\Z>q\»x\Îì\È7IÛôØ}\Â\–\—\«^ú8hLâπ\…\Á\Ô|\¬cØ}Ú\‘˘Òç[˙\÷Mˇƒ∏s˚P∑.	Øà/¡èF≠\⁄RQQÕª\\U>xê\‘=ÇE¥ãI\›\ŒJ\ÁA¥\⁄g\√kl ã∏J∑“¥\“#©2<ÀΩã£MUñPà>˝\Ÿ˝g~f<o<ı8Y˘\ k?\Ïy\\8o¸˙}£jÉ1\’I\Ó$∑ºCæÙ√ùSKVÅc9˜â9XQé•ö\œx\\Ç\‡ùI]\‰WRºsõß\‰\‹\rEÒ(2à[Q=QY\‹gáç\Ì\‰%2LN\Ze§øwî<\«˝\¬x–òs\∆\›\∆˜\»Oß:@Ãäqbƒµ\≈VpIv;!N…ñ‘ùqÒíD8NL\ÍO\ÏIùx≥JüU(\⁄\ÿ¿¢®,}n*«ØüæD~ix8üò3åø6åc(z\Â\r1ñk5VûwH\0!v\Êté?/Zf\Õı2\◊	˘ÖÒ2üò~ü¸≥\·féM≠ã\√\ÊûVj\◊\ÿ\\VAEßïO\ÍI+±ZEª\ƒqˆ\\µâ3(/Mˇ•Ò\"i\Ê\⁄\»\n\Óˆ\Èoäπ\Èø\·n,\ÌC\Ïsp¢U´urú\›\· @ôïEóì\„xáC\‚≠Vq÷ô76{\÷LèMû\‚Òèùã\Èr%Qà\ÿe<bπìπ=HNíî¡q#\”ãπ\È? øö>PÚ.¥à9à®\’\ HÑü\‘Q™RiWç\rQ\”nû4s\›b\Ó\ ˙BI[zU\Ã¡áU\⁄5>\ÿ6+/ñïπ\\~Q™Ùr6NrX¯2H,p3M≈†õä;®ä\ÀMTo%3N¢ÑπX\ﬁ\\°^5±U\Ôì\«\…â\Ï&èoÒNõqL8d<∫o:%\ÊÆ<*|∫û;\”8A|WéïÚxﬁº7öµvÿà\‰r^î$ã\€¡[ ¨<±Ãî+Våb&ï1v\'(s\·VxÒº±˙.3àc\‹!K9©zå7\Óò\ÓsWŒík˜sg¿±\”.˛\\º\0*\ŸIÛ\0UNIÚ\€*í∫M\‡Àì:_Ò\≈\'MÜ\«â\œï=neë$˛\‹x»†5\"£§õtì°+Ø={ñå˜ú=«Ωi¸ëqê\‹Mvë]\‰àqÿ∏ˇ£O\»eÚ¡ØQ:\Ì\ÊiØ\¬F-TQU%\ÿ∑\€\ÓØ\\\0ª\›·®Æ∞9a€†ß”ö‘ùº\ﬂa&bˆ`|vI∫´ˇ∂\…+ıWc√ú{ë]\rÊùâ*Öê\Ô;y\œ∆ã\‰IÚd·∑æA\÷\ZOèÒë\Ì£#©\È\”/ãπ\◊\ﬂ<r>fT\‹\À5≤^(\\™ƒó∞qmQ†¶FÅ\"˙úa\È2üß\‚\\h´Zò‘´\ﬁ67k^\ƒJU*Ω6gCÛ	\Í¢%øøbh\…u‹äÂã£M~vc™ã§Jü\ﬂ_\Â˜U\∆\€\∆?ùπˇBˇÆÜõ\Ôπ˚\Ó.b˘\«=/ep\ﬂØO\rÑzˇ\‰\¬C‰Åø{\'E\‰\÷\Êç\Í\⁄njo\Ÿ˚\Œˇ¨πÒW\r°û\÷e7\∆\÷oˇ	ã s∞ §y%Ä\'\ƒj≥ü‘Öô{fò•∑Ò\Ã¿]2^4∆Ö.c\\8C8\√\0¡SÖK\"˚_ïA\Õ\„!\ƒ\Á∞Z+º6^,K\Íbi\ÎWΩ<>IPe¨(üπaè8m\„É\Ô/ê\«ˇ\Ï°oäπ©çè~¯\r¢\\·üö:Ú˝?ˇŒì¸ $)ºŒüíXqç\Ê\‡\Õ\n\ÿ\Ï\¬P_s°k\Õ˘¶\∆≤¢y•R)Ií¸AŸº¸\ Z\·ı¿Cï\À/4°P(vπeú°	 \Ï\'	\“\Î3\‹B1Ñ∫(\›\‰Û{è\'A$<ªAZòè\‚›ë\'\Õ\Ï\€\r \\`ﬂëä¿˘~∑ˇ|˝WÅ\Î¿æ\ﬂ&èb\Zyqn/!/B^d˚§\⁄\‚\”\\◊Öºpy\À	\‰•#\»K∏}V÷Åº0Ç\·Q,ìúx\Í`Kˇ\Î@xÉ$_æ\Á\÷b\Êa\Êa\Êa\Êa\Êa˛\Ô˜8Úˇ\n\—y\\\r\nendstream\nendobj\n355 0 obj\n<<\n/Length 6809\n/Length1 14756\n/Filter /FlateDecode\n>>\nstream\r\nxú\Ì{	tTU∂\Ë>\√jû´\n»≠\\™$1$ïÅ0•$IeBÅ@xu#üWÇ †aPlZ¥ 8Å~P[\–FH\”zÉÅF\Á®\»G≈∂\’n\ÌVÒ\—m‘∂•Ö∫y\Ô‹™ÑÑ\÷˛\Ôˇ˜ˇz\ÎØ\œ>p\Îå{Ô≥ß≥\œ\Â\0¨∞\Z\ƒ\'O+(Zı“ç\œ†\0 >gabâ˝\n\0ùÄ;\Ê,_*\Ÿ.\Àx\0\ﬂ\0\€\Ê-ôøßâ.Ä˘c\0a\œ¸D\€Ä\0ß\0¿>ˇ\Í\Î\ÁMZ0\ÏÄ\Ï\”\0\ﬁ=≠s-\∆˝sñ\0†8\0î∂∂\ŒMX\ﬁ0\Ã@\„\0`X\Î¬•\◊}<!≥	¿}Äu\Ê’ã\Á$˛\«¡w{\08@µ0q\›n6¿9\0ê%\Œı?[˙\0-@+ó,n[⁄≥\0\Ê†¡l|…µsóT>≥Ò1\02\0\0å`°ßlÄ\0\»˝\–^ò`∞C\Ã@V8Dü≠C\œ<ÜÛ\0àw&w\0vù›¨\›`\ÿ\∆z˙π_\ÔAôúôq\„?\€\∆}+\ZD}§ª§p˚=û˚\∆Ò≥õì\«\r\€\ƒ\Ÿ\0`\0‹ªîv°{Ä\‡6sa\0îï˙%\«`˙J\ƒ\ÿ\ƒÛÑ£S6∑?\Õ\¬KßUB$¯Ü\œ\“\‹pãx\'éIÄ~\Œ\∆h-\◊\≈$£Ø@˙\Ã@a5\0;0É# j°¶¿ò`9¨Ñ∑·õû}\Ìp»ÉK°\Í°∞\0ÆÇ\ÎS£=ü§\nπ¨∑¶ó\Á{ûøP.ÅwÉ.\Á∫¿À∏.\Ó\»¿QZnX\–sJ\◊E\ﬂSs≥\'\◊Æs˜ı|°\›\⁄Û\'mg\œ)\»\–¸#Z?)Ω¿:∏	~¿\›plÇ5p≤A;@dì!P+5IhhSV-i\ \ZälC+Ü>9î\\\÷ ö\‘\Œjà≥B\≈ˆ¶`xXS¶´\'K†=Y<\È…™Øg\’EÉYÆ∞≥âC§âÜISA6RAû$§&öôıØQ$á≥õá˝Mﬁ∞ß…ÅlMˆ∞≠\…fõl\√Y∂£6l≥ı\ÿ0è4°04-Ü\·I¯3P;†\’^ƒ°Ω\Ëû\Œ\È\”rsˆ\n=ç\r™a\ *Z£ß±gdj≥ ØQ°©˘äX\'Bw)∑\ﬁy\'L“†Mã©\“•AmôS\ÌC:Ω0Qik\ÀÕù’∂tY.É•πmKs˚É\ﬁÃòïíí\0\Õ\Ãz®\0ÆÖ\'\“uNx0]\«`Öª\“u\≈}Û)d\√\ËtùÉ\›Yù	\0&\√òã`\Z$`¥A>4\¬\\ò\À\‡jH¿µ0\Ê¬µ\–`1,	\n\·(ÑQ}Î§æï\“+{géÖB∏¶A%å˝üR\ÿ˙{\ZU∞@˜è•∞\0V\¬\\h	Z K!ÃÅ≈∞ÆákıY≠∞Ù\ﬂ=k\'HP£tNÚ”µB\»	j`1,Ü˘p5\Ã	*a1\\KÙgB\«\œˆ{â.˚¨,ı∞L/˜˛á\À[(]ÖGb#n\∆\Î:¸˛#2Å,#ø&g\»ZM†\Ëi\Œ˜É•ç{ï\'¸˛Q˛aÖ∞B¯Ö\·\·{±QºC<b\»6,7\Ï4ú5é5^g¸π^\ﬁ3\—ˇ\Â\"ˇßJ\…≤T_,\À\≈r±\\,ˇèñ\ÊH\Õ\ÕJ¨i˙¥∆©S&_~Ÿ§Ü˙∫⁄öhuU\Â\ƒK#∆è;¶|tYiI·®ÇKÚÛÜÁÑÇ\√\‰\Ï@VÜ\€a∑Y-&£Axéå ORQºZ%A\…M\»\’r¢6?O™\Œh≠\ œ´ñ£qUJHj4Æ“ê\\[´w\…	UäKj(°Jâ~\›q5íê\‘yÃå§fF˙f\"ª4\∆1≤§©í•Ω®yjLñ\‘;´dERø\–\Îó\Èu\Z\“ñ*Y	ÚÛ$ù+∆≠T≠Fó∑∂W«´ÚÛPß\…X)W\Œ5\Ê\ÁAß\—T)WöÚÛ@./\ÈD\√\' ΩÇáWè\È\ƒ ZYï´-Íî©±\Í* †\‰\Á’©VπJÇJ•\ W™ÇéRZ¿XáuRgﬁ°ˆ;ˆ\⁄av<\◊\‹\"∑$f\∆TíPÚÛ\⁄Iu{˚\Ì™#W!W©#V~öëüW=WÕì´™\’\\Üµ°±èN\√yíH\ÂÇvYjˇTóø85∞\'ë\Ó\·ÉˆoÅUU\\©¢\∆XÄÅ?*G\„\Ì\ÌQYä∂\«\€{{Vœñ%ª\‹\ﬁi6∑/©éK*Lâ©(±∑gˇ:ø\ZΩCQ\ÌÒV4FIo=\⁄ÿ†∫¶^Sq0*µ&TTI∞Båˆ}s¶¸\ÿ0®B•\ 3	L\ÎˆF`v~^@]=5ñjK0€ø\"πää\„l\‰PÔàßâç¨\Ó\È[ó˘y\r\”b\Ì*\r÷µ\»\’\‘»∫Ñ∫z∂*%Ædäë\Ì™ıØ˛Ä\‹\ÓtH\Âä>WRI∞ÆeÅ§r!ïg´˙/Pià-i∑\Î\r\Î_S?_¯\€U\Zr8•rY*/`x™\Â\Íx˙\œÚ\÷uıl)?O≠\ÕM\¬Ùò\Z©í™\’H\"≠±\Í\ŒQ\’ru\"Æ¢¯Ç*]ôjÅºDu\À˚¥\Àÿ™^0-¶/I/S›ï*\ƒ\Á§W©’∫_I\’\ÌÒ™ó<5∂\¬=wK˛ß\¬PJõÏ≠å©$T\›kôßf\≈˝-™ü\'\≈¸5¢®(°»±π\n3;ŸÆé¯ÿØá¢\€\ ÙX\√4πajsltöë\‘\0CGÉ\’†ëc˛\Zï™bPîb\ÿOï\Ì*î¢*\r\ «©4®\nAQÇvïOı2√ù8Nä!?Ù\ŒVG|¨éê™\ÁV•\Á±ˆ\0§3ß\ \⁄^l<k™(^Y\Î(Å\‰\Áaï•4aïäL®µΩC$(©4(™8XY´w1Yf0£óbÚ\\Yë[%52%\∆ˆ\∆ƒ£K9-]\Êi]M\–\Í\'¨¸<\r\”˚\ZLòj4\◊\ﬂ_∏jç\ﬁ\Ók\÷^0\\\◊;,µãr√¥vÜ\\N#\ÎT`&\ÌÎ±Ä9¥M»í]ä¶∫Ω3a\Œ\‹:Ü!ë\ÎZ\⁄\Âi±q˙\ÏÜ\∆\ÿ*ˇJF\À	\r®a˙\ƒ¸ºN;e¥fjg≠ô\÷\€gê\÷Lè\Ì\∆W\∆\'*ù\√–ö©±}@D\Ô≈¨óu≤Ü\ƒ\ZScl7ı˘˛}Ä\’˙(\’;ÙˆúΩÙ>±∑¡úΩ8\’gO\n\ÈÑ\"Äa\Œ^ö\ZâÙŒ¶0gØò\Í[≠˜\È\–	Ld##Üà[∞ø±Æ\›\\D‹è\0û2#ÚwÆ∆ïçz˜^¥∫\”Òßf¨ä§8\\\”tûtSs\Ï)3Xê_*ä2ëA~^uF´\‹¿éïj©Ö\ Oî\÷ˆ∏¬ú\rº*™8àT$O\0\À:\ÊÕ™Qû;Q5\…Y\ÎØHıÛ¨_ê\'™»ã˛}˘jWNQ≥Ä+bŸÆJÉ∫˝\Ìˆ/ò¶î\‹¸ºv˚g˘Ù\Ó}+É\›ˇ¯≠\rûçxå\Ôm£øB\≈ˇ\ﬁ˚ü\Œ¿@7gÜU\‹q\Ë¶m\–M\–ÕΩ\r´∏œ°[\ÁC\Óâ”ì\–Ms†[(án^Ñn~,¨¢\«R\„Ùk\Ë¶-p%]N\Óm\ÿO_¯è”ßm0ã~*9\nmÙsh£´†\rw¡:rt\⁄<l\”\ÁÖA\≈<®\¬5†“ì†\“\„˙|ï≠!U†ícp%~≤\ËIxå\‚~¯E¿\‰ 4˛üñ\€\ﬂ\Ì\„a¥ˆˇ6ç¶ãˇ*\⁄ò.˛+\È_Ñãp.\¬E∏\·\"\\Ñãˇ\‡±\–\rò\›-©ë\Îxû°Ñ√î\0EaT.érÅ≤Ä#pò‘ù{¶_üºù\Î˙ææïû\0ç\⁄\‡∫¿É#få®\’f\ !**NT^\Ó;\nª≥,\Ãcè\€\ÈìC∏qÀÜm˜¨øo\›#˜n∆Ö»Ä\ﬁ|\‚∞VÙó\”Z\È≥\Ëeˆ%\∆x\Ì\06˜b•Få`µ	\ÕàŸ± ó:KäqN\ÿ\Î\ƒ\Ê-Yw\ﬂ˙{∂1¥\⁄ﬂ¥1;†\◊OˇΩy¯I≠Thg\–B¯Dp<ÕÅ¡\»\—\—é\n˙xWöe4ªdïˇRÀóæ\Ìªk[Q\—\Ã\‘W(úù;\0X°<2[M\"\‚ò\Ã®\›f\≈uäâ≥Z)GÄ:°\"\\\·,/pñ\Áˆ1\Îp˙\ GHÄ\»(å	\Â°ÒÆd◊û]x\‚›∏Bõ\€êΩ#v°cZw\‡˚*|%zi∆™xõ6ª3”É\\X¡\‘EB.:\ƒh\ÀÃ¥\Z©`•Ål—ñaÀ®Wl6+X3\Î´|ı\n®»Öåä\\á\ 3\nÙá˘R¸§\‘ê®\«\Õ\ÍpS9\‡\nïñád\Ÿ\·H◊∫\—CHFt˝:tôˆ›ó\Z\Ó@{V}è\n;üz\Ê\◊\\\◊nﬁôi,\◊>xÒCRu\Õm7,LÆO˛n\ÌÜ5´ôWıú¢Gπ\◊¡°àõX\›+Òe8°NqR_ßò\\}¸\ÈLéB\Ÿ\‡∞C∏®\Ã\√\À8äù\√\¬E>!D\∆~•ùDñømzÒÅè¥gµ≠;Q\≈{\'v\’n\Á\¬\⁄s\⁄I\Ì\⁄+eˇΩ≠A˛à¶Ôùæ\·r\0\Ã$\∆≈∏.¶kq[ıO-ú.\ŒRØpÑZ\Î¶•^\Í\Á\Ì	G@báÄ\ÏK¿≈¥\⁄\›\⁄U\ËjB+˜h\–>˚\Ó(\ZÖäIm£v◊•›¶=éÜ¢\Ï≥KP.\€s7\09\√uÅ	\∆D≤x£Q5[xCù\¬ÛcÆN¡\Î\‰ºP=i\’ébLx\“…ôs\«HAÚ<+π\r\ﬂ\ u›Øçÿò<—èíä\"Éx\0DDDå¶9°\‚)»ΩP[G/zÆ\Î˛\‰\…˚”ö\„\∆sØÉü\Ì\¬-fblıãt\◊)\0ú\Ÿ\Ï®SÃîÛ\’)ú\ÎGwÅ~ÄY\›Å¢2GÄLB_-=˝∞∂Gª\Î˚¸OØM|˘\Ì[\Ì@¨\◊ˆa-Y°u®\ÂSÙOO\œ\ÿ8]{^;°ΩßΩ)£\ÁS{\Á≤t)á#ôÑ@§î\ŒbIù\"äúë\'à\”\›0\Ï,/\Ë\ÁÖ}õw»é∞#\‡sYÁ¥éÇ;∞öú\¬u%7\‡E\0®\'Æ›àZı4$b1â¢\’f ¿\’)êù\⁄/C\…pë\Ïúo∏®¥\ƒv∏yÛ¨“ö\À\Ê\Ã\Ô8§\›\Ë_\Ôæ\Ó\ZÆ\Î˚\ÿ¡ciª†\'uéGF<å[õååc,rÜ˛‹ñ\–tFQ—ìØ&ˇuSGæø;πø¥&˘◊ï\Ã\≈«ì∑ˆ≥≤\"V@y u\n8œ≥´Û\ÀDtw0S˙˛\”Õ©µ¸5\Ïª1(ädà«õ¨Voq{ê\—Axì@¨¿3\ÊwæÚEâdØ\«!;(å\¬\ŸQ\\&#2E≥ã÷á†£\"z[Î∞äöô≥o~\Á\‹,Æ\Îl=\Ì˙æû<±\Ì\‡˜_ßıX¡uÅ.âx</ õ\rp8MD∞â	˝•2PÖi\¬a\·2Gò´x˛\‹D˚Cá\»[Ò\œ\È\Î\Ô\Ì9wò\Î:;∆èÇ§Ü\≈f\’π#`ã	N0Û¿gf<uäÅ[ùB\\?Rv+≤;\√ENá\ÀŸò;®=§Ω\»\¬ä£*4\Õ>€ñ¸\Íõ3\ﬂ}˝MˇN€™-B\ÎP+öã\÷jK¥G¥\ﬂhGP\ZârP°v$üh´\ÓΩN(é2ro\\n#≠WåF^úıä@¯¸∑WÖ£êõd&y	Ö\”Qõ∂j«¥ª:\–\rxX“¥ÈèØ\Ï>HÕøˇsÚ0◊ïÙoÿ∫˛Ætd§Gπ.0Éj#AB\ÿlp&£Q0`\Íı,`Åz\≈b¡Ñx\ÍBLX\◊¬è#:7:\'\‘cÁêåÇΩ°∂¥Y\“\ﬁGwvkkGO\Ó\ŸÒ\Àgá\„\…G∏Æ7èjøüó\\å\„\Óæ{˝j@pe\œ)äπ\◊aG¸C]fÄGÉ!ÛP\‚ı˙\Î/%ÜJÇﬁÇ\‹TñrJº\ﬁ˘PN(TR\\öä<Ÿº\«\Ìı˙º^äµ9≠ùª£˘ù÷é]\„\Ô\ﬁ∆ì⁄±˜ü)y˙ó∑?0˙÷µ\'~Ön=¸^\Âc°ºõ\⁄&%\Zã\Î^›∫Û\’)˜MZ:Rbja\„–ø\È\⁄\ÃuÅ\0\√\"N@\"D4Ñí:Öˆ\∆[˜ùi,ÿî<ºÆC+§µZ!óuøc˜˜ú\‚2π.p@0\‚∞#£Äó\”!j©Shzè\·˛Ü\Ëp3\‘M*\‚pô\⁄[\⁄\ÌåˆQ«´\œ\Ô{ï\Î:w˘˜\⁄ëté<q.˙Ãã/\Ì%{S_ö\“∏.0¬†à	Q≥I$@	aåÜù\Â\ÈÙÖ\ÀKºæ\“2j~&˘’é\‰_ˆ†)c≤áça©\√¸\Ë\Êm[√¨ûS\‰mÜL5ë`∂h\Z:43\”)í`a\”\–\ZõL\‡Òÿ¢ä\«\Œ\rä*ú<L$ÁèàÚ~\‚I;sé\ÃÛrv®\ƒ,cvì-‰îñÜãºG∞®¥§D\‡ôÚHc@l|t\Â£˚∞kˇ\‚ïkûz8Ò‚≥öuK\Áˆóü\\¯\‡¸∫[\–$;_u\”\r\”o\Ã+z\‚P“Ω¨c\”AX\ÿ\÷<0®=ß\Ë2\ﬁ\r.»Ç™H∂\—\Á≥\Ÿ\ÃCàôHò=Ná\—¡?(™^pG∞0≤pFøº3≠ét \Â\»\—n!\\\Í\”\Õ,e~¯â˜˛¸’ªWué3\À+∂ã\‚\“7:6n\Óÿ¥q#m\÷~´}≠}≠ü\‹x\'\Ô\÷nªq\Óc\Î^¯¸ÛW>:ˆ\Ó[\Ã.\⁄zNëutf*k≤\‚1êoâ*ºúQºfM\\:kÚ˙ÑPHñt\Î(Ûxﬁó\⁄Yd¯vÚ\√˘·≤õã¥›è>≤ˆûEnDf\‰ByŸæ;ΩC¥ØΩ7ˆ\ﬁr¿å*-\„\›\‡Ñ,ò	\·}`µ:xápzl\0ôâ¡0(™\Ï\ƒUà˜\«≈£K\'(Ûr6v∞x\È\Á\‰8\¬Y\◊eq\⁄\…fC\€gø˘Û\Èw?Za\Ëˆ€µá;6m\Èÿ∞eÛΩè£≤!\ \€6˘2toßV\Ï{S>˘\ \'G\ﬂz7Õ•ì\ŒÇ±ë¨£\œDà\√H˚}¶®\‚ÛœªuAY™f\Ó/2ß\«¶\ƒ≈ìl^áç\ﬂhü#\Ó\√7O\'-‹æùøä=Ù\‡-YÒ¯;\‹h8êç÷æ˙˝Ç√Ø\÷\ﬂ\nê\œv=\–\„LkC\0àï\œ7îGÜ∏\Õf\∆\·à\«k¥E# N‡¢äK∞\Ê\ra\Ê\Áè&4gπû0\…π§¨\ƒ\Ë\rZû\0~X;π˝\≈Q‚üñ\Â∆´f5#y\Â\\9y•a\‹xtü|k÷™ˆ\Zˆ\≈{éÊ¶Öt&åÑ2∏E&\‰féö≥\∆sÖ.\‰\‚\»\Ï¡Y¡L\„\ƒ\ ¡∂[IT\«\÷(\∆lq§M¥âﬁë#qç2\“6º¢Fn˜^R£x˝i\—ı©8£†¿\·,/\œ˝ë\Ë\Ôº^èõó≥st`æÎ¶Ål\ÀB\Áü\·\"\ÍıY\Œ\Ê]¨QR,gÛ¥ı¡y*ÃΩ≤æ˘˘\›\œijˇÚõì´óé,èT7]ı\ﬁ\À3™5\«\∆;éu/z\‡ïk~\⁄|Û\“o˛∫Ïß¥vAÜ|M\Õ\÷C\‚\Ë¶¸‹çww=˜»Üñ\rÉ\\SJ\∆5èîw\\Ω\Á˜YPfÆ∫J©æöåk[~Íªüfˇ2à\Êq\»áÄ\"dwXÑZ≈Çmài\Á\Õ\‹Tr◊õ+ÜI±ç\ÿ˛Bh\∆ˆ\Ì{Fè>f\Ãë£i-\ZQ^R:ztY≥Ä\·\›`á“à\ﬂn5\ZM&ëßúHN3Ä\›.äD0yà-y\ ·äî(S~S8\nïñ±\Àao\÷\Á\–Ù\‹ö˝íVÖ>\Ë\÷V≠z\Ï1éüÉVh˘\…uòøZõ«ªœΩR÷ñ¢çfn \‡ç\0!\ a\–w”õ®≤ç0\Êywj6ˇ:ù	2D#≤\«\·päê\rNôˆz<\ŒLj…¥Dï¨Lª\Àf\0ßGOˇRf\ÎpñgÑ\√\\$éîg≥∞∑ˆÖKK√í˛d¡ú.Yæ\Âæ\ÌKV<∏~˚\Ì~±\‡óW\"4Y,‹øbˇ>\‹˝≥ü\Ìﬁó|ê˝˛˙xÚ0≠\›8•yˇåñ\Á\ﬁJñÙJ∂ä\Œ7F2¿mEÉ\€\‡ıò\rv;ç*vª\—\∆d:W\Zê(.\‰àÒB^yÛÆG\·Ω◊º¸*~\È∂[ˆø´”ù™\ËDS±f6ù	f\»`Ÿ¢,É2çﬁ®b¥˚Ä \ÿ?[î≥C∏Ñ8o\Î\Ÿ<ù≠}˝ÂΩü˛ôø<Ål\Áû\›Ò\Ë£;w˛\‚\—\Ì8®˝E{ª\·_!3\ \’\ﬁ\‘Œæı\·o˚-ãv™\Ê¶\ÀÙ]†\"\"eö® àYN—ô-S\ÿlû®b≥l¢üw\Á£^Ñıà\ Ig\Ã)!∞”ãÖº~;¨\Ã\€o˜âëéE\ÔÒ’ó;6\‚\Õwm\›\Íû\‹ü°ç\Áã76O\—\ﬁ’æaá˘dˇ\Î¡\œ_9Ò⁄ëò¨47-\”eï:]\ÌCºd–†L{¶\‰˜ŸÜÍµ∏\\BTq\Ÿ-U,ˇ\Ë¯HùE•e}áÖØ\Ô$)K\ﬂ1x|˘ˆ∏wnÿ≤i\’;_û~˜\◊2~∂\›di[±˚\Ì\‡â\◊>9zÙ∑\Î\–HdBtI\«∆øΩÅé∑DO\Ÿ…°3¡##nã¡`4bá\”d≥Ä\—\‹˘S\ﬂY>\‡-So0\Ó~¨nåØ™¯\÷g∑Øuâ\„w—ô\ÊÕ∂˜∂&˜\–\⁄◊ØZö\ cIù	√†428ï\«rÆæ<6™x\Ì<1Ù\ŸO¡e≤,îˆe≤9ó\‡øOdI€ßoæørÚ\”\”oæcÒ\÷M7Uº∞s\Á\ÿ_‹∂¸∫¸ñª^Xãr7mØ\ﬁ<¸íiMë+&î7]\›p€ñ\⁄€´\Í/Õõ0∫§\Ê@ê\’s\n\Ô\‡¢\‡eπ∂\›\Ì6òNB3|Fó\›U£X#võ\0QEH+j–ëI[J?vªw∞´,\Ïao\‹^\Ï\Ãk\Ã/©=ˇ\–C\—8ö†=?kôE∏\—\‚@ìÒS™ˇ§›îºaŒïÃ£\Î9E\Àıˇ\ÀT\…D.¡l6∫åØ\Ÿb±ãnõ\Ó\’^So\Ê\»Ú\‘¿\€Oov»ΩŸ£MZyÛÆüo_õa?ΩÙ\’Whm≤¸∂[«ë≥{\Ôù:\„\‡1|\“˘0¶µ`Çåà\ÕŒÄlzí\Z\ÓÕÜ(\ÏÚ˙¬•NW°G¥¯\ÓSS¨¢i\Ÿªµ8≠M.ˇ¥™]ÜGùe\Ÿ5\÷‹îßµ\‡a∑É\rà\◊G-`qFã_TUú?3GπRàK]aƒßt.*+√ªOOvâñi\'vk#¢ø^3©æ¨\Íóu\„imÚ\Ówˇ9¸˛\…Yi\ﬂ«≠\ÊC2˛\»BZ»ç¯DD(¢FGkŒÜ\ƒ\ZÖ\≈˝˛)b\ÍïR	b˜ \œ}Üg$è\‚œìªÒªÜÃ∏\È¶s˚°µÙ∑\ƒ\…¿\0Æ.5ö\Ëj\Í}?äJK\À\¬ûd¥v\‘bÈµº\'\"ã\È\◊\‘K=ó,\Ó\ÈI›≠Ö6Ç\"\0$¿rdDç >Ö\\rK\0zzRï\‡\€\‚a˘`3≤˙˝m\0j\”\ﬂD;∫Ärà∞∑∫\'¶\ﬁ[tw∞\À¸1¸_\r\nendstream\nendobj\n356 0 obj\n<<\n/Length 3898\n/Length1 11028\n/Filter /FlateDecode\n>>\nstream\r\nxú\ÌYp’ùˇº}ª´ﬂ∂$À≤cAºõçî\‰,\·Jî¶Xÿñ∞c%Ò\œTõWr\Ï\ƒ\Êv\„$4	\Ì9!%)ù)ws\«–ñ\·ò\ŒÒ2B\·ò;`Æw.\√0\”\· 7@{=†3Ö°$^›Ωïl•˜£˜GgZø\÷\€˜æø˜˚cW#É\0®¿(2[\Z[æ}ı\Ë˚\0˘@f\◊\ﬁ\Ï˘W\È\ﬂ\0r/Äùª\ÓW™\"u˜B/Ä\«vO\Ì\Ÿ˚w\”?8\08O\0ñã{≤\”S∞\"\0\‡\0\Áû[\Ì\ÓöOæq¿∫e|,;\Ív\ﬂ	êù\0Z\«\««≤k\ÏIÄ\\`\Â¯\ﬁ˝\ﬂq¸pM®\ÿy\Î\‰Æ\Ï\Âá>xê“Ä•ioˆõS\“\n°¿\'\0î€≤{\«j\Z˝†ø\»\»\‘\‰Ù˛\‚v§ñÛßˆçM=oª˙«Äp\’\‘!`ÖΩXD%@\ÔG~§!AÄç\ÿ	((L(\Ó\Êˆæ`==˜(`?}\≈i≤ü\Êî\≈@\Ô7)d\ŸÎ≠ªN¯ı çYmVìsæΩ\Ê!~}µ\·_^Ω\‚ú{\‘~\⁄ µmYß¶∂\"xÆ\›põ)ÿÄ$∫±Éx•X,SnD7z\–\œ)≈∑9\“\Õ\Êıπ/\∆\ƒ√í*Öß!“ÉR ı•+}ª\…U´ 8¨2ïDAπ\Ïb\≈\Ê:†@¡+rΩ\·\√]\÷\”BZ˘k\Œá•ºï}®§<jp@\ K>\Ô\\F\ré\0\≈KfnV\√\«W)è\Í´˜\ﬂ3\Ó)^4û.^Ç\◊\ÿˆ•πˇ°îgºãè	H^¡\"\‡c˛¡eºÖ3\0\‚\'mjó2§:T\ﬂEáñ\”b}o\ _øuÛh˝ñ\‘h}h≠{(]9¥¨™Xoãı2-\÷oN-ØMëT\“U_ıIÑâQ:TOI%m£èS*˜$_Læû§Zt\≈\–5\—¿ê?Z=\‰!ïC\Óh\Â\–\„ï/U\nMïÑD14â?¡\„¯\0¢d\∆O$R ﬂùhh\Ë)Xä˝=\Ã÷ªÉë,8¿\◊x\ﬂv&ü`⁄æ#=K\»wÙcßO£˝\⁄\÷2êf µzH3˜µ≥~¥\Î\”\”\r\”\”\r¶áß˜Û´π,@\Ì0\0∂Ûm\0ˆ\·æÚû¿ãª\ {>)wî˜\◊aKy/\‚\Z¥î˜jQW\ﬁÀ®∞S\√m@∑a\Z¥c∑b\€0Ü}ò\∆&q4\„:4£iACY\–Qt\ÊeæÇf‹àt\‡+ˇçá˘\ÎØ[\Ï\ƒˆ`˚1Å\√\√(å\"ã˝\»B¡.Lb\ná∞œî\Z\«~(¯(hAì\È=R\ﬁ5#7aìÿÉ[1ò\ƒ>Lôk÷¥\œ\Ô\Ó:≥˚V˛÷∏Ûs¯i\'á\»YÚˆ<\n+ÑÖ\„\¬sT4ÒkÙI˙\∆\ÔE¸ø–ªÑK∏ÑK∏Ñ†∏*~”é\Ìzzhp†øØw\ÎñÕ©ûM\›]7%ù\Ì7\∆\€n¯\Í∆Ølà]øæu]sS\„uë\ÍU°\‡JmÖZ_\ÎÛ∏++\\ª\Õjë%ë\naÖëLÇ—†\‚IfµÑñÌäÑïD\Ìxg$ú–í¶dñ\Ã01§uuô$-Àîå\¬BY¶dë3,ûU\ÿ\Ó/H\∆KíÒI\‚V6b#w°)\ÏBß¶\»ˆæ¥¶∞”ùöÆ∞\À\Ê~≥πC\Ê¡’©\È™\Z	+fT<Z%¡í\«sâLg$Lfˆ≠c\Ã	c\÷\Ó\Ë\–:ë0\ÿjmjñ¨æÅòaub√¨\0´ãªe4ò»é≤ﬁæt¢3†™z$\‹\Õ*¥NìÖ\”$ì;ò\≈4©L\–qRô\r?ì;Upc$\”\‡\’F≥;”åfıH8Gπ\‹q\Êi`k¥N∂\Ê;µëpbåÖµ\Œk\‡V{˙¸Ù|\Êí0)\Ë÷î\‹G`$£]æÙyJ∂LëÉ\Óè¿∑L\Ë`§?≠r$µd&óKjJ2ó\…e≈ôMqkπYß37ï\»(ΩiF≤Ö\‚S\',yJg\Ó\Ã8Ÿ†óo=\Ÿ\ﬂ√™˙v§ôL*\„YFÉå\€4ı˙Ä\ÍYê\È˝Ml0KìyÜUïß\·d!éëHXe3}\È\“Y¡H\‡\‚ç\r:2úÛ\Ã<ßzàsf\Ê9\ÍMçÑ{\“9&ªGµ\ƒãüÃ≤ô¶do\·Ö\—‹¨\‚„Ä™\Âº%÷®õ≤\n£¡\Ó\—	ÖI!&s≠\≈\nLqïú\€<T|\\∫\\\‰òÚxïò¶\ƒ\ZπùÑñ»îˇé◊≤ô%f]\r•FL≥xßí`ÒlπbâŸ¶∆Ññ\»f\…Ltö\≈dç\⁄Ûi\Ì\’\Âa%&“¶JYç˘:2ª\ Z¨1aŒïí\»ÒN˚ﬂñr\ÊdÄ=•èoàÑ{¥æÙ9Dãg\◊*Å\'¢XΩìˆw§\r%r\È\—›¨>eJf∑í®,Æ3í’µÙò\Œ[Ts≥5f#\Èf_\r¶{¥ûæ\Ì\È\Î\ÀAó‹úL|¡åñî\Ã0)»¨A´íTgb\–Õ§†ídbPk\ﬂ\»\ƒ ≥≠\Ãt3πD\ÂMﬁæQIì\0\Ê•Ÿöãlçí\Î,\ÀÒÛ\ÁåJºı:∫\Ê≠\…¸\»H¶£+†\Íj	\"aÅâA•\ÏòIA+/@\◊<ã&≠Lvtô$û˜ZûU%≠çi∫6Æ∞xoö\ﬂOèYër2\Ã˙î\Î:¯π”¢dE\¬j\œ\‡¬Å\'ì%ãì\Àn2\œ«Æ/∞ª\Á\ŸJŒ™ı\‰∏q≠lLv3vè_\Ô	ò\œ\r\ﬁ1Z2´)n%Y\Íò\‹l<ŒªÖ7áí”∫Gs\⁄@z£)\›”ü˛V\‡0˜\ÂE\ÈlèÑg¥\œj\‰D\ﬂlúúÿû>\ÁîÉ\È3:2\Ì˙\ÏJr¢/}N\‚&U\‡TN\‰Ö∏•˛Ù¡j\ \Œ≈Åì+öÛº´@`“¨Û4Ç]°DsóÖLGq\ÿUKú¯º¥à]kâ6c\“LòOY\‹.≈≠q[\‹)∏Ñ¿,\·§3R\‹˙lO8âãfgÑé~ì\\ 3≥∂x†$1âó\"<1Ùô\Î°\Ì\È\'úpëÄπ\Í∫\ﬁ\Œ!N‘ék=¸îPFy£‹°è\Á2:6¯ôdBê0¢\›\0&h7\ÃAv2ª6\÷\ŒZ;ß∑qz[â.s∫Ekg\ƒO˛K}Ü	ΩåÿëV57S\Í\Œr\ÓÀºRzC$úsøÅÄg\—.\ÂAa¡Ú∏S§í@´M§†±•1\ÍÒíX\ÃıDõõ™Tè∫^ı®\œ\“\Ó´Oéá\ÊéK˘O7çã?(æK^ß\·@\rBÒ*Ø,;Å\⁄\ \ÍAΩ\“m£É∫≠\nm\r®mkê®\'j\⁄[ø∂5\⁄\‚Øˆ\…⁄äêg\—˛¿ˆm;vˆ\Ó\‰◊õ˚w\ﬁ3∏-›øuáNOÚMüû.˝&\'ìûÜ.t\ƒU¡E≠≤\‰pP¿b©§¢X\·R∫\ÀEı¢-\⁄ı\∆\ZK˛MÙ\∆<—®7Û\∆b\ÕM*U©JTBÑ\–*ôä\Îoô{\Ô\„å í#Ç<g|/hUˇí\Ï4~ =˝ißê!Ø›±r∆∞\ﬂ\‚\nÄ¯K)èJ\‘B¡∂x\ÿ\‚Ûâb\›rácÖªÆÆ≤Rµ∫óπóm÷ùn\‚¢nw%*\ÎRz•µ)t>%^\ƒjø>|≥π˚,¿(è\–\„ôW\ƒjül©ˆ˚´}¢¶íhKÎ∫µ!MÛxÃùZ ˇL÷ìeGvü<bºı\…\‹§ıÏ∑øq\‰\ÿ˜_ò9l\\ïÚ≥\œ\ﬁ˘®\«^ˇ\ÿ\È\Á/\“\È-\€ª\Á~l\‹92ñ¡\Ì\≈K\‚\À“ã£9^k©™™•.Wç§tèhë\ÏRJ∑Û\“y≠5◊Ööõ\»\n°⁄≠∂¨˜»ö\œZ\Ô\ hKç%¢¡«ü!ìæ~ˆM\„Y\„o!\Î_~ı\'£˝èà\Áç_Ωg\‘l6Æˆê;\…-ÔêØ=π\Á\Í™\rx•RVTbu\‹g<.QtKŒî.Q—ï\“E\Ô\‚\Ê);wCU=™\‚V5OTëc\∆\∆yë\Ï&ßåø72?<Fû~n\‹o\ÃHy\„n\„á\‰\'Wª@Ãä	R$\‚+≠\"\‡í\ÌvBú≤-•;e‚¢≤LAJ\È%ˆîNºø^•\œ*mn\‚QTó?¢p5O7\Õ]\"¡\'\Â\r\„\„8J^©!\Âa\√\⁄xùïRáb\ÁN˘Û¢m\ﬁ\—b/ãùêü/\—\‰\‹{\‰C\√\Õü+Yóz•<úhè\◊;¡\Óp†\¬J%\…\Â\Íp\»\‘jïdJ$sº±Ö	0›¥xJC+˘\"è\ÍQ=\ÎâJ§^\„!\„\Ëù\∆§ı09E“Ü å\œ},\Â\Áv˝à¸b\ÓP˘\ﬁ\ƒ6)	ıÒ\n\—BôP–îér\Ó ∑\“\‹5\ÌH´\–\'\ÂØl*ñµ\ÂW§<|\ÿø\∆õ\√f•REÖ\À\Âó\‰jØ`dáÖV@ÊÅõ3\\\n∫•t5±Rà\Ê≠\Ê\∆Iîpk[´4B5\„![ïÒyÑló\…$y\ƒxã:m\∆qÒàÒÅπ¥îøÚ∞8¸\È&\·lÛÒ]9^\Œ\„ysö[\„\À\Ï∞\Ÿ\Â<Tíeã\€A-VJ,ÛœíX)ä˘T\∆¯§™ã\÷yT\Èºqp\Ó.3à\„\¬K%©˚ç◊ø5\◊+ÂØú#\◊\ŒB\‡3(˝L∫\0™yˇ{Ä\Zß,˚mU)\›&\“ îN´æºˇxÃï¯¸Q\≈\„VW\»\“œåf0\„2A˙HªÚ\ÍS\Á»¥qœπßÖ7å?3ìª\…^≤ó5\Ó0\Ó˝\Ërôºˇ+îg∞Àú¡\Zlâá™jjDª\Ëv\€˝\’\À`∑;µU6\'lõu¿\·tZS∫ì˙f\"\⁄ı≥Góªˆ[<±r57-zZÒÅ5üd®Q	yÙ{ß\Óπo\ÿxÅ<F˛à,ˇŒüíM£∆£\∆˜iddb<=wh\Ó%)ˇ\⁄G\œ«å™\Ô\nÕºWÜãó\ƒ\Z\ÈE¨B\"æ\"PWßBï|N¯∞zçOÖSu.∑\’,O\È5\"µ-Œö±rï\ /≥Ö\–|¢∂bï\«\Ô/ÖZuù∞n\Ì\ hãü?«¥rµ\œ\ÔØÒ˚\≈\Z\„m\„?\Œ\ﬁ{ah˜ﬁ¶õ\Ôπ˚\Ó^b˘˜}/}cÙ¿üoJá˛\‚\¬\‰æz\'Mîˆ\÷-õ:n\Ël\€ˇ\‡û\Á\ﬁlm˛ES®ø}\ÕWcõF~\Ã\„_àá§<,≈Ω2@	±\⁄,T§)]úü~òañﬂë|\Ó9\nóååi±◊ò\œ¡0@HJ|çûñUXqM\‹A≈∏∞\Ÿ\≈†±\ÓB\…B\›˘ñ\Ê&≤ÆuΩZ-\Àí˙QŸ∂ˆ\ M\‚kÅ\Á«™\◊^hA±X\Í=À¥B@,8Hí§\÷\'Ñ\ÂR\r\ÎPûPÚæ˘¡ìá(\ Á∫ç˚(MtÅ¥ÚoÄxÅü(Å\‡˚\Ì˛KÙ°~O:H§e∏]∫ÑÇxqî\ﬂ\œ\‰zQè°`9âÇ|y∑/∫P\«1,>Ã´˜á	\‚\Î$ıªÚΩ∏K∞K∞K∞K∞K∞K˚\¬#(¸\'ç¥ã\r\nendstream\nendobj\n357 0 obj\n<<\n/Length 5830\n/Length1 13484\n/Filter /FlateDecode\n>>\nstream\r\nxú\Ì{{|Uû\Ô˜\‘9U˝\ÓÆ\ÍtwZHuäN¿$Ü§Û Ä¶%IìND ∂˘pª!Å\‡àDÉè¡Âäéæ`\\G/£F+\ 4ÅEVçä|u\÷uv\ŒCóYú—ôq\«]πS’ùò∞\Œ‹πw\Ôg˜è\Âw\“U\Á¸\Œ9ø\ﬂ\Ô¸\Áw™>\0nlEr¡\‚\ \ÍM/\ﬁ¸\rÄ< πj]™óÕ∑\‰\0∑≠∫~É\Ïô_8¿˝-ÄΩ´{◊¨˚ü©¥8\ﬂ,÷§˙z\·á\‡\0q\ÕU_]˝µC_)äˇêé˜tß∫\ÏáWı$	†Æßß;\ÂzÕ∂ s\0L\ÌY∑\·∆Éfæª\0˜Ú´÷ØJ\È%\‡ü\0,3÷•n\Ï\Âgpv\0g\»Wß\÷uü´{`\Â\0\Ÿÿªæo\√\»Z¨\»F\Ôµ›ΩMx†2@l †∞\¬,##Ä\0ÙAÙ#Ä•\‡¡AD%ñƒçO@\Õ\—&å¨6h~	¿zw\Ê	¿∂ˇÛ]˙M∂Ωf<\–M)¸\—oB⁄Ωˇ\√3\Ác´\Õjˆ\◊Vm3\ÓoïΩˆ\÷\Áª2o\ŸˆZW∞Åù\ \“\‰>\0øãè\0§({ßß∞ö|d\Â8á Pûq3∆é\ÁYu\È\‚&D!\„\r°H˜\·6\Î\›\\B˘Ü\—\«Z˘¥°s1\◊8¡p#ÄIAaáå\ÈhE±)tc-Æ\∆uxcdƒú9\ró\"é6t ÖUXãØ\‡\Z£o\‰F°Û≥˜±r¸\\çå¡á|\\Œßëè\Î¯4bb/kÖ€Åë3¶\r∆Æ∫œ∏Úi‰ùΩ\‰˝ˆë_\ÎOéúAÅ~\‰\œs˙Kêµ∂\·¸\·^‹ÉùÿÇ[à˝@tß-\‘*w\ dJgQ+\Ì,öB<S\Zß<=Ö\Œo/)∫¨=R\‘ï‘àù\·\»\‘\Œ¬ºë\")\ËHQ[<RèÖãÚ\"\ﬁNû\–N°ùEîxh#}ö\“y±¬¢ç%R\‹yA$\ÿà¯;%\‚\È#ûNègÅá+ÚúÙpœàá8ÇNA\Áz‹åßÒ[0dsÄdà\‹7∏dqYY˚êe§£]≥-ºB#[¥b\„\Z]¥L∂h\Ë\\vEbêê{\‘\€\Ôæs\'∑k’ãö<Ym◊∫\'4qÚ`\0s’ææ≤≤}Æ+3`CYﬂÜ≤Ò`6Vdµd¡2\√kò\r¿µx*W\'\‚\·\\ùÉ˜\‰\Í5c\„ä13W\ÁQ`˙†Q XÄ^t\„j,F\nW£\Ë@7\÷\‡:\\ÖÆ\≈Rt\„ZÙa-\÷\„j»®\¬E®¬å±yÚ\ÿL˘úô£#g£\nób1ö0˚ˇ\»mb\Î\ﬂÛh\∆Z¨¡Zl¿ZlD7∫ £)l@\n2Va=zÒU\\ké\Í¡Ü?E‘ìêQç¶$πZ\ !c\÷c=\÷\‡*tCF\÷\„ZÙö◊îI\ﬂX\ÔE¶Óãæ¥¥\·∫ˇ\ÀrÄx\»|≤ï%g∏9\‹:n˜w\‹\‹œ©LˇÜ\Ó°\Ô\–wX)\€\»a?`ü~Y\·;˘N˛>˛¬å\\Y!¨ûµ8,-f\Ÿiy\Õ:≈∫¬∫˚?Pˇá\ k\Á\À˘ræú/\Á\À\”Únt\ﬁ\À\‘D\Áí\≈ã.∏|˛e\ÌmÒ\÷y±ñÊ¶πóF/πx\Œ\ÏY\r3\Î\Îj´fT^TQ>≠¥$<U)¯$\—\„v9\Ï6´E\‡\Â\ eç$[4\Zñ•XJiQR≠\ÂrKAOsEyãKjrJ\÷bIçï(≠≠&JIirR\÷JRöú\ZáNj—î¨≠>gd4;2:6íàÚ\Ã1X(≤v¢Yëá»≤E	E\÷\ÓnVTY˚¿¨\œ7\Î¨\ƒl∏ö5™(óM©i\Â-v}OK≤π¢ú:\ÏMJS∑Ω¢ÉvGì\“\‰®(á6M\È$\”.!fÖõ\÷2kêÉ\’e∞\’h∏%’•-\\îhiÜBjEy\\s+\ÕföLíö–§YLíÚZCtlìÀü\ÔøkH\ƒ\ dô≥K\ÈJ-Oh4•Vî˜”ñ˛˛;5©LõÆ4k\”7˛≤†¢º•[+Wö[¥2Éj{\«üˆ/Xçãä\‹ˇ14íT>83ì\ aÑ∞¯1å™\∆5i§#2 Sb\…˛˛ò\"\«˙ì˝©°ë\Õ+YT˙ù\Œ˛ﬁñ§¨aaB#©°ë\√€ÇZ\Ï.Uì=dñö[z¨£]\À[tEB\„\¬1π\'•—∞F√çJhf0$ççY¯Á∫°Yö4¡\–p(d®a\€P++\ C\⁄\ÊEâl[\∆\ \‡3àVñ©\Zó4zû\ÌÒw\Z=õG{∆¶\'ïPEy˚\‚Dø\∆\¬Ò.•e≠›ñ\“6Ø\‘\‰‘ïÜaQsˇ[0§Ù{%π°R5\«\ \Z\r«ª\÷\ \Z_¢	∆¨Ò4VbL\ÈÕÜ˚ﬂ≤∑Ç˝\Z+ëºrÉ\"7T\ZtZîñd\Ó\Ô˙ûmÛJπ¢\\k-\À:¬íÑmñ[¥h*g±ñ¡ï-JK*©ë\‰\⁄f”òZ•“´˘îπc\÷5\ƒjYª8aN\…M\”|M\Zí´r≥¥\ 3Æ\‰ñ˛dsVÉñ≤(qëëü\r\÷\»¡g#®Å\⁄l4%4Z\““ü\ËZ≠%É]öú\\-\'Ç!-™j$•*ân\’p;E‘¶ˇ,h:áj˙ íD˚b•}—≤\ƒÃú \ŸÉ∑úCFI≥d4>¨Y\√V9¡©™±∞®Òa9¶±∞2wé\∆¬ö%l\’,aQ≤X\√q\ÁŒë$à\—\—\⁄Ùüi\”\Âñ\Ó\Ê\‹8£=Å(o∏SS\Î(5¡hj$\Ÿ\‘\Z©°,Tîs\Z\À9\∆\Z∂\ZJm\Ì¢aYca´∆ÖõZMî°\À\√\È\ÂÑ“≠®Jè¨E&åµ\Í1µúSÜ©Ûú≠ñLhçSVEπÜP˚í±Ü°L-VØ\\mû\Ÿk∂û\”\Ìñ˚≠J˚\‚~É∏í#ç\«5.ù)ÕΩ¿h%ñRdQée∫0\Z5ÇπgñADâwı+ãs\Ã\—\ÌâM¡ç//\⁄I˚íπ\ÂÉ\Ê*dÀ¢¡(Ÿ≤xY\‚ê\»[ñ$û\·◊îú´N%[%\…@\‘\ƒr\÷@\Z\r\Ÿhî:\œpVs|P\ÿlˆ2a∂W\rò8\Î(é`\’ó≈âYF%&£(8¨\ZbŸû\Ë\ËhÜUC\÷,n≥â3aÜ ¢v>jç⁄¢N\Œ\≈âÅzÜèZ¿F¨ì∏Hpp3\◊\‘a¢á\»\ÊA[4ò±6\ÕJ∏•Û÷ù\À\œ:\·\"AÛ™™\Í\\*\ [\nzîv#≠¥\»]Ü£¸≠\⁄”üTç`C@\„\¬\Z&\ZQ.Å\∆)óNpjv•{Æ\ÊP\Ê\Z¯Fﬂò\≈ﬁ¢\Ã\’HÄ¸i˙fçkZ®\√ÆHÑQì\'\r˚\≈K©e\Â˝\‚Ø*\ÿ	}+\√˘˛Ú[n:∏∏¯ˇ\Ìù\œ_ºï\Êù\ÿƒøÖa÷áa\¬0ˇ6Ò\ÔcÿîCI≤\”f•∂4`X∞bXòçM\ÏT∂ü˝√¨W≤uÚo\‡0˚\ﬁ_œüı¡|\ÌBO¢èΩè>∂	}\„˚9{\Õqhú\0\Õr\r4v\Z\⁄\ÿ¸˜\—Gõ°\—S∏í{E\Ï4ˇˇßùø\ÿ#d\Î_[¸WÒ>\Á\·<úáÛp\Œ\√y8\Á\·<¸\Á7\√\‡ågKf\Á”†∞¿êQûc\‘TVWFHe§2R5#/$Ö\ÍCR\Ëçü=\ÿ\√}5s\'ü˛¨≠áΩÇ˝\‚\”p·Ç®\”;s{•î¢±QÚíÜ)\"$Do}D\‡¸>oæR\¬u\Ïﬁ±˜æ\Ì˜o{ÙÎª∏*b#Ø?uLØ˛√áz\›s\‰˚\∆\ÎG8\Á(Uf∑¿∑\«NY\ÈD™D\‰,Jù∑∂Ü+çºús˜éG∑›ø˝æΩY˝S}\÷G»´˛Åº~\ÏiΩ*˚	/ÚG`Å\r\—)ú\€a%º±n\ ,LÙ∏π∏\Í\‡\›n\∆S0/\Z#çﬁÜJoC\ŸC…õ\ﬂP5#DCT!BhI©`°,ôŒ§\Ï\Á\Ê\ﬁ\À5\Í\›!%0}?9•WÚG>k\ÊÆ$/.›î\Ï\”gÉ\ZœΩ\Ï(üÜ˘êèñ\‰±\…vOa°\€\Œ,n*∂z\n<m™\«„Üª∞Mu{ëﬂ¶Ç¢±çeí\rï\ÊMÚí¸¨<Y’Üd\Ê˜	?ì|L	ÂÖ™\ÎjkJEírµa≤á(Ñm\ﬂF\Ê\Î¸ç\Œ\rêÇèh\œF™ü=¯˜|˙©#∑>Yho\–Ù\¬?\”\Êk\Ó∏i]f{\Ê\«[wl\ŸlXb\”\»víîD}\‘\Ì≥πi~Åq\’\ÀB\\u\‰ç\…g\nU5ÉC©Æ˜ä©\∆;5Rùo)°≥?\“O◊ß;_x\Ëß˙s˙cOí∆∑\ﬂ\€ﬂ∫èè\Ëˇ†ü\÷\ﬂ\’_™ˇª≤Ö¨˝9Y2¥d\«\Â\0ghåOiX!aZ\‘\Á6?ó\ÊÒÆ6ïß\Ã›¶\ZV\Z\Â˛ÖO íB2®àê\"Ed	˝˝^˝+\‰y\“I6\–\ﬂ\’ı«ìd©\ÊN\Î\Ë∑i˝˝[d\n)˛ºóîk\Ë\'|\ZÃä	v;a∞\Êt	∂∏*Ñ\„¯∏\ Qbè´\ƒ{Æyr¶©öa\·\œ˝\Ë\'gO\—\ \ÃM‹ä\Ã^\Óv>˝†>˝Å\Ã{\„8\ŸPù$\0ÑZ	µ;\Œa\‰E\„órPF9êæÅQÚ|˙¡\Ã\Èsñ\„/\Ê_E\–XÖ\œZ\»qÓ†ï]0¡∏\nNßWùåœè´|ﬁü]	I\¬;\Zu°\Íz)D/#m¯˝Ä~\œAíxˇ◊Ø\Ã˝˛A˝c˝M\"m\◊qz¶!\\B∂ëÆ_íø˘\Ó\“ñ\Ë\«ı˜Ù∑ı\◊r<ªvæ\»\‘r$Zh#V\∆x.ßï\∆U´ï∑îfFº\rï\„¢plÒí\"E§ê\·ã\Œ\Íî\‡¥\ÃB>ù\Ÿ¡]\rêë§~3\È1wë\…Qó\√ju{l|\\EqvΩIÉ-.≠\rD™\Îj•à\‰ú+\Í\Ê\Õ_µf\‡y˝\Ê\‡vﬂç\◊\È\œGO\Â¸Çù6%æ0\Í7§\Â9á›êò≥Ú∂Ò\“6L∞±òÇíaß_\Œ¸\ÎŒÅ\Ó¡\·\Ã\Ó\≈-ô\ÔÒ\ÈL˜V\Êˆqæ¿£(\Í¶\0,ÑÇ\∆Uxø◊î\◊PA\»?<`∏\“gø‹ïù+\\c|˚Ö\ÍhÅï\Áá\€\Ì\\>?±KTpX®Ç!ú!]~√π™$J¿/)RàDHDR§özÖ–Ö∫hu\Ô! \'≠\‰\r}¿m’ùº∏\ÎÕ≥+¯Ù\Ám,˝Y}j\Ô\—\œ~ó≥c#üÜàã¢~õ Xà\«$ØÉZ<VJ,\„µ2—Ñ9\∆)\·\Í•\ﬂx¸\ÏªVq\œÛt≤ïss\ﬂ`Øæ}\‡\Ï1>˝˘¨ 	7\“y∆û`xıQ˛\»7ˆ/úÑ\¬õ?Æ\⁄ı\ƒUö˜\Â{B\÷oe\—©ˆJ\"ßs¸Q}è˛Ç±ë$i&≥\…\ \œ˚2˝˛ì?˛\Ó˜\Ó\«˙c˙\’d\È!\›d´ﬁ´?™ˇ£~ÇTìI)©\“Od˜\'\÷cFØ5\—Ivû\‹êÁ≥≥6\’n,oõj°\¬9Ò;™É™\ƒ\«Bä°yôDrª6\Î\—O\È\Ô\Ì 7qS3éù?\Â\ËQ\Ê¸\…o3\«¯t&∏\„±\Ì˜\‰vFvíO\√	?Z£a!ú\”&Yvª\≈∆±@æ\Õ\⁄Tóã£\‘W)up¶˛l\Z1•1%a~ë\'\n	è\nD˙\»v\‚\"Dá\‹=¨?¢ü<}\‡âo?˜c.ôyîOø~Rˇ\…\Í\Ãz.π\„\ﬁ{∑o¡ï#g«øä©®âß\‰9ÅÇ<ûÖKúSh å´FmåÑ	\—B|LëKkÅ,˚í“íí⁄ö∫\Ï\ŒS,¯}Å@~ ¿8˝_>\‘\œﬁµ\ÏÕûÅ˝ﬂª„µßıS\Ô¨˝\Ó∑\Ô|h\Ê\Ì[\ﬂ˚π˝\ÿ\€Mèóî\ﬂ\“wY™£&˛ÚcOæº˛\À6¨π,µ®™\„\Ã\ÔÚ¿ñÒiX05\Í\·	•VõÖ2\ZW\Ÿ\Ë~ã\»XN36õ⁄ê?\ƒm–´X´^\≈=hÓ±áG\ŒÖ|\Z\¬QI$v±\‰y%+eÆ∏\ rkååwD\…g¯†π\—dwæPˇÅ˛â˛â˛”ÅóèzôOüΩ¸3˝\ÁD>Kü:;¯¬ãCt(˚≠(˚üÜì¢¬ú+£\‘4\‚\Õ\∆U\’!∆π$ê_Wœú3=ë˘\√≤pVÒ\‘Y\∆qÕ†¸\Õ]{á#g\Ë	∂Öòäy\—p±\’1eJa°\◊J\√%ÑsLôßr¸~OLıã¸§ò\ \‡7TÚEähßû\\0ó*Ç†ó‘ä\·z\√oä-•uuë\ÍÄ_\nW\◊\’\÷Z\√x¥#d\Ì¯\Ê\∆o\‚ÚØﬂ∏ı;ëE\«R/<ßªw\Ó˚˛\”\Î^b7πLöoπi\…\Õ\Â\’O=üÒ]7∞sï≈≤Æo\Ÿ\nÙçú°\€\ÿÚ\ÏY\ƒC©\ﬂFÚWLDxc*\ÁûE¯\‹Y$êo))QdS\Áı~Å[˝˝sb˚x¡#ë˙[´ıgæ˘\Ë\÷˚Æˆë0qí<R^úw`≤æÙï∑gΩú¡ï\’>xQÑπ\—\–d!n∑$Hr\»\Î˜\0Ñ8©\Õ6)¶\⁄DöSi`ÇgG\n\∆XMEÖA)\Ê$c èîñJI15Tìsp∫\À\÷˜´¸\Ìá?¸\È\r.\€wß˛\»¿\Œ\›;v\Ô˙˙∑H	Ò)ﬂª`>9˙\ÈôΩÆú~\È\'√úî^∂yòÑ\Ÿ—¢{æÉR\…N/\Ê;bj~>¡g*\ =AQ\„Û}dº º~(êUó@ãK®¶Ñª˘˜˙˚Ñˇ\Á\◊?Ã∏¯CO~\'±\Á\·\€ˆ∏πã\ÔÚëi\ƒBld¶˛\—O\÷{π\Ì˛í˝\’˛áˆ|\Àÿ´ˆd5ˇSPx†D%;¿%ó•Uuqbx\÷\Îe\ŸT<ö\Ÿ#¥\∆Ùü\·Qd\Èæ}f^8m÷¨i\Œd≠dzCm\›ÃôııF¸i\0õ,¯ ¢.\Z\›vª\√aoeí\◊	à¢\’J-?ıd„§≤Aä4fõµG\’RWo\ÂGs¥\œBñî%\»\ ıfÚ£a}”¶\«∑rUØ\"7\ËômúpïæZù}©æ/Àõ,|†Dm ÑÒ\Ã’å+åÖ\¬æ\Ïh\·U∂\nbQ\≈/I^´\räÕ´–©\·~ø∑êπ\n]1µ®P\ÃÛ\ÿ\‡ıõ…∫1íç≥ÜÇ\ H\‰úcH\ zåë∞G+ë¸H]]D6ØF\Ë	\·\ﬁ\ÎwﬂøØ˜Üá∑\Ôª3h≠¸ˆïÑ,∞Væ\·!n¯k_{\ÊP\Êa\„˛˜oeé±\÷.;º¥\Î~ê©\’l3[™¢9≠Võ\œ;m¢\»b™(\⁄=∞B\Ê2€Ñ¥:W\"C˙\»\∆[˜?jà∫\Ê˚/s/\ﬁq\€\·ö|©&S}∫è’≥\Âp¢\Õ\—bª89@\'M*\Â–§`ægÚî)W^û%¶\Êâ.\ƒT\◊_\nµl¨U\◊’èV˛X\‘\’\ÁN9w˘æá¯áü‹±{\Á¶7Û\·\ﬂ˝™≠\‡k˚Ææûy#¸\ﬁ+ø8yÚü∂ëâÉ∏\»E|˙\Zy´+ˆ≠¨nh)[F}.õ\Õn\Á$Ø\√\„Ç\›>¶B\Ã\ \Âmò¨:ö\√Fµ\¬=üï\ﬂ\\s˚s˚∂\ÊY/\ﬁœñ;wy\ﬁ~,sÄµæ˙ï\r\ŸLJ˚\ÿrLE]ÙÇl&\ÂÛ\∆2iL\ràµçm8ï_ñK•¯ã\\Zz˜\ÔS)\Ì˚\Â\Î\Ôl\\\›%∑ﬁµ˛±ù∑4æst\…\Ÿˇ\Îé\Îo¨\Ë∫\Á{[I\Ÿ\Œ}-ª¶]¥∏3z\≈%\rùWµﬂ±ªı\Œ\Ê∂K\À/ôY;\Ô>çú\·û\‡c\Ÿ^Ù˘lõó≤Ç|{ûò7OuGEè1’í3‘§\“F\÷>~\„˘Bíî\⁄˙˙à\ﬂxûÒ8oyGAp\ÌÖ˙Ò={bIrâ~|\≈u.\À\Õ.â,\‡\ÓZ\ÿÚk˝ñ\ÃM´Æ4ºÙÒë3¨¡¸èàöh!…≥8ùˆ<ª?\‡tπD´\œczj¿1öªåLôx˛\Z\Õ\¬I\Õ_πl\„≠˚ø±okÅ-Ú\›\r/ø\ƒZ3\rw\‹v\‰-.˙˘\–\◊-=zä;al˙[\Ÿ?QØÇ\ryi≥;\ÿf*\'ùM\≈uuıø X≤u\∆z˘ïÚß¢\Î\Ÿ\Ô.\—.ı_z¥fd${äµÙq%®à\◊;\ÈÄıY.ƒó†¨πß\r\“gæóë\“`<°\∆sÄ\ÈQ\Ÿ\'Ä\·#≠ˇ\Èhø\Ìfπ\r\nendstream\nendobj\n358 0 obj\n<<\n/Length 3898\n/Length1 11028\n/Filter /FlateDecode\n>>\nstream\r\nxú\ÌYp’ùˇº}ª´ﬂ∂$À≤cAºõçî\‰,\·Jî¶Xÿñ∞c%Ò\œTõWr\Ï\ƒ\Êv\„$4	\Ì9!%)ù)ws\«–ñ\·ò\ŒÒ2B\·ò;`Æw.\√0\”\· 7@{=†3Ö°$^›Ωïl•˜£˜GgZø\÷\€˜æø˜˚cW#É\0®¿(2[\Z[æ}ı\Ë˚\0˘@f\◊\ﬁ\Ï˘W\È\ﬂ\0r/Äùª\ÓW™\"u˜B/Ä\«vO\Ì\Ÿ˚w\”?8\08O\0ñã{≤\”S∞\"\0\‡\0\Áû[\Ì\ÓöOæq¿∫e|,;\Ív\ﬂ	êù\0Z\«\««≤k\ÏIÄ\\`\Â¯\ﬁ˝\ﬂq¸pM®\ÿy\Î\‰Æ\Ï\Âá>xê“Ä•ioˆõS\“\n°¿\'\0î€≤{\«j\Z˝†ø\»\»\‘\‰Ù˛\‚v§ñÛßˆçM=oª˙«Äp\’\‘!`ÖΩXD%@\ÔG~§!AÄç\ÿ	((L(\Ó\Êˆæ`==˜(`?}\≈i≤ü\Êî\≈@\Ô7)d\ŸÎ≠ªN¯ı çYmVìsæΩ\Ê!~}µ\·_^Ω\‚ú{\‘~\⁄ µmYß¶∂\"xÆ\›põ)ÿÄ$∫±Éx•X,SnD7z\–\œ)≈∑9\“\Õ\Êıπ/\∆\ƒ√í*Öß!“ÉR ı•+}ª\…U´ 8¨2ïDAπ\Ïb\≈\Ê:†@¡+rΩ\·\√]\÷\”BZ˘k\Œá•ºï}®§<jp@\ K>\Ô\\F\ré\0\≈KfnV\√\«W)è\Í´˜\ﬂ3\Ó)^4û.^Ç\◊\ÿˆ•πˇ°îgºãè	H^¡\"\‡c˛¡eºÖ3\0\‚\'mjó2§:T\ﬂEáñ\”b}o\ _øuÛh˝ñ\‘h}h≠{(]9¥¨™Xoãı2-\÷oN-ØMëT\“U_ıIÑâQ:TOI%m£èS*˜$_Læû§Zt\≈\–5\—¿ê?Z=\‰!ïC\Óh\Â\–\„ï/U\nMïÑD14â?¡\„¯\0¢d\∆O$R ﬂùhh\Ë)Xä˝=\Ã÷ªÉë,8¿\◊x\ﬂv&ü`⁄æ#=K\»wÙcßO£˝\⁄\÷2êf µzH3˜µ≥~¥\Î\”\”\r\”\”\r¶áß˜Û´π,@\Ì0\0∂Ûm\0ˆ\·æÚû¿ãª\ {>)wî˜\◊aKy/\‚\Z¥î˜jQW\ﬁÀ®∞S\√m@∑a\Z¥c∑b\€0Ü}ò\∆&q4\„:4£iACY\–Qt\ÊeæÇf‹àt\‡+ˇçá˘\ÎØ[\Ï\ƒˆ`˚1Å\√\√(å\"ã˝\»B¡.Lb\ná∞œî\Z\«~(¯(hAì\È=R\ﬁ5#7aìÿÉ[1ò\ƒ>Lôk÷¥\œ\Ô\Ó:≥˚V˛÷∏Ûs¯i\'á\»YÚˆ<\n+ÑÖ\„\¬sT4ÒkÙI˙\∆\ÔE¸ø–ªÑK∏ÑK∏Ñ†∏*~”é\Ìzzhp†øØw\ÎñÕ©ûM\›]7%ù\Ì7\∆\€n¯\Í∆Ølà]øæu]sS\„uë\ÍU°\‡JmÖZ_\ÎÛ∏++\\ª\Õjë%ë\naÖëLÇ—†\‚IfµÑñÌäÑïD\Ìxg$ú–í¶dñ\Ã01§uuô$-Àîå\¬BY¶dë3,ûU\ÿ\Ó/H\∆KíÒI\‚V6b#w°)\ÏBß¶\»ˆæ¥¶∞”ùöÆ∞\À\Ê~≥πC\Ê¡’©\È™\Z	+fT<Z%¡í\«sâLg$Lfˆ≠c\Ã	c\÷\Ó\Ë\–:ë0\ÿjmjñ¨æÅòaub√¨\0´ãªe4ò»é≤ﬁæt¢3†™z$\‹\Õ*¥NìÖ\”$ì;ò\≈4©L\–qRô\r?ì;Upc$\”\‡\’F≥;”åfıH8Gπ\‹q\Êi`k¥N∂\Ê;µëpbåÖµ\Œk\‡V{˙¸Ù|\Êí0)\Ë÷î\‹G`$£]æÙyJ∂LëÉ\Óè¿∑L\Ë`§?≠r$µd&óKjJ2ó\…e≈ôMqkπYß37ï\»(ΩiF≤Ö\‚S\',yJg\Ó\Ã8Ÿ†óo=\Ÿ\ﬂ√™˙v§ôL*\„YFÉå\€4ı˙Ä\ÍYê\È˝Ml0KìyÜUïß\·d!éëHXe3}\È\“Y¡H\‡\‚ç\r:2úÛ\Ã<ßzàsf\Ê9\ÍMçÑ{\“9&ªGµ\ƒãüÃ≤ô¶do\·Ö\—‹¨\‚„Ä™\Âº%÷®õ≤\n£¡\Ó\—	ÖI!&s≠\≈\nLqïú\€<T|\\∫\\\‰òÚxïò¶\ƒ\ZπùÑñ»îˇé◊≤ô%f]\r•FL≥xßí`ÒlπbâŸ¶∆Ññ\»f\…Ltö\≈dç\⁄Ûi\Ì\’\Âa%&“¶JYç˘:2ª\ Z¨1aŒïí\»ÒN˚ﬂñr\ÊdÄ=•èoàÑ{¥æÙ9Dãg\◊*Å\'¢XΩìˆw§\r%r\È\—›¨>eJf∑í®,Æ3í’µÙò\Œ[Ts≥5f#\Èf_\r¶{¥ûæ\Ì\È\Î\ÀAó‹úL|¡åñî\Ã0)»¨A´íTgb\–Õ§†ídbPk\ﬂ\»\ƒ ≥≠\Ãt3πD\ÂMﬁæQIì\0\Ê•Ÿöãlçí\Î,\ÀÒÛ\ÁåJºı:∫\Ê≠\…¸\»H¶£+†\Íj	\"aÅâA•\ÏòIA+/@\◊<ã&≠Lvtô$û˜ZûU%≠çi∫6Æ∞xoö\ﬂOèYër2\Ã˙î\Î:¯π”¢dE\¬j\œ\‡¬Å\'ì%ãì\Àn2\œ«Æ/∞ª\Á\ŸJŒ™ı\‰∏q≠lLv3vè_\Ô	ò\œ\r\ﬁ1Z2´)n%Y\Íò\‹l<ŒªÖ7áí”∫Gs\⁄@z£)\›”ü˛V\‡0˜\ÂE\ÈlèÑg¥\œj\‰D\ﬂlúúÿû>\ÁîÉ\È3:2\Ì˙\ÏJr¢/}N\‚&U\‡TN\‰Ö∏•˛Ù¡j\ \Œ≈Åì+öÛº´@`“¨Û4Ç]°DsóÖLGq\ÿUKú¯º¥à]kâ6c\“LòOY\‹.≈≠q[\‹)∏Ñ¿,\·§3R\‹˙lO8âãfgÑé~ì\\ 3≥∂x†$1âó\"<1Ùô\Î°\Ì\È\'úpëÄπ\Í∫\ﬁ\Œ!N‘ék=¸îPFy£‹°è\Á2:6¯ôdBê0¢\›\0&h7\ÃAv2ª6\÷\ŒZ;ß∑qz[â.s∫Ekg\ƒO˛K}Ü	ΩåÿëV57S\Í\Œr\ÓÀºRzC$úsøÅÄg\—.\ÂAa¡Ú∏S§í@´M§†±•1\ÍÒíX\ÃıDõõ™Tè∫^ı®\œ\“\Ó´Oéá\ÊéK˘O7çã?(æK^ß\·@\rBÒ*Ø,;Å\⁄\ \ÍAΩ\“m£É∫≠\nm\r®mkê®\'j\⁄[ø∂5\⁄\‚Øˆ\…⁄äêg\—˛¿ˆm;vˆ\Ó\‰◊õ˚w\ﬁ3∏-›øuáNOÚMüû.˝&\'ìûÜ.t\ƒU¡E≠≤\‰pP¿b©§¢X\·R∫\ÀEı¢-\⁄ı\∆\ZK˛MÙ\∆<—®7Û\∆b\ÕM*U©JTBÑ\–*ôä\Îoô{\Ô\„å í#Ç<g|/hUˇí\Ï4~ =˝ißê!Ø›±r∆∞\ﬂ\‚\nÄ¯K)èJ\‘B¡∂x\ÿ\‚Ûâb\›rácÖªÆÆ≤Rµ∫óπóm÷ùn\‚¢nw%*\ÎRz•µ)t>%^\ƒjø>|≥π˚,¿(è\–\„ôW\ƒjül©ˆ˚´}¢¶íhKÎ∫µ!MÛxÃùZ ˇL÷ìeGvü<bºı\…\‹§ıÏ∑øq\‰\ÿ˜_ò9l\\ïÚ≥\œ\ﬁ˘®\«^ˇ\ÿ\È\Á/\“\È-\€ª\Á~l\‹92ñ¡\Ì\≈K\‚\À“ã£9^k©™™•.Wç§tèhë\ÏRJ∑Û\“y≠5◊Ööõ\»\n°⁄≠∂¨˜»ö\œZ\Ô\ hKç%¢¡«ü!ìæ~ˆM\„Y\„o!\Î_~ı\'£˝èà\Áç_Ωg\‘l6Æˆê;\…-ÔêØ=π\Á\Í™\rx•RVTbu\‹g<.QtKŒî.Q—ï\“E\Ô\‚\Ê);wCU=™\‚V5OTëc\∆\∆yë\Ï&ßåø72?<Fû~n\‹o\ÃHy\„n\„á\‰\'Wª@Ãä	R$\‚+≠\"\‡í\ÌvBú≤-•;e‚¢≤LAJ\È%ˆîNºø^•\œ*mn\‚QTó?¢p5O7\Õ]\"¡\'\Â\r\„\„8J^©!\Âa\√\⁄xùïRáb\ÁN˘Û¢m\ﬁ\—b/ãùêü/\—\‰\‹{\‰C\√\Õü+Yóz•<úhè\◊;¡\Óp†\¬J%\…\Â\Íp\»\‘jïdJ$sº±Ö	0›¥xJC+˘\"è\ÍQ=\ÎâJ§^\„!\„\Ëù\∆§ı09E“Ü å\œ},\Â\Áv˝à¸b\ÓP˘\ﬁ\ƒ6)	ıÒ\n\—BôP–îér\Ó ∑\“\‹5\ÌH´\–\'\ÂØl*ñµ\ÂW§<|\ÿø\∆õ\√f•REÖ\À\Âó\‰jØ`dáÖV@ÊÅõ3\\\n∫•t5±Rà\Ê≠\Ê\∆Iîpk[´4B5\„![ïÒyÑló\…$y\ƒxã:m\∆qÒàÒÅπ¥îøÚ∞8¸\È&\·lÛÒ]9^\Œ\„ysö[\„\À\Ï∞\Ÿ\Â<Tíeã\€A-VJ,ÛœíX)ä˘T\∆¯§™ã\÷yT\Èºqp\Ó.3à\„\¬K%©˚ç◊ø5\◊+ÂØú#\◊\ŒB\‡3(˝L∫\0™yˇ{Ä\Zß,˚mU)\›&\“ îN´æºˇxÃï¯¸Q\≈\„VW\»\“œåf0\„2A˙HªÚ\ÍS\Á»¥qœπßÖ7å?3ìª\…^≤ó5\Ó0\Ó˝\Ërôºˇ+îg∞Àú¡\Zlâá™jjDª\Ëv\€˝\’\À`∑;µU6\'lõu¿\·tZS∫ì˙f\"\⁄ı≥Góªˆ[<±r57-zZÒÅ5üd®Q	yÙ{ß\Óπo\ÿxÅ<F˛à,ˇŒüíM£∆£\∆˜iddb<=wh\Ó%)ˇ\⁄G\œ«å™\Ô\nÕºWÜãó\ƒ\Z\ÈE¨B\"æ\"PWßBï|N¯∞zçOÖSu.∑\’,O\È5\"µ-Œö±rï\ /≥Ö\–|¢∂bï\«\Ô/ÖZuù∞n\Ì\ hãü?«¥rµ\œ\ÔØÒ˚\≈\Z\„m\„?\Œ\ﬁ{ah˜ﬁ¶õ\Ôπ˚\Ó^b˘˜}/}cÙ¿üoJá˛\‚\¬\‰æz\'Mîˆ\÷-õ:n\Ël\€ˇ\‡û\Á\ﬁlm˛ES®ø}\ÕWcõF~\Ã\„_àá§<,≈Ω2@	±\⁄,T§)]úü~òañﬂë|\Ó9\nóååi±◊ò\œ¡0@HJ|çûñUXqM\‹A≈∏∞\Ÿ\≈†±\ÓB\…B\›˘ñ\Ê&≤ÆuΩZ-\Àí˙QŸ∂ˆ\ M\‚kÅ\Á«™\◊^hA±X\Í=À¥B@,8Hí§\÷\'Ñ\ÂR\r\ÎPûPÚæ˘¡ìá(\ Á∫ç˚(MtÅ¥ÚoÄxÅü(Å\‡˚\Ì˛KÙ°~O:H§e∏]∫ÑÇxqî\ﬂ\œ\‰zQè°`9âÇ|y∑/∫P\«1,>Ã´˜á	\‚\Î$ıªÚΩ∏K∞K∞K∞K∞K∞K˚\¬#(¸\'ç¥ã\r\nendstream\nendobj\n359 0 obj\n<<\n/Title (ID NOMBRE)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 349 0 R\n/Next 365 0 R\n>>\nendobj\n360 0 obj\n<<\n/Title (INFO ESTUDIANTE)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 366 0 R\n/Next 350 0 R\n>>\nendobj\n361 0 obj\n<<\n/Title (ID)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 351 0 R\n/Next 367 0 R\n>>\nendobj\n362 0 obj\n<<\n/Title (INFO ESTUDIANTE)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 368 0 R\n/Next 352 0 R\n>>\nendobj\n363 0 obj\n<<\n/Title (DOCUMENTOS  \\(misma estructura que en ticket detail\\))\n/Dest [11 0 R /Fit]\n/Parent 352 0 R\n/Next 364 0 R\n>>\nendobj\n364 0 obj\n<<\n/Title (SUBIR DOCUMENTO \\(misma estructura que en ticket detail\\))\n/Dest [11 0 R /Fit]\n/Parent 352 0 R\n/Prev 363 0 R\n>>\nendobj\n365 0 obj\n<<\n/Title (ESTADO \\(LISTA DESPLEGABLE\\))\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 359 0 R\n/Next 369 0 R\n>>\nendobj\n366 0 obj\n<<\n/Title (INFO ACUDIENTE)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 370 0 R\n/Next 360 0 R\n>>\nendobj\n367 0 obj\n<<\n/Title (FECHA APERTURA)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 361 0 R\n/Next 371 0 R\n>>\nendobj\n368 0 obj\n<<\n/Title (INFO ACUDIENTE)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 372 0 R\n/Next 362 0 R\n>>\nendobj\n369 0 obj\n<<\n/Title (RESOLUCION)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 365 0 R\n/Next 373 0 R\n>>\nendobj\n370 0 obj\n<<\n/Title <415349474E414349D34E204355504F>\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 374 0 R\n/Next 366 0 R\n>>\nendobj\n371 0 obj\n<<\n/Title (PUNTAJE PRIORIDAD)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 367 0 R\n/Next 375 0 R\n>>\nendobj\n372 0 obj\n<<\n/Title <415349474E414349D34E204355504F>\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 376 0 R\n/Next 368 0 R\n>>\nendobj\n373 0 obj\n<<\n/Title (TARJETAS DE NAVEGACION)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 369 0 R\n/Next 374 0 R\n>>\nendobj\n374 0 obj\n<<\n/Title (COMENTARIOS)\n/Dest [9 0 R /Fit]\n/Parent 7 0 R\n/Prev 373 0 R\n/Next 370 0 R\n>>\nendobj\n375 0 obj\n<<\n/Title <444553435249504349D34E>\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 371 0 R\n/Next 377 0 R\n>>\nendobj\n376 0 obj\n<<\n/Title (COMENTARIOS)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 378 0 R\n/Next 372 0 R\n>>\nendobj\n377 0 obj\n<<\n/Title (ID NOMBRE)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 375 0 R\n/Next 379 0 R\n>>\nendobj\n378 0 obj\n<<\n/Title (TARJETAS DE NAVEGACION)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 380 0 R\n/Next 376 0 R\n>>\nendobj\n379 0 obj\n<<\n/Title (ESTADO \\(LISTA DESPLEGABLE\\))\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 377 0 R\n/Next 381 0 R\n>>\nendobj\n380 0 obj\n<<\n/Title (RESOLUCION)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 382 0 R\n/Next 378 0 R\n>>\nendobj\n381 0 obj\n<<\n/Title (RESOLUCION)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 379 0 R\n/Next 383 0 R\n>>\nendobj\n382 0 obj\n<<\n/Title (ESTADO \\(LISTA DESPLEGABLE\\))\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 384 0 R\n/Next 380 0 R\n>>\nendobj\n383 0 obj\n<<\n/Title (TARJETAS DE NAVEGACION)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 381 0 R\n/Next 385 0 R\n>>\nendobj\n384 0 obj\n<<\n/Title (ID NOMBRE)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 386 0 R\n/Next 382 0 R\n>>\nendobj\n385 0 obj\n<<\n/Title (COMENTARIOS)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 383 0 R\n/Next 387 0 R\n>>\nendobj\n386 0 obj\n<<\n/Title <444553435249504349D34E>\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 388 0 R\n/Next 384 0 R\n>>\nendobj\n387 0 obj\n<<\n/Title <415349474E414349D34E204355504F>\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 385 0 R\n/Next 389 0 R\n>>\nendobj\n388 0 obj\n<<\n/Title (PUNTAJE PRIORIDAD)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 390 0 R\n/Next 386 0 R\n>>\nendobj\n389 0 obj\n<<\n/Title (INFO ACUDIENTE)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 387 0 R\n/Next 391 0 R\n>>\nendobj\n390 0 obj\n<<\n/Title (FECHA APERTURA)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 392 0 R\n/Next 388 0 R\n>>\nendobj\n391 0 obj\n<<\n/Title (INFO ESTUDIANTE)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 389 0 R\n/Next 393 0 R\n>>\nendobj\n392 0 obj\n<<\n/Title (ID)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 394 0 R\n/Next 390 0 R\n>>\nendobj\n393 0 obj\n<<\n/Title (DOCUMENTOS)\n/Dest [10 0 R /Fit]\n/Parent 15 0 R\n/Prev 391 0 R\n/First 395 0 R\n/Last 396 0 R\n/Count -2\n/Next 394 0 R\n>>\nendobj\n394 0 obj\n<<\n/Title (TITULO TICKET)\n/Dest [11 0 R /Fit]\n/Parent 15 0 R\n/Prev 393 0 R\n/Next 392 0 R\n>>\nendobj\n395 0 obj\n<<\n/Title <507265666572656E63696173207920417369676E616369F36E20286D69736D6120657374727563747572612071756520656E207469636B65742064657461696C29>\n/Dest [10 0 R /Fit]\n/Parent 393 0 R\n/Next 396 0 R\n>>\nendobj\n396 0 obj\n<<\n/Title <507265666572656E63696173207920417369676E616369F36E20286D69736D6120657374727563747572612079206461746F732071756520656E207469636B65742064657461696C2C207065726F20657374612076657A206C6F732063616D706F7320736F6E206C6973746120646573706C656761626C65732C20636F6E20756E2063616D706F20616C2066696E616C206C6C616D61646F206375706F29>\n/Dest [10 0 R /Fit]\n/Parent 393 0 R\n/Prev 395 0 R\n>>\nendobj\nxref\n0 397\n0000000000 65535 f\r\n0000000015 00000 n\r\n0000000420 00000 n\r\n0000000491 00000 n\r\n0000003326 00000 n\r\n0000003421 00000 n\r\n0000003455 00000 n\r\n0000003523 00000 n\r\n0000000188 00000 n\r\n0000003597 00000 n\r\n0000004208 00000 n\r\n0000004784 00000 n\r\n0000005396 00000 n\r\n0000005484 00000 n\r\n0000006008 00000 n\r\n0000006100 00000 n\r\n0000006226 00000 n\r\n0000006285 00000 n\r\n0000006614 00000 n\r\n0000006942 00000 n\r\n0000007269 00000 n\r\n0000007595 00000 n\r\n0000007922 00000 n\r\n0000008249 00000 n\r\n0000008576 00000 n\r\n0000008903 00000 n\r\n0000009231 00000 n\r\n0000009561 00000 n\r\n0000009890 00000 n\r\n0000010219 00000 n\r\n0000010548 00000 n\r\n0000010878 00000 n\r\n0000011207 00000 n\r\n0000011536 00000 n\r\n0000011865 00000 n\r\n0000012192 00000 n\r\n0000012520 00000 n\r\n0000012845 00000 n\r\n0000012891 00000 n\r\n0000015649 00000 n\r\n0000015695 00000 n\r\n0000016024 00000 n\r\n0000016351 00000 n\r\n0000016677 00000 n\r\n0000017004 00000 n\r\n0000017331 00000 n\r\n0000017658 00000 n\r\n0000017986 00000 n\r\n0000018316 00000 n\r\n0000018645 00000 n\r\n0000018974 00000 n\r\n0000019303 00000 n\r\n0000019633 00000 n\r\n0000019962 00000 n\r\n0000020291 00000 n\r\n0000020620 00000 n\r\n0000020948 00000 n\r\n0000021276 00000 n\r\n0000021322 00000 n\r\n0000023940 00000 n\r\n0000023986 00000 n\r\n0000024315 00000 n\r\n0000024643 00000 n\r\n0000024970 00000 n\r\n0000025296 00000 n\r\n0000025623 00000 n\r\n0000025950 00000 n\r\n0000026277 00000 n\r\n0000026605 00000 n\r\n0000026933 00000 n\r\n0000027263 00000 n\r\n0000027592 00000 n\r\n0000027921 00000 n\r\n0000028250 00000 n\r\n0000028580 00000 n\r\n0000028909 00000 n\r\n0000029238 00000 n\r\n0000029567 00000 n\r\n0000029895 00000 n\r\n0000030224 00000 n\r\n0000030552 00000 n\r\n0000030598 00000 n\r\n0000033123 00000 n\r\n0000033346 00000 n\r\n0000033557 00000 n\r\n0000033792 00000 n\r\n0000033922 00000 n\r\n0000034030 00000 n\r\n0000034144 00000 n\r\n0000034260 00000 n\r\n0000034366 00000 n\r\n0000034512 00000 n\r\n0000034609 00000 n\r\n0000034716 00000 n\r\n0000034819 00000 n\r\n0000034920 00000 n\r\n0000035027 00000 n\r\n0000035170 00000 n\r\n0000035275 00000 n\r\n0000035388 00000 n\r\n0000035519 00000 n\r\n0000035611 00000 n\r\n0000035726 00000 n\r\n0000035842 00000 n\r\n0000035964 00000 n\r\n0000036126 00000 n\r\n0000036248 00000 n\r\n0000036378 00000 n\r\n0000036486 00000 n\r\n0000036618 00000 n\r\n0000036728 00000 n\r\n0000036844 00000 n\r\n0000036962 00000 n\r\n0000037070 00000 n\r\n0000037218 00000 n\r\n0000037326 00000 n\r\n0000037470 00000 n\r\n0000037576 00000 n\r\n0000037690 00000 n\r\n0000037823 00000 n\r\n0000037916 00000 n\r\n0000038032 00000 n\r\n0000038149 00000 n\r\n0000038272 00000 n\r\n0000038621 00000 n\r\n0000039342 00000 n\r\n0000039474 00000 n\r\n0000039584 00000 n\r\n0000039700 00000 n\r\n0000039818 00000 n\r\n0000039926 00000 n\r\n0000040074 00000 n\r\n0000040182 00000 n\r\n0000040326 00000 n\r\n0000040432 00000 n\r\n0000040546 00000 n\r\n0000040679 00000 n\r\n0000040772 00000 n\r\n0000040888 00000 n\r\n0000041005 00000 n\r\n0000041128 00000 n\r\n0000041245 00000 n\r\n0000041448 00000 n\r\n0000041571 00000 n\r\n0000041698 00000 n\r\n0000041893 00000 n\r\n0000041988 00000 n\r\n0000042089 00000 n\r\n0000042180 00000 n\r\n0000042276 00000 n\r\n0000042317 00000 n\r\n0000042397 00000 n\r\n0000042477 00000 n\r\n0000042512 00000 n\r\n0000042573 00000 n\r\n0000042608 00000 n\r\n0000042669 00000 n\r\n0000042704 00000 n\r\n0000042765 00000 n\r\n0000042800 00000 n\r\n0000042861 00000 n\r\n0000042896 00000 n\r\n0000042957 00000 n\r\n0000042992 00000 n\r\n0000043053 00000 n\r\n0000043088 00000 n\r\n0000043149 00000 n\r\n0000043184 00000 n\r\n0000043245 00000 n\r\n0000043280 00000 n\r\n0000043341 00000 n\r\n0000043376 00000 n\r\n0000043437 00000 n\r\n0000043472 00000 n\r\n0000043533 00000 n\r\n0000043568 00000 n\r\n0000043629 00000 n\r\n0000043664 00000 n\r\n0000043725 00000 n\r\n0000043760 00000 n\r\n0000043821 00000 n\r\n0000043856 00000 n\r\n0000043917 00000 n\r\n0000043952 00000 n\r\n0000044013 00000 n\r\n0000044048 00000 n\r\n0000044109 00000 n\r\n0000044144 00000 n\r\n0000044205 00000 n\r\n0000044240 00000 n\r\n0000044301 00000 n\r\n0000044336 00000 n\r\n0000044397 00000 n\r\n0000044551 00000 n\r\n0000044702 00000 n\r\n0000044743 00000 n\r\n0000044823 00000 n\r\n0000044858 00000 n\r\n0000044919 00000 n\r\n0000044954 00000 n\r\n0000045015 00000 n\r\n0000045050 00000 n\r\n0000045111 00000 n\r\n0000045146 00000 n\r\n0000045207 00000 n\r\n0000045242 00000 n\r\n0000045303 00000 n\r\n0000045338 00000 n\r\n0000045399 00000 n\r\n0000045434 00000 n\r\n0000045495 00000 n\r\n0000045530 00000 n\r\n0000045591 00000 n\r\n0000045626 00000 n\r\n0000045687 00000 n\r\n0000045722 00000 n\r\n0000045783 00000 n\r\n0000045818 00000 n\r\n0000045879 00000 n\r\n0000045914 00000 n\r\n0000045975 00000 n\r\n0000046010 00000 n\r\n0000046071 00000 n\r\n0000046106 00000 n\r\n0000046167 00000 n\r\n0000046202 00000 n\r\n0000046263 00000 n\r\n0000046298 00000 n\r\n0000046359 00000 n\r\n0000046394 00000 n\r\n0000046455 00000 n\r\n0000046609 00000 n\r\n0000046760 00000 n\r\n0000046801 00000 n\r\n0000046881 00000 n\r\n0000046916 00000 n\r\n0000046977 00000 n\r\n0000047012 00000 n\r\n0000047073 00000 n\r\n0000047108 00000 n\r\n0000047169 00000 n\r\n0000047204 00000 n\r\n0000047265 00000 n\r\n0000047300 00000 n\r\n0000047361 00000 n\r\n0000047396 00000 n\r\n0000047457 00000 n\r\n0000047492 00000 n\r\n0000047553 00000 n\r\n0000047588 00000 n\r\n0000047649 00000 n\r\n0000047684 00000 n\r\n0000047745 00000 n\r\n0000047780 00000 n\r\n0000047841 00000 n\r\n0000047876 00000 n\r\n0000047937 00000 n\r\n0000047972 00000 n\r\n0000048033 00000 n\r\n0000048068 00000 n\r\n0000048129 00000 n\r\n0000048164 00000 n\r\n0000048225 00000 n\r\n0000048260 00000 n\r\n0000048321 00000 n\r\n0000048356 00000 n\r\n0000048417 00000 n\r\n0000048452 00000 n\r\n0000048513 00000 n\r\n0000048548 00000 n\r\n0000048609 00000 n\r\n0000048644 00000 n\r\n0000048705 00000 n\r\n0000048740 00000 n\r\n0000048801 00000 n\r\n0000048955 00000 n\r\n0000049106 00000 n\r\n0000049238 00000 n\r\n0000049322 00000 n\r\n0000049406 00000 n\r\n0000049490 00000 n\r\n0000049574 00000 n\r\n0000049682 00000 n\r\n0000049786 00000 n\r\n0000049957 00000 n\r\n0000050072 00000 n\r\n0000050644 00000 n\r\n0000051041 00000 n\r\n0000051464 00000 n\r\n0000051831 00000 n\r\n0000052560 00000 n\r\n0000052959 00000 n\r\n0000053361 00000 n\r\n0000053721 00000 n\r\n0000054343 00000 n\r\n0000054740 00000 n\r\n0000055142 00000 n\r\n0000055502 00000 n\r\n0000055598 00000 n\r\n0000055694 00000 n\r\n0000055790 00000 n\r\n0000055886 00000 n\r\n0000055982 00000 n\r\n0000056078 00000 n\r\n0000056174 00000 n\r\n0000056222 00000 n\r\n0000056270 00000 n\r\n0000056318 00000 n\r\n0000056366 00000 n\r\n0000056477 00000 n\r\n0000056576 00000 n\r\n0000056665 00000 n\r\n0000056777 00000 n\r\n0000056890 00000 n\r\n0000057146 00000 n\r\n0000057222 00000 n\r\n0000057475 00000 n\r\n0000057551 00000 n\r\n0000057807 00000 n\r\n0000057883 00000 n\r\n0000058136 00000 n\r\n0000058212 00000 n\r\n0000058468 00000 n\r\n0000058544 00000 n\r\n0000058797 00000 n\r\n0000058873 00000 n\r\n0000058932 00000 n\r\n0000058991 00000 n\r\n0000059050 00000 n\r\n0000059109 00000 n\r\n0000059168 00000 n\r\n0000059227 00000 n\r\n0000059286 00000 n\r\n0000059345 00000 n\r\n0000059404 00000 n\r\n0000059463 00000 n\r\n0000059522 00000 n\r\n0000059581 00000 n\r\n0000059640 00000 n\r\n0000059699 00000 n\r\n0000059758 00000 n\r\n0000059817 00000 n\r\n0000059876 00000 n\r\n0000059935 00000 n\r\n0000059994 00000 n\r\n0000060053 00000 n\r\n0000060112 00000 n\r\n0000060171 00000 n\r\n0000060230 00000 n\r\n0000060289 00000 n\r\n0000060405 00000 n\r\n0000060509 00000 n\r\n0000060618 00000 n\r\n0000060763 00000 n\r\n0000066040 00000 n\r\n0000070188 00000 n\r\n0000077089 00000 n\r\n0000081079 00000 n\r\n0000087001 00000 n\r\n0000090991 00000 n\r\n0000091094 00000 n\r\n0000091203 00000 n\r\n0000091301 00000 n\r\n0000091412 00000 n\r\n0000091548 00000 n\r\n0000091688 00000 n\r\n0000091810 00000 n\r\n0000091918 00000 n\r\n0000092028 00000 n\r\n0000092138 00000 n\r\n0000092242 00000 n\r\n0000092366 00000 n\r\n0000092479 00000 n\r\n0000092605 00000 n\r\n0000092721 00000 n\r\n0000092826 00000 n\r\n0000092944 00000 n\r\n0000093051 00000 n\r\n0000093156 00000 n\r\n0000093274 00000 n\r\n0000093398 00000 n\r\n0000093504 00000 n\r\n0000093610 00000 n\r\n0000093734 00000 n\r\n0000093852 00000 n\r\n0000093957 00000 n\r\n0000094064 00000 n\r\n0000094182 00000 n\r\n0000094308 00000 n\r\n0000094421 00000 n\r\n0000094531 00000 n\r\n0000094641 00000 n\r\n0000094752 00000 n\r\n0000094850 00000 n\r\n0000094995 00000 n\r\n0000095104 00000 n\r\n0000095317 00000 n\r\ntrailer\n<<\n/Root 1 0 R\n/Info 8 0 R\n/ID [<311169CBB6306FCE0F23FBD2CA4EA0FF0BF58A6C1211598E1CA28157DFA6BA80> <311169CBB6306FCE0F23FBD2CA4EA0FF0BF58A6C1211598E1CA28157DFA6BA80>]\n/Size 397\n>>\nstartxref\n95716\n%%EOF\n','EJEMPLO PAGINA.pdf','2026-04-19 03:13:38',1);
/*!40000 ALTER TABLE `tbl_documento_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado_ticket`
--

DROP TABLE IF EXISTS `tbl_estado_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado_ticket` (
  `ID_Estado_Ticket` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Estado` varchar(50) NOT NULL,
  `Estado_Final` tinyint(1) NOT NULL,
  `Estado_Estado_Ticket` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Estado_Ticket`),
  UNIQUE KEY `Nombre_Estado` (`Nombre_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado_ticket`
--

LOCK TABLES `tbl_estado_ticket` WRITE;
/*!40000 ALTER TABLE `tbl_estado_ticket` DISABLE KEYS */;
INSERT INTO `tbl_estado_ticket` VALUES (1,'Abierto',0,1),(2,'En Revisi√≥n',0,1),(3,'Validaci√≥n de Documentos',0,1),(4,'Pendiente Acci√≥n de Usuario',0,1),(5,'Asignaci√≥n de Cupo',0,1),(6,'Rechazado',1,1),(7,'Cancelado a Petici√≥n',1,1),(8,'Solucionado',1,1);
/*!40000 ALTER TABLE `tbl_estado_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estrato`
--

DROP TABLE IF EXISTS `tbl_estrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estrato` (
  `ID_Estrato` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Estrato` varchar(10) NOT NULL,
  `Nivel_Prioridad_E` tinyint NOT NULL,
  `Estado_Estrato` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Estrato`),
  UNIQUE KEY `Nombre_Estrato` (`Nombre_Estrato`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estrato`
--

LOCK TABLES `tbl_estrato` WRITE;
/*!40000 ALTER TABLE `tbl_estrato` DISABLE KEYS */;
INSERT INTO `tbl_estrato` VALUES (1,'Estrato 1',60,1),(2,'Estrato 2',50,1),(3,'Estrato 3',40,1),(4,'Estrato 4',30,1);
/*!40000 ALTER TABLE `tbl_estrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estudiante`
--

DROP TABLE IF EXISTS `tbl_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estudiante` (
  `ID_Estudiante` int NOT NULL AUTO_INCREMENT,
  `FK_ID_Tipo_Iden` tinyint NOT NULL,
  `FK_ID_Persona` int NOT NULL,
  `FK_ID_Grado_Actual` tinyint NOT NULL,
  `FK_ID_Grado_Proximo` tinyint DEFAULT NULL,
  `FK_ID_Colegio_Anterior` int NOT NULL,
  `FK_ID_Genero` tinyint NOT NULL,
  `FK_ID_Grupo_Preferencial` tinyint NOT NULL,
  `FK_ID_Acudiente` int NOT NULL,
  `FK_ID_Parentesco_Es` tinyint NOT NULL,
  `Estado_Estudiante` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Estudiante`),
  UNIQUE KEY `FK_ID_Persona` (`FK_ID_Persona`),
  KEY `FK_Estudiante_Identificacion` (`FK_ID_Tipo_Iden`),
  KEY `FK_Estudiante_Grado_Actual` (`FK_ID_Grado_Actual`),
  KEY `FK_Estudiante_Grado_Proximo` (`FK_ID_Grado_Proximo`),
  KEY `FK_Estudiante_Colegio_Anterior` (`FK_ID_Colegio_Anterior`),
  KEY `FK_Estudiante_Genero` (`FK_ID_Genero`),
  KEY `FK_Estudiante_GP` (`FK_ID_Grupo_Preferencial`),
  KEY `FK_Estudiante_Acudiente` (`FK_ID_Acudiente`),
  KEY `FK_Estudiante_Parentesco` (`FK_ID_Parentesco_Es`),
  CONSTRAINT `FK_Estudiante_Acudiente` FOREIGN KEY (`FK_ID_Acudiente`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Colegio_Anterior` FOREIGN KEY (`FK_ID_Colegio_Anterior`) REFERENCES `tbl_colegio` (`ID_Colegio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Genero` FOREIGN KEY (`FK_ID_Genero`) REFERENCES `tbl_genero` (`ID_Genero`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_GP` FOREIGN KEY (`FK_ID_Grupo_Preferencial`) REFERENCES `tbl_grupo_preferencial` (`ID_Grupo_Preferencial`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Grado_Actual` FOREIGN KEY (`FK_ID_Grado_Actual`) REFERENCES `tbl_grado` (`ID_Grado`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Grado_Proximo` FOREIGN KEY (`FK_ID_Grado_Proximo`) REFERENCES `tbl_grado` (`ID_Grado`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Identificacion` FOREIGN KEY (`FK_ID_Tipo_Iden`) REFERENCES `tbl_tipo_identificacion` (`ID_Tipo_Iden`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Parentesco` FOREIGN KEY (`FK_ID_Parentesco_Es`) REFERENCES `tbl_parentesco` (`ID_Parentesco`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Estudiante_Persona` FOREIGN KEY (`FK_ID_Persona`) REFERENCES `tbl_persona` (`ID_Persona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estudiante`
--

LOCK TABLES `tbl_estudiante` WRITE;
/*!40000 ALTER TABLE `tbl_estudiante` DISABLE KEYS */;
INSERT INTO `tbl_estudiante` VALUES (1,3,6,9,10,2,1,1,5,6,1),(2,3,7,10,11,11,1,1,5,6,1),(3,3,8,9,10,4,1,1,5,7,1);
/*!40000 ALTER TABLE `tbl_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genero`
--

DROP TABLE IF EXISTS `tbl_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_genero` (
  `ID_Genero` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Genero` varchar(30) NOT NULL,
  `Estado_Genero` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Genero`),
  UNIQUE KEY `Nombre_Genero` (`Nombre_Genero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genero`
--

LOCK TABLES `tbl_genero` WRITE;
/*!40000 ALTER TABLE `tbl_genero` DISABLE KEYS */;
INSERT INTO `tbl_genero` VALUES (1,'Masculino',1),(2,'Femenino',1),(3,'Otro',1);
/*!40000 ALTER TABLE `tbl_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grado`
--

DROP TABLE IF EXISTS `tbl_grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_grado` (
  `ID_Grado` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Grado` varchar(30) NOT NULL,
  `Nivel_Educativo` varchar(30) NOT NULL,
  `Estado_Grado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Grado`),
  UNIQUE KEY `Nombre_Grado` (`Nombre_Grado`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grado`
--

LOCK TABLES `tbl_grado` WRITE;
/*!40000 ALTER TABLE `tbl_grado` DISABLE KEYS */;
INSERT INTO `tbl_grado` VALUES (1,'Pre jard√≠n','Preescolar',1),(2,'Transici√≥n','Preescolar',1),(3,'Primero','Primaria',1),(4,'Segundo','Primaria',1),(5,'Tercero','Primaria',1),(6,'Cuarto','Primaria',1),(7,'Quinto','Primaria',1),(8,'Sexto','Secundaria',1),(9,'Septimo','Secundaria',1),(10,'Octavo','Secundaria',1),(11,'Noveno','Secundaria',1),(12,'Decimo','Bachiller',1),(13,'Once','Bachiller',1);
/*!40000 ALTER TABLE `tbl_grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grupo_preferencial`
--

DROP TABLE IF EXISTS `tbl_grupo_preferencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_grupo_preferencial` (
  `ID_Grupo_Preferencial` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Grupo_Preferencial` varchar(30) NOT NULL,
  `Nivel_Prioridad_GP` tinyint NOT NULL,
  `Estado_Grupo_Preferencial` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Grupo_Preferencial`),
  UNIQUE KEY `Nombre_Grupo_Preferencial` (`Nombre_Grupo_Preferencial`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grupo_preferencial`
--

LOCK TABLES `tbl_grupo_preferencial` WRITE;
/*!40000 ALTER TABLE `tbl_grupo_preferencial` DISABLE KEYS */;
INSERT INTO `tbl_grupo_preferencial` VALUES (1,'Ninguno',0,1),(2,'Comunidad Ind√≠gena',30,1),(3,'Afrocolombiano',25,1),(4,'Refugiado',25,1),(5,'LGBTQ+',20,1),(6,'Pobreza Extrema',20,1);
/*!40000 ALTER TABLE `tbl_grupo_preferencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_jornada`
--

DROP TABLE IF EXISTS `tbl_jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_jornada` (
  `ID_Jornada` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Jornada` varchar(20) NOT NULL,
  `Estado_Jornada` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Jornada`),
  UNIQUE KEY `Nombre_Jornada` (`Nombre_Jornada`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_jornada`
--

LOCK TABLES `tbl_jornada` WRITE;
/*!40000 ALTER TABLE `tbl_jornada` DISABLE KEYS */;
INSERT INTO `tbl_jornada` VALUES (1,'Ma√±ana',1),(2,'Tarde',1),(3,'Nocturna',1);
/*!40000 ALTER TABLE `tbl_jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_localidad`
--

DROP TABLE IF EXISTS `tbl_localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_localidad` (
  `ID_Localidad` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Localidad` varchar(30) NOT NULL,
  `Estado_Localidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Localidad`),
  UNIQUE KEY `Nombre_Localidad` (`Nombre_Localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_localidad`
--

LOCK TABLES `tbl_localidad` WRITE;
/*!40000 ALTER TABLE `tbl_localidad` DISABLE KEYS */;
INSERT INTO `tbl_localidad` VALUES (1,'Engativ√°',1),(2,'Otra',1);
/*!40000 ALTER TABLE `tbl_localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_parentesco`
--

DROP TABLE IF EXISTS `tbl_parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_parentesco` (
  `ID_Parentesco` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Parentesco` varchar(30) NOT NULL,
  `Tipo_Usuario` enum('ACUDIENTE','ESTUDIANTE') NOT NULL,
  `Estado_Parentesco` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Parentesco`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_parentesco`
--

LOCK TABLES `tbl_parentesco` WRITE;
/*!40000 ALTER TABLE `tbl_parentesco` DISABLE KEYS */;
INSERT INTO `tbl_parentesco` VALUES (1,'Hijo','ESTUDIANTE',1),(2,'Hija','ESTUDIANTE',1),(3,'Sobrino/a','ESTUDIANTE',1),(4,'Hermano/a','ESTUDIANTE',1),(5,'Nieto/a','ESTUDIANTE',1),(6,'Hijo Adoptivo','ESTUDIANTE',1),(7,'Hija Adoptiva','ESTUDIANTE',1),(8,'Otro ','ESTUDIANTE',1),(9,'Padre','ACUDIENTE',1),(10,'Madre','ACUDIENTE',1),(11,'T√≠o/a','ACUDIENTE',1),(12,'Abuelo/a','ACUDIENTE',1),(13,'Hermano/a Mayor','ACUDIENTE',1),(14,'Tutor Legal','ACUDIENTE',1),(15,'Otro','ACUDIENTE',1);
/*!40000 ALTER TABLE `tbl_parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_persona`
--

DROP TABLE IF EXISTS `tbl_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_persona` (
  `ID_Persona` int NOT NULL AUTO_INCREMENT,
  `Num_Doc_Persona` varchar(30) NOT NULL,
  `Primer_Nombre` varchar(50) NOT NULL,
  `Segundo_Nombre` varchar(50) DEFAULT NULL,
  `Primer_Apellido` varchar(50) NOT NULL,
  `Segundo_Apellido` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Estado_Persona` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Persona`),
  UNIQUE KEY `Num_Doc_Persona` (`Num_Doc_Persona`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_persona`
--

LOCK TABLES `tbl_persona` WRITE;
/*!40000 ALTER TABLE `tbl_persona` DISABLE KEYS */;
INSERT INTO `tbl_persona` VALUES (1,'000000010000000','System','-','User','-','2000-01-01',1),(2,'000000020000000','Unknown','-','User','-','2000-01-01',1),(3,'1010101101','Fortress',NULL,'Educa',NULL,'2005-08-26',1),(4,'1019762928','Emerson','Daniel','Caicedo','Cobos','2000-01-01',1),(5,'54269132','Luis','Felipe','Gonzalez','Mogollon','2000-01-01',1),(6,'1524524213','Luis','Alejandro','Narvaez','Talavera','2015-11-19',1),(7,'1064298354','Andres','Felipe','Saenz','Gutierrez','2008-06-19',1),(8,'546544','Marialis','Chiquinquira','Vargas','Rodriguez','2011-10-18',1);
/*!40000 ALTER TABLE `tbl_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rol`
--

DROP TABLE IF EXISTS `tbl_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rol` (
  `ID_Rol` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(50) NOT NULL,
  `Descripcion_Rol` varchar(150) NOT NULL,
  `Estado_Rol` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Rol`),
  UNIQUE KEY `Nombre_Rol` (`Nombre_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rol`
--

LOCK TABLES `tbl_rol` WRITE;
/*!40000 ALTER TABLE `tbl_rol` DISABLE KEYS */;
INSERT INTO `tbl_rol` VALUES (1,'Sistema','Usuario generico que representa el sistema',1),(2,'Acudiente','Persona encargada de registrar estudiantes y la creaci√≥n de sus respectivos ticktes',1),(3,'Tecnico','Resolvera tickets',1),(4,'Admin','Encargado de la pagina',1),(5,'Desconocido','Usuario generico para exepciones en la auditoria',1);
/*!40000 ALTER TABLE `tbl_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sesion_activa`
--

DROP TABLE IF EXISTS `tbl_sesion_activa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sesion_activa` (
  `ID_Sesion` bigint NOT NULL AUTO_INCREMENT,
  `FK_ID_Usuario` int NOT NULL,
  `JTI` varchar(64) NOT NULL,
  `Dispositivo` varchar(255) DEFAULT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `Fecha_Inicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `Ultimo_Acceso` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Activa` tinyint(1) DEFAULT '1',
  `Estado_Sesion_Activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Sesion`),
  UNIQUE KEY `JTI` (`JTI`),
  KEY `FK_Sesion_Usuario` (`FK_ID_Usuario`),
  KEY `idx_jti` (`JTI`),
  CONSTRAINT `FK_Sesion_Usuario` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sesion_activa`
--

LOCK TABLES `tbl_sesion_activa` WRITE;
/*!40000 ALTER TABLE `tbl_sesion_activa` DISABLE KEYS */;
INSERT INTO `tbl_sesion_activa` VALUES (1,5,'67d1a146-07d7-4862-bfe5-918573fec497','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 01:54:32','2026-04-19 02:48:34',0,1),(2,5,'89e33f19-004c-484d-8827-1003c3b3916a','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 01:55:40','2026-04-19 02:58:48',0,1),(3,5,'1e17f1f3-1f96-401f-bc1b-173b6664e835','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 02:58:26','2026-04-19 03:48:28',0,1),(4,3,'66ed8b27-d23a-4f9f-b935-b2e905351c76','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 04:09:17','2026-04-19 04:09:17',1,1),(5,3,'fd010b69-b5f1-4594-a0d3-6ec863d55132','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 04:21:13','2026-04-19 04:21:13',1,1),(6,3,'dd67159d-2447-4930-9195-da47c0e8cd06','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 04:43:41','2026-04-19 04:43:41',1,1),(7,5,'e3653dad-4c65-409f-a053-82e0671ecdb2','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 05:47:51','2026-04-19 05:49:40',0,1),(8,5,'a3b4cfef-c66c-44d3-83c9-60d6bd2090df','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 05:55:27','2026-04-19 06:06:53',0,1),(9,5,'40e42555-db0d-4358-bd14-47f7ba9752fd','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','127.0.0.1','2026-04-19 06:07:02','2026-04-19 06:07:02',1,1);
/*!40000 ALTER TABLE `tbl_sesion_activa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ticket`
--

DROP TABLE IF EXISTS `tbl_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ticket` (
  `ID_Ticket` varchar(10) NOT NULL,
  `Titulo_Ticket` varchar(150) NOT NULL,
  `Descripcion_Ticket` text NOT NULL,
  `Fecha_Creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Cierre` datetime DEFAULT NULL,
  `Puntaje_Prioridad` int NOT NULL,
  `FK_ID_Usuario_Creador` int NOT NULL,
  `FK_ID_Usuario_Tecnico` int DEFAULT NULL,
  `FK_ID_Estudiante` int NOT NULL,
  `FK_ID_Tipo_Afectacion` tinyint NOT NULL,
  `FK_ID_Colegio_Preferencia` int DEFAULT NULL,
  `FK_ID_Jornada_Preferencia` tinyint NOT NULL,
  `FK_ID_Cupo_Asignado` int DEFAULT NULL,
  `FK_ID_Estado_Ticket` tinyint NOT NULL,
  `FK_ID_Barrio` int NOT NULL,
  `FK_ID_Tiempo_Residencia` tinyint DEFAULT NULL,
  `Estado_Ticket` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Ticket`),
  KEY `FK_Ticket_UsuarioCreador` (`FK_ID_Usuario_Creador`),
  KEY `FK_Ticket_UsuarioTecnico` (`FK_ID_Usuario_Tecnico`),
  KEY `FK_Ticket_Estudiante` (`FK_ID_Estudiante`),
  KEY `FK_Ticket_Afectacion` (`FK_ID_Tipo_Afectacion`),
  KEY `FK_Ticket_Colegio` (`FK_ID_Colegio_Preferencia`),
  KEY `FK_Ticket_Jornada` (`FK_ID_Jornada_Preferencia`),
  KEY `FK_Ticket_Cupo_Asignado` (`FK_ID_Cupo_Asignado`),
  KEY `FK_Ticket_Estado` (`FK_ID_Estado_Ticket`),
  KEY `FK_Ticket_Barrio` (`FK_ID_Barrio`),
  KEY `FK_Ticket_TiempoResidencia` (`FK_ID_Tiempo_Residencia`),
  CONSTRAINT `FK_Ticket_Afectacion` FOREIGN KEY (`FK_ID_Tipo_Afectacion`) REFERENCES `tbl_tipo_afectacion` (`ID_Tipo_Afectacion`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Barrio` FOREIGN KEY (`FK_ID_Barrio`) REFERENCES `tbl_barrio` (`ID_Barrio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Colegio` FOREIGN KEY (`FK_ID_Colegio_Preferencia`) REFERENCES `tbl_colegio` (`ID_Colegio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Cupo_Asignado` FOREIGN KEY (`FK_ID_Cupo_Asignado`) REFERENCES `tbl_cupos` (`ID_Cupos`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Estado` FOREIGN KEY (`FK_ID_Estado_Ticket`) REFERENCES `tbl_estado_ticket` (`ID_Estado_Ticket`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Estudiante` FOREIGN KEY (`FK_ID_Estudiante`) REFERENCES `tbl_estudiante` (`ID_Estudiante`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_Jornada` FOREIGN KEY (`FK_ID_Jornada_Preferencia`) REFERENCES `tbl_jornada` (`ID_Jornada`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_TiempoResidencia` FOREIGN KEY (`FK_ID_Tiempo_Residencia`) REFERENCES `tbl_tiempo_residencia` (`ID_Tiempo_Residencia`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_UsuarioCreador` FOREIGN KEY (`FK_ID_Usuario_Creador`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Ticket_UsuarioTecnico` FOREIGN KEY (`FK_ID_Usuario_Tecnico`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket`
--

LOCK TABLES `tbl_ticket` WRITE;
/*!40000 ALTER TABLE `tbl_ticket` DISABLE KEYS */;
INSERT INTO `tbl_ticket` VALUES ('EDU-000001','Solicitud de Cupo ‚Äî Marialis Vargas ‚Äî Octavo','Describa brevemente la situaci√≥n del menor y las circunstancias que motivaron la solicitud de cupo educativo. Sea lo m√°s detallado posible para una mejor evaluaci√≥n del caso...','2026-04-19 03:13:38',NULL,40,5,4,3,1,NULL,1,NULL,1,4,4,1);
/*!40000 ALTER TABLE `tbl_ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_asignar_tecnico_ticket` BEFORE INSERT ON `tbl_ticket` FOR EACH ROW BEGIN
    -- Solo asigna si no viene ya asignado
    IF NEW.FK_ID_Usuario_Tecnico IS NULL THEN
        SET NEW.FK_ID_Usuario_Tecnico = fn_obtener_tecnico_disponible();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_ticket_comentario`
--

DROP TABLE IF EXISTS `tbl_ticket_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ticket_comentario` (
  `ID_Ticket_Comentario` int NOT NULL AUTO_INCREMENT,
  `Tipo_Evento` varchar(20) NOT NULL,
  `Comentario` text NOT NULL,
  `Fecha_Comentario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Es_Interno` tinyint(1) NOT NULL,
  `FK_ID_Usuario` int NOT NULL,
  `FK_ID_Ticket` varchar(10) NOT NULL,
  `Estado_Comentario_Ticket` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Ticket_Comentario`),
  KEY `FK_TicketComentario_Usuario` (`FK_ID_Usuario`),
  KEY `FK_TicketComentario_Ticket` (`FK_ID_Ticket`),
  CONSTRAINT `FK_TicketComentario_Ticket` FOREIGN KEY (`FK_ID_Ticket`) REFERENCES `tbl_ticket` (`ID_Ticket`) ON UPDATE CASCADE,
  CONSTRAINT `FK_TicketComentario_Usuario` FOREIGN KEY (`FK_ID_Usuario`) REFERENCES `tbl_usuario` (`ID_Usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket_comentario`
--

LOCK TABLES `tbl_ticket_comentario` WRITE;
/*!40000 ALTER TABLE `tbl_ticket_comentario` DISABLE KEYS */;
INSERT INTO `tbl_ticket_comentario` VALUES (1,'Nueva Solicitud','[Nueva Solicitud] Ticket creado: Solicitud de Cupo ‚Äî Marialis Vargas ‚Äî Octavo','2026-04-19 03:13:38',1,5,'EDU-000001',1);
/*!40000 ALTER TABLE `tbl_ticket_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tiempo_residencia`
--

DROP TABLE IF EXISTS `tbl_tiempo_residencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tiempo_residencia` (
  `ID_Tiempo_Residencia` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Tiempo` varchar(40) NOT NULL,
  `Estado_T_Residencia` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Tiempo_Residencia`),
  UNIQUE KEY `Nombre_Tiempo` (`Nombre_Tiempo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tiempo_residencia`
--

LOCK TABLES `tbl_tiempo_residencia` WRITE;
/*!40000 ALTER TABLE `tbl_tiempo_residencia` DISABLE KEYS */;
INSERT INTO `tbl_tiempo_residencia` VALUES (1,'Menos de 1 mes',1),(2,'1 a 6 meses',1),(3,'6 meses a 1 a√±o',1),(4,'M√°s de 1 a√±o',1);
/*!40000 ALTER TABLE `tbl_tiempo_residencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_afectacion`
--

DROP TABLE IF EXISTS `tbl_tipo_afectacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_afectacion` (
  `ID_Tipo_Afectacion` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Afectacion` varchar(60) NOT NULL,
  `Nivel_Prioridad_TC` tinyint NOT NULL,
  `Estado_Afectacion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Tipo_Afectacion`),
  UNIQUE KEY `Nombre_Afectacion` (`Nombre_Afectacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_afectacion`
--

LOCK TABLES `tbl_tipo_afectacion` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_afectacion` DISABLE KEYS */;
INSERT INTO `tbl_tipo_afectacion` VALUES (1,'Desplazamiento Forzado',40,1),(2,'V√≠ctima del Conflicto Armado',35,1),(3,'Vulnerabilidad Econ√≥mica',20,1),(4,'No Escolarizado',15,1),(5,'Otro',5,1);
/*!40000 ALTER TABLE `tbl_tipo_afectacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_documento`
--

DROP TABLE IF EXISTS `tbl_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_documento` (
  `ID_Tipo_Doc` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Doc` varchar(30) NOT NULL,
  `Estado_Documentos` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Tipo_Doc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_documento`
--

LOCK TABLES `tbl_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_documento` DISABLE KEYS */;
INSERT INTO `tbl_tipo_documento` VALUES (1,'Documento Acudiente',1),(2,'Documento Menor',1),(3,'Certificado Acad√©mico',1),(4,'Documento V√≠ctima',1);
/*!40000 ALTER TABLE `tbl_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_identificacion`
--

DROP TABLE IF EXISTS `tbl_tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_identificacion` (
  `ID_Tipo_Iden` tinyint NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Iden` varchar(30) NOT NULL,
  `Tipo_Usuario` enum('ACUDIENTE','ESTUDIANTE') NOT NULL,
  `Estado_Identificacion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Tipo_Iden`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_identificacion`
--

LOCK TABLES `tbl_tipo_identificacion` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_identificacion` DISABLE KEYS */;
INSERT INTO `tbl_tipo_identificacion` VALUES (1,'Cedula de Ciudadania','ACUDIENTE',1),(2,'Cedula de Extranjeria','ACUDIENTE',1),(3,'Tarjeta de Identidad','ESTUDIANTE',1),(4,'Registro Civil','ESTUDIANTE',1);
/*!40000 ALTER TABLE `tbl_tipo_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` varchar(255) NOT NULL,
  `Contrase√±a_Hash` varchar(255) NOT NULL,
  `Ultimo_Cambio_Contrase√±a` datetime DEFAULT NULL,
  `Ultimo_Login` datetime DEFAULT NULL,
  `Intentos_Fallidos` int DEFAULT NULL,
  `Fecha_Creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Doble_Factor_Activo` enum('ACTIVE','INACTIVE') DEFAULT 'INACTIVE',
  `MFA_Fecha_Configuracion` datetime DEFAULT NULL,
  `MFA_Secret` varchar(64) DEFAULT NULL,
  `MFA_Secret_Temp` varchar(64) DEFAULT NULL,
  `Notificaciones_Email` tinyint(1) NOT NULL DEFAULT '0',
  `Notificaciones_Navegador` tinyint(1) NOT NULL DEFAULT '0',
  `Aceptacion_Terminos` enum('ACCEPTED','REJECTED') DEFAULT 'REJECTED',
  `FK_ID_Persona` int NOT NULL,
  `FK_ID_Rol` tinyint NOT NULL,
  `Estado_Usuario` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Nombre_Usuario` (`Nombre_Usuario`),
  UNIQUE KEY `FK_ID_Persona` (`FK_ID_Persona`),
  KEY `FK_Usuario_Rol` (`FK_ID_Rol`),
  CONSTRAINT `FK_Usuario_Persona` FOREIGN KEY (`FK_ID_Persona`) REFERENCES `tbl_persona` (`ID_Persona`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Usuario_Rol` FOREIGN KEY (`FK_ID_Rol`) REFERENCES `tbl_rol` (`ID_Rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'system@audit','$argon2id$v=19$m=65536,t=3,p=4$zrLKUtV7jF6NS1gi5VyvhA$XrhMZLWBgYSjWJGkRMDcIU84dbGNAhmyQGdWsNFQxgU',NULL,NULL,NULL,'2026-04-19 01:42:15','INACTIVE',NULL,NULL,NULL,0,0,'REJECTED',1,1,1),(2,'unknown@audit','$argon2id$v=19$m=65536,t=3,p=4$zrLKUtV7jF6NS1gi5VyvhA$XrhMZLWBgYSjWJGkRMDcIU84dbGNAhmyQGdWsNFQxgl',NULL,NULL,NULL,'2026-04-19 01:43:20','INACTIVE',NULL,NULL,NULL,0,0,'REJECTED',2,5,1),(3,'fortress.educa@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$CbNaBHYhF5D+Llo3F4gYLQ$EqZN3qrgTsEUQwe7ZpSgTBSBAOijwkUw+M42Gqmkoio',NULL,'2026-04-19 04:43:41',0,'2026-04-17 02:01:41','ACTIVE','2026-04-19 04:09:45','OOOSARPUVHSG77E5IQ5B6RIRHEWU24GT',NULL,0,0,'ACCEPTED',3,4,1),(4,'edcaicedoc@sanmateo.edu.co','$argon2id$v=19$m=65536,t=3,p=4$zrLKUtV7jF6NS1gi5VyvhA$XrhMZLWBgYSjWJGkRMDcIU84dbGNAhmyQGdWsNFQxgU','2026-04-14 11:44:39','2026-04-16 06:13:17',0,'2026-03-30 23:07:59','ACTIVE','2026-04-14 12:43:47','PWHFBTGG3SXTCWGBE6QI5GG6KUZKV2O5',NULL,0,0,'ACCEPTED',4,3,1),(5,'danicaicedo2005@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$CbNaBHYhF5D+Llo3F4gYLQ$EqZN3qrgTsEUQwe7ZpSgTBSBAOijwkUw+M42Gqmkoio','2026-04-19 02:58:44','2026-04-19 06:07:02',0,'2026-04-03 17:09:56','INACTIVE','2026-04-19 06:08:05',NULL,NULL,0,0,'ACCEPTED',5,2,1);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_asignar_tickets_a_nuevo_tecnico` AFTER INSERT ON `tbl_usuario` FOR EACH ROW BEGIN
    DECLARE v_tecnico_id INT;

    IF NEW.FK_ID_Rol = 3 AND NEW.Estado_Usuario = 1 THEN

        SET v_tecnico_id = fn_obtener_tecnico_disponible();

        UPDATE TBL_TICKET
        SET FK_ID_Usuario_Tecnico = v_tecnico_id
        WHERE FK_ID_Usuario_Tecnico IS NULL
          AND Estado_Ticket = 1;

    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_reasignar_tickets_tecnico_inactivo` AFTER UPDATE ON `tbl_usuario` FOR EACH ROW BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_ticket_id VARCHAR(10);
    DECLARE v_nuevo_tecnico INT;
    DECLARE v_nombre_anterior VARCHAR(150);
    DECLARE v_nombre_nuevo VARCHAR(150);
    DECLARE v_msg TEXT;

    -- Cursor para recorrer tickets afectados
    DECLARE cur_tickets CURSOR FOR
        SELECT ID_Ticket
        FROM TBL_TICKET
        WHERE FK_ID_Usuario_Tecnico = OLD.ID_Usuario
          AND Estado_Ticket = 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Condici√≥n: usuario deja de ser t√©cnico o se desactiva
    IF (OLD.FK_ID_Rol = 3 AND (NEW.FK_ID_Rol <> 3 OR NEW.Estado_Usuario = 0)) THEN

        -- Obtener nombre t√©cnico anterior
        SELECT CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido)
        INTO v_nombre_anterior
        FROM TBL_PERSONA p
        WHERE p.ID_Persona = OLD.FK_ID_Persona;

        OPEN cur_tickets;

        read_loop: LOOP
            FETCH cur_tickets INTO v_ticket_id;
            IF done THEN
                LEAVE read_loop;
            END IF;

            -- Obtener nuevo t√©cnico disponible
            SET v_nuevo_tecnico = fn_obtener_tecnico_disponible();

            -- Actualizar ticket
            UPDATE TBL_TICKET
            SET FK_ID_Usuario_Tecnico = v_nuevo_tecnico
            WHERE ID_Ticket = v_ticket_id;

            -- Obtener nombre nuevo t√©cnico (si existe)
            IF v_nuevo_tecnico IS NOT NULL THEN
                SELECT CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido)
                INTO v_nombre_nuevo
                FROM TBL_USUARIO u
                INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
                WHERE u.ID_Usuario = v_nuevo_tecnico;
            ELSE
                SET v_nombre_nuevo = 'Sin asignar';
            END IF;

            -- Construir mensaje tipo auditor√≠a
            SET v_msg = CONCAT(
                '[Reasignaci√≥n Autom√°tica] T√©cnico: ',
                v_nombre_anterior,
                ' -> ',
                v_nombre_nuevo
            );

            -- Insertar comentario (VISIBLE al usuario)
            INSERT INTO TBL_TICKET_COMENTARIO (
                Comentario,
                Es_Interno,
                FK_ID_Usuario,
                FK_ID_Ticket
            ) VALUES (
                v_msg,
                0, -- p√∫blico
                COALESCE(v_nuevo_tecnico, OLD.ID_Usuario), 
                v_ticket_id
            );

        END LOOP;

        CLOSE cur_tickets;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_admin_acudientes`
--

DROP TABLE IF EXISTS `vw_admin_acudientes`;
/*!50001 DROP VIEW IF EXISTS `vw_admin_acudientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_admin_acudientes` AS SELECT 
 1 AS `ID_Usuario`,
 1 AS `ID_Formateado`,
 1 AS `Nombre_Completo`,
 1 AS `MFA`,
 1 AS `Email`,
 1 AS `Total_Solicitudes`,
 1 AS `Estado_Usuario`,
 1 AS `Estado_Texto`,
 1 AS `Ultimo_Login`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_admin_administradores`
--

DROP TABLE IF EXISTS `vw_admin_administradores`;
/*!50001 DROP VIEW IF EXISTS `vw_admin_administradores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_admin_administradores` AS SELECT 
 1 AS `ID_Usuario`,
 1 AS `ID_Formateado`,
 1 AS `Nombre_Completo`,
 1 AS `Ultimo_Login`,
 1 AS `Estado_Usuario`,
 1 AS `Estado_Texto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_admin_estudiantes`
--

DROP TABLE IF EXISTS `vw_admin_estudiantes`;
/*!50001 DROP VIEW IF EXISTS `vw_admin_estudiantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_admin_estudiantes` AS SELECT 
 1 AS `ID_Estudiante`,
 1 AS `ID_Formateado`,
 1 AS `Nombre_Estudiante`,
 1 AS `Nombre_Acudiente`,
 1 AS `Edad`,
 1 AS `Genero`,
 1 AS `Estado_Estudiante`,
 1 AS `Estado_Texto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_admin_tecnicos`
--

DROP TABLE IF EXISTS `vw_admin_tecnicos`;
/*!50001 DROP VIEW IF EXISTS `vw_admin_tecnicos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_admin_tecnicos` AS SELECT 
 1 AS `ID_Usuario`,
 1 AS `ID_Formateado`,
 1 AS `Nombre_Completo`,
 1 AS `Email`,
 1 AS `Casos_Asignados`,
 1 AS `Casos_Cerrados`,
 1 AS `Estado_Usuario`,
 1 AS `Estado_Texto`,
 1 AS `Ultimo_Login`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_auditoria_comentarios`
--

DROP TABLE IF EXISTS `vw_auditoria_comentarios`;
/*!50001 DROP VIEW IF EXISTS `vw_auditoria_comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_auditoria_comentarios` AS SELECT 
 1 AS `ID_Ticket_Comentario`,
 1 AS `Tipo_Evento`,
 1 AS `Comentario`,
 1 AS `Fecha_Comentario`,
 1 AS `Es_Interno`,
 1 AS `FK_ID_Ticket`,
 1 AS `Estado_Comentario_Ticket`,
 1 AS `ID_Usuario`,
 1 AS `Nombre_Rol`,
 1 AS `Nombre_Completo_Usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_cases_general`
--

DROP TABLE IF EXISTS `vw_cases_general`;
/*!50001 DROP VIEW IF EXISTS `vw_cases_general`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cases_general` AS SELECT 
 1 AS `ID_Ticket`,
 1 AS `Titulo_Ticket`,
 1 AS `Fecha_Creacion`,
 1 AS `Fecha_Cierre`,
 1 AS `Puntaje_Prioridad`,
 1 AS `Nombre_Estado`,
 1 AS `Estado_Final`,
 1 AS `Nombre_Estudiante`,
 1 AS `Edad_Estudiante`,
 1 AS `Nombre_Acudiente`,
 1 AS `Nombre_Grado`,
 1 AS `Nombre_Afectacion`,
 1 AS `Colegio_Asignado`,
 1 AS `Nombre_Tecnico`,
 1 AS `FK_ID_Estado_Ticket`,
 1 AS `FK_ID_Grado_Actual`,
 1 AS `FK_ID_Grado_Proximo`,
 1 AS `FK_ID_Tipo_Afectacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estudiante_detalle`
--

DROP TABLE IF EXISTS `vw_estudiante_detalle`;
/*!50001 DROP VIEW IF EXISTS `vw_estudiante_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estudiante_detalle` AS SELECT 
 1 AS `ID_Estudiante`,
 1 AS `FK_ID_Acudiente`,
 1 AS `Estado_Estudiante`,
 1 AS `ID_Persona`,
 1 AS `Primer_Nombre`,
 1 AS `Segundo_Nombre`,
 1 AS `Primer_Apellido`,
 1 AS `Segundo_Apellido`,
 1 AS `Fecha_Nacimiento`,
 1 AS `Numero_Documento`,
 1 AS `Nombre_Tipo_Iden`,
 1 AS `Nombre_Genero`,
 1 AS `Nombre_Grupo_Preferencial`,
 1 AS `Nombre_Grado_Actual`,
 1 AS `Nombre_Grado_Proximo`,
 1 AS `Nombre_Colegio_Anterior`,
 1 AS `ID_Genero`,
 1 AS `ID_Grupo_Preferencial`,
 1 AS `ID_Grado_Actual`,
 1 AS `ID_Grado_Proximo`,
 1 AS `ID_Colegio_Anterior`,
 1 AS `FK_ID_Persona`,
 1 AS `ID_Tipo_Iden`,
 1 AS `ID_Parentesco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_historial_acceso`
--

DROP TABLE IF EXISTS `vw_historial_acceso`;
/*!50001 DROP VIEW IF EXISTS `vw_historial_acceso`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_historial_acceso` AS SELECT 
 1 AS `ID_Auditoria`,
 1 AS `Nombre_Usuario`,
 1 AS `ID_Rol`,
 1 AS `Nombre_Rol`,
 1 AS `Evento`,
 1 AS `IP`,
 1 AS `Navegador`,
 1 AS `User_Agent`,
 1 AS `Fecha_Evento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_historial_acciones`
--

DROP TABLE IF EXISTS `vw_historial_acciones`;
/*!50001 DROP VIEW IF EXISTS `vw_historial_acciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_historial_acciones` AS SELECT 
 1 AS `ID_Auditoria`,
 1 AS `Evento`,
 1 AS `Tabla_Afectada`,
 1 AS `ID_Registro_Afectado`,
 1 AS `ID_Formateado`,
 1 AS `ID_Rol`,
 1 AS `Nombre_Rol`,
 1 AS `IP`,
 1 AS `Dato_Antiguo`,
 1 AS `Dato_Nuevo`,
 1 AS `Fecha_Evento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ticket_acudiente_detalle`
--

DROP TABLE IF EXISTS `vw_ticket_acudiente_detalle`;
/*!50001 DROP VIEW IF EXISTS `vw_ticket_acudiente_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ticket_acudiente_detalle` AS SELECT 
 1 AS `ID_Ticket`,
 1 AS `ID_Persona`,
 1 AS `Numero_Documento`,
 1 AS `Nombre_Tipo_Iden`,
 1 AS `Primer_Nombre`,
 1 AS `Segundo_Nombre`,
 1 AS `Primer_Apellido`,
 1 AS `Segundo_Apellido`,
 1 AS `Email`,
 1 AS `Telefono`,
 1 AS `Nombre_Barrio`,
 1 AS `Nombre_Localidad`,
 1 AS `Nombre_Estrato`,
 1 AS `Nombre_Genero`,
 1 AS `Nombre_Grupo_Preferencial`,
 1 AS `Nombre_Parentesco`,
 1 AS `Fecha_Creacion`,
 1 AS `Iniciales`,
 1 AS `Nombre_Completo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ticket_base`
--

DROP TABLE IF EXISTS `vw_ticket_base`;
/*!50001 DROP VIEW IF EXISTS `vw_ticket_base`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ticket_base` AS SELECT 
 1 AS `ID_Ticket`,
 1 AS `Titulo_Ticket`,
 1 AS `Descripcion_Ticket`,
 1 AS `Fecha_Creacion`,
 1 AS `Fecha_Cierre`,
 1 AS `Puntaje_Prioridad`,
 1 AS `FK_ID_Usuario_Creador`,
 1 AS `FK_ID_Estudiante`,
 1 AS `Nombre_Estado`,
 1 AS `Estado_Final`,
 1 AS `Nombre_Afectacion`,
 1 AS `Nivel_Prioridad_TC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ticket_comentarios`
--

DROP TABLE IF EXISTS `vw_ticket_comentarios`;
/*!50001 DROP VIEW IF EXISTS `vw_ticket_comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ticket_comentarios` AS SELECT 
 1 AS `ID_Ticket_Comentario`,
 1 AS `FK_ID_Ticket`,
 1 AS `Comentario`,
 1 AS `Fecha_Comentario`,
 1 AS `Es_Interno`,
 1 AS `Estado_Comentario_Ticket`,
 1 AS `ID_Usuario`,
 1 AS `Nombre_Usuario`,
 1 AS `Nombre_Rol`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ticket_detalle`
--

DROP TABLE IF EXISTS `vw_ticket_detalle`;
/*!50001 DROP VIEW IF EXISTS `vw_ticket_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ticket_detalle` AS SELECT 
 1 AS `ID_Ticket`,
 1 AS `Titulo_Ticket`,
 1 AS `Descripcion_Ticket`,
 1 AS `Fecha_Creacion`,
 1 AS `Fecha_Cierre`,
 1 AS `Puntaje_Prioridad`,
 1 AS `Estado_Ticket`,
 1 AS `FK_ID_Usuario_Creador`,
 1 AS `FK_ID_Usuario_Tecnico`,
 1 AS `FK_ID_Estudiante`,
 1 AS `FK_ID_Jornada_Preferencia`,
 1 AS `FK_ID_Barrio`,
 1 AS `FK_ID_Tiempo_Residencia`,
 1 AS `FK_ID_Colegio_Preferencia`,
 1 AS `FK_ID_Cupo_Asignado`,
 1 AS `Nombre_Estado`,
 1 AS `Estado_Final`,
 1 AS `Nombre_Afectacion`,
 1 AS `Nivel_Prioridad_TC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ticket_estudiante_detalle`
--

DROP TABLE IF EXISTS `vw_ticket_estudiante_detalle`;
/*!50001 DROP VIEW IF EXISTS `vw_ticket_estudiante_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ticket_estudiante_detalle` AS SELECT 
 1 AS `ID_Ticket`,
 1 AS `ID_Estudiante`,
 1 AS `ID_Persona`,
 1 AS `Nombre_Tipo_Iden`,
 1 AS `Numero_Documento`,
 1 AS `Primer_Nombre`,
 1 AS `Segundo_Nombre`,
 1 AS `Primer_Apellido`,
 1 AS `Segundo_Apellido`,
 1 AS `Fecha_Nacimiento`,
 1 AS `Edad`,
 1 AS `Nombre_Genero`,
 1 AS `Nombre_Grupo_Preferencial`,
 1 AS `Nombre_Grado_Actual`,
 1 AS `Nombre_Grado_Proximo`,
 1 AS `Nombre_Colegio_Anterior`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ticket_panel_detalle`
--

DROP TABLE IF EXISTS `vw_ticket_panel_detalle`;
/*!50001 DROP VIEW IF EXISTS `vw_ticket_panel_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ticket_panel_detalle` AS SELECT 
 1 AS `ID_Ticket`,
 1 AS `Titulo_Ticket`,
 1 AS `Descripcion_Ticket`,
 1 AS `Fecha_Creacion`,
 1 AS `Fecha_Cierre`,
 1 AS `Puntaje_Prioridad`,
 1 AS `ID_Estado_Ticket`,
 1 AS `Nombre_Estado`,
 1 AS `ID_Tecnico`,
 1 AS `Nombre_Tecnico`,
 1 AS `Nombre_Estudiante`,
 1 AS `Grado_Actual`,
 1 AS `Grado_Proximo`,
 1 AS `Colegio_Preferencia`,
 1 AS `Nombre_Jornada`,
 1 AS `Nombre_Afectacion`,
 1 AS `Nombre_Barrio`,
 1 AS `Nombre_Tiempo`,
 1 AS `Colegio_Asignado`,
 1 AS `ID_Cupos`,
 1 AS `Estado_Final`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'fortress_educa_db'
--

--
-- Dumping routines for database 'fortress_educa_db'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_obtener_tecnico_disponible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_obtener_tecnico_disponible`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_tecnico_id INT;

    SELECT u.ID_Usuario
    INTO v_tecnico_id
    FROM TBL_USUARIO u
    LEFT JOIN TBL_TICKET t 
        ON u.ID_Usuario = t.FK_ID_Usuario_Tecnico
        AND t.Estado_Ticket = 1
    WHERE u.FK_ID_Rol = 3
      AND u.Estado_Usuario = 1
    GROUP BY u.ID_Usuario
    ORDER BY COUNT(t.ID_Ticket) ASC
    LIMIT 1;

    RETURN v_tecnico_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_acudientes_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_acudientes_listar`()
BEGIN
    SELECT * FROM VW_ADMIN_ACUDIENTES ORDER BY ID_Usuario DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_administradores_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_administradores_listar`()
BEGIN
    SELECT * FROM VW_ADMIN_ADMINISTRADORES ORDER BY ID_Usuario DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_estudiantes_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_estudiantes_listar`()
BEGIN
    SELECT * FROM VW_ADMIN_ESTUDIANTES ORDER BY ID_Estudiante DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_eventos_acceso_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_eventos_acceso_consultar`()
BEGIN
    SELECT 'LOGIN' AS Nombre_Evento
    UNION ALL SELECT 'LOGIN_MFA'

    UNION ALL SELECT 'LOGOUT'

    UNION ALL SELECT 'PENDING_MFA'

    UNION ALL SELECT 'MFA_SETUP_OK'
    UNION ALL SELECT 'MFA_SETUP_FAILED'

    UNION ALL SELECT 'AD_FAILED_LOGIN'
    UNION ALL SELECT 'US_FAILED_LOGIN'

    UNION ALL SELECT 'FAILED_MFA'
    UNION ALL SELECT 'FAILED_LOGIN';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_eventos_auditoria_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_eventos_auditoria_consultar`()
BEGIN
    SELECT DISTINCT Tipo_Evento AS Nombre_Evento
    FROM TBL_AUDITORIA
    WHERE Estado_Auditoria = 1
    ORDER BY Tipo_Evento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_historial_acceso_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_historial_acceso_listar`(
    IN p_id_rol TINYINT,
    IN p_evento VARCHAR(50),
    IN p_navegador VARCHAR(100)
)
BEGIN
    SELECT *
    FROM vw_historial_acceso
    WHERE ID_Rol <> 1
        AND (p_id_rol IS NULL OR ID_Rol = p_id_rol)
        AND (p_evento IS NULL OR Evento = p_evento)
        AND (p_navegador IS NULL OR Navegador = p_navegador)
    ORDER BY Fecha_Evento DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_historial_acciones_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_historial_acciones_listar`(
    IN p_id_rol TINYINT,
    IN p_evento VARCHAR(50)
)
BEGIN
    SELECT *
    FROM vw_historial_acciones
    WHERE (p_id_rol IS NULL OR ID_Rol = p_id_rol)
        AND (p_evento IS NULL OR Evento = p_evento)
    ORDER BY Fecha_Evento DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_metricas_accounts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_metricas_accounts`()
BEGIN
    SELECT
        -- Total de usuarios en el sistema
        (SELECT COUNT(*)
         FROM TBL_USUARIO
         WHERE Estado_Usuario = 1) AS total_usuarios,

        -- Acudientes con sesi√≥n activa ahora mismo
        (SELECT COUNT(DISTINCT sa.FK_ID_Usuario)
            FROM TBL_SESION_ACTIVA sa
            INNER JOIN TBL_USUARIO u ON sa.FK_ID_Usuario = u.ID_Usuario
            INNER JOIN TBL_ROL r ON u.FK_ID_Rol = r.ID_Rol
            WHERE sa.Activa = 1
                AND r.Nombre_Rol = 'Acudiente') AS acudientes_con,

        -- T√©cnicos con sesi√≥n activa ahora mismo
        (SELECT COUNT(DISTINCT sa.FK_ID_Usuario)
            FROM TBL_SESION_ACTIVA sa
            INNER JOIN TBL_USUARIO  u ON sa.FK_ID_Usuario = u.ID_Usuario
            INNER JOIN TBL_ROL r ON u.FK_ID_Rol = r.ID_Rol
            WHERE sa.Activa = 1
                AND r.Nombre_Rol = 'Tecnico') AS tecnicos_con,

        -- Administradores con sesi√≥n activa ahora mismo
        (SELECT COUNT(DISTINCT sa.FK_ID_Usuario)
            FROM TBL_SESION_ACTIVA sa
            INNER JOIN TBL_USUARIO  u ON sa.FK_ID_Usuario = u.ID_Usuario
            INNER JOIN TBL_ROL r ON u.FK_ID_Rol = r.ID_Rol
            WHERE sa.Activa = 1
            AND r.Nombre_Rol = 'Admin') AS administradores_con;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_metricas_funcionarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_metricas_funcionarios`()
BEGIN
    SELECT
        (SELECT COUNT(*)
         FROM VW_ADMIN_TECNICOS) AS tecnicos,
        (SELECT COUNT(*)
         FROM VW_ADMIN_TECNICOS WHERE Estado_Usuario = 0) AS tecnicos_desactivados,
        (SELECT COUNT(*)
         FROM VW_ADMIN_ADMINISTRADORES) AS administradores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_metricas_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_metricas_usuarios`()
BEGIN
    SELECT
        (SELECT COUNT(*) FROM VW_ADMIN_ACUDIENTES) AS acudientes,
        (SELECT COUNT(*) FROM TBL_ESTUDIANTE) AS estudiantes,
        (SELECT COUNT(*) FROM TBL_USUARIO u
            INNER JOIN TBL_ROL r ON u.FK_ID_Rol = r.ID_Rol
            WHERE r.Nombre_Rol = 'Acudiente'
                AND u.Doble_Factor_Activo = 'ACTIVE') AS usuarios_mfa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_navegadores_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_navegadores_consultar`()
BEGIN
    SELECT DISTINCT
        CASE
            WHEN User_Agent LIKE '%Brave/%' OR User_Agent LIKE '% Brave %' THEN 'Brave'
            WHEN User_Agent LIKE '%Edg/%' THEN 'Edge'
            WHEN User_Agent LIKE '%OPR/%' OR User_Agent LIKE '%Opera/%' THEN 'Opera'
            WHEN User_Agent LIKE '%Vivaldi/%' THEN 'Vivaldi'
            WHEN User_Agent LIKE '%CriOS/%' THEN 'Chrome (iOS)'
            WHEN User_Agent LIKE '%Chrome/%' THEN 'Chrome'
            WHEN User_Agent LIKE '%Firefox/%' THEN 'Firefox'
            WHEN User_Agent LIKE '%Safari/%' AND User_Agent NOT LIKE '%Chrome/%' AND User_Agent NOT LIKE '%Chromium/%' THEN 'Safari'
            WHEN User_Agent LIKE '%MSIE %' OR User_Agent LIKE '%Trident/%' THEN 'Internet Explorer'
            ELSE 'Otro'
        END AS Nombre_Navegador
    FROM TBL_AUDITORIA_SESION
    WHERE Estado_Auditoria_Sesion = 1
    ORDER BY Nombre_Navegador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_tecnicos_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_tecnicos_listar`(
    IN p_estado TINYINT
)
BEGIN
    SELECT *
    FROM VW_ADMIN_TECNICOS
    WHERE (p_estado IS NULL OR Estado_Usuario = p_estado)
    ORDER BY ID_Usuario DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_toggle_estado_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_toggle_estado_estudiante`(
    IN p_id_estudiante INT,
    IN p_nuevo_estado TINYINT,
    IN p_ejecutor_id INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_estado_actual TINYINT;

    SELECT Estado_Estudiante INTO v_estado_actual
    FROM TBL_ESTUDIANTE
    WHERE ID_Estudiante = p_id_estudiante;

    UPDATE TBL_ESTUDIANTE
    SET Estado_Estudiante = p_nuevo_estado
    WHERE ID_Estudiante = p_id_estudiante;

    INSERT INTO TBL_AUDITORIA (
        Tabla_Afectada,
        Tipo_Evento,
        ID_Registro_Afectado,
        Datos_Antiguo,
        Datos_Nuevos,
        IP_Usuario,
        User_Agent,
        FK_ID_Usuario
    ) VALUES (
        'TBL_ESTUDIANTE',
        'DELETE',
        CAST(p_id_estudiante AS CHAR),
        JSON_OBJECT('Estado_Estudiante', v_estado_actual),
        JSON_OBJECT('Estado_Estudiante', p_nuevo_estado),
        p_ip,
        p_user_agent,
        p_ejecutor_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_admin_toggle_estado_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_toggle_estado_usuario`(
    IN p_id_usuario INT,
    IN p_nuevo_estado TINYINT,
    IN p_ejecutor_id INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent   VARCHAR(255)
)
BEGIN
    DECLARE v_estado_actual TINYINT;
    DECLARE v_evento VARCHAR(20);

    -- Estado actual antes del cambio
    SELECT Estado_Usuario INTO v_estado_actual
    FROM TBL_USUARIO
    WHERE ID_Usuario = p_id_usuario;

    SET v_evento = IF(p_nuevo_estado = 1, 'UPDATE', 'DELETE');

    -- Aplicar cambio
    UPDATE TBL_USUARIO
    SET Estado_Usuario = p_nuevo_estado
    WHERE ID_Usuario = p_id_usuario;

    -- Registrar en auditor√≠a con JSON estructurado
    INSERT INTO TBL_AUDITORIA (
        Tabla_Afectada,
        Tipo_Evento,
        ID_Registro_Afectado,
        Datos_Antiguo,
        Datos_Nuevos,
        IP_Usuario,
        User_Agent,
        FK_ID_Usuario
    ) VALUES (
        'TBL_USUARIO',
        v_evento,
        CAST(p_id_usuario AS CHAR),
        JSON_OBJECT('Estado_Usuario', v_estado_actual),
        JSON_OBJECT('Estado_Usuario', p_nuevo_estado),
        p_ip,
        p_user_agent,
        p_ejecutor_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_auditoria_sesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_auditoria_sesion`(
    IN p_usuario INT,
    IN p_ip VARCHAR(45),
    IN p_evento VARCHAR(45),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    INSERT INTO TBL_AUDITORIA_SESION(
        FK_ID_Usuario,
        IP_Usuario,
        Tipo_Evento,
        User_Agent
    )

    VALUES(
        p_usuario,
        p_ip,
        p_evento,
        p_user_agent
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cases_listar_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cases_listar_todos`(
    IN p_id_estado TINYINT,
    IN p_id_grado TINYINT,
    IN p_id_afectacion TINYINT
)
BEGIN
    SELECT *
    FROM vw_cases_general
    WHERE (p_id_estado IS NULL OR FK_ID_Estado_Ticket = p_id_estado)
      AND (p_id_grado IS NULL OR FK_ID_Grado_Actual = p_id_grado OR FK_ID_Grado_Proximo = p_id_grado)
      AND (p_id_afectacion IS NULL OR FK_ID_Tipo_Afectacion = p_id_afectacion)
    ORDER BY Puntaje_Prioridad DESC, Fecha_Creacion ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cases_metricas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cases_metricas`()
BEGIN
    SELECT
        -- Total de tickets activos en el sistema
        COUNT(*) AS total_solicitudes,

        -- Tickets en estado "En Revisi√≥n" (ID 2)
        SUM(t.FK_ID_Estado_Ticket = 2) AS en_revision,

        -- Tickets con estado final = 1 (Solucionado, Rechazado, Cancelado)
        SUM(et.Estado_Final = 1) AS solucionados,

        -- Cupos disponibles: suma de Cupos_Disponibles en TBL_CUPOS activos
        (SELECT COALESCE(SUM(c.Cupos_Disponibles), 0)FROM TBL_CUPOS c WHERE c.Estado_Cupos = 1) AS cupos_disponibles,

        -- Tickets con cupo asignado (FK_ID_Cupo_Asignado no nulo)
        SUM(t.FK_ID_Cupo_Asignado IS NOT NULL) AS cupos_asignados

    FROM TBL_TICKET t
    INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    WHERE t.Estado_Ticket = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_colegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_colegios`()
BEGIN
    SELECT ID_Colegio, Nombre_Colegio
    FROM TBL_COLEGIO
    ORDER BY Nombre_Colegio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_cupos_disponibles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_cupos_disponibles`(
    IN p_id_ticket VARCHAR(10)     -- ticket actual (para no excluirlo de su propio cupo)
)
BEGIN
    SELECT
        cu.ID_Cupos,
        CONCAT(col.Nombre_Colegio, ' ‚Äî ', jor.Nombre_Jornada, ' ‚Äî Grado: ', g.Nombre_Grado) AS Label_Cupo
    FROM TBL_CUPOS cu
    INNER JOIN TBL_COLEGIO col ON cu.FK_ID_Colegio = col.ID_Colegio
    INNER JOIN TBL_JORNADA jor ON cu.FK_ID_Jornada = jor.ID_Jornada
    INNER JOIN TBL_GRADO g ON cu.FK_ID_Grado = g.ID_Grado
    WHERE cu.Estado_Cupos = 1   -- activo/disponible
      AND (
          -- Cupos sin asignar a ning√∫n ticket
          cu.ID_Cupos NOT IN (
              SELECT FK_ID_Cupo_Asignado
              FROM TBL_TICKET
              WHERE FK_ID_Cupo_Asignado IS NOT NULL
                AND ID_Ticket != p_id_ticket
          )
      )
    ORDER BY col.Nombre_Colegio, jor.Nombre_Jornada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_estados_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_estados_ticket`()
BEGIN
    SELECT ID_Estado_Ticket, Nombre_Estado
    FROM TBL_ESTADO_TICKET
    ORDER BY ID_Estado_Ticket;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_grados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_grados`()
BEGIN
    SELECT ID_Grado, Nombre_Grado
    FROM TBL_GRADO
    ORDER BY ID_Grado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_jornadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_jornadas`()
BEGIN
    SELECT ID_Jornada, Nombre_Jornada
    FROM TBL_JORNADA
    WHERE Estado_Jornada = 1
    ORDER BY ID_Jornada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_catalogo_tipo_afectacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_catalogo_tipo_afectacion`()
BEGIN
    SELECT ID_Tipo_Afectacion, Nombre_Afectacion
    FROM TBL_TIPO_AFECTACION
    WHERE Estado_Afectacion = 1
    ORDER BY ID_Tipo_Afectacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_configuracion_actualizar_notif_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_configuracion_actualizar_notif_email`(
    IN p_id_usuario INT,
    IN p_activo TINYINT(1)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
 
    SELECT COUNT(*) INTO v_existe
    FROM TBL_USUARIO
    WHERE ID_Usuario   = p_id_usuario
      AND Estado_Usuario = 1;
 
    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Usuario no encontrado o inactivo.';
    END IF;
 
    UPDATE TBL_USUARIO
    SET Notificaciones_Email = p_activo
    WHERE ID_Usuario = p_id_usuario;
 
    -- Devuelve el estado actualizado para confirmaci√≥n
    SELECT Notificaciones_Email AS notif_email_activo
    FROM TBL_USUARIO
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_configuracion_actualizar_notif_navegador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_configuracion_actualizar_notif_navegador`(
    IN p_id_usuario INT,
    IN p_activo TINYINT(1)
)
BEGIN
    DECLARE v_existe INT DEFAULT 0;
 
    SELECT COUNT(*) INTO v_existe
    FROM TBL_USUARIO
    WHERE ID_Usuario    = p_id_usuario
      AND Estado_Usuario = 1;
 
    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Usuario no encontrado o inactivo.';
    END IF;
 
    UPDATE TBL_USUARIO
    SET Notificaciones_Navegador = p_activo
    WHERE ID_Usuario = p_id_usuario;
 
    -- Devuelve el estado actualizado para confirmaci√≥n
    SELECT Notificaciones_Navegador AS notif_navegador_activo
    FROM TBL_USUARIO
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_configuracion_obtener_notificaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_configuracion_obtener_notificaciones`(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        Notificaciones_Email,
        Notificaciones_Navegador
    FROM TBL_USUARIO
    WHERE ID_Usuario = p_id_usuario
      AND Estado_Usuario = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_documento_ticket_insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_documento_ticket_insertar`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_tipo_doc TINYINT,
    IN p_archivo MEDIUMBLOB,
    IN p_nombre_original VARCHAR(100)
)
BEGIN
    INSERT INTO TBL_DOCUMENTO_TICKET (
        FK_ID_Ticket,
        FK_ID_Tipo_Doc,
        Archivo,
        Nombre_Original
    ) VALUES (
        p_id_ticket,
        p_id_tipo_doc,
        p_archivo,
        p_nombre_original
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_cuenta_completa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_cuenta_completa`(
    IN p_ID_Usuario INT,
    IN p_IP VARCHAR(50),
    IN p_User_Agent VARCHAR(255)
)
BEGIN
    -- Declaraci√≥n de variable para el prefijo de ofuscaci√≥n
    DECLARE v_Timestamp VARCHAR(20);
    
    -- Manejador de errores para hacer ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la eliminaci√≥n completa del usuario y sus estudiantes asociados';
    END;

    -- Generar una marca de tiempo √∫nica para esta transacci√≥n
    SET v_Timestamp = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');

    START TRANSACTION;
        
        -- OFUSCAR Y DESACTIVAR PERSONAS DE LOS ESTUDIANTES 
        UPDATE TBL_PERSONA 
        SET Num_Doc_Persona = CONCAT('DEL_', v_Timestamp, '_', Num_Doc_Persona),
            Estado_Persona = 0
        WHERE ID_Persona IN (
            SELECT FK_ID_Persona FROM TBL_ESTUDIANTE WHERE FK_ID_Acudiente = p_ID_Usuario
        );

        -- INACTIVAR REGISTROS EN TBL_ESTUDIANTE
        UPDATE TBL_ESTUDIANTE 
        SET Estado_Estudiante = 0
        WHERE FK_ID_Acudiente = p_ID_Usuario;

        -- Registro de auditor√≠a para los estudiantes
        CALL sp_insertar_auditoria(
            'TBL_ESTUDIANTE', 'DELETE_STUDENT', CAST(p_ID_Usuario AS CHAR),
            NULL, JSON_OBJECT('Accion', 'Baja masiva por retiro de acudiente'),
            p_IP, p_User_Agent, p_ID_Usuario
        );

        -- LOGICA DE OFUSCACI√ìN DE USUARIO Y DATOS ADICIONALES
        UPDATE TBL_USUARIO u
        JOIN TBL_DATOS_ADICIONALES d ON u.FK_ID_Persona = d.FK_ID_Persona
        SET u.Estado_Usuario = 0,
            u.Nombre_Usuario = CONCAT('del_', v_Timestamp, '_', u.Nombre_Usuario),
            d.Estado_Datos_Adicionales = 0,
            d.Email = CONCAT('del_', v_Timestamp, '_', d.Email),
            d.Telefono = CONCAT('del_', v_Timestamp, '_', d.Telefono)
        WHERE u.ID_Usuario = p_ID_Usuario;

        -- INACTIVAR Y OFUSCAR PERSONA DEL USUARIO
        UPDATE TBL_PERSONA p
        JOIN TBL_USUARIO u ON p.ID_Persona = u.FK_ID_Persona
        SET p.Estado_Persona = 0,
            p.Num_Doc_Persona = CONCAT('DEL_', v_Timestamp, '_', p.Num_Doc_Persona)
        WHERE u.ID_Usuario = p_ID_Usuario;

        -- Auditor√≠a final del cierre de cuenta
        CALL sp_insertar_auditoria(
            'SISTEMA', 'ACCOUNT_CLOSED', CAST(p_ID_Usuario AS CHAR),
            NULL, JSON_OBJECT('Status', 'Cuenta inactivada y datos UNIQUE liberados'),
            p_IP, p_User_Agent, p_ID_Usuario
        );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_history_contar_auditoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_history_contar_auditoria`(
    IN p_tipo_evento  VARCHAR(30),
    IN p_fecha_desde  DATE,
    IN p_fecha_hasta  DATE
)
BEGIN
    SELECT COUNT(*) AS total
    FROM vw_auditoria_comentarios
    WHERE Estado_Comentario_Ticket = 1
      AND (p_tipo_evento  IS NULL OR Tipo_Evento                = p_tipo_evento)
      AND (p_fecha_desde  IS NULL OR DATE(Fecha_Comentario)    >= p_fecha_desde)
      AND (p_fecha_hasta  IS NULL OR DATE(Fecha_Comentario)    <= p_fecha_hasta);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_history_exportar_auditoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_history_exportar_auditoria`(
    IN p_tipo_evento  VARCHAR(30),
    IN p_fecha_desde  DATE,
    IN p_fecha_hasta  DATE
)
BEGIN
    SELECT
        ID_Ticket_Comentario,
        Tipo_Evento,
        Comentario,
        Fecha_Comentario,
        Es_Interno,
        FK_ID_Ticket,
        Nombre_Rol,
        Nombre_Completo_Usuario
    FROM vw_auditoria_comentarios
    WHERE Estado_Comentario_Ticket = 1
      AND (p_tipo_evento IS NULL OR Tipo_Evento = p_tipo_evento)
      AND (p_fecha_desde IS NULL OR DATE(Fecha_Comentario) >= p_fecha_desde)
      AND (p_fecha_hasta IS NULL OR DATE(Fecha_Comentario) <= p_fecha_hasta)
    ORDER BY Fecha_Comentario DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_history_listar_auditoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_history_listar_auditoria`(
    IN p_tipo_evento  VARCHAR(30),
    IN p_fecha_desde  DATE,
    IN p_fecha_hasta  DATE,
    IN p_pagina       INT,
    IN p_por_pagina   INT
)
BEGIN
    DECLARE v_offset INT;
    SET v_offset = (p_pagina - 1) * p_por_pagina;

    SELECT
        ID_Ticket_Comentario,
        Tipo_Evento,
        Comentario,
        Fecha_Comentario,
        Es_Interno,
        FK_ID_Ticket,
        Nombre_Rol,
        Nombre_Completo_Usuario
    FROM vw_auditoria_comentarios
    WHERE Estado_Comentario_Ticket = 1
      AND (p_tipo_evento  IS NULL OR Tipo_Evento                = p_tipo_evento)
      AND (p_fecha_desde  IS NULL OR DATE(Fecha_Comentario)    >= p_fecha_desde)
      AND (p_fecha_hasta  IS NULL OR DATE(Fecha_Comentario)    <= p_fecha_hasta)
    ORDER BY Fecha_Comentario DESC
    LIMIT p_por_pagina OFFSET v_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_auditoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_auditoria`(
    IN p_tabla VARCHAR(100),
    IN p_evento VARCHAR(20),
    IN p_id_registro VARCHAR(50),
    IN p_datos_old JSON,
    IN p_datos_new JSON,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255),
    IN p_id_usuario INT
)
BEGIN
    INSERT INTO TBL_AUDITORIA (
        Tabla_Afectada,
        Tipo_Evento,
        ID_Registro_Afectado,
        Datos_Antiguo,
        Datos_Nuevos,
        IP_Usuario,
        User_Agent,
        FK_ID_Usuario
    )
    VALUES (
        p_tabla,
        p_evento,
        p_id_registro,
        p_datos_old,
        p_datos_new,
        p_ip,
        p_user_agent,
        p_id_usuario
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtener_datos_autenticacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_datos_autenticacion`(
    IN p_nombre_usuario VARCHAR(50)
)
BEGIN
    SELECT 
        ID_Usuario, 
        Contrase√±a_Hash, 
        Intentos_Fallidos
    FROM TBL_USUARIO
    WHERE Nombre_Usuario = p_nombre_usuario
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_perfil_acudiente_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_perfil_acudiente_consultar`(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        -- Identidad (Solo lectura para el usuario)
        p.ID_Persona, -- ID t√©cnico para el servicio Python
        p.Num_Doc_Persona AS Numero_Documento,
        p.Primer_Nombre,
        p.Segundo_Nombre,
        p.Primer_Apellido,
        p.Segundo_Apellido,
        ti.Nombre_Tipo_Iden,

        -- Contacto (Editable)
        da.ID_Datos_Adicionales,
        da.Email,
        da.Telefono,

        -- Ubicaci√≥n y Demograf√≠a (Editable)
        da.FK_ID_Barrio AS ID_Barrio,
        b.Nombre_Barrio,
        da.FK_ID_Estrato AS ID_Estrato,
        da.FK_ID_Genero AS ID_Genero,
        da.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,

        -- Metadatos
        par.Nombre_Parentesco,
        u.Fecha_Creacion
    FROM TBL_USUARIO u
    INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_DATOS_ADICIONALES da ON da.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_TIPO_IDENTIFICACION ti ON da.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
    INNER JOIN TBL_BARRIO b ON da.FK_ID_Barrio = b.ID_Barrio
    INNER JOIN TBL_PARENTESCO par ON da.FK_ID_Parentesco = par.ID_Parentesco
    WHERE u.ID_Usuario = p_id_usuario
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_perfil_estudiantes_por_acudiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_perfil_estudiantes_por_acudiente`(IN p_id_usuario INT)
BEGIN
    SELECT *
    FROM vw_estudiante_detalle
    WHERE FK_ID_Acudiente = p_id_usuario
      AND Estado_Estudiante = 1
    ORDER BY Primer_Apellido, Primer_Nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_perfil_estudiante_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_perfil_estudiante_consultar`(
    IN p_id_acudiente INT
)
BEGIN
    SELECT
        -- Llaves primarias t√©cnicas
        e.ID_Estudiante, 
        p.ID_Persona,

        -- Identificaci√≥n (Solo lectura)
        ti.Nombre_Tipo_Iden,
        p.Num_Doc_Persona AS Numero_Documento,

        -- Datos Personales (Editables)
        p.Primer_Nombre,
        p.Segundo_Nombre,
        p.Primer_Apellido,
        p.Segundo_Apellido,
        p.Fecha_Nacimiento,

        -- Demogr√°ficos
        e.FK_ID_Genero AS ID_Genero,
        e.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,

        -- Acad√©micos (Editables)
        e.FK_ID_Grado_Actual AS ID_Grado_Actual,
        e.FK_ID_Grado_Proximo AS ID_Grado_Proximo,
        e.FK_ID_Colegio_Anterior AS ID_Colegio_Anterior
        
    FROM TBL_ESTUDIANTE e
    INNER JOIN TBL_PERSONA p ON e.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_TIPO_IDENTIFICACION ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
    WHERE e.FK_ID_Acudiente = p_id_acudiente
      AND e.Estado_Estudiante = 1
    LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_perfil_estudiante_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_perfil_estudiante_por_id`(
    IN p_id_estudiante INT,
    IN p_id_usuario INT
)
BEGIN
    SELECT
        e.ID_Estudiante,
        p.ID_Persona,
        p.Primer_Nombre,
        p.Segundo_Nombre,
        p.Primer_Apellido,
        p.Segundo_Apellido,
        p.Fecha_Nacimiento,
        ti.Nombre_Tipo_Iden,
        p.Num_Doc_Persona AS Numero_Documento,
        e.FK_ID_Genero AS ID_Genero,
        e.FK_ID_Grupo_Preferencial AS ID_Grupo_Preferencial,
        e.FK_ID_Grado_Actual AS ID_Grado_Actual,
        e.FK_ID_Grado_Proximo AS ID_Grado_Proximo,
        e.FK_ID_Colegio_Anterior AS ID_Colegio_Anterior,
        e.FK_ID_Tipo_Iden AS ID_Tipo_Iden,
        ti.Nombre_Tipo_Iden,
        p.Num_Doc_Persona AS Numero_Documento

    FROM TBL_ESTUDIANTE e
    INNER JOIN TBL_PERSONA p ON e.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_TIPO_IDENTIFICACION ti ON e.FK_ID_Tipo_Iden = ti.ID_Tipo_Iden
    WHERE e.ID_Estudiante = p_id_estudiante
      AND e.FK_ID_Acudiente = p_id_usuario
      AND e.Estado_Estudiante = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_estudiante_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_estudiante_completo`(
    -- PERSONA
    IN p_Num_Doc_Persona VARCHAR(30),
    IN p_Primer_Nombre VARCHAR(50),
    IN p_Segundo_Nombre VARCHAR(50),
    IN p_Primer_Apellido VARCHAR(50),
    IN p_Segundo_Apellido VARCHAR(50),
    IN p_Fecha_Nacimiento DATE,

    -- ESTUDIANTE
    IN p_FK_ID_Tipo_Iden TINYINT,
    IN p_FK_ID_Grado_Actual TINYINT,
    IN p_FK_ID_Grado_Proximo TINYINT,
    IN p_FK_ID_Colegio_Anterior INT,
    IN p_FK_ID_Genero TINYINT,
    IN p_FK_ID_Grupo_Preferencial TINYINT,
    IN p_FK_ID_Acudiente INT,
    IN p_FK_ID_Parentesco_Es TINYINT,

    -- AUDITOR√çA
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    -- Variables para capturar los IDs generados autom√°ticamente
    DECLARE v_ID_Persona_New INT;
    DECLARE v_ID_Estudiante_New INT;

    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error en registro completo de estudiante';
    END;

    START TRANSACTION;

    -- INSERT PERSONA
    INSERT INTO TBL_PERSONA(
        Num_Doc_Persona,
        Primer_Nombre,
        Segundo_Nombre,
        Primer_Apellido,
        Segundo_Apellido,
        Fecha_Nacimiento,
        Estado_Persona
    )
    VALUES(
        p_Num_Doc_Persona,
        p_Primer_Nombre,
        p_Segundo_Nombre,
        p_Primer_Apellido,
        p_Segundo_Apellido,
        p_Fecha_Nacimiento,
        1
    );

    -- Capturar el ID generado para la persona
    SET v_ID_Persona_New = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'TBL_PERSONA',
        'CREATE',
        CAST(v_ID_Persona_New AS CHAR),
        NULL,
        JSON_OBJECT('Doc', p_Num_Doc_Persona, 'Nombre', p_Primer_Nombre),
        p_ip,
        p_user_agent,
        p_FK_ID_Acudiente
    );

    -- INSERT ESTUDIANTE
    INSERT INTO TBL_ESTUDIANTE (
        FK_ID_Tipo_Iden,
        FK_ID_Persona,
        FK_ID_Grado_Actual,
        FK_ID_Grado_Proximo,
        FK_ID_Colegio_Anterior,
        FK_ID_Genero,
        FK_ID_Grupo_Preferencial,
        FK_ID_Acudiente,
        FK_ID_Parentesco_Es,
        Estado_Estudiante
    )
    VALUES (
        p_FK_ID_Tipo_Iden,
        v_ID_Persona_New,
        p_FK_ID_Grado_Actual,
        p_FK_ID_Grado_Proximo,
        p_FK_ID_Colegio_Anterior,
        p_FK_ID_Genero,
        p_FK_ID_Grupo_Preferencial,
        p_FK_ID_Acudiente,
        p_FK_ID_Parentesco_Es,
        1
    );

    -- Capturar el ID generado para el estudiante
    SET v_ID_Estudiante_New = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'TBL_ESTUDIANTE',
        'CREATE',
        CAST(v_ID_Estudiante_New AS CHAR),
        NULL,
        JSON_OBJECT('ID_Persona', v_ID_Persona_New, 'Grado', p_FK_ID_Grado_Actual),
        p_ip,
        p_user_agent,
        p_FK_ID_Acudiente
    );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_exito_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_exito_login`(IN p_id_usuario INT)
BEGIN
    UPDATE TBL_USUARIO
    SET Ultimo_Login = NOW(), Intentos_Fallidos = 0
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_usuario_completo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_usuario_completo`(
    -- PERSONA
    IN p_Num_Doc_Persona VARCHAR(30),
    IN p_Primer_Nombre VARCHAR(50),
    IN p_Segundo_Nombre VARCHAR(50),
    IN p_Primer_Apellido VARCHAR(50),
    IN p_Segundo_Apellido VARCHAR(50),
    IN p_Fecha_Nacimiento DATE,

    -- DATOS ADICIONALES
    IN p_Email VARCHAR(255),
    IN p_Telefono VARCHAR(45),
    IN p_FK_ID_Parentesco TINYINT,
    IN p_FK_ID_Tipo_Iden TINYINT,
    IN p_FK_ID_Genero TINYINT,
    IN p_FK_ID_Grupo_Preferencial TINYINT,
    IN p_FK_ID_Estrato TINYINT,
    IN p_FK_ID_Barrio INT,

    -- USUARIO
    IN p_Nombre_Usuario VARCHAR(50),
    IN p_password_hash VARCHAR(255),
    IN p_FK_ID_Rol TINYINT,

    -- AUDITOR√çA
    IN p_IP VARCHAR(50),
    IN p_User_Agent VARCHAR(255)
)
BEGIN
    DECLARE v_ID_Persona INT;
    DECLARE v_ID_Datos_Adicionales INT;
    DECLARE v_ID_Usuario INT;

    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- INSERT PERSONA
    INSERT INTO TBL_PERSONA (
        Num_Doc_Persona, Primer_Nombre, Segundo_Nombre, 
        Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento, Estado_Persona
    ) VALUES (
        p_Num_Doc_Persona, p_Primer_Nombre, p_Segundo_Nombre,
        p_Primer_Apellido, p_Segundo_Apellido, p_Fecha_Nacimiento, 1
    );

    SET v_ID_Persona = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'TBL_PERSONA', 'CREATE', CAST(v_ID_Persona AS CHAR),
        NULL, JSON_OBJECT('Doc', p_Num_Doc_Persona, 'Nombre', p_Primer_Nombre), 
        p_IP, p_User_Agent, 1
    );

    -- DATOS ADICIONALES
    INSERT INTO TBL_DATOS_ADICIONALES (
        Email, Telefono, FK_ID_Parentesco, FK_ID_Tipo_Iden, 
        FK_ID_Persona, FK_ID_Genero, FK_ID_Grupo_Preferencial, 
        FK_ID_Estrato, FK_ID_Barrio, Estado_Datos_Adicionales
    ) VALUES (
        p_Email, p_Telefono, p_FK_ID_Parentesco, p_FK_ID_Tipo_Iden,
        v_ID_Persona, p_FK_ID_Genero, p_FK_ID_Grupo_Preferencial,
        p_FK_ID_Estrato, p_FK_ID_Barrio, 1
    );

    SET v_ID_Datos_Adicionales = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'TBL_DATOS_ADICIONALES', 'CREATE', CAST(v_ID_Datos_Adicionales AS CHAR),
        NULL, JSON_OBJECT('Email', p_Email, 'Tel', p_Telefono), 
        p_IP, p_User_Agent, 1
    );

    -- USUARIO
    INSERT INTO TBL_USUARIO (
        Nombre_Usuario, Contrase√±a_Hash, 
        Ultimo_Cambio_Contrase√±a, Ultimo_Login, Intentos_Fallidos,
        Fecha_Creacion, Doble_Factor_Activo, MFA_Fecha_Configuracion,
        MFA_Secret, MFA_Secret_Temp, Notificaciones_Email,
        Notificaciones_Navegador, Aceptacion_Terminos, FK_ID_Persona,
        FK_ID_Rol, Estado_Usuario
    ) VALUES (
        p_Nombre_Usuario, p_password_hash,
        NULL, NULL, 0,
        CURRENT_TIMESTAMP, 'INACTIVE', NULL,
        NULL, NULL, 0,
        0, 'ACCEPTED', v_ID_Persona,
        p_FK_ID_Rol, 1
    );

    SET v_ID_Usuario = LAST_INSERT_ID();

    CALL sp_insertar_auditoria(
        'TBL_USUARIO', 'CREATE_ACCOUNT', CAST(v_ID_Usuario AS CHAR),
        NULL, JSON_OBJECT('Username', p_Nombre_Usuario), 
        p_IP, p_User_Agent, 1
    );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_barrio_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_barrio_consultar`()
BEGIN
    SELECT
    ID_Barrio,
    Nombre_Barrio
    FROM TBL_BARRIO
    WHERE Estado_Barrio = 1
    ORDER BY Nombre_Barrio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_colegio_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_colegio_consultar`()
BEGIN
    SELECT
        ID_Colegio,
        Nombre_Colegio
    FROM TBL_COLEGIO
    WHERE Estado_Colegio = 1
    ORDER BY Nombre_Colegio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_dashboard_resumen_acudiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_dashboard_resumen_acudiente`(
    IN p_id_usuario INT
)
BEGIN
    -- Datos del acudiente y su estudiante
    SELECT
        -- Acudiente
        CONCAT(pa.Primer_Nombre, ' ', COALESCE(pa.Segundo_Nombre, ''), ' ', pa.Primer_Apellido) AS Nombre_Acudiente,

        -- Estudiante
        CONCAT(pe.Primer_Nombre, ' ', pe.Primer_Apellido) AS Nombre_Estudiante,
        g_act.Nombre_Grado AS Grado_Actual,
        COALESCE(g_prox.Nombre_Grado, 'No definido') AS Grado_Proximo,

        -- Ticket m√°s reciente
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Fecha_Creacion AS Fecha_Ticket,
        t.Puntaje_Prioridad,
        et.Nombre_Estado,
        et.Estado_Final,
        ta.Nombre_Afectacion,

        -- Colegio asignado (si existe)
        COALESCE(c.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,

        -- Conteo total de tickets del usuario
        (
            SELECT COUNT(*)
            FROM TBL_TICKET t2
            WHERE t2.FK_ID_Usuario_Creador = p_id_usuario
              AND t2.Estado_Ticket = 1
        ) AS Total_Tickets,

        -- Conteo de documentos pendientes (tickets abiertos sin documentos)
        (
            SELECT COUNT(*)
            FROM TBL_TICKET t3
            WHERE t3.FK_ID_Usuario_Creador = p_id_usuario
              AND t3.Estado_Ticket = 1
              AND t3.FK_ID_Estado_Ticket NOT IN (
                  SELECT ID_Estado_Ticket FROM TBL_ESTADO_TICKET WHERE Estado_Final = 1
              )
              AND NOT EXISTS (
                  SELECT 1 FROM TBL_DOCUMENTO_TICKET dt
                  WHERE dt.FK_ID_Ticket = t3.ID_Ticket
                    AND dt.Estado_Documentos = 1
              )
        ) AS Tickets_Sin_Documentos

    FROM TBL_USUARIO u
    INNER JOIN TBL_PERSONA pa ON u.FK_ID_Persona = pa.ID_Persona
    -- Estudiante vinculado al acudiente
    INNER JOIN TBL_ESTUDIANTE est ON est.FK_ID_Acudiente = u.ID_Usuario
    INNER JOIN TBL_PERSONA pe ON est.FK_ID_Persona = pe.ID_Persona
    INNER JOIN TBL_GRADO g_act ON est.FK_ID_Grado_Actual = g_act.ID_Grado
    LEFT  JOIN TBL_GRADO g_prox ON est.FK_ID_Grado_Proximo = g_prox.ID_Grado
    -- Ticket m√°s reciente
    LEFT JOIN TBL_TICKET t ON t.FK_ID_Usuario_Creador = u.ID_Usuario 
        AND t.Estado_Ticket = 1
        AND t.Fecha_Creacion = (
            SELECT MAX(t_inner.Fecha_Creacion)
            FROM TBL_TICKET t_inner
            WHERE t_inner.FK_ID_Usuario_Creador = u.ID_Usuario
              AND t_inner.Estado_Ticket = 1
        )

    LEFT JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    LEFT JOIN TBL_TIPO_AFECTACION ta ON t.FK_ID_Tipo_Afectacion = ta.ID_Tipo_Afectacion
    LEFT JOIN TBL_CUPOS cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN TBL_COLEGIO c ON cu.FK_ID_Colegio = c.ID_Colegio

    WHERE u.ID_Usuario  = p_id_usuario
      AND u.Estado_Usuario = 1
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_datos_adicionales_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_datos_adicionales_actualizar`(
    IN p_id_datos INT,
    IN p_telefono VARCHAR(45),
    IN p_id_persona INT,
    IN p_genero TINYINT,
    IN p_grupo_pref TINYINT,
    IN p_estrato TINYINT,
    IN p_barrio TINYINT,
    IN p_id_usuario INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_old JSON;
    
    START TRANSACTION;

    -- Captura estado anterior para auditor√≠a
    SELECT JSON_OBJECT(
        'Telefono', Telefono,
        'Genero', FK_ID_Genero,
        'Grupo', FK_ID_Grupo_Preferencial,
        'Estrato', FK_ID_Estrato,
        'Barrio', FK_ID_Barrio
    ) INTO v_old
    FROM TBL_DATOS_ADICIONALES
    WHERE ID_Datos_Adicionales = p_id_datos;

    UPDATE TBL_DATOS_ADICIONALES
    SET
        Telefono = p_telefono,
        FK_ID_Genero = p_genero,
        FK_ID_Grupo_Preferencial = p_grupo_pref,
        FK_ID_Estrato = p_estrato,
        FK_ID_Barrio = p_barrio
    WHERE ID_Datos_Adicionales = p_id_datos
      AND FK_ID_Persona = p_id_persona;

    CALL sp_insertar_auditoria(
        'TBL_DATOS_ADICIONALES', 'UPDATE', CAST(p_id_datos AS CHAR),
        v_old, 
        JSON_OBJECT('Telefono', p_telefono, 'Genero', p_genero, 'Barrio', p_barrio),
        p_ip, p_user_agent, p_id_usuario
    );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_documento_ticket_descargar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_documento_ticket_descargar`(
    IN p_id_doc INT,
    IN p_id_usuario INT
)
BEGIN
    SELECT
        dt.Archivo,
        dt.Nombre_Original,
        tdoc.Nombre_Tipo_Doc
    FROM TBL_DOCUMENTO_TICKET dt
    INNER JOIN TBL_TIPO_DOCUMENTO tdoc ON dt.FK_ID_Tipo_Doc = tdoc.ID_Tipo_Doc
    INNER JOIN TBL_TICKET t ON dt.FK_ID_Ticket = t.ID_Ticket
    WHERE dt.ID_Doc_Ticket = p_id_doc AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND dt.Estado_Documentos = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_documento_ticket_insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_documento_ticket_insertar`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_tipo_doc TINYINT,
    IN p_archivo MEDIUMBLOB,
    IN p_nombre_original VARCHAR(100)
)
BEGIN
    INSERT INTO TBL_DOCUMENTO_TICKET (
        FK_ID_Ticket,
        FK_ID_Tipo_Doc,
        Archivo,
        Nombre_Original
    ) VALUES (
        p_id_ticket,
        p_id_tipo_doc,
        p_archivo,
        p_nombre_original
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_estrato_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_estrato_consultar`()
BEGIN
    SELECT 
        ID_Estrato, 
        Nombre_Estrato
    FROM tbl_estrato
    WHERE Estado_Estrato = 1
    ORDER BY ID_Estrato;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_estudiante_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_estudiante_actualizar`(
    IN p_grado_actual TINYINT,
    IN p_grado_proximo TINYINT,
    IN p_colegio INT,
    IN p_genero TINYINT,
    IN p_grupo_pref TINYINT,
    IN p_id_persona INT,

    -- AUDITOR√çA
    IN p_id_usuario INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_old JSON;
    DECLARE v_new JSON;
    DECLARE v_id_estudiante INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error actualizando estudiante';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    SELECT ID_Estudiante
    INTO v_id_estudiante
    FROM TBL_ESTUDIANTE
    WHERE FK_ID_Persona = p_id_persona
    LIMIT 1;

    IF v_id_estudiante IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estudiante no existe';
    END IF;

    -- OLD DATA
    SELECT JSON_OBJECT(
        'Grado_Actual', FK_ID_Grado_Actual,
        'Grado_Proximo', FK_ID_Grado_Proximo,
        'Colegio', FK_ID_Colegio_Anterior,
        'Genero', FK_ID_Genero,
        'Grupo_Preferencial', FK_ID_Grupo_Preferencial
    )
    
    INTO v_old
    FROM TBL_ESTUDIANTE
    WHERE ID_Estudiante = v_id_estudiante;

    -- UPDATE
    UPDATE TBL_ESTUDIANTE
    SET
        FK_ID_Grado_Actual = p_grado_actual,
        FK_ID_Grado_Proximo = p_grado_proximo,
        FK_ID_Colegio_Anterior = p_colegio,
        FK_ID_Genero = p_genero,
        FK_ID_Grupo_Preferencial = p_grupo_pref
    WHERE ID_Estudiante = v_id_estudiante;

    -- NEW DATA
    SET v_new = JSON_OBJECT(
        'Grado_Actual', p_grado_actual,
        'Grado_Proximo', p_grado_proximo,
        'Colegio', p_colegio,
        'Genero', p_genero,
        'Grupo_Preferencial', p_grupo_pref
    );

    -- AUDITOR√çA
    CALL sp_insertar_auditoria(
        'TBL_ESTUDIANTE',
        'UPDATE',
        v_id_estudiante,
        v_old,
        v_new,
        p_ip,
        p_user_agent,
        p_id_usuario
    );

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_estudiante_verificar_existente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_estudiante_verificar_existente`(
    IN p_num_doc VARCHAR(30),
    IN p_fk_id_acudiente INT
)
BEGIN

    SELECT COUNT(*) AS existe 
    FROM TBL_ESTUDIANTE e
    INNER JOIN TBL_PERSONA p ON e.FK_ID_Persona = p.ID_Persona
    WHERE p.Num_Doc_Persona = p_num_doc 
      AND e.FK_ID_Acudiente = p_fk_id_acudiente 
      AND e.Estado_Estudiante = 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_estudiante_verificar_por_acudiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_estudiante_verificar_por_acudiente`(IN p_id_acudiente INT)
BEGIN
    SELECT COUNT(*) AS total_estudiantes
    FROM TBL_ESTUDIANTE
    WHERE FK_ID_Acudiente   = p_id_acudiente
      AND Estado_Estudiante = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_genero_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_genero_consultar`()
BEGIN
    SELECT
        ID_Genero,
        Nombre_Genero
    FROM TBL_GENERO
    WHERE Estado_Genero = 1
    ORDER BY Nombre_Genero;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_grado_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_grado_consultar`()
BEGIN
    SELECT
        ID_Grado,
        Nombre_Grado
    FROM TBL_GRADO
    WHERE Estado_Grado = 1
    ORDER BY ID_Grado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_grupo_preferencial_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_grupo_preferencial_consultar`()
BEGIN
    SELECT
        ID_Grupo_Preferencial,
        Nombre_Grupo_Preferencial
    FROM TBL_GRUPO_PREFERENCIAL
    WHERE Estado_Grupo_Preferencial = 1
    ORDER BY ID_Grupo_Preferencial;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_jornada_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_jornada_consultar`()
BEGIN
    SELECT ID_Jornada, Nombre_Jornada
    FROM TBL_JORNADA
    WHERE Estado_Jornada = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_localidad_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_localidad_consultar`()
BEGIN
    SELECT
        ID_Localidad,
        Nombre_Localidad
    FROM TBL_LOCALIDAD
    WHERE Estado_Localidad = 1
    ORDER BY Nombre_Localidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_parentesco_consultar_acu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_parentesco_consultar_acu`()
BEGIN
    SELECT 
        ID_Parentesco,
        Nombre_Parentesco
    FROM TBL_PARENTESCO
    WHERE Estado_Parentesco = 1 AND Tipo_Usuario = 'ACUDIENTE'
    ORDER BY ID_Parentesco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_parentesco_consultar_est` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_parentesco_consultar_est`()
BEGIN
    SELECT 
        ID_Parentesco,
        Nombre_Parentesco
    FROM TBL_PARENTESCO
    WHERE Estado_Parentesco = 1 AND Tipo_Usuario = 'ESTUDIANTE'
    ORDER BY ID_Parentesco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_persona_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_persona_actualizar`(
    IN p_id_persona INT,
    IN p_primer_nombre VARCHAR(50),
    IN p_segundo_nombre VARCHAR(50),
    IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50),
    IN p_fecha_nac DATE,

    -- AUDITOR√çA
    IN p_id_usuario INT,
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_old JSON;
    DECLARE v_new JSON;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error actualizando persona';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM TBL_PERSONA WHERE ID_Persona = p_id_persona
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Persona no existe';
    END IF;

    -- OLD DATA
    SELECT JSON_OBJECT(
        'Primer_Nombre', Primer_Nombre,
        'Segundo_Nombre', Segundo_Nombre,
        'Primer_Apellido', Primer_Apellido,
        'Segundo_Apellido', Segundo_Apellido,
        'Fecha_Nacimiento', Fecha_Nacimiento
    )
    INTO v_old
    FROM TBL_PERSONA
    WHERE ID_Persona = p_id_persona;

    -- UPDATE
    UPDATE TBL_PERSONA
    SET
        Primer_Nombre = p_primer_nombre,
        Segundo_Nombre = p_segundo_nombre,
        Primer_Apellido = p_primer_apellido,
        Segundo_Apellido = p_segundo_apellido,
        Fecha_Nacimiento = p_fecha_nac
    WHERE ID_Persona = p_id_persona;

    -- NEW DATA
    SET v_new = JSON_OBJECT(
        'Primer_Nombre', p_primer_nombre,
        'Segundo_Nombre', p_segundo_nombre,
        'Primer_Apellido', p_primer_apellido,
        'Segundo_Apellido', p_segundo_apellido,
        'Fecha_Nacimiento', p_fecha_nac
    );

    -- AUDITOR√çA
    CALL sp_insertar_auditoria(
        'TBL_PERSONA',
        'UPDATE',
        p_id_persona,
        v_old,
        v_new,
        p_ip,
        p_user_agent,
        p_id_usuario
    );

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_rol_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_rol_consultar`()
BEGIN
    SELECT ID_Rol, Nombre_Rol
    FROM TBL_ROL
    WHERE ID_Rol <> 1 AND Estado_Rol = 1 
    ORDER BY Nombre_Rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_rol_consultar_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_rol_consultar_nombre`(
    IN p_Nombre_Rol VARCHAR(50)
)
BEGIN
    SELECT ID_Rol 
    FROM tbl_rol 
    WHERE Nombre_Rol = p_Nombre_Rol 
    AND Estado_Rol = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_sesion_activa_cerrar_sesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_sesion_activa_cerrar_sesion`(
    IN p_jti VARCHAR(64)
)
BEGIN
    UPDATE TBL_SESION_ACTIVA
    SET Activa = 0
    WHERE JTI = p_jti;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_sesion_activa_cerrar_todas_sesiones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_sesion_activa_cerrar_todas_sesiones`(
    IN p_id_usuario INT,
    IN p_jti_actual VARCHAR(64)   -- excluir la sesi√≥n actual
)
BEGIN
    UPDATE TBL_SESION_ACTIVA
    SET Activa = 0
    WHERE FK_ID_Usuario = p_id_usuario
      AND JTI <> p_jti_actual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_sesion_activa_listar_sesiones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_sesion_activa_listar_sesiones`(
    IN p_id_usuario INT
)
BEGIN
    SELECT ID_Sesion, JTI, Dispositivo, IP, Fecha_Inicio, Ultimo_Acceso
    FROM TBL_SESION_ACTIVA
    WHERE FK_ID_Usuario = p_id_usuario
      AND Activa = 1
    ORDER BY Ultimo_Acceso DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_sesion_activa_registrar_sesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_sesion_activa_registrar_sesion`(
    IN p_id_usuario INT,
    IN p_jti VARCHAR(64),
    IN p_dispositivo VARCHAR(255),
    IN p_ip VARCHAR(50)
)
BEGIN
    INSERT INTO TBL_SESION_ACTIVA (FK_ID_Usuario, JTI, Dispositivo, IP)
    VALUES (p_id_usuario, p_jti, p_dispositivo, p_ip)
    ON DUPLICATE KEY UPDATE Ultimo_Acceso = CURRENT_TIMESTAMP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_sesion_activa_verificar_jti` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_sesion_activa_verificar_jti`(
    IN p_jti VARCHAR(64)
)
BEGIN
    SELECT COUNT(*) AS activo
    FROM TBL_SESION_ACTIVA
    WHERE JTI = p_jti AND Activa = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_ticket_cerrado_consultar_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_ticket_cerrado_consultar_por_usuario`(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Fecha_Creacion,
        t.Fecha_Cierre,
        t.Nombre_Estado,

        CONCAT(e.Primer_Nombre, ' ', e.Primer_Apellido) AS Nombre_Estudiante,
        e.Nombre_Grado_Actual

    FROM vw_ticket_base t
    INNER JOIN vw_estudiante_detalle e ON t.FK_ID_Estudiante = e.ID_Estudiante

    WHERE t.FK_ID_Usuario_Creador = p_id_usuario
      AND t.Estado_Final = 1
    ORDER BY t.Fecha_Creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_ticket_comentarios_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_ticket_comentarios_consultar`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT *
    FROM vw_ticket_comentarios vc
    INNER JOIN TBL_TICKET t ON vc.FK_ID_Ticket = t.ID_Ticket

    WHERE vc.FK_ID_Ticket = p_id_ticket
      AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND vc.Es_Interno = 0
      AND vc.Estado_Comentario_Ticket = 1
    ORDER BY vc.Fecha_Comentario ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_ticket_consultar_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_ticket_consultar_detalle`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Descripcion_Ticket,
        t.Fecha_Creacion,
        t.Fecha_Cierre,
        t.Puntaje_Prioridad,

        t.Nombre_Estado,
        t.Estado_Final,

        t.Nombre_Afectacion,
        t.Nivel_Prioridad_TC,

        CONCAT(e.Primer_Nombre, ' ', e.Primer_Apellido) AS Nombre_Estudiante,
        e.Nombre_Grado_Actual,
        e.Nombre_Grado_Proximo,

        j.Nombre_Jornada AS Jornada_Preferencia,
        COALESCE(cp.Nombre_Colegio, 'Sin preferencia') AS Colegio_Preferencia,
        COALESCE(c_asig.Nombre_Colegio, 'Sin asignar') AS Colegio_Asignado,

        CONCAT(pt.Primer_Nombre, ' ', pt.Primer_Apellido) AS Nombre_Tecnico,

        b.Nombre_Barrio,
        tr.Nombre_Tiempo

    FROM vw_ticket_detalle t
    INNER JOIN vw_estudiante_detalle e ON t.FK_ID_Estudiante = e.ID_Estudiante
    INNER JOIN TBL_JORNADA j ON t.FK_ID_Jornada_Preferencia = j.ID_Jornada
    INNER JOIN TBL_BARRIO b ON t.FK_ID_Barrio = b.ID_Barrio
    LEFT JOIN TBL_TIEMPO_RESIDENCIA tr ON t.FK_ID_Tiempo_Residencia = tr.ID_Tiempo_Residencia
    LEFT JOIN TBL_COLEGIO cp ON t.FK_ID_Colegio_Preferencia = cp.ID_Colegio
    LEFT JOIN TBL_CUPOS cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN TBL_COLEGIO c_asig ON cu.FK_ID_Colegio = c_asig.ID_Colegio
    LEFT JOIN TBL_USUARIO ut ON t.FK_ID_Usuario_Tecnico = ut.ID_Usuario
    LEFT JOIN TBL_PERSONA pt ON ut.FK_ID_Persona = pt.ID_Persona

    WHERE t.ID_Ticket = p_id_ticket
    AND t.FK_ID_Usuario_Creador = p_id_usuario
    AND t.Estado_Ticket = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_ticket_consultar_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_ticket_consultar_por_usuario`(
    IN p_id_usuario INT
)
BEGIN
    SELECT
        t.ID_Ticket,
        t.Titulo_Ticket,
        t.Fecha_Creacion,
        t.Fecha_Cierre,
        et.Nombre_Estado,
        g.Nombre_Grado,
        CONCAT(p.Primer_Nombre, ' ', COALESCE(p.Segundo_Nombre, ''), ' ', p.Primer_Apellido, ' ', COALESCE(p.Segundo_Apellido, '')) AS Nombre_Estudiante,
        COALESCE(c.Nombre_Colegio, 'Sin asignar') AS Nombre_Colegio
    FROM TBL_TICKET t
    INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    INNER JOIN TBL_ESTUDIANTE est ON t.FK_ID_Estudiante = est.ID_Estudiante
    INNER JOIN TBL_PERSONA p ON est.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_GRADO g ON est.FK_ID_Grado_Actual = g.ID_Grado
    LEFT JOIN TBL_CUPOS cu ON t.FK_ID_Cupo_Asignado = cu.ID_Cupos
    LEFT JOIN TBL_COLEGIO c ON cu.FK_ID_Colegio = c.ID_Colegio

    WHERE t.FK_ID_Usuario_Creador = p_id_usuario 
        AND t.Estado_Ticket = 1
        AND et.Estado_Final = 0
    ORDER BY t.Fecha_Creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_ticket_documentos_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_ticket_documentos_consultar`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT
)
BEGIN
    SELECT
        dt.ID_Doc_Ticket,
        dt.Nombre_Original,
        dt.Fecha_Subida,
        tdoc.Nombre_Tipo_Doc
    FROM TBL_DOCUMENTO_TICKET dt
    INNER JOIN TBL_TIPO_DOCUMENTO tdoc ON dt.FK_ID_Tipo_Doc = tdoc.ID_Tipo_Doc
    INNER JOIN TBL_TICKET t ON dt.FK_ID_Ticket = t.ID_Ticket
    WHERE dt.FK_ID_Ticket = p_id_ticket AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND dt.Estado_Documentos = 1
    ORDER BY dt.Fecha_Subida DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_tiempo_residencia_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_tiempo_residencia_consultar`()
BEGIN
    SELECT ID_Tiempo_Residencia, Nombre_Tiempo
    FROM TBL_TIEMPO_RESIDENCIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_tipo_afectacion_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_tipo_afectacion_consultar`()
BEGIN
    SELECT ID_Tipo_Afectacion, Nombre_Afectacion, Nivel_Prioridad_TC
    FROM TBL_TIPO_AFECTACION
    WHERE Estado_Afectacion = 1
    ORDER BY Nivel_Prioridad_TC DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_tipo_documento_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_tipo_documento_consultar`()
BEGIN
    SELECT ID_Tipo_Doc, Nombre_Tipo_Doc
    FROM TBL_TIPO_DOCUMENTO
    WHERE Estado_Documentos = 1
    ORDER BY Nombre_Tipo_Doc ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_tipo_identificacion_consultar_acu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_tipo_identificacion_consultar_acu`()
BEGIN
    SELECT 
        ID_Tipo_Iden,
        Nombre_Tipo_Iden
    FROM TBL_TIPO_IDENTIFICACION
    WHERE Estado_Identificacion = 1 AND Tipo_Usuario = 'ACUDIENTE'
    ORDER BY Nombre_Tipo_Iden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_tipo_identificacion_consultar_est` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_tipo_identificacion_consultar_est`()
BEGIN
    SELECT 
        ID_Tipo_Iden,
        Nombre_Tipo_Iden
    FROM TBL_TIPO_IDENTIFICACION
    WHERE Estado_Identificacion = 1 AND Tipo_Usuario = 'ESTUDIANTE'
    ORDER BY Nombre_Tipo_Iden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_usuario_activar_mfa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_usuario_activar_mfa`(
    IN p_id_usuario INT
)
BEGIN
    UPDATE TBL_USUARIO
    SET MFA_Fecha_Configuracion = CURRENT_TIMESTAMP,
        MFA_Secret = MFA_Secret_Temp,
        MFA_Secret_Temp = NULL,
        Doble_Factor_Activo = 'ACTIVE'
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_usuario_cambiar_contrase√±a_perfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_usuario_cambiar_contrase√±a_perfil`(
    IN p_id_usuario INT,
    IN p_nuevo_hash VARCHAR(255),
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    
    START TRANSACTION;

        -- Actualizaci√≥n de credenciales
        UPDATE TBL_USUARIO
        SET Contrase√±a_Hash = p_nuevo_hash,
            Ultimo_Cambio_Contrase√±a = CURRENT_TIMESTAMP
        WHERE ID_Usuario = p_id_usuario;

        -- Registro de auditor√≠a
        CALL sp_insertar_auditoria(
            'TBL_USUARIO', 
            'PASSWORD_CHANGE', 
            CAST(p_id_usuario AS CHAR),
            JSON_OBJECT('evento', 'cambio_password_perfil'),
            JSON_OBJECT('resultado', 'exitoso'),
            p_ip, 
            p_user_agent, 
            p_id_usuario
        );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_usuario_desactivar_mfa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_usuario_desactivar_mfa`(
    IN p_id_usuario INT
)
BEGIN
    UPDATE TBL_USUARIO
    SET MFA_Fecha_Configuracion = CURRENT_TIMESTAMP,
        MFA_Secret = NULL,
        MFA_Secret_Temp = NULL,
        Doble_Factor_Activo = 'INACTIVE'
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_usuario_guardar_mfa_secret_temp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_usuario_guardar_mfa_secret_temp`(
    IN p_id_usuario INT,
    IN p_secret VARCHAR(64)
)
BEGIN
    UPDATE TBL_USUARIO
    SET MFA_Secret_Temp = p_secret
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tbl_usuario_obtener_mfa_secret` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tbl_usuario_obtener_mfa_secret`(
    IN p_id_usuario INT
)
BEGIN
    SELECT MFA_Secret, MFA_Secret_Temp, Doble_Factor_Activo
    FROM TBL_USUARIO
    WHERE ID_Usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_crear`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_usuario INT,
    IN p_id_estudiante INT,
    IN p_id_tipo_afectacion TINYINT,
    IN p_descripcion TEXT,
    IN p_id_barrio INT,
    IN p_id_tiempo_residencia TINYINT,
    IN p_id_jornada TINYINT,
    IN p_id_colegio INT,
    IN p_ip VARCHAR(45),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_titulo VARCHAR(150);
    DECLARE v_puntaje INT DEFAULT 0;
    DECLARE v_nombre_est VARCHAR(120);
    DECLARE v_grado VARCHAR(60);
    DECLARE v_nivel_afectacion TINYINT DEFAULT 0;
    DECLARE v_nivel_gp TINYINT DEFAULT 0;
    DECLARE v_id_estado_inicial TINYINT;
    DECLARE v_msg_comentario TEXT;

    -- Manejo de errores: rollback autom√°tico
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Nombre del estudiante y grado para el t√≠tulo
    SELECT CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido),
           gr.Nombre_Grado
    INTO   v_nombre_est, v_grado
    FROM   TBL_ESTUDIANTE e
    INNER JOIN TBL_PERSONA p ON e.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_GRADO gr ON e.FK_ID_Grado_Proximo = gr.ID_Grado
    WHERE  e.ID_Estudiante = p_id_estudiante;

    SET v_titulo = CONCAT('Solicitud de Cupo ‚Äî ', v_nombre_est, ' ‚Äî ', v_grado);

    -- Puntaje de prioridad
    SELECT Nivel_Prioridad_TC INTO v_nivel_afectacion
    FROM TBL_TIPO_AFECTACION
    WHERE ID_Tipo_Afectacion = p_id_tipo_afectacion;

    SELECT gp.Nivel_Prioridad_GP INTO v_nivel_gp
    FROM TBL_ESTUDIANTE e
    INNER JOIN TBL_GRUPO_PREFERENCIAL gp 
        ON e.FK_ID_Grupo_Preferencial = gp.ID_Grupo_Preferencial
    WHERE e.ID_Estudiante = p_id_estudiante;

    SET v_puntaje = COALESCE(v_nivel_afectacion, 0) + COALESCE(v_nivel_gp, 0);

    -- Estado inicial
    SELECT ID_Estado_Ticket INTO v_id_estado_inicial
    FROM TBL_ESTADO_TICKET
    WHERE Estado_Final = 0 AND Estado_Estado_Ticket = 1
    ORDER BY ID_Estado_Ticket ASC
    LIMIT 1;

    -- Insertar ticket
    INSERT INTO TBL_TICKET (
        ID_Ticket, Titulo_Ticket, Descripcion_Ticket, Puntaje_Prioridad,
        FK_ID_Usuario_Creador, FK_ID_Estudiante, FK_ID_Tipo_Afectacion,
        FK_ID_Colegio_Preferencia, FK_ID_Jornada_Preferencia,
        FK_ID_Estado_Ticket, FK_ID_Barrio, FK_ID_Tiempo_Residencia
    ) VALUES (
        p_id_ticket, v_titulo, p_descripcion, v_puntaje,
        p_id_usuario, p_id_estudiante, p_id_tipo_afectacion,
        p_id_colegio, p_id_jornada,
        v_id_estado_inicial, p_id_barrio, p_id_tiempo_residencia
    );

    -- Crear mensaje del comentario autom√°tico
    SET v_msg_comentario = CONCAT(
        '[Nueva Solicitud] Ticket creado: ',
        v_titulo
    );

    -- Insertar comentario autom√°tico
    INSERT INTO TBL_TICKET_COMENTARIO (
        Tipo_Evento,
        Comentario,
        Es_Interno,
        FK_ID_Usuario,
        FK_ID_Ticket
    ) VALUES (
        'Nueva Solicitud',
        v_msg_comentario,
        1, -- interno
        p_id_usuario,
        p_id_ticket
    );

    COMMIT;

    -- Retorno
    SELECT 
        p_id_ticket AS id_ticket, 
        v_titulo AS titulo, 
        v_puntaje AS puntaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_obtener_ultimo_numero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_obtener_ultimo_numero`()
BEGIN
    SELECT COALESCE(
        MAX(CAST(SUBSTRING(ID_Ticket, 5) AS UNSIGNED)), 
        0
    ) AS ultimo_numero
    FROM TBL_TICKET;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_acudiente_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_acudiente_consultar`(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT *
    FROM vw_ticket_acudiente_detalle
    WHERE ID_Ticket = p_id_ticket
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_asignar_cupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_asignar_cupo`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_cupo INT,
    IN p_id_tecnico INT
)
BEGIN
    DECLARE v_nombre_colegio VARCHAR(100);
    DECLARE v_tipo_evento VARCHAR(20);
    DECLARE v_msg_auditoria TEXT;

    -- Obtener el nombre del colegio para la auditor√≠a
    SELECT col.Nombre_Colegio INTO v_nombre_colegio
    FROM TBL_CUPOS c
    INNER JOIN TBL_COLEGIO col ON c.FK_ID_Colegio = col.ID_Colegio
    WHERE c.ID_Cupos = p_id_cupo
    LIMIT 1;

    -- Asignar el cupo al ticket
    UPDATE TBL_TICKET
    SET FK_ID_Cupo_Asignado = p_id_cupo
    WHERE ID_Ticket = p_id_ticket;

    -- Definir el tipo de evento para auditoria
    SET v_tipo_evento = 'Cupo Asignado';

    -- Registrar auditor√≠a
    SET v_msg_auditoria = CONCAT(
        '[Cupo Asignado] Colegio: ', COALESCE(v_nombre_colegio, 'Desconocido'),
        ' | Cupo ID: ', p_id_cupo
    );

    INSERT INTO TBL_TICKET_COMENTARIO (
        Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket
    ) VALUES (
        v_tipo_evento, v_msg_auditoria, 1, p_id_tecnico, p_id_ticket
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_comentarios_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_comentarios_consultar`(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT
        tc.ID_Ticket_Comentario,
        tc.Tipo_Evento,
        tc.Comentario,
        tc.Fecha_Comentario,
        tc.Es_Interno,
        CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Usuario,
        r.Nombre_Rol
    FROM TBL_TICKET_COMENTARIO tc
    INNER JOIN TBL_USUARIO u ON tc.FK_ID_Usuario = u.ID_Usuario
    INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
    INNER JOIN TBL_ROL r ON u.FK_ID_Rol = r.ID_Rol
    WHERE tc.FK_ID_Ticket = p_id_ticket
      AND tc.Estado_Comentario_Ticket = 1
    ORDER BY tc.Fecha_Comentario DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_comentario_insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_comentario_insertar`(
    IN p_id_ticket VARCHAR(10),
    IN p_tipo_evento VARCHAR(20),
    IN p_id_usuario INT,
    IN p_comentario TEXT,
    IN p_es_interno TINYINT(1)
)
BEGIN
    INSERT INTO TBL_TICKET_COMENTARIO (
        Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket
    ) VALUES (
        p_tipo_evento, p_comentario, p_es_interno, p_id_usuario, p_id_ticket
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_consultar_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_consultar_detalle`(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT *
    FROM vw_ticket_panel_detalle
    WHERE ID_Ticket = p_id_ticket
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_documentos_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_documentos_consultar`(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT
        dt.ID_Doc_Ticket,
        dt.Nombre_Original,
        dt.Fecha_Subida,
        td.Nombre_Tipo_Doc
    FROM TBL_DOCUMENTO_TICKET dt
    INNER JOIN TBL_TIPO_DOCUMENTO td ON dt.FK_ID_Tipo_Doc = td.ID_Tipo_Doc
    WHERE dt.FK_ID_Ticket = p_id_ticket
      AND dt.Estado_Documentos = 1
    ORDER BY dt.Fecha_Subida DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_documento_descargar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_documento_descargar`(
    IN p_id_doc INT
)
BEGIN
    SELECT
        dt.Archivo,
        dt.Nombre_Original
    FROM TBL_DOCUMENTO_TICKET dt
    WHERE dt.ID_Doc_Ticket = p_id_doc
      AND dt.Estado_Documentos = 1
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_estado_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_estado_actualizar`(
    IN p_id_ticket VARCHAR(10),
    IN p_id_estado_nuevo TINYINT,
    IN p_fecha_cierre DATETIME,    -- NULL si no se cierra
    IN p_resolucion TEXT,
    IN p_id_tecnico INT           -- t√©cnico que ejecuta el cambio
)
BEGIN
    DECLARE v_estado_anterior VARCHAR(60);
    DECLARE v_estado_nuevo VARCHAR(60);
    DECLARE v_tipo_evento VARCHAR(20);
    DECLARE v_es_final TINYINT;    
    DECLARE v_msg_auditoria TEXT;

    -- Capturar el nombre del estado anterior para la auditor√≠a
    SELECT et.Nombre_Estado INTO v_estado_anterior
    FROM TBL_TICKET t
    INNER JOIN TBL_ESTADO_TICKET et ON t.FK_ID_Estado_Ticket = et.ID_Estado_Ticket
    WHERE t.ID_Ticket = p_id_ticket
    LIMIT 1;

    -- Capturar el nombre del nuevo estado
    SELECT Nombre_Estado INTO v_estado_nuevo
    FROM TBL_ESTADO_TICKET
    WHERE ID_Estado_Ticket = p_id_estado_nuevo
    LIMIT 1;

    -- Obtener si es estado final
    SELECT Estado_Final 
    INTO v_es_final
    FROM TBL_ESTADO_TICKET
    WHERE ID_Estado_Ticket = p_id_estado_nuevo
    LIMIT 1;
    
    -- Actualizar el ticket
    UPDATE TBL_TICKET
    SET FK_ID_Estado_Ticket = p_id_estado_nuevo,
        Fecha_Cierre = p_fecha_cierre
    WHERE ID_Ticket = p_id_ticket;

    -- Definir el tipo de evento para auditoria
    SET v_tipo_evento = IF(v_es_final = 1, 'Cierre Solicitud', 'Cambio de Estado');

    -- Construir el mensaje de auditor√≠a
    SET v_msg_auditoria = CONCAT(
        '[', v_tipo_evento, '] ',
        v_estado_anterior, ' ‚Üí ', v_estado_nuevo,
        IF(p_resolucion IS NOT NULL AND p_resolucion != '',
        CONCAT(' | Resoluci√≥n: ', p_resolucion), '')
    );

    -- Registrar el cambio como comentario interno autom√°tico
    INSERT INTO TBL_TICKET_COMENTARIO (
        Tipo_Evento, Comentario, Es_Interno, FK_ID_Usuario, FK_ID_Ticket
    ) VALUES (
        v_tipo_evento, v_msg_auditoria, 1, p_id_tecnico, p_id_ticket
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_panel_estudiante_consultar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_panel_estudiante_consultar`(
    IN p_id_ticket VARCHAR(10)
)
BEGIN
    SELECT *
    FROM vw_ticket_estudiante_detalle
    WHERE ID_Ticket = p_id_ticket
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ticket_verificar_activo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ticket_verificar_activo`(
    IN p_id_estudiante INT,
    IN p_id_usuario INT
)
BEGIN
    SELECT COUNT(*) AS total_activos
    FROM TBL_TICKET t
    INNER JOIN TBL_ESTADO_TICKET e ON t.FK_ID_Estado_Ticket = e.ID_Estado_Ticket
    WHERE t.FK_ID_Estudiante = p_id_estudiante
      AND t.FK_ID_Usuario_Creador = p_id_usuario
      AND e.Estado_Final = 0
      AND t.Estado_Ticket = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_obtener_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_obtener_email`(
    IN p_Nombre_Usuario VARCHAR(50)
)
BEGIN
    SELECT 
        DA.Email
    FROM TBL_USUARIO U
    INNER JOIN TBL_DATOS_ADICIONALES DA ON U.FK_ID_Persona = DA.FK_ID_Persona
    WHERE U.Nombre_Usuario = p_Nombre_Usuario 
    AND DA.Email = p_Nombre_Usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_recuperar_contrase√±a` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_recuperar_contrase√±a`(
    IN p_username VARCHAR(100),
    IN p_nuevo_hash VARCHAR(255),
    IN p_ip VARCHAR(50),
    IN p_user_agent VARCHAR(255)
)
BEGIN
    DECLARE v_id_usuario INT;

    START TRANSACTION;

    SELECT ID_Usuario INTO v_id_usuario
    FROM TBL_USUARIO
    WHERE Nombre_Usuario = p_username;

    UPDATE TBL_USUARIO
    SET Contrase√±a_Hash = p_nuevo_hash,
        Ultimo_Cambio_Contrase√±a = CURRENT_TIMESTAMP
    WHERE Nombre_Usuario = p_username;

    CALL sp_insertar_auditoria(
        'TBL_USUARIO',
        'PASSWORD_CHANGE',
        v_id_usuario,
        JSON_OBJECT('evento','recuperacion_password'),
        JSON_OBJECT('evento','password_actualizado'),
        p_ip,
        p_user_agent,
        1
    );

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_verificar_existente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_verificar_existente`(
    IN p_Email VARCHAR(255),
    IN p_Documento INT
)
BEGIN
    SELECT 
        u.Nombre_Usuario,
        p.ID_Persona
    FROM TBL_USUARIO u
    JOIN TBL_PERSONA p
    ON u.FK_ID_Persona = p.ID_Persona
    WHERE u.Nombre_Usuario = p_Email
    OR p.ID_Persona = p_Documento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validar_data_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validar_data_user`(
    IN p_nombre_usuario VARCHAR(50)
)
BEGIN
    SELECT 
        u.ID_Usuario,
        u.Doble_Factor_Activo,
        u.FK_ID_Rol,

        -- Datos de persona
        p.Primer_Nombre,
        p.Primer_Apellido,
        CONCAT(p.Primer_Nombre, ' ', p.Primer_Apellido) AS Nombre_Completo

    FROM TBL_USUARIO u
    INNER JOIN TBL_PERSONA p ON u.FK_ID_Persona = p.ID_Persona
    
    WHERE u.Nombre_Usuario = p_nombre_usuario
    AND u.Estado_Usuario = 1
    AND p.Estado_Persona = 1

    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_admin_acudientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_admin_acudientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_admin_acudientes` AS select `u`.`ID_Usuario` AS `ID_Usuario`,concat('ACU-',`u`.`ID_Usuario`) AS `ID_Formateado`,trim(concat(`p`.`Primer_Nombre`,' ',coalesce(`p`.`Segundo_Nombre`,''),' ',`p`.`Primer_Apellido`,' ',coalesce(`p`.`Segundo_Apellido`,''))) AS `Nombre_Completo`,`u`.`Doble_Factor_Activo` AS `MFA`,`da`.`Email` AS `Email`,(select count(0) from `tbl_ticket` `t` where ((`t`.`FK_ID_Usuario_Creador` = `u`.`ID_Usuario`) and (`t`.`Estado_Ticket` = 1))) AS `Total_Solicitudes`,`u`.`Estado_Usuario` AS `Estado_Usuario`,(case `u`.`Estado_Usuario` when 1 then 'Activo' else 'Eliminado' end) AS `Estado_Texto`,`u`.`Ultimo_Login` AS `Ultimo_Login` from (((`tbl_usuario` `u` join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) join `tbl_persona` `p` on((`u`.`FK_ID_Persona` = `p`.`ID_Persona`))) left join `tbl_datos_adicionales` `da` on((`da`.`FK_ID_Persona` = `p`.`ID_Persona`))) where (`r`.`Nombre_Rol` = 'Acudiente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_admin_administradores`
--

/*!50001 DROP VIEW IF EXISTS `vw_admin_administradores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_admin_administradores` AS select `u`.`ID_Usuario` AS `ID_Usuario`,concat('ADM-',convert(lpad(`u`.`ID_Usuario`,4,'0') using utf8mb4)) AS `ID_Formateado`,concat(`p`.`Primer_Nombre`,' ',`p`.`Primer_Apellido`) AS `Nombre_Completo`,`u`.`Ultimo_Login` AS `Ultimo_Login`,`u`.`Estado_Usuario` AS `Estado_Usuario`,(case `u`.`Estado_Usuario` when 1 then 'Activo' else 'Desactivado' end) AS `Estado_Texto` from ((`tbl_usuario` `u` join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) join `tbl_persona` `p` on((`u`.`FK_ID_Persona` = `p`.`ID_Persona`))) where (`r`.`Nombre_Rol` = 'Admin') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_admin_estudiantes`
--

/*!50001 DROP VIEW IF EXISTS `vw_admin_estudiantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_admin_estudiantes` AS select `e`.`ID_Estudiante` AS `ID_Estudiante`,concat('EST-',`e`.`ID_Estudiante`) AS `ID_Formateado`,concat(`pe`.`Primer_Nombre`,' ',`pe`.`Primer_Apellido`) AS `Nombre_Estudiante`,concat(`pa`.`Primer_Nombre`,' ',`pa`.`Primer_Apellido`) AS `Nombre_Acudiente`,timestampdiff(YEAR,`pe`.`Fecha_Nacimiento`,curdate()) AS `Edad`,`g`.`Nombre_Genero` AS `Genero`,`e`.`Estado_Estudiante` AS `Estado_Estudiante`,(case `e`.`Estado_Estudiante` when 1 then 'Activo' else 'Eliminado' end) AS `Estado_Texto` from ((((`tbl_estudiante` `e` join `tbl_persona` `pe` on((`e`.`FK_ID_Persona` = `pe`.`ID_Persona`))) join `tbl_usuario` `ua` on((`e`.`FK_ID_Acudiente` = `ua`.`ID_Usuario`))) join `tbl_persona` `pa` on((`ua`.`FK_ID_Persona` = `pa`.`ID_Persona`))) join `tbl_genero` `g` on((`e`.`FK_ID_Genero` = `g`.`ID_Genero`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_admin_tecnicos`
--

/*!50001 DROP VIEW IF EXISTS `vw_admin_tecnicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_admin_tecnicos` AS select `u`.`ID_Usuario` AS `ID_Usuario`,concat('TEC-',`u`.`ID_Usuario`) AS `ID_Formateado`,concat(`p`.`Primer_Nombre`,' ',`p`.`Primer_Apellido`) AS `Nombre_Completo`,`da`.`Email` AS `Email`,(select count(0) from (`tbl_ticket` `t` join `tbl_estado_ticket` `et` on((`t`.`FK_ID_Estado_Ticket` = `et`.`ID_Estado_Ticket`))) where ((`t`.`FK_ID_Usuario_Tecnico` = `u`.`ID_Usuario`) and (`et`.`Estado_Final` = 0))) AS `Casos_Asignados`,(select count(0) from (`tbl_ticket` `t` join `tbl_estado_ticket` `et` on((`t`.`FK_ID_Estado_Ticket` = `et`.`ID_Estado_Ticket`))) where ((`t`.`FK_ID_Usuario_Tecnico` = `u`.`ID_Usuario`) and (`et`.`Estado_Final` = 1))) AS `Casos_Cerrados`,`u`.`Estado_Usuario` AS `Estado_Usuario`,(case `u`.`Estado_Usuario` when 1 then 'Activo' else 'Desactivado' end) AS `Estado_Texto`,`u`.`Ultimo_Login` AS `Ultimo_Login` from (((`tbl_usuario` `u` join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) join `tbl_persona` `p` on((`u`.`FK_ID_Persona` = `p`.`ID_Persona`))) left join `tbl_datos_adicionales` `da` on((`da`.`FK_ID_Persona` = `p`.`ID_Persona`))) where (`r`.`Nombre_Rol` = 'Tecnico') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_auditoria_comentarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_auditoria_comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_auditoria_comentarios` AS select `tc`.`ID_Ticket_Comentario` AS `ID_Ticket_Comentario`,`tc`.`Tipo_Evento` AS `Tipo_Evento`,`tc`.`Comentario` AS `Comentario`,`tc`.`Fecha_Comentario` AS `Fecha_Comentario`,`tc`.`Es_Interno` AS `Es_Interno`,`tc`.`FK_ID_Ticket` AS `FK_ID_Ticket`,`tc`.`Estado_Comentario_Ticket` AS `Estado_Comentario_Ticket`,`u`.`ID_Usuario` AS `ID_Usuario`,`r`.`Nombre_Rol` AS `Nombre_Rol`,concat(`p`.`Primer_Nombre`,' ',`p`.`Primer_Apellido`) AS `Nombre_Completo_Usuario` from (((`tbl_ticket_comentario` `tc` join `tbl_usuario` `u` on((`tc`.`FK_ID_Usuario` = `u`.`ID_Usuario`))) join `tbl_persona` `p` on((`u`.`FK_ID_Persona` = `p`.`ID_Persona`))) join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cases_general`
--

/*!50001 DROP VIEW IF EXISTS `vw_cases_general`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cases_general` AS select `t`.`ID_Ticket` AS `ID_Ticket`,`t`.`Titulo_Ticket` AS `Titulo_Ticket`,`t`.`Fecha_Creacion` AS `Fecha_Creacion`,`t`.`Fecha_Cierre` AS `Fecha_Cierre`,`t`.`Puntaje_Prioridad` AS `Puntaje_Prioridad`,`et`.`Nombre_Estado` AS `Nombre_Estado`,`et`.`Estado_Final` AS `Estado_Final`,concat(`pe`.`Primer_Nombre`,' ',`pe`.`Primer_Apellido`) AS `Nombre_Estudiante`,timestampdiff(YEAR,`pe`.`Fecha_Nacimiento`,curdate()) AS `Edad_Estudiante`,concat(`pa`.`Primer_Nombre`,' ',`pa`.`Primer_Apellido`) AS `Nombre_Acudiente`,coalesce(`g_prx`.`Nombre_Grado`,`g_act`.`Nombre_Grado`) AS `Nombre_Grado`,`afec`.`Nombre_Afectacion` AS `Nombre_Afectacion`,coalesce(`col_asig`.`Nombre_Colegio`,'Sin asignar') AS `Colegio_Asignado`,coalesce(concat(`pt`.`Primer_Nombre`,' ',`pt`.`Primer_Apellido`),'Sin asignar') AS `Nombre_Tecnico`,`t`.`FK_ID_Estado_Ticket` AS `FK_ID_Estado_Ticket`,`es`.`FK_ID_Grado_Actual` AS `FK_ID_Grado_Actual`,`es`.`FK_ID_Grado_Proximo` AS `FK_ID_Grado_Proximo`,`t`.`FK_ID_Tipo_Afectacion` AS `FK_ID_Tipo_Afectacion` from ((((((((((((`tbl_ticket` `t` join `tbl_estado_ticket` `et` on((`t`.`FK_ID_Estado_Ticket` = `et`.`ID_Estado_Ticket`))) join `tbl_estudiante` `es` on((`t`.`FK_ID_Estudiante` = `es`.`ID_Estudiante`))) join `tbl_persona` `pe` on((`es`.`FK_ID_Persona` = `pe`.`ID_Persona`))) join `tbl_grado` `g_act` on((`es`.`FK_ID_Grado_Actual` = `g_act`.`ID_Grado`))) left join `tbl_grado` `g_prx` on((`es`.`FK_ID_Grado_Proximo` = `g_prx`.`ID_Grado`))) join `tbl_tipo_afectacion` `afec` on((`t`.`FK_ID_Tipo_Afectacion` = `afec`.`ID_Tipo_Afectacion`))) join `tbl_usuario` `ua` on((`t`.`FK_ID_Usuario_Creador` = `ua`.`ID_Usuario`))) join `tbl_persona` `pa` on((`ua`.`FK_ID_Persona` = `pa`.`ID_Persona`))) left join `tbl_usuario` `ut` on((`t`.`FK_ID_Usuario_Tecnico` = `ut`.`ID_Usuario`))) left join `tbl_persona` `pt` on((`ut`.`FK_ID_Persona` = `pt`.`ID_Persona`))) left join `tbl_cupos` `cu` on((`t`.`FK_ID_Cupo_Asignado` = `cu`.`ID_Cupos`))) left join `tbl_colegio` `col_asig` on((`cu`.`FK_ID_Colegio` = `col_asig`.`ID_Colegio`))) where (`t`.`Estado_Ticket` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estudiante_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vw_estudiante_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estudiante_detalle` AS select `e`.`ID_Estudiante` AS `ID_Estudiante`,`e`.`FK_ID_Acudiente` AS `FK_ID_Acudiente`,`e`.`Estado_Estudiante` AS `Estado_Estudiante`,`p`.`ID_Persona` AS `ID_Persona`,`p`.`Primer_Nombre` AS `Primer_Nombre`,`p`.`Segundo_Nombre` AS `Segundo_Nombre`,`p`.`Primer_Apellido` AS `Primer_Apellido`,`p`.`Segundo_Apellido` AS `Segundo_Apellido`,`p`.`Fecha_Nacimiento` AS `Fecha_Nacimiento`,`p`.`Num_Doc_Persona` AS `Numero_Documento`,`ti`.`Nombre_Tipo_Iden` AS `Nombre_Tipo_Iden`,`g`.`Nombre_Genero` AS `Nombre_Genero`,`gp`.`Nombre_Grupo_Preferencial` AS `Nombre_Grupo_Preferencial`,`gr_a`.`Nombre_Grado` AS `Nombre_Grado_Actual`,`gr_p`.`Nombre_Grado` AS `Nombre_Grado_Proximo`,`c`.`Nombre_Colegio` AS `Nombre_Colegio_Anterior`,`e`.`FK_ID_Genero` AS `ID_Genero`,`e`.`FK_ID_Grupo_Preferencial` AS `ID_Grupo_Preferencial`,`e`.`FK_ID_Grado_Actual` AS `ID_Grado_Actual`,`e`.`FK_ID_Grado_Proximo` AS `ID_Grado_Proximo`,`e`.`FK_ID_Colegio_Anterior` AS `ID_Colegio_Anterior`,`e`.`FK_ID_Persona` AS `FK_ID_Persona`,`e`.`FK_ID_Tipo_Iden` AS `ID_Tipo_Iden`,`e`.`FK_ID_Parentesco_Es` AS `ID_Parentesco` from (((((((`tbl_estudiante` `e` join `tbl_persona` `p` on((`e`.`FK_ID_Persona` = `p`.`ID_Persona`))) join `tbl_tipo_identificacion` `ti` on((`e`.`FK_ID_Tipo_Iden` = `ti`.`ID_Tipo_Iden`))) join `tbl_genero` `g` on((`e`.`FK_ID_Genero` = `g`.`ID_Genero`))) join `tbl_grupo_preferencial` `gp` on((`e`.`FK_ID_Grupo_Preferencial` = `gp`.`ID_Grupo_Preferencial`))) join `tbl_grado` `gr_a` on((`e`.`FK_ID_Grado_Actual` = `gr_a`.`ID_Grado`))) left join `tbl_grado` `gr_p` on((`e`.`FK_ID_Grado_Proximo` = `gr_p`.`ID_Grado`))) join `tbl_colegio` `c` on((`e`.`FK_ID_Colegio_Anterior` = `c`.`ID_Colegio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_historial_acceso`
--

/*!50001 DROP VIEW IF EXISTS `vw_historial_acceso`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_historial_acceso` AS select `sa`.`ID_Auditoria` AS `ID_Auditoria`,coalesce(`u`.`Nombre_Usuario`,'Desconocido') AS `Nombre_Usuario`,coalesce(`r`.`ID_Rol`,0) AS `ID_Rol`,coalesce(`r`.`Nombre_Rol`,'‚Äî‚Äî‚Äî‚Äî') AS `Nombre_Rol`,`sa`.`Tipo_Evento` AS `Evento`,`sa`.`IP_Usuario` AS `IP`,(case when ((`sa`.`User_Agent` like '%Brave/%') or (`sa`.`User_Agent` like '% Brave %')) then 'Brave' when (`sa`.`User_Agent` like '%Edg/%') then 'Edge' when ((`sa`.`User_Agent` like '%OPR/%') or (`sa`.`User_Agent` like '%Opera/%')) then 'Opera' when (`sa`.`User_Agent` like '%Vivaldi/%') then 'Vivaldi' when (`sa`.`User_Agent` like '%CriOS/%') then 'Chrome (iOS)' when (`sa`.`User_Agent` like '%Chrome/%') then 'Chrome' when (`sa`.`User_Agent` like '%Firefox/%') then 'Firefox' when ((`sa`.`User_Agent` like '%Safari/%') and (not((`sa`.`User_Agent` like '%Chrome/%'))) and (not((`sa`.`User_Agent` like '%Chromium/%')))) then 'Safari' when ((`sa`.`User_Agent` like '%MSIE %') or (`sa`.`User_Agent` like '%Trident/%')) then 'Internet Explorer' else 'Otro' end) AS `Navegador`,`sa`.`User_Agent` AS `User_Agent`,`sa`.`Fecha_Evento` AS `Fecha_Evento` from ((`tbl_auditoria_sesion` `sa` left join `tbl_usuario` `u` on((`sa`.`FK_ID_Usuario` = `u`.`ID_Usuario`))) left join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) where (`sa`.`Estado_Auditoria_Sesion` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_historial_acciones`
--

/*!50001 DROP VIEW IF EXISTS `vw_historial_acciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_historial_acciones` AS select `a`.`ID_Auditoria` AS `ID_Auditoria`,`a`.`Tipo_Evento` AS `Evento`,`a`.`Tabla_Afectada` AS `Tabla_Afectada`,`a`.`ID_Registro_Afectado` AS `ID_Registro_Afectado`,coalesce(concat((case `r`.`Nombre_Rol` when 'Admin' then 'ADM' when 'Tecnico' then 'TEC' when 'Acudiente' then 'ACU' when 'Sistema' then 'SIS' else 'SIS' end),'-',`u`.`ID_Usuario`),concat('USR-',`a`.`FK_ID_Usuario`)) AS `ID_Formateado`,coalesce(`r`.`ID_Rol`,0) AS `ID_Rol`,coalesce(`r`.`Nombre_Rol`,'‚Äî') AS `Nombre_Rol`,`a`.`IP_Usuario` AS `IP`,coalesce(cast(`a`.`Datos_Antiguo` as char charset utf8mb4),'No aplica') AS `Dato_Antiguo`,coalesce(cast(`a`.`Datos_Nuevos` as char charset utf8mb4),'No aplica') AS `Dato_Nuevo`,`a`.`Fecha_Auditoria` AS `Fecha_Evento` from ((`tbl_auditoria` `a` left join `tbl_usuario` `u` on((`a`.`FK_ID_Usuario` = `u`.`ID_Usuario`))) left join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) where (`a`.`Estado_Auditoria` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ticket_acudiente_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vw_ticket_acudiente_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ticket_acudiente_detalle` AS select `t`.`ID_Ticket` AS `ID_Ticket`,`p`.`ID_Persona` AS `ID_Persona`,`p`.`Num_Doc_Persona` AS `Numero_Documento`,`ti`.`Nombre_Tipo_Iden` AS `Nombre_Tipo_Iden`,`p`.`Primer_Nombre` AS `Primer_Nombre`,`p`.`Segundo_Nombre` AS `Segundo_Nombre`,`p`.`Primer_Apellido` AS `Primer_Apellido`,`p`.`Segundo_Apellido` AS `Segundo_Apellido`,`da`.`Email` AS `Email`,`da`.`Telefono` AS `Telefono`,`b`.`Nombre_Barrio` AS `Nombre_Barrio`,`loc`.`Nombre_Localidad` AS `Nombre_Localidad`,`est`.`Nombre_Estrato` AS `Nombre_Estrato`,`gen`.`Nombre_Genero` AS `Nombre_Genero`,`gp`.`Nombre_Grupo_Preferencial` AS `Nombre_Grupo_Preferencial`,`par`.`Nombre_Parentesco` AS `Nombre_Parentesco`,`u`.`Fecha_Creacion` AS `Fecha_Creacion`,concat(left(`p`.`Primer_Nombre`,1),left(`p`.`Primer_Apellido`,1)) AS `Iniciales`,concat(`p`.`Primer_Nombre`,' ',`p`.`Primer_Apellido`) AS `Nombre_Completo` from ((((((((((`tbl_ticket` `t` join `tbl_usuario` `u` on((`t`.`FK_ID_Usuario_Creador` = `u`.`ID_Usuario`))) join `tbl_persona` `p` on((`u`.`FK_ID_Persona` = `p`.`ID_Persona`))) join `tbl_datos_adicionales` `da` on((`da`.`FK_ID_Persona` = `p`.`ID_Persona`))) join `tbl_tipo_identificacion` `ti` on((`da`.`FK_ID_Tipo_Iden` = `ti`.`ID_Tipo_Iden`))) join `tbl_barrio` `b` on((`da`.`FK_ID_Barrio` = `b`.`ID_Barrio`))) join `tbl_localidad` `loc` on((`b`.`FK_ID_Localidad` = `loc`.`ID_Localidad`))) join `tbl_estrato` `est` on((`da`.`FK_ID_Estrato` = `est`.`ID_Estrato`))) join `tbl_genero` `gen` on((`da`.`FK_ID_Genero` = `gen`.`ID_Genero`))) join `tbl_grupo_preferencial` `gp` on((`da`.`FK_ID_Grupo_Preferencial` = `gp`.`ID_Grupo_Preferencial`))) join `tbl_parentesco` `par` on((`da`.`FK_ID_Parentesco` = `par`.`ID_Parentesco`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ticket_base`
--

/*!50001 DROP VIEW IF EXISTS `vw_ticket_base`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ticket_base` AS select `t`.`ID_Ticket` AS `ID_Ticket`,`t`.`Titulo_Ticket` AS `Titulo_Ticket`,`t`.`Descripcion_Ticket` AS `Descripcion_Ticket`,`t`.`Fecha_Creacion` AS `Fecha_Creacion`,`t`.`Fecha_Cierre` AS `Fecha_Cierre`,`t`.`Puntaje_Prioridad` AS `Puntaje_Prioridad`,`t`.`FK_ID_Usuario_Creador` AS `FK_ID_Usuario_Creador`,`t`.`FK_ID_Estudiante` AS `FK_ID_Estudiante`,`et`.`Nombre_Estado` AS `Nombre_Estado`,`et`.`Estado_Final` AS `Estado_Final`,`ta`.`Nombre_Afectacion` AS `Nombre_Afectacion`,`ta`.`Nivel_Prioridad_TC` AS `Nivel_Prioridad_TC` from ((`tbl_ticket` `t` join `tbl_estado_ticket` `et` on((`t`.`FK_ID_Estado_Ticket` = `et`.`ID_Estado_Ticket`))) join `tbl_tipo_afectacion` `ta` on((`t`.`FK_ID_Tipo_Afectacion` = `ta`.`ID_Tipo_Afectacion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ticket_comentarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_ticket_comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ticket_comentarios` AS select `tc`.`ID_Ticket_Comentario` AS `ID_Ticket_Comentario`,`tc`.`FK_ID_Ticket` AS `FK_ID_Ticket`,`tc`.`Comentario` AS `Comentario`,`tc`.`Fecha_Comentario` AS `Fecha_Comentario`,`tc`.`Es_Interno` AS `Es_Interno`,`tc`.`Estado_Comentario_Ticket` AS `Estado_Comentario_Ticket`,`u`.`ID_Usuario` AS `ID_Usuario`,concat(`p`.`Primer_Nombre`,' ',`p`.`Primer_Apellido`) AS `Nombre_Usuario`,`r`.`Nombre_Rol` AS `Nombre_Rol` from (((`tbl_ticket_comentario` `tc` join `tbl_usuario` `u` on((`tc`.`FK_ID_Usuario` = `u`.`ID_Usuario`))) join `tbl_persona` `p` on((`u`.`FK_ID_Persona` = `p`.`ID_Persona`))) join `tbl_rol` `r` on((`u`.`FK_ID_Rol` = `r`.`ID_Rol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ticket_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vw_ticket_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ticket_detalle` AS select `t`.`ID_Ticket` AS `ID_Ticket`,`t`.`Titulo_Ticket` AS `Titulo_Ticket`,`t`.`Descripcion_Ticket` AS `Descripcion_Ticket`,`t`.`Fecha_Creacion` AS `Fecha_Creacion`,`t`.`Fecha_Cierre` AS `Fecha_Cierre`,`t`.`Puntaje_Prioridad` AS `Puntaje_Prioridad`,`t`.`Estado_Ticket` AS `Estado_Ticket`,`t`.`FK_ID_Usuario_Creador` AS `FK_ID_Usuario_Creador`,`t`.`FK_ID_Usuario_Tecnico` AS `FK_ID_Usuario_Tecnico`,`t`.`FK_ID_Estudiante` AS `FK_ID_Estudiante`,`t`.`FK_ID_Jornada_Preferencia` AS `FK_ID_Jornada_Preferencia`,`t`.`FK_ID_Barrio` AS `FK_ID_Barrio`,`t`.`FK_ID_Tiempo_Residencia` AS `FK_ID_Tiempo_Residencia`,`t`.`FK_ID_Colegio_Preferencia` AS `FK_ID_Colegio_Preferencia`,`t`.`FK_ID_Cupo_Asignado` AS `FK_ID_Cupo_Asignado`,`et`.`Nombre_Estado` AS `Nombre_Estado`,`et`.`Estado_Final` AS `Estado_Final`,`ta`.`Nombre_Afectacion` AS `Nombre_Afectacion`,`ta`.`Nivel_Prioridad_TC` AS `Nivel_Prioridad_TC` from ((`tbl_ticket` `t` join `tbl_estado_ticket` `et` on((`t`.`FK_ID_Estado_Ticket` = `et`.`ID_Estado_Ticket`))) join `tbl_tipo_afectacion` `ta` on((`t`.`FK_ID_Tipo_Afectacion` = `ta`.`ID_Tipo_Afectacion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ticket_estudiante_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vw_ticket_estudiante_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ticket_estudiante_detalle` AS select `t`.`ID_Ticket` AS `ID_Ticket`,`e`.`ID_Estudiante` AS `ID_Estudiante`,`p`.`ID_Persona` AS `ID_Persona`,`ti`.`Nombre_Tipo_Iden` AS `Nombre_Tipo_Iden`,`p`.`Num_Doc_Persona` AS `Numero_Documento`,`p`.`Primer_Nombre` AS `Primer_Nombre`,`p`.`Segundo_Nombre` AS `Segundo_Nombre`,`p`.`Primer_Apellido` AS `Primer_Apellido`,`p`.`Segundo_Apellido` AS `Segundo_Apellido`,`p`.`Fecha_Nacimiento` AS `Fecha_Nacimiento`,timestampdiff(YEAR,`p`.`Fecha_Nacimiento`,curdate()) AS `Edad`,`gen`.`Nombre_Genero` AS `Nombre_Genero`,`gp`.`Nombre_Grupo_Preferencial` AS `Nombre_Grupo_Preferencial`,`g_act`.`Nombre_Grado` AS `Nombre_Grado_Actual`,`g_prx`.`Nombre_Grado` AS `Nombre_Grado_Proximo`,`col`.`Nombre_Colegio` AS `Nombre_Colegio_Anterior` from ((((((((`tbl_ticket` `t` join `tbl_estudiante` `e` on((`t`.`FK_ID_Estudiante` = `e`.`ID_Estudiante`))) join `tbl_persona` `p` on((`e`.`FK_ID_Persona` = `p`.`ID_Persona`))) join `tbl_tipo_identificacion` `ti` on((`e`.`FK_ID_Tipo_Iden` = `ti`.`ID_Tipo_Iden`))) join `tbl_genero` `gen` on((`e`.`FK_ID_Genero` = `gen`.`ID_Genero`))) join `tbl_grupo_preferencial` `gp` on((`e`.`FK_ID_Grupo_Preferencial` = `gp`.`ID_Grupo_Preferencial`))) join `tbl_grado` `g_act` on((`e`.`FK_ID_Grado_Actual` = `g_act`.`ID_Grado`))) left join `tbl_grado` `g_prx` on((`e`.`FK_ID_Grado_Proximo` = `g_prx`.`ID_Grado`))) join `tbl_colegio` `col` on((`e`.`FK_ID_Colegio_Anterior` = `col`.`ID_Colegio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ticket_panel_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vw_ticket_panel_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ticket_panel_detalle` AS select `t`.`ID_Ticket` AS `ID_Ticket`,`t`.`Titulo_Ticket` AS `Titulo_Ticket`,`t`.`Descripcion_Ticket` AS `Descripcion_Ticket`,`t`.`Fecha_Creacion` AS `Fecha_Creacion`,`t`.`Fecha_Cierre` AS `Fecha_Cierre`,`t`.`Puntaje_Prioridad` AS `Puntaje_Prioridad`,`et`.`ID_Estado_Ticket` AS `ID_Estado_Ticket`,`et`.`Nombre_Estado` AS `Nombre_Estado`,`t`.`FK_ID_Usuario_Tecnico` AS `ID_Tecnico`,concat(`pt`.`Primer_Nombre`,' ',`pt`.`Primer_Apellido`) AS `Nombre_Tecnico`,concat(`pe`.`Primer_Nombre`,' ',`pe`.`Primer_Apellido`) AS `Nombre_Estudiante`,`g_act`.`Nombre_Grado` AS `Grado_Actual`,`g_prx`.`Nombre_Grado` AS `Grado_Proximo`,coalesce(`col_pref`.`Nombre_Colegio`,'Sin preferencia') AS `Colegio_Preferencia`,`jor`.`Nombre_Jornada` AS `Nombre_Jornada`,`afec`.`Nombre_Afectacion` AS `Nombre_Afectacion`,`b`.`Nombre_Barrio` AS `Nombre_Barrio`,`tres`.`Nombre_Tiempo` AS `Nombre_Tiempo`,coalesce(`col_asig`.`Nombre_Colegio`,'Sin asignar') AS `Colegio_Asignado`,`cu`.`ID_Cupos` AS `ID_Cupos`,(case when (`t`.`Fecha_Cierre` is not null) then 1 else 0 end) AS `Estado_Final` from ((((((((((((((`tbl_ticket` `t` join `tbl_estado_ticket` `et` on((`t`.`FK_ID_Estado_Ticket` = `et`.`ID_Estado_Ticket`))) join `tbl_estudiante` `es` on((`t`.`FK_ID_Estudiante` = `es`.`ID_Estudiante`))) join `tbl_persona` `pe` on((`es`.`FK_ID_Persona` = `pe`.`ID_Persona`))) join `tbl_grado` `g_act` on((`es`.`FK_ID_Grado_Actual` = `g_act`.`ID_Grado`))) left join `tbl_grado` `g_prx` on((`es`.`FK_ID_Grado_Proximo` = `g_prx`.`ID_Grado`))) join `tbl_jornada` `jor` on((`t`.`FK_ID_Jornada_Preferencia` = `jor`.`ID_Jornada`))) join `tbl_tipo_afectacion` `afec` on((`t`.`FK_ID_Tipo_Afectacion` = `afec`.`ID_Tipo_Afectacion`))) join `tbl_barrio` `b` on((`t`.`FK_ID_Barrio` = `b`.`ID_Barrio`))) left join `tbl_tiempo_residencia` `tres` on((`t`.`FK_ID_Tiempo_Residencia` = `tres`.`ID_Tiempo_Residencia`))) left join `tbl_colegio` `col_pref` on((`t`.`FK_ID_Colegio_Preferencia` = `col_pref`.`ID_Colegio`))) left join `tbl_usuario` `ut` on((`t`.`FK_ID_Usuario_Tecnico` = `ut`.`ID_Usuario`))) left join `tbl_persona` `pt` on((`ut`.`FK_ID_Persona` = `pt`.`ID_Persona`))) left join `tbl_cupos` `cu` on((`t`.`FK_ID_Cupo_Asignado` = `cu`.`ID_Cupos`))) left join `tbl_colegio` `col_asig` on((`cu`.`FK_ID_Colegio` = `col_asig`.`ID_Colegio`))) where (`t`.`Estado_Ticket` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-19 20:53:42
