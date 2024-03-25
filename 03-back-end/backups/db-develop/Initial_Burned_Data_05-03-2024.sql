CREATE DATABASE  IF NOT EXISTS `archivo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
  `class` varchar(2) COLLATE utf8_bin NOT NULL,
  `desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `class_UNIQUE` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence`
--

LOCK TABLES `licence` WRITE;
/*!40000 ALTER TABLE `licence` DISABLE KEYS */;
INSERT INTO `licence` VALUES (1,'A','Para conducción de vehículos motorizados como: ciclomotores, motocicletas, tricar, cuadrones, en el artículo 132, literal A, número 1 del Reglamento LOTTTSV).'),(2,'B','Para automóviles y camionetas con acoplados de hasta 1,75 toneladas de carga Útil o casas rodantes.'),(3,'C','Taxis convencionales, ejecutivos, camionetas livianas o mixta hasta 3.500 kg, hasta 8 pasajeros; vehículos de transporte de pasajeros de no más s de 25 asientos y los vehículos comprendidos en el tipo B.'),(4,'D','Servicio de pasajeros (intracantonales, interprovinciales, intraprovinciales, intrarregionales y por cuenta propia); y para vehículos del Estado ecuatoriano comprendidos en el tipo B y no considerados en el tipo C1.'),(5,'E','Camiones pesados y extra pesados con o sin remolque de más s de 3,5 toneladas, tráiler, volquetas, tanqueros, plataformas públicas, cuenta propia, otros camiones y los vehículos estatales con estas características.'),(6,'F','Si cumple con los requisitos de ley este tipo de licencia le permitirá  conducir taxis convencionales, ejecutivos, camionetas livianas o mixtas hasta 3500 kg)  (Resolución No. ANT-NACDSGRDI18-0000070 de 10 septiembre de 2018.'),(7,'G','Para maquinaria agrícola, maquinaria pesada, equipos camineros (tractores, moto niveladoras, retroexcavadoras, montacargas, palas mecánicas y otros).'),(8,'A1','Se conceden a usuarios que requieren la licencia por primera vez: ciclomotores, motocicletas, tricimotos,  cuadrones y tricilos motorizados de servicio comercial.'),(9,'C1','xxx'),(10,'E1','xxxx');
/*!40000 ALTER TABLE `licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) COLLATE utf8_bin NOT NULL,
  `firstname` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `names` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `treat` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'1727266742','GUERRERO CHICO','HILLARY MISHELL','GUERRERO CHICO HILLARY MISHELL',NULL,'Abg.','hillary-andino2@hotmail.com','0984546674'),(2,'1310589609','MUÑOZ CARDENAS','JOHANNA CAROLINA','MUÑOZ CARDENAS JOHANNA CAROLINA',NULL,'Lic.','carolinamunozcardenas@gmail.com','0984866675'),(3,'1724237456','SANTILLAN PILLAJO','LUIS EDUARDO','SANTILLAN PILLAJO LUIS EDUARDO',NULL,'Ing.','lesantillan@udlanet.ec','0984155744'),(4,'1717342727','GUILLEN HERRERA','MARIA VERONICA','GUILLEN HERRERA MARIA VERONICA',NULL,'Sra.','vgh04@hotmail.com','0969060488'),(5,'1724143498','ROJAS SALAZAR ','JONATHAN PAUL','ROJAS SALAZAR JONATHAN PAUL',NULL,'Tlgo.','paulro_43@hotmail.com','0987919811'),(6,'0104899596','JIMENEZ JIMENEZ','ROSA VIRGINIA','JIMENEZ JIMENEZ ROSA VIRGINIA',NULL,'Tlga.','rositajimenez0404@gmail.com','0983315555'),(7,'1803463270','AGUAYO ESCOBAR','EMMA MELISSA','AGUAYO ESCOBAR EMMA MELISSA',NULL,'Tlga.','meli.aguayoe@ant.gob.ec','0987506850'),(8,'0401427703','REVELO BURBANO','ALVARO GEOVANNY','REVELO BURBANO ALVARO GEOVANNY',NULL,'Sr.','geovanny_1992@hotmail.es','0988882036'),(9,'1713162459','MIELES ALARCON','CESAR ROBERTO','MIELES ALARCON CESAR ROBERTO',NULL,'Tlgo.','cesar_mieles@hotmail.com','0992927999'),(10,'1716457781','NAULA CHIMBOLEMA','TUPAC ISAAC','NAULA CHIMBOLEMA TUPAC ISAAC',NULL,'Lic.','is14cancer@hotmail.com','0999206465'),(11,'1716942865','CANDO SAQUINGA','NANCY JEANETH','CANDO SAQUINGA NANCY JEANETH',NULL,'Ing.','nancycando35@yahoo.com','0980586492'),(12,'1714331137','CARRERA GUERRON','XIMENA CECILIA','CARRERA GUERRON XIMENA CECILIA',NULL,'Ing.','ximecarrera09@gmail.com','0982296066'),(13,'1203575194','CASTRO RODRIGUEZ','GINA MARIUXI','CASTRO RODRIGUEZ GINA MARIUXI',NULL,'Ing.','gcastrords@gmail.com','0993309377'),(14,'1205351255','CASTRO YOZA','VERONICA ESTEFANIA','CASTRO YOZA VERONICA ESTEFANIA',NULL,'Tlga.','castroveronica27988@gmail.com','0994295112'),(15,'1720935392','HUERTAS PAREDES','OSWALDO RODRIGO','HUERTAS PAREDES OSWALDO RODRIGO',NULL,'Abg.','yogo_huertas@hotmail.com','3828890'),(16,'1714734389','MACIAS RUIZ','ALEJANDRO DAVID','MACIAS RUIZ ALEJANDRO DAVID',NULL,'Sr.','alejomaciasruiz@hotmail.com','0998382503'),(17,'1710898345','OCHOA CALDERON','MAURICIO RUBEN','OCHOA CALDERON MAURICIO RUBEN',NULL,'Ing.','mauricio8a2005@yahoo.com','0984814350'),(18,'1713878500','POZO NOROÑA','STALIN ERNESTO','POZO NOROÑA STALIN ERNESTO',NULL,'Tlgo.','stanleystell@gmail.com','0960999748'),(19,'1712268190','CASTRO PALLAROSO','PABLO TEODORO','PABLO TEODORO PABLO TEODORO',NULL,'Sr.','','0987435919'),(20,'2300137797','LOZANO LOOR','JONATHAN FERNANDO','LOZANO LOOR JONATHAN FERNANDO',NULL,'Sr.','','0992844949'),(21,'1716865066','GORDON ALBUJA','DIEGO GEOVANNY','GORDON ALBUJA DIEGO GEOVANNY',NULL,'Sr.','','0998694482'),(22,'0201922812','VALDIVIESO PURCACHI ','JEFFERSON STALIN','VALDIVIESO PURCACHI  JEFFERSON STALIN',NULL,'Sr.','','0963813226');
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
  `kind` varchar(70) COLLATE utf8_bin NOT NULL,
  `desc` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kind_UNIQUE` (`kind`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (1,'EMISIÓN DE LICENCIA POR PRIMERA VEZ',''),(2,'RENOVACIÓN DE LICENCIA',''),(3,'DUPLICADO O REIMPRESIÓN DE LICENCIA',''),(4,'HOMOLOGACIÓN DE LICENCIA',''),(5,'CANJE DE LICENCIA',''),(6,'PERMISO INTERNACIONAL DE CONDUCIR',''),(7,'REIMPRESION DE LICENCIA NO PROFESIONAL',' '),(8,'REIMPRESION DE LICENCIA  PROFESIONAL',' '),(9,'CAMBIO DE CATEGORIA x F',' ');
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure_has_person`
--

DROP TABLE IF EXISTS `procedure_has_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure_has_person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `procedure_id` int NOT NULL,
  `person_id` int NOT NULL,
  `licence_id` int NOT NULL,
  `usraxis_id` int NOT NULL,
  `usraxis_person_id` int NOT NULL,
  `fproc` date NOT NULL,
  `numproc` int NOT NULL,
  PRIMARY KEY (`id`,`procedure_id`,`person_id`,`licence_id`,`usraxis_id`,`usraxis_person_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `procedure_id_UNIQUE` (`procedure_id`),
  UNIQUE KEY `person_id_UNIQUE` (`person_id`),
  UNIQUE KEY `licence_id_UNIQUE` (`licence_id`),
  UNIQUE KEY `usraxis_id_UNIQUE` (`usraxis_id`),
  UNIQUE KEY `usraxis_person_id_UNIQUE` (`usraxis_person_id`),
  UNIQUE KEY `numproc_UNIQUE` (`numproc`),
  KEY `fk_procedure_has_person_person1_idx` (`person_id`),
  KEY `fk_procedure_has_person_procedure1_idx` (`procedure_id`),
  KEY `fk_procedure_has_person_licence1_idx` (`licence_id`),
  KEY `fk_procedure_has_person_usraxis1_idx` (`usraxis_id`,`usraxis_person_id`),
  CONSTRAINT `fk_procedure_has_person_licence1` FOREIGN KEY (`licence_id`) REFERENCES `licence` (`id`),
  CONSTRAINT `fk_procedure_has_person_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `fk_procedure_has_person_procedure1` FOREIGN KEY (`procedure_id`) REFERENCES `procedure` (`id`),
  CONSTRAINT `fk_procedure_has_person_usraxis1` FOREIGN KEY (`usraxis_id`, `usraxis_person_id`) REFERENCES `usraxis` (`id`, `person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure_has_person`
--

LOCK TABLES `procedure_has_person` WRITE;
/*!40000 ALTER TABLE `procedure_has_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedure_has_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usraxis`
--

DROP TABLE IF EXISTS `usraxis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usraxis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`id`,`person_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_usraxis_person1_idx` (`person_id`),
  CONSTRAINT `fk_usraxis_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usraxis`
--

LOCK TABLES `usraxis` WRITE;
/*!40000 ALTER TABLE `usraxis` DISABLE KEYS */;
INSERT INTO `usraxis` VALUES (16,'AMACIASR',16),(8,'AREVELO',8),(9,'CMIELES',9),(21,'DIGORDON',21),(7,'EAGUAYO',7),(18,'EPOZON',18),(3,'ESANTILLAN',3),(13,'GCASTRO',13),(1,'HGUERRERO',1),(10,'INAULA',10),(2,'JCMUNOZ',2),(20,'JLOZANO',20),(5,'JPROJAS',5),(17,'MOCHOA',17),(11,'NCANDO',11),(15,'OHUERTAS',15),(19,'PCASTRO',19),(6,'RVJIMENEZ',6),(22,'SVALDIVIES',22),(14,'VCASTRO',14),(4,'VGUILLEN',4),(12,'XCARRERA',12);
/*!40000 ALTER TABLE `usraxis` ENABLE KEYS */;
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

-- Dump completed on 2024-03-05 16:23:01
