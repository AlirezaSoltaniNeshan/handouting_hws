-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: task1
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
-- Table structure for table `corp_sections`
--

DROP TABLE IF EXISTS `corp_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corp_sections` (
  `section_id` int unsigned NOT NULL,
  `section_name` varchar(20) DEFAULT NULL,
  `corp_id` int DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `corp_id` (`corp_id`),
  CONSTRAINT `corp_sections_ibfk_1` FOREIGN KEY (`corp_id`) REFERENCES `corporation` (`corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corp_sections`
--

LOCK TABLES `corp_sections` WRITE;
/*!40000 ALTER TABLE `corp_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `corp_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporation`
--

DROP TABLE IF EXISTS `corporation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporation` (
  `corp_id` int NOT NULL,
  `corp_name` varchar(40) DEFAULT NULL,
  `corp_email` varchar(100) DEFAULT NULL,
  `corp_tel` varchar(15) DEFAULT NULL,
  `corp_city` varchar(20) DEFAULT NULL,
  `corp_addres` varchar(100) DEFAULT NULL,
  `corp_branches` varchar(20) DEFAULT NULL,
  `corp_type` varchar(20) DEFAULT NULL,
  `corp_account` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`corp_id`)
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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int unsigned NOT NULL,
  `person_id` int unsigned DEFAULT NULL,
  `corp_id` int DEFAULT NULL,
  `section_id` int unsigned DEFAULT NULL,
  `cooperaion_date` date DEFAULT NULL,
  `resignation_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `person_id` (`person_id`),
  KEY `corp_id` (`corp_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`person_id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`corp_id`) REFERENCES `corporation` (`corp_id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `corp_sections` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `food_id` int unsigned NOT NULL AUTO_INCREMENT,
  `food_name` varchar(15) DEFAULT NULL,
  `available_day` varchar(10) DEFAULT NULL,
  `food_verfy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
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
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `person_id` int unsigned NOT NULL,
  `natural_code` varchar(12) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `degree` enum('Diploma','Bachelor','Master','PhD') DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `brithdate` date DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `marriage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `self_service`
--

DROP TABLE IF EXISTS `self_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `self_service` (
  `tnx_id` int unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int unsigned DEFAULT NULL,
  `food_id` int unsigned DEFAULT NULL,
  `reserve_date` date DEFAULT NULL,
  `reserve_time` time DEFAULT NULL,
  `accepted_payment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tnx_id`),
  KEY `person_id` (`person_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `self_service_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`person_id`),
  CONSTRAINT `self_service_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `self_service`
--

LOCK TABLES `self_service` WRITE;
/*!40000 ALTER TABLE `self_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `self_service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-31 15:14:36
