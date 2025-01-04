CREATE DATABASE  IF NOT EXISTS `archivo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
-- Table structure for table `body`
--

DROP TABLE IF EXISTS `body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body` (
  `id` int NOT NULL AUTO_INCREMENT,
  `antecedentes` text,
  `hallazgos` text,
  `conclusiones` text,
  `recomendaciones` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body`
--

LOCK TABLES `body` WRITE;
/*!40000 ALTER TABLE `body` DISABLE KEYS */;
/*!40000 ALTER TABLE `body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_city_province1_idx` (`province_id`),
  CONSTRAINT `fk_city_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer`
--

DROP TABLE IF EXISTS `footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `realizadox` int DEFAULT NULL,
  `revisadox` int DEFAULT NULL,
  `aprobadox` int DEFAULT NULL,
  `ffooter` date DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_footer_person1_idx` (`person_id`),
  CONSTRAINT `fk_footer_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer`
--

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `de` varchar(45) DEFAULT NULL,
  `para` varchar(45) DEFAULT NULL,
  `asunto` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legalbasis`
--

DROP TABLE IF EXISTS `legalbasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legalbasis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(128) DEFAULT NULL,
  `contenido` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legalbasis`
--

LOCK TABLES `legalbasis` WRITE;
/*!40000 ALTER TABLE `legalbasis` DISABLE KEYS */;
/*!40000 ALTER TABLE `legalbasis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(2) NOT NULL,
  `desc` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `class_UNIQUE` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,'A','Para conducción de vehículos motorizados como: ciclomotores, motocicletas, tricar, cuadrones, en el artículo 132, literal A, número 1 del Reglamento LOTTTSV).'),(2,'B','Para automóviles y camionetas con acoplados de hasta 1,75 toneladas de carga Útil o casas rodantes.'),(3,'C','Taxis convencionales, ejecutivos, camionetas livianas o mixta hasta 3.500 kg, hasta 8 pasajeros; vehículos de transporte de pasajeros de no más s de 25 asientos y los vehículos comprendidos en el tipo B.'),(4,'D','Servicio de pasajeros (intracantonales, interprovinciales, intraprovinciales, intrarregionales y por cuenta propia); y para vehículos del Estado ecuatoriano comprendidos en el tipo B y no considerados en el tipo C1.'),(5,'E','Camiones pesados y extra pesados con o sin remolque de más s de 3,5 toneladas, tráiler, volquetas, tanqueros, plataformas públicas, cuenta propia, otros camiones y los vehículos estatales con estas características.'),(6,'F','Si cumple con los requisitos de ley este tipo de licencia le permitirá  conducir taxis convencionales, ejecutivos, camionetas livianas o mixtas hasta 3500 kg)  (Resolución No. ANT-NACDSGRDI18-0000070 de 10 septiembre de 2018.'),(7,'G','Para maquinaria agrícola, maquinaria pesada, equipos camineros (tractores, moto niveladoras, retroexcavadoras, montacargas, palas mecánicas y otros).'),(8,'A1','Ciclomotores, motocicletas, tricimotos,  cuadrones y triciclos motorizados de servicio comercial.'),(9,'C1','Para vehículos policiales, ambulancias, militares, municipales y en general todo vehículo público o particular de emergencia y control de seguridad.'),(10,'E1','Permite la conducción de ambulancias, auto bombas, trole-bus, vehículos de servicios de emergencias y transporte de mercancías peligrosas.'),(11,'D1','Recategorización');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `building` varchar(100) DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `shelf` varchar(50) DEFAULT NULL,
  `box` varchar(50) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'OFICINA DE ATENCIÓN AL USUARIO OCCIDENTAL','Av. Occidental - Quito 170132 Ecuador'),(2,'OFICINA DE ATENCIÓN AL USUARIO PLATAFORMA NORTE','RGH8+5CF Alfonso Pereira - Quito 170102 Ecuador'),(3,'OFICINA DE ATENCIÓN AL USUARIO PLATAFORMA SUR','PF43+VPF Av. Amaru Ñan - Quito 170146 Ecuador'),(4,'OFICINA DE ATENCIÓN AL USUARIO RUMIÑAHUI','MGFX+7H9 - Sangolquí 171103 Ecuador'),(5,'OFICINA DE ATENCIÓN AL USUARIO TUMBACO','Eugenio Espejo - Quito 170184 Ecuador'),(6,'OFICINA DE ATENCIÓN AL USUARIO MEJÍA','FCJG+G6G - Machachi Ecuador\r\n7,OFICINA DE ATENCIÓN AL USUARIO CAYAMBE,Av. Víctor Cartagena - Cayambe Ecuador\"');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(13) NOT NULL,
  `lastname` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `firstname` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `names` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `treat` varchar(45) DEFAULT NULL,
  `cargo` varchar(128) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  KEY `fk_person_city1_idx` (`city_id`),
  CONSTRAINT `fk_person_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'1727266742','GUERRERO CHICO','HILLARY MISHELL','GUERRERO CHICO HILLARY MISHELL',NULL,'Abg.','TÉCNICO EN EMISIÓN DE LICENCIAS','hillary-andino2@hotmail.com','0984546674',NULL),(2,'1310589609','MUÑOZ CARDENAS','JOHANNA CAROLINA','MUÑOZ CARDENAS JOHANNA CAROLINA',NULL,'Lic.','TÉCNICO EN EMISIÓN DE LICENCIAS','carolinamunozcardenas@gmail.com','0984866675',NULL),(3,'1724237456','SANTILLAN PILLAJO','LUIS EDUARDO','SANTILLAN PILLAJO LUIS EDUARDO',NULL,'Ing.','TÉCNICO EN EMISIÓN DE LICENCIAS','lesantillan@udlanet.ec','0984155744',NULL),(4,'1717342727','GUILLEN HERRERA','MARIA VERONICA','GUILLEN HERRERA MARIA VERONICA',NULL,'Sra.','TÉCNICO EN EMISIÓN DE LICENCIAS','vgh04@hotmail.com','0969060488',NULL),(5,'1724143498','ROJAS SALAZAR ','JONATHAN PAUL','ROJAS SALAZAR JONATHAN PAUL',NULL,'Tlgo.','TÉCNICO EN EMISIÓN DE LICENCIAS','paulro_43@hotmail.com','0987919811',NULL),(6,'0104899596','JIMENEZ JIMENEZ','ROSA VIRGINIA','JIMENEZ JIMENEZ ROSA VIRGINIA',NULL,'Tlga.','TÉCNICO EN EMISIÓN DE LICENCIAS','rositajimenez0404@gmail.com','0983315555',NULL),(7,'1803463270','AGUAYO ESCOBAR','EMMA MELISSA','AGUAYO ESCOBAR EMMA MELISSA',NULL,'Tlga.','TÉCNICO EN EMISIÓN DE LICENCIAS','meli.aguayoe@ant.gob.ec','0987506850',NULL),(8,'0401427703','REVELO BURBANO','ALVARO GEOVANNY','REVELO BURBANO ALVARO GEOVANNY',NULL,'Sr.','TÉCNICO EN EMISIÓN DE LICENCIAS','geovanny_1992@hotmail.es','0988882036',NULL),(9,'1713162459','MIELES ALARCON','CESAR ROBERTO','MIELES ALARCON CESAR ROBERTO',NULL,'Tlgo.','TÉCNICO EN EMISIÓN DE LICENCIAS','cesar_mieles@hotmail.com','0992927999',NULL),(10,'1716457781','NAULA CHIMBOLEMA','TUPAC ISAAC','NAULA CHIMBOLEMA TUPAC ISAAC',NULL,'Lic.','TÉCNICO EN EMISIÓN DE LICENCIAS','is14cancer@hotmail.com','0999206465',NULL),(11,'1716942865','CANDO SAQUINGA','NANCY JEANETH','CANDO SAQUINGA NANCY JEANETH',NULL,'Ing.','TÉCNICO EN EMISIÓN DE LICENCIAS','nancycando35@yahoo.com','0980586492',NULL),(12,'1714331137','CARRERA GUERRON','XIMENA CECILIA','CARRERA GUERRON XIMENA CECILIA',NULL,'Ing.','JEFE DE OFICINA DE ATENCIÓN AL USUARIO','ximecarrera09@gmail.com','0982296066',NULL),(13,'1203575194','CASTRO RODRIGUEZ','GINA MARIUXI','CASTRO RODRIGUEZ GINA MARIUXI',NULL,'Ing.','RECAUDADOR(A)','gcastrords@gmail.com','0993309377',NULL),(14,'1205351255','CASTRO YOZA','VERONICA ESTEFANIA','CASTRO YOZA VERONICA ESTEFANIA',NULL,'Tlga.','FOTÓGRAFO(A)','castroveronica27988@gmail.com','0994295112',NULL),(15,'1720935392','HUERTAS PAREDES','OSWALDO RODRIGO','HUERTAS PAREDES OSWALDO RODRIGO',NULL,'Abg.','TÉCNICO EN EMISIÓN DE LICENCIAS','yogo_huertas@hotmail.com','0999260295',NULL),(16,'1714734389','MACIAS RUIZ','ALEJANDRO DAVID','MACIAS RUIZ ALEJANDRO DAVID',NULL,'Sr.','TÉCNICO EN EMISIÓN DE LICENCIAS','alejomaciasruiz@hotmail.com','0998382503',NULL),(17,'1710898345','OCHOA CALDERON','MAURICIO RUBEN','OCHOA CALDERON MAURICIO RUBEN',NULL,'Ing.','TÉCNICO DE ARCHIVO Y DOCUMENTACIÓN','mauricio8a2005@yahoo.com','0984814350',NULL),(18,'1713878500','POZO NOROÑA','STALIN ERNESTO','POZO NOROÑA STALIN ERNESTO',NULL,'Tlgo.','TÉCNICO EN EMISIÓN DE LICENCIAS','stanleystell@gmail.com','0960999748',NULL),(19,'1712268190','CASTRO PALLAROSO','PABLO TEODORO','CASTRO PALLOROSO PABLO TEODORO',NULL,'Sr.','TÉCNICO EN EMISIÓN DE LICENCIAS','','0987435919',NULL),(20,'2300137797','LOZANO LOOR','JONATHAN FERNANDO','LOZANO LOOR JONATHAN FERNANDO',NULL,'Sr.','TÉCNICO EN EMISIÓN DE LICENCIAS','','0992844949',NULL),(21,'1716865066','GORDON ALBUJA','DIEGO GEOVANNY','GORDON ALBUJA DIEGO GEOVANNY',NULL,'Sr.','TÉCNICO EN EMISIÓN DE LICENCIAS','','0998694482',NULL),(22,'0201922812','VALDIVIESO PURCACHI ','JEFFERSON STALIN','VALDIVIESO PURCACHI JEFFERSON STALIN',NULL,'Sr.','TÉCNICO EN EMISIÓN DE LICENCIAS','','0963813226',NULL),(23,'0602906398','QUINTANA FREIRE','PABLO PATRICIO','QUINTANA FREIRE PABLO PATRICIO',NULL,'Lic.','TÉCNICO EN EMISIÓN DE LICENCIAS','pabilos@yahoo.es','0985531327',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_has_procedure`
--

DROP TABLE IF EXISTS `person_has_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_has_procedure` (
  `procedure_id` int NOT NULL,
  `identification` varchar(13) NOT NULL,
  `usraxis_id` int NOT NULL,
  `licence_id` int NOT NULL,
  `year_id` int NOT NULL,
  `status_id` int NOT NULL,
  `fproc` datetime NOT NULL,
  `ffin` datetime NOT NULL,
  `numproc` int NOT NULL,
  `numfojas` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `scan_id` int DEFAULT NULL,
  PRIMARY KEY (`procedure_id`),
  UNIQUE KEY `numproc_UNIQUE` (`numproc`),
  KEY `fk_person_has_procedure_procedure1_idx` (`procedure_id`),
  KEY `fk_person_has_procedure_usraxis1_idx` (`usraxis_id`),
  KEY `fk_person_has_procedure_licence1_idx` (`licence_id`),
  KEY `fk_person_has_procedure_year1_idx` (`year_id`),
  KEY `fk_person_has_procedure_status1_idx` (`status_id`),
  KEY `fk_person_has_procedure_location1_idx` (`location_id`),
  KEY `fk_person_has_procedure_scan1_idx` (`scan_id`),
  CONSTRAINT `fk_person_has_procedure_licence1` FOREIGN KEY (`licence_id`) REFERENCES `license` (`id`),
  CONSTRAINT `fk_person_has_procedure_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_person_has_procedure_procedure1` FOREIGN KEY (`procedure_id`) REFERENCES `procedure` (`id`),
  CONSTRAINT `fk_person_has_procedure_scan1` FOREIGN KEY (`scan_id`) REFERENCES `scan` (`id`),
  CONSTRAINT `fk_person_has_procedure_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_person_has_procedure_usraxis1` FOREIGN KEY (`usraxis_id`) REFERENCES `usraxis` (`id`),
  CONSTRAINT `fk_person_has_procedure_year1` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_has_procedure`
--

LOCK TABLES `person_has_procedure` WRITE;
/*!40000 ALTER TABLE `person_has_procedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_has_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure`
--

DROP TABLE IF EXISTS `procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kind` varchar(70) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kind_UNIQUE` (`kind`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (1,'EMISIÓN DE LICENCIA POR PRIMERA VEZ',' '),(2,'RENOVACIÓN DE LICENCIA',' '),(3,'DUPLICADO DE LICENCIA',' '),(4,'HOMOLOGACIÓN Y CANJE DE LICENCIA',' '),(5,'PERMISO INTERNACIONAL DE CONDUCCIÓN',' '),(6,'CAMBIO DE CATEGORÍA x F',' ');
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numinfo` varchar(45) NOT NULL,
  `person_has_procedure_person_id` int NOT NULL,
  `person_has_procedure_procedure_id` int NOT NULL,
  `status_id` int NOT NULL,
  `legalbasis_id` int NOT NULL,
  `footer_id` int NOT NULL,
  `header_id` int NOT NULL,
  `body_id` int NOT NULL,
  PRIMARY KEY (`id`,`legalbasis_id`),
  UNIQUE KEY `numinfo_UNIQUE` (`numinfo`),
  KEY `fk_report_person_has_procedure1_idx` (`person_has_procedure_person_id`,`person_has_procedure_procedure_id`),
  KEY `fk_report_status1_idx` (`status_id`),
  KEY `fk_report_legalbasis1_idx` (`legalbasis_id`),
  KEY `fk_report_footer1_idx` (`footer_id`),
  KEY `fk_report_header1_idx` (`header_id`),
  KEY `fk_report_body1_idx` (`body_id`),
  KEY `fk_report_person_has_procedure1` (`person_has_procedure_procedure_id`),
  CONSTRAINT `fk_report_body1` FOREIGN KEY (`body_id`) REFERENCES `body` (`id`),
  CONSTRAINT `fk_report_footer1` FOREIGN KEY (`footer_id`) REFERENCES `footer` (`id`),
  CONSTRAINT `fk_report_header1` FOREIGN KEY (`header_id`) REFERENCES `header` (`id`),
  CONSTRAINT `fk_report_legalbasis1` FOREIGN KEY (`legalbasis_id`) REFERENCES `legalbasis` (`id`),
  CONSTRAINT `fk_report_person_has_procedure1` FOREIGN KEY (`person_has_procedure_procedure_id`) REFERENCES `person_has_procedure` (`procedure_id`),
  CONSTRAINT `fk_report_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numorder` int NOT NULL,
  `freq` datetime NOT NULL,
  `qr` varchar(90) DEFAULT NULL,
  `obs` varchar(128) DEFAULT NULL,
  `person_has_procedure_person_id` int NOT NULL,
  `person_has_procedure_procedure_id` int NOT NULL,
  `report_id` int NOT NULL,
  `person_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numorder_UNIQUE` (`numorder`),
  KEY `fk_request_person_has_procedure1_idx` (`person_has_procedure_person_id`,`person_has_procedure_procedure_id`),
  KEY `fk_request_report1_idx` (`report_id`),
  KEY `fk_request_person1_idx` (`person_id`),
  KEY `fk_request_person_has_procedure1` (`person_has_procedure_procedure_id`),
  CONSTRAINT `fk_request_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `fk_request_person_has_procedure1` FOREIGN KEY (`person_has_procedure_procedure_id`) REFERENCES `person_has_procedure` (`procedure_id`),
  CONSTRAINT `fk_request_report1` FOREIGN KEY (`report_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scan`
--

DROP TABLE IF EXISTS `scan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `fcreate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename_UNIQUE` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scan`
--

LOCK TABLES `scan` WRITE;
/*!40000 ALTER TABLE `scan` DISABLE KEYS */;
/*!40000 ALTER TABLE `scan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshot`
--

DROP TABLE IF EXISTS `snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snapshot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(128) DEFAULT NULL,
  `report_id` int NOT NULL,
  `report_legalbasis_id` int NOT NULL,
  PRIMARY KEY (`id`,`report_id`,`report_legalbasis_id`),
  KEY `fk_snapshot_report1_idx` (`report_id`,`report_legalbasis_id`),
  CONSTRAINT `fk_snapshot_report1` FOREIGN KEY (`report_id`, `report_legalbasis_id`) REFERENCES `report` (`id`, `legalbasis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshot`
--

LOCK TABLES `snapshot` WRITE;
/*!40000 ALTER TABLE `snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'FINALIZADO'),(2,'EN REVISIÓN'),(3,'ENTREGADO'),(4,'INCOMPLETO'),(5,'DEVUELTO'),(6,'INEXISTENTE'),(7,'ARCHIVADO'),(8,'EN PROCESO'),(9,'FIRMA DEL DIRECTOR(A)');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usraxis`
--

DROP TABLE IF EXISTS `usraxis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usraxis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `person_id` int NOT NULL,
  `office_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_usraxis_person1_idx` (`person_id`),
  KEY `fk_usraxis_office1_idx` (`office_id`),
  CONSTRAINT `fk_usraxis_office1` FOREIGN KEY (`office_id`) REFERENCES `office` (`id`),
  CONSTRAINT `fk_usraxis_person1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usraxis`
--

LOCK TABLES `usraxis` WRITE;
/*!40000 ALTER TABLE `usraxis` DISABLE KEYS */;
INSERT INTO `usraxis` VALUES (1,'AMACIASR',16,2),(2,'AREVELO',8,2),(3,'CMIELES',9,2),(4,'DIGORDON',21,2),(5,'EAGUAYO',7,2),(6,'EPOZON',18,2),(7,'ESANTILLAN',3,2),(8,'GCASTRO',13,2),(9,'HGUERRERO',1,2),(10,'INAULA',10,2),(11,'JCMUNOZ',2,2),(12,'JLOZANO',20,2),(13,'JPROJAS',5,2),(14,'MOCHOA',17,2),(15,'NCANDO',11,2),(16,'OHUERTAS',15,2),(17,'PQUINTANA',23,2),(18,'PTCASTRO',19,2),(19,'RVJIMENEZ',6,2),(20,'SVALDIVIES',22,2),(21,'VCASTRO',14,2),(22,'VGUILLEN',4,2),(23,'XCARRERA',12,2);
/*!40000 ALTER TABLE `usraxis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(4) NOT NULL,
  `fstart` datetime DEFAULT NULL,
  `fclose` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,'2018','2018-01-03 00:00:00','2018-12-28 00:00:00'),(2,'2019','2019-01-02 00:00:00','2019-12-31 00:00:00'),(3,'2020','2020-01-02 00:00:00','2020-12-31 00:00:00'),(4,'2021','2021-01-04 00:00:00','2021-12-31 00:00:00'),(5,'2022','2022-01-03 00:00:00','2022-12-30 00:00:00'),(6,'2023','2023-01-03 00:00:00','2023-12-29 00:00:00'),(7,'2024','2024-01-02 00:00:00','2024-12-31 00:00:00');
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
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

-- Dump completed on 2024-10-22 14:20:48
