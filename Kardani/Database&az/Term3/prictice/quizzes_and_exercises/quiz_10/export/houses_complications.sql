-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: house_complications
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
-- Table structure for table `payment_complications`
--

DROP TABLE IF EXISTS `payment_complications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_complications` (
  `payment_serial` int unsigned NOT NULL,
  `serial_number` int unsigned DEFAULT NULL,
  `id` int unsigned DEFAULT NULL,
  `deposit_day_time` datetime DEFAULT NULL,
  `deposit_status` enum('accepted, dismiss, expire') DEFAULT NULL,
  `deposit_price` decimal(16,3) DEFAULT NULL,
  PRIMARY KEY (`payment_serial`),
  KEY `serial_number` (`serial_number`),
  KEY `id` (`id`),
  CONSTRAINT `payment_complications_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `users` (`serial_number`),
  CONSTRAINT `payment_complications_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users_houses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_complications`
--

LOCK TABLES `payment_complications` WRITE;
/*!40000 ALTER TABLE `payment_complications` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_complications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `serial_number` int unsigned NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `natural_code` varchar(11) DEFAULT NULL,
  `account_serial` int unsigned DEFAULT NULL,
  PRIMARY KEY (`serial_number`),
  UNIQUE KEY `natural_code` (`natural_code`),
  UNIQUE KEY `account_serial` (`account_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_houses`
--

DROP TABLE IF EXISTS `users_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_houses` (
  `id` int unsigned NOT NULL,
  `serial_number` int unsigned DEFAULT NULL,
  `register_plak` varchar(10) DEFAULT NULL,
  `address` text,
  `blue_plak` int DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `region_section_number` int DEFAULT NULL,
  `Neighbourhood_number` int DEFAULT NULL,
  `block` int unsigned DEFAULT NULL,
  `melk_number` int unsigned DEFAULT NULL,
  `construction_year` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serial_number` (`serial_number`),
  CONSTRAINT `users_houses_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `users` (`serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_houses`
--

LOCK TABLES `users_houses` WRITE;
/*!40000 ALTER TABLE `users_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_houses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-05  8:43:34
