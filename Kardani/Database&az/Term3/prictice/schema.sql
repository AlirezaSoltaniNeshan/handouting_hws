-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: organization
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `corp_connection`
--

DROP TABLE IF EXISTS `corp_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_connection` (
  `serial` int NOT NULL AUTO_INCREMENT,
  `corp_id` int NOT NULL,
  `corp_connected_to` int NOT NULL,
  `cotract_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_connection`
--

LOCK TABLES `corp_connection` WRITE;
/*!40000 ALTER TABLE `corp_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corp_emp`
--

DROP TABLE IF EXISTS `corp_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_emp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(10) NOT NULL,
  `corp_serial` varchar(15) NOT NULL,
  `enroll_date` date DEFAULT NULL,
  `outrolling_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_id` (`emp_id`),
  UNIQUE KEY `corp_serial` (`corp_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_emp`
--

LOCK TABLES `corp_emp` WRITE;
/*!40000 ALTER TABLE `corp_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporation`
--

DROP TABLE IF EXISTS `corporation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporation` (
  `corp_id` int NOT NULL,
  `corp_serial` varchar(15) NOT NULL,
  `corp_name` varchar(20) DEFAULT NULL,
  `corp_email` varchar(50) DEFAULT NULL,
  `corp_tel` varchar(12) DEFAULT NULL,
  `corp_address` varchar(100) DEFAULT NULL,
  `employee_qty` int DEFAULT NULL,
  `corp_branch` varchar(3) DEFAULT NULL,
  `corp_type` varchar(15) DEFAULT NULL,
  `corp_account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`corp_id`),
  UNIQUE KEY `corp_serial` (`corp_serial`),
  UNIQUE KEY `corp_serial_2` (`corp_serial`),
  UNIQUE KEY `corp_account` (`corp_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporation`
--

LOCK TABLES `corporation` WRITE;
/*!40000 ALTER TABLE `corporation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `serial` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `family` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `natural_id` varchar(10) NOT NULL,
  `emp_de` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`serial`),
  UNIQUE KEY `emp_id` (`emp_id`),
  UNIQUE KEY `natural_id` (`natural_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 18:49:12
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: azdb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `favorite_food`
--

DROP TABLE IF EXISTS `favorite_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_food` (
  `person_id` int unsigned NOT NULL,
  `food_name` varchar(50) NOT NULL,
  PRIMARY KEY (`person_id`,`food_name`),
  CONSTRAINT `favorite_food_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_food`
--

LOCK TABLES `favorite_food` WRITE;
/*!40000 ALTER TABLE `favorite_food` DISABLE KEYS */;
INSERT INTO `favorite_food` VALUES (1,'Baghali Ghatogh'),(1,'Ghyme'),(1,'Pasta'),(1,'Pizza'),(2,'Mico sanoph'),(2,'Morgh'),(2,'Pasta'),(2,'Turkey Dolme');
/*!40000 ALTER TABLE `favorite_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `f_id` int unsigned NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `person_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `eye_color` enum('BR','BL','GR') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Alireza','Soltani Neshan','BR','2001-08-01','Farvardin-Jonobi','Tehran','Tehran','Iran','98778881'),(2,'Ahamad','Ahamdi','GR','2001-08-01','Farvardin-shomali','Tehran','Tehran','Iran','98778581');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18 18:49:13
