-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: change_plak
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
-- Table structure for table `new_plak_car`
--

DROP TABLE IF EXISTS `new_plak_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_plak_car` (
  `user_priority_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `user_car_id` int unsigned DEFAULT NULL,
  `user_new_plak` varchar(9) DEFAULT NULL,
  `user_new_plak_city` varchar(15) DEFAULT NULL,
  `user_new_plak_address` text,
  PRIMARY KEY (`user_priority_id`),
  UNIQUE KEY `user_new_plak` (`user_new_plak`),
  KEY `user_id` (`user_id`),
  KEY `user_car_id` (`user_car_id`),
  CONSTRAINT `new_plak_car_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `new_plak_car_ibfk_2` FOREIGN KEY (`user_car_id`) REFERENCES `users_cars` (`user_car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_plak_car`
--

LOCK TABLES `new_plak_car` WRITE;
/*!40000 ALTER TABLE `new_plak_car` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_plak_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `user_fname` varchar(15) DEFAULT NULL,
  `user_lname` varchar(20) DEFAULT NULL,
  `user_gender` tinyint(1) DEFAULT NULL,
  `user_age` int unsigned DEFAULT NULL,
  `user_city` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
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
-- Table structure for table `users_cars`
--

DROP TABLE IF EXISTS `users_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cars` (
  `user_car_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `user_car_name` varchar(10) DEFAULT NULL,
  `user_car_background` int unsigned DEFAULT NULL,
  `user_old_plak` varchar(9) DEFAULT NULL,
  `user_address` text,
  PRIMARY KEY (`user_car_id`),
  UNIQUE KEY `user_old_plak` (`user_old_plak`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_cars_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_cars`
--

LOCK TABLES `users_cars` WRITE;
/*!40000 ALTER TABLE `users_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_cars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01  8:23:51
