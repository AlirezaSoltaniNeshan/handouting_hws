-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: check_cars
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
-- Table structure for table `cars_users`
--

DROP TABLE IF EXISTS `cars_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_users` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(15) DEFAULT NULL,
  `user_lname` varchar(20) DEFAULT NULL,
  `user_car_name` varchar(15) DEFAULT NULL,
  `user_car_model` int unsigned DEFAULT NULL,
  `user_date_timing` datetime DEFAULT NULL,
  `user_plak` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_plak` (`user_plak`),
  CONSTRAINT `cars_users_chk_1` CHECK ((`user_car_model` between 80 and 99))
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_users`
--

LOCK TABLES `cars_users` WRITE;
/*!40000 ALTER TABLE `cars_users` DISABLE KEYS */;
INSERT INTO `cars_users` VALUES (10000,'Alireza','Soltani Neshan','Pejeout',84,'2005-06-09 00:00:00',NULL),(10001,'Ata','Soltani Neshan','Mercedes-Benz',98,'2019-08-10 00:00:00',NULL),(10002,'Babak','Farhadi','Saipa-Tiba',95,'2015-10-08 00:00:00',NULL),(10003,'محمد','حسيني','BMW',95,'2015-11-18 00:00:00',NULL),(10004,'علي','محمدي','Pride',90,'2010-12-01 00:00:00',NULL),(10005,'BAHAR','ALISHAHI','Pride',90,'2010-12-01 00:00:00',NULL),(10006,'SASAN','SAHLABI','Pride',90,'2010-12-01 00:00:00',NULL);
/*!40000 ALTER TABLE `cars_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experts`
--

DROP TABLE IF EXISTS `experts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experts` (
  `exp_id` int unsigned NOT NULL,
  `exp_fullname` varchar(100) DEFAULT NULL,
  `exp_phone` varchar(12) DEFAULT NULL,
  `exp_email` varchar(100) DEFAULT NULL,
  `exp_sign_in` datetime DEFAULT NULL,
  `exp_sign_out` datetime DEFAULT NULL,
  `exp_degree` varchar(15) DEFAULT NULL,
  `exp_shiftf` enum('day','night') DEFAULT NULL,
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experts`
--

LOCK TABLES `experts` WRITE;
/*!40000 ALTER TABLE `experts` DISABLE KEYS */;
INSERT INTO `experts` VALUES (1101,'AMIRABAS AMOLI','77212233','exp1@test.com','2000-05-06 12:54:32','2019-05-12 15:34:52','','day'),(1102,'BABK SAMAIE','77225588','exp2@test.com','2001-05-06 12:54:32','2020-05-12 15:34:52','','night');
/*!40000 ALTER TABLE `experts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exprets_check`
--

DROP TABLE IF EXISTS `exprets_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exprets_check` (
  `check_priority` int unsigned NOT NULL AUTO_INCREMENT,
  `exp_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `check_in_date_time` datetime DEFAULT NULL,
  `check_out_date_time` datetime DEFAULT NULL,
  `pay_price` decimal(12,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`check_priority`),
  KEY `exp_id` (`exp_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `exprets_check_ibfk_1` FOREIGN KEY (`exp_id`) REFERENCES `experts` (`exp_id`),
  CONSTRAINT `exprets_check_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `cars_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exprets_check`
--

LOCK TABLES `exprets_check` WRITE;
/*!40000 ALTER TABLE `exprets_check` DISABLE KEYS */;
INSERT INTO `exprets_check` VALUES (2,1101,10001,'2020-11-29 12:59:32','2020-11-29 13:35:40',25000.00),(3,1101,10001,'2020-11-29 12:59:32','2020-11-29 13:35:40',30000.00),(4,1101,10001,'2020-11-29 12:59:32','2020-11-29 13:35:40',35000.00);
/*!40000 ALTER TABLE `exprets_check` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-28  9:29:18
