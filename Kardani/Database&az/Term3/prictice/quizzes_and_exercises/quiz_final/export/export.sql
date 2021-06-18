-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: sazman_bargh
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `pay_tnx` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `file_serial` int DEFAULT NULL,
  `pay_status` varchar(2) DEFAULT NULL,
  `pay_dt` datetime DEFAULT NULL,
  `pay_desc` text,
  PRIMARY KEY (`pay_tnx`),
  KEY `file_serial` (`file_serial`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`file_serial`) REFERENCES `user_stuff` (`file_serial`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stuf_usage`
--

DROP TABLE IF EXISTS `user_stuf_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stuf_usage` (
  `row_id` int NOT NULL AUTO_INCREMENT,
  `file_serial` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `consum_elec` varchar(50) DEFAULT NULL,
  `consum_usage_temporal` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `file_serial` (`file_serial`),
  CONSTRAINT `user_stuf_usage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_stuf_usage_ibfk_2` FOREIGN KEY (`file_serial`) REFERENCES `user_stuff` (`file_serial`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stuf_usage`
--

LOCK TABLES `user_stuf_usage` WRITE;
/*!40000 ALTER TABLE `user_stuf_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stuf_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stuff`
--

DROP TABLE IF EXISTS `user_stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stuff` (
  `file_serial` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `address` text,
  `city` varchar(20) DEFAULT NULL,
  `house_plate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`file_serial`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_stuff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stuff`
--

LOCK TABLES `user_stuff` WRITE;
/*!40000 ALTER TABLE `user_stuff` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stuff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (123,'asn.codes','1323546749879849515131321','Alireza','Soltani Neshan','2020-05-15 12:18:43','user'),(124,'DsnMonk','132354674987984951513132113235467498798495151313211323546749879849515131321','Kobra','Kibarie','2020-12-25 23:58:13','user'),(125,'KeyIf','132354674987984951513132113235467498798495151313211323546749879849515131321','Keyvan','php','2020-12-25 23:58:13','user'),(126,'Mehrdad','132354674987984951513132113235467498798495151313211323546749879849515131321','Jan','Json','2020-12-25 23:58:13','user'),(127,'FarFarhadi','132354674987984951513132113235467498798495151313211323546749879849515131321','Babak','Farhaddi','2020-12-25 23:58:13','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-26  9:03:40
