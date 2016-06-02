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

CREATE DATABASE IF NO EXISTS 'findyourjob';
CREATE USER 'root'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON * . * TO 'root'@localhost';
USE 'findyourjob';

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `foto` varchar(30) NOT NULL,
  `trayectoria` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `demandante` bigint(20) NOT NULL,
  `formacion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fon5r4lt18iuh3h1vbxx3sffr` (`demandante`),
  KEY `FK_kxasy07a1b6pas4h0emqak8nu` (`formacion`),
  CONSTRAINT `FK_fon5r4lt18iuh3h1vbxx3sffr` FOREIGN KEY (`demandante`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FK_kxasy07a1b6pas4h0emqak8nu` FOREIGN KEY (`formacion`) REFERENCES `formacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (2,'fotoantonio','muy larga',0,17,NULL);
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
  PRIMARY KEY (`id`),
  KEY `FK_jx9d5vrmcu4uvtw9pbya8raf7` (`curriculum`),
  CONSTRAINT `FK_jx9d5vrmcu4uvtw9pbya8raf7` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia`
--

LOCK TABLES `experiencia` WRITE;
/*!40000 ALTER TABLE `experiencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacion`
--

DROP TABLE IF EXISTS `formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cursos_idiomas` varchar(30) NOT NULL,
  `titulos_academicos` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `curriculum` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rh7ifal8jv4iegah0hdbld17v` (`curriculum`),
  CONSTRAINT `FK_rh7ifal8jv4iegah0hdbld17v` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion`
--

LOCK TABLES `formacion` WRITE;
/*!40000 ALTER TABLE `formacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` varchar(30) NOT NULL,
  `fecha` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `demandante` bigint(20) NOT NULL,
  `oferta` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ospcbcdkox1m92d6acftub7bu` (`demandante`),
  KEY `FK_jtwnnskbxax0f2q8butty5yj` (`oferta`),
  CONSTRAINT `FK_jtwnnskbxax0f2q8butty5yj` FOREIGN KEY (`oferta`) REFERENCES `oferta` (`id`),
  CONSTRAINT `FK_ospcbcdkox1m92d6acftub7bu` FOREIGN KEY (`demandante`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
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
INSERT INTO `localizacion` VALUES (6,'calle almendral','chiclana de la frontera',0);
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
  `estado` varchar(30) NOT NULL,
  `fecha_disponible_inicio` varchar(30) NOT NULL,
  `fecha_inicio_actividad` varchar(30) NOT NULL,
  `perfil` varchar(30) NOT NULL,
  `sueldo_bruto` float NOT NULL,
  `tipologia` varchar(30) NOT NULL,
  `vacantes` varchar(30) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `empresa` bigint(20) NOT NULL,
  `localizacion` bigint(20) NOT NULL,
  `puesto_trabajo` bigint(20) DEFAULT NULL,
  `fecha_disponible_fin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5m6k3hjnv4ytgy9agn0rwopnw` (`localizacion`),
  KEY `FK_nqamyrt6lhujudi9745bfd56u` (`puesto_trabajo`),
  CONSTRAINT `FK_5m6k3hjnv4ytgy9agn0rwopnw` FOREIGN KEY (`localizacion`) REFERENCES `localizacion` (`id`),
  CONSTRAINT `FK_nqamyrt6lhujudi9745bfd56u` FOREIGN KEY (`puesto_trabajo`) REFERENCES `puesto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oferta`
--

LOCK TABLES `oferta` WRITE;
/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
INSERT INTO `oferta` VALUES (14,'Activa','2016-06-01 00:00:00','2016-06-21 00:00:00','programador',1000,'tiempo parcial','12',0,18,6,3,'2016-06-10 00:00:00'),(15,'En espera','2016-07-06 00:00:00','2016-06-15 00:00:00','dependienta',600,'tiempo parcial','7',0,18,6,4,'2016-06-10 00:00:00'),(16,'Activa','2016-06-01 00:00:00','2016-06-25 00:00:00','analista',700,'tiempo parcial','8',0,15,6,3,'2016-06-16 00:00:00');
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
  `experiencia` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_phpy47xrh4h9gl5yj9329rw3x` (`experiencia`),
  CONSTRAINT `FK_phpy47xrh4h9gl5yj9329rw3x` FOREIGN KEY (`experiencia`) REFERENCES `experiencia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (3,'programador',0,NULL),(4,'dependiente',0,NULL);
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
  `rol` varchar(255) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` varchar(30) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `sexo` varchar(30) DEFAULT NULL,
  `telefono` double DEFAULT NULL,
  `curriculum` bigint(20) DEFAULT NULL,
  `actividad_profesional` varchar(30) DEFAULT NULL,
  `cif` varchar(30) DEFAULT NULL,
  `gestion_propia` bit(1) DEFAULT NULL,
  `numero_empleados` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tc6axurp76758bfw4ccqqdaco` (`curriculum`),
  CONSTRAINT `FK_tc6axurp76758bfw4ccqqdaco` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Usuario',1,'','anarosa','ADMINISTRADOR','anarosa',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Empresa',15,'','deloitte','GESTOR_EMPRESA','deloitte',0,NULL,'rrhh_deloite@hotmail.com',NULL,'deloitte',NULL,NULL,NULL,'analista','478965','',2),('Usuario',16,'','gestor1','GESTOR_ETT','gestor1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Demandante',17,'','antonio','DEMANDANTE','antonio',0,'Rodríguez','antonio_rod@gmail.com','2016-06-13 00:00:00','Antonio','hombre',63254269,NULL,NULL,NULL,NULL,NULL),('Empresa',18,'','telepizza','GESTOR_EMPRESA','telepizza',0,NULL,'aaa',NULL,'Telepizza',NULL,NULL,NULL,'dsf','556','',4);
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

-- Dump completed on 2016-06-02 18:46:57
