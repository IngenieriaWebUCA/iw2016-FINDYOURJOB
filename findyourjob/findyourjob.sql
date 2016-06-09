-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: findyourjob
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foto` varchar(30) DEFAULT NULL,
  `trayectoria` varchar(30) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `demandante` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fon5r4lt18iuh3h1vbxx3sffr` (`demandante`),
  CONSTRAINT `FK_fon5r4lt18iuh3h1vbxx3sffr` FOREIGN KEY (`demandante`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (1,'fotomarta','estudiante',NULL,39);
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia`
--

DROP TABLE IF EXISTS `experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_contrato_fin` varchar(30) NOT NULL,
  `fecha_contrato_inicio` varchar(30) NOT NULL,
  `nombre_empresa` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `curriculum` bigint(20) NOT NULL,
  `puesto` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jx9d5vrmcu4uvtw9pbya8raf7` (`curriculum`),
  KEY `FK_hy1mg5bxn2ea3rtgu89ssefuu` (`puesto`),
  CONSTRAINT `FK_hy1mg5bxn2ea3rtgu89ssefuu` FOREIGN KEY (`puesto`) REFERENCES `puesto` (`id`),
  CONSTRAINT `FK_jx9d5vrmcu4uvtw9pbya8raf7` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia`
--

LOCK TABLES `experiencia` WRITE;
/*!40000 ALTER TABLE `experiencia` DISABLE KEYS */;
INSERT INTO `experiencia` VALUES (2,'2015-05-30 00:00:00','2015-06-30 00:00:00','Mercadona',NULL,1,1);
/*!40000 ALTER TABLE `experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestor_empresa`
--

DROP TABLE IF EXISTS `gestor_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestor_empresa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `password` varchar(10) NOT NULL,
  `rol` int(11) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor_empresa`
--

LOCK TABLES `gestor_empresa` WRITE;
/*!40000 ALTER TABLE `gestor_empresa` DISABLE KEYS */;
INSERT INTO `gestor_empresa` VALUES (1,'','gestor1',0,'gestor1',NULL),(4,'','pedro',NULL,'pedro',0);
/*!40000 ALTER TABLE `gestor_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `demandante` bigint(20) NOT NULL,
  `oferta` bigint(20) NOT NULL,
  `inscripcion_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ospcbcdkox1m92d6acftub7bu` (`demandante`),
  KEY `FK_jtwnnskbxax0f2q8butty5yj` (`oferta`),
  CONSTRAINT `FK_jtwnnskbxax0f2q8butty5yj` FOREIGN KEY (`oferta`) REFERENCES `oferta` (`id`),
  CONSTRAINT `FK_ospcbcdkox1m92d6acftub7bu` FOREIGN KEY (`demandante`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES (4,'2016-06-09 12:11:21',0,39,3,0),(5,'2016-06-09 12:17:12',0,45,4,0);
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacion`
--

DROP TABLE IF EXISTS `localizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(30) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacion`
--

LOCK TABLES `localizacion` WRITE;
/*!40000 ALTER TABLE `localizacion` DISABLE KEYS */;
INSERT INTO `localizacion` VALUES (1,'Callejón de la Rosa','Chiclana de la Frontera',0),(2,'El almendral','Jerez',0),(3,'Avenida Sanlucar','Jerez',0),(4,'Vallesequillo','Sevilla',0),(5,'Calle la Vega','Madrid',0),(6,'Calle Limonero','Puerto Real',0);
/*!40000 ALTER TABLE `localizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oferta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_disponible_inicio` varchar(30) NOT NULL,
  `fecha_inicio_actividad` varchar(30) NOT NULL,
  `perfil` varchar(30) NOT NULL,
  `sueldo_bruto` float NOT NULL,
  `tipologia` varchar(30) NOT NULL,
  `vacantes` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `empresa` bigint(20) NOT NULL,
  `localizacion` bigint(20) DEFAULT NULL,
  `puesto_trabajo` bigint(20) DEFAULT NULL,
  `fecha_disponible_fin` datetime NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5m6k3hjnv4ytgy9agn0rwopnw` (`localizacion`),
  KEY `FK_nqamyrt6lhujudi9745bfd56u` (`puesto_trabajo`),
  KEY `FK_5p5cq9yp4r32f9gpmfrp6x9ca` (`empresa`),
  CONSTRAINT `FK_5m6k3hjnv4ytgy9agn0rwopnw` FOREIGN KEY (`localizacion`) REFERENCES `localizacion` (`id`),
  CONSTRAINT `FK_5p5cq9yp4r32f9gpmfrp6x9ca` FOREIGN KEY (`empresa`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_nqamyrt6lhujudi9745bfd56u` FOREIGN KEY (`puesto_trabajo`) REFERENCES `puesto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (3,'2016-06-03 00:00:00','2016-06-14 00:00:00','ingles',300,'tiempo parcial','5',0,40,1,1,'2016-06-22 00:00:00',0),(4,'2016-06-04 00:00:00','2016-06-22 00:00:00','Bachillerato',800,'tiempo completo','5',0,31,1,1,'2016-06-13 00:00:00',1),(5,'2016-08-01 00:00:00','2016-06-16 00:00:00','aleman',500,'tiempo parcial','7',0,46,3,2,'2016-06-07 00:00:00',2);
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'Reponedor',0),(2,'Dependiente',0);
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` bit(1) NOT NULL,
  `password` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `telefono` double DEFAULT NULL,
  `curriculum` bigint(20) DEFAULT NULL,
  `actividad_profesional` varchar(30) DEFAULT NULL,
  `cif` varchar(30) DEFAULT NULL,
  `gestion_propia` bit(1) DEFAULT NULL,
  `numero_empleados` int(11) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `gestor` bigint(20) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `usuario_gestor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tc6axurp76758bfw4ccqqdaco` (`curriculum`),
  KEY `FK_l3dmup0wv69cl3g5r714wxife` (`gestor`),
  CONSTRAINT `FK_l3dmup0wv69cl3g5r714wxife` FOREIGN KEY (`gestor`) REFERENCES `gestor_empresa` (`id`),
  CONSTRAINT `FK_tc6axurp76758bfw4ccqqdaco` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Usuario',0,'','gestor1','gestor1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL),('Empresa',29,'','macdonal','macdonal',2,NULL,'rrhh_macdonal@gmail.com','macdonal',NULL,NULL,'hosteleria','4444','',45,NULL,NULL,NULL,NULL,NULL),('Empresa',30,'','navantia','navantia',0,NULL,'navanteando@hotmail.com','Navantia',NULL,NULL,'analista','89657745','',350,NULL,NULL,NULL,2,NULL),('Empresa',31,'\0','mercadona','mercadona',0,NULL,'rrhh_mercadona@hotmail.com','Mercadona',NULL,NULL,'reponedor','44444444444','\0',90,NULL,NULL,1,NULL,NULL),('Empresa',33,'\0','sprinter','sprinter',0,NULL,'rrhh_sprinter@hotmail.com','Sprinter',NULL,NULL,'dependiente','765456789','\0',10,NULL,NULL,1,NULL,'gestor1'),('Usuario',35,'','anarosa','anarosa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),('Usuario',37,'','aaaaa','aaaaa',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Usuario',38,'','pedro','pedro',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL),('Demandante',39,'','marta','marta',0,'jimenez','marta7@gmail.com','marta',545,1,NULL,NULL,NULL,NULL,'2016-05-30 00:00:00',0,NULL,1,NULL),('Empresa',40,'','diadia','diadia',1,NULL,'rrhh_dia@hotmail.com','dia',NULL,NULL,'cajera','4567890987654','',30,NULL,NULL,NULL,NULL,NULL),('Empresa',41,'\0','media','media',0,NULL,'media_markrhh@hotmail.com','media mark',NULL,NULL,'comercio','59494','\0',100,NULL,NULL,1,NULL,'gestor1'),('Empresa',42,'\0','supersol','supersol',0,NULL,'supersol@gmail.com','supersol',NULL,NULL,'comercio','59494','\0',40,NULL,NULL,1,NULL,'gestor1'),('Empresa',43,'','melia','melia',0,NULL,'melia_playa@gmail.com','Hotel Meliá',NULL,NULL,'turismo','59494','',200,NULL,NULL,NULL,2,'melia'),('Empresa',44,'\0','iberostar','iberostar',0,NULL,'iberostar_rrhh@gmail.com','Hotel Iberostar',NULL,NULL,'turismo','98765456789','\0',88,NULL,NULL,1,NULL,'gestor1'),('Demandante',45,'','pablo','pablo',0,'Gómez','gomezpablo@hotmail.com','pablo',698574125,NULL,NULL,NULL,NULL,NULL,'1980-06-22 00:00:00',1,NULL,1,NULL),('Empresa',46,'','ikeas','ikeas',0,NULL,'ikea_rrhh@gmail.com','Ikea',NULL,NULL,'comercio','87654567890','',150,NULL,NULL,NULL,2,'ikeas'),('Demandante',47,'','carlos','carlos',0,'Barea','carlos@gmail.com','Carlos',98765321,NULL,NULL,NULL,NULL,NULL,'2009-06-10 00:00:00',1,NULL,1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-09 18:15:40
