CREATE DATABASE  IF NOT EXISTS `archivo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `archivo`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: archivo
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `licence`
--

DROP TABLE IF EXISTS `licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `desc` varchar(90) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `class_UNIQUE` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence`
--

LOCK TABLES `licence` WRITE;
/*!40000 ALTER TABLE `licence` DISABLE KEYS */;
INSERT INTO `licence` VALUES (1,'A','Para conducción de vehículos motorizados como: ciclomotores, motocicletas, tricar, cuadro'),(2,'B','Para automóviles y camionetas con acoplados de hasta 1,75 toneladas de carga Útil o casas'),(3,'C','Taxis convencionales, ejecutivos, camionetas livianas o mixta hasta 3.500 kg, hasta 8 pas'),(4,'D','Servicio de pasajeros (intracantonales, interprovinciales, intraprovinciales, intrarregio'),(5,'E','Camiones pesados y extra pesados con o sin remolque de más s de 3,5 toneladas, tráiler, '),(6,'F','Si cumple con los requisitos de ley este tipo de licencia le permitirá  conducir taxis co'),(7,'G','Para maquinaria agrícola, maquinaria pesada, equipos camineros (tractores, moto nivelador'),(8,'A1','ciclomotores, motocicletas, tricimotos,  cuadrones y triciclos motorizados de servicio co'),(9,'C1','Ambulancias'),(10,'E1','Trolebus, metro');
/*!40000 ALTER TABLE `licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numproc`
--

DROP TABLE IF EXISTS `numproc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numproc` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `usrext_has_procedure_usrext_id` int NOT NULL,
  `usrext_has_procedure_usrext_person_id` int NOT NULL,
  `usrext_has_procedure_procedure_id` int NOT NULL,
  PRIMARY KEY (`id`,`usrext_has_procedure_usrext_id`,`usrext_has_procedure_usrext_person_id`,`usrext_has_procedure_procedure_id`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  KEY `fk_numproc_usrext_has_procedure1_idx` (`usrext_has_procedure_usrext_id`,`usrext_has_procedure_usrext_person_id`,`usrext_has_procedure_procedure_id`),
  CONSTRAINT `fk_numproc_usrext_has_procedure1` FOREIGN KEY (`usrext_has_procedure_usrext_id`, `usrext_has_procedure_usrext_person_id`, `usrext_has_procedure_procedure_id`) REFERENCES `usrext_has_procedure` (`usrext_id`, `usrext_person_id`, `procedure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numproc`
--

LOCK TABLES `numproc` WRITE;
/*!40000 ALTER TABLE `numproc` DISABLE KEYS */;
/*!40000 ALTER TABLE `numproc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `lastname` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `names` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `treat` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usraxis_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_person_usraxis_idx` (`usraxis_id`),
  CONSTRAINT `fk_person_usraxis` FOREIGN KEY (`usraxis_id`) REFERENCES `usraxis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure`
--

DROP TABLE IF EXISTS `procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kind` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `desc` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kind_UNIQUE` (`kind`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (1,'EMISIÓN DE LICENCIA POR PRIMERA VEZ',NULL),(2,'RENOVACIÓN DE LICENCIA',NULL),(3,'DUPLICADO DE LICENCIA',NULL),(4,'HOMOLOGACIÓN DE LICENCIA',NULL),(5,'CANJE DE LICENCIA',NULL),(6,'PERMISO INTERNACIONAL DE CONDUCCIÓN',NULL);
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure_has_licence`
--

DROP TABLE IF EXISTS `procedure_has_licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure_has_licence` (
  `procedure_id` int NOT NULL,
  `licence_id` int NOT NULL,
  PRIMARY KEY (`procedure_id`,`licence_id`),
  KEY `fk_procedure_has_licence_licence1_idx` (`licence_id`),
  KEY `fk_procedure_has_licence_procedure1_idx` (`procedure_id`),
  CONSTRAINT `fk_procedure_has_licence_licence1` FOREIGN KEY (`licence_id`) REFERENCES `licence` (`id`),
  CONSTRAINT `fk_procedure_has_licence_procedure1` FOREIGN KEY (`procedure_id`) REFERENCES `procedure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure_has_licence`
--

LOCK TABLES `procedure_has_licence` WRITE;
/*!40000 ALTER TABLE `procedure_has_licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedure_has_licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usraxis`
--

DROP TABLE IF EXISTS `usraxis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usraxis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usraxis`
--

LOCK TABLES `usraxis` WRITE;
/*!40000 ALTER TABLE `usraxis` DISABLE KEYS */;
INSERT INTO `usraxis` VALUES (16,'AMACIASR'),(8,'AREVELO'),(9,'CMIELES'),(7,'EAGUAYO'),(18,'EPOZON'),(3,'ESANTILLAN'),(13,'GCASTRO'),(1,'HGUERRERO'),(10,'INAULA'),(2,'JCMUNOZ'),(5,'JPROJAS'),(17,'MOCHOA'),(11,'NCANDO'),(15,'OHUERTAS'),(6,'RVJIMENEZ'),(14,'VCASTRO'),(4,'VGUILLEN'),(12,'XCARRERA');
/*!40000 ALTER TABLE `usraxis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrext`
--

DROP TABLE IF EXISTS `usrext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usrext` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  PRIMARY KEY (`id`,`person_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_usrext_person1_idx` (`person_id`),
  CONSTRAINT `fk_usrext_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrext`
--

LOCK TABLES `usrext` WRITE;
/*!40000 ALTER TABLE `usrext` DISABLE KEYS */;
/*!40000 ALTER TABLE `usrext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrext_has_procedure`
--

DROP TABLE IF EXISTS `usrext_has_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usrext_has_procedure` (
  `usrext_id` int NOT NULL,
  `usrext_person_id` int NOT NULL,
  `procedure_id` int NOT NULL,
  `usraxis_id` int NOT NULL,
  PRIMARY KEY (`usrext_id`,`usrext_person_id`,`procedure_id`),
  KEY `fk_usrext_has_procedure_procedure1_idx` (`procedure_id`),
  KEY `fk_usrext_has_procedure_usrext1_idx` (`usrext_id`,`usrext_person_id`),
  KEY `fk_usrext_has_procedure_usraxis1_idx` (`usraxis_id`),
  CONSTRAINT `fk_usrext_has_procedure_procedure1` FOREIGN KEY (`procedure_id`) REFERENCES `procedure` (`id`),
  CONSTRAINT `fk_usrext_has_procedure_usraxis1` FOREIGN KEY (`usraxis_id`) REFERENCES `usraxis` (`id`),
  CONSTRAINT `fk_usrext_has_procedure_usrext1` FOREIGN KEY (`usrext_id`, `usrext_person_id`) REFERENCES `usrext` (`id`, `person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrext_has_procedure`
--

LOCK TABLES `usrext_has_procedure` WRITE;
/*!40000 ALTER TABLE `usrext_has_procedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `usrext_has_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'archivo'
--

--
-- Dumping routines for database 'archivo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 17:11:52
