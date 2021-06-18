-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: car_sys
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
-- Table structure for table `car_details`
--

DROP TABLE IF EXISTS `car_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `serial_id` int unsigned DEFAULT NULL,
  `production_number` int DEFAULT NULL,
  `production_color` varchar(10) DEFAULT NULL,
  `production_limit` text,
  PRIMARY KEY (`id`),
  KEY `serial_id` (`serial_id`),
  CONSTRAINT `car_details_ibfk_1` FOREIGN KEY (`serial_id`) REFERENCES `cars` (`serial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_details`
--

LOCK TABLES `car_details` WRITE;
/*!40000 ALTER TABLE `car_details` DISABLE KEYS */;
INSERT INTO `car_details` VALUES (1,123,50,'BLACK','مه شکن ندارد، صندلي گرم کن ندارد، ضبط ندارد');
/*!40000 ALTER TABLE `car_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `serial_id` int unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `pure_price` decimal(16,3) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` int unsigned DEFAULT NULL,
  PRIMARY KEY (`serial_id`),
  CONSTRAINT `cars_chk_1` CHECK ((`status` in (-(1),0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (123,'سمند',40000000.000,'2001-08-10',NULL,1),(125,'پژو 405',30000000.000,'2003-09-25',NULL,1),(126,'پژو پارس',20000000.000,'2007-09-25',NULL,1);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `tnx_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `car_serial_id` int unsigned DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `main_price` decimal(16,3) DEFAULT NULL,
  `price_with_vendor` decimal(16,3) DEFAULT NULL,
  `pay_status` int DEFAULT NULL,
  PRIMARY KEY (`tnx_id`),
  KEY `user_id` (`user_id`),
  KEY `car_serial_id` (`car_serial_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`car_serial_id`) REFERENCES `cars` (`serial_id`),
  CONSTRAINT `payment_chk_1` CHECK ((`pay_status` in (-(1),0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=20005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (20000,445588,123,'2020-12-09 12:30:58',40000000.000,45000000.000,1),(20003,445588,125,'2019-05-09 12:30:58',30000000.000,37000000.000,-1),(20004,557744,126,'2018-05-09 12:30:58',20000000.000,21000000.000,1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `entry_date` datetime DEFAULT NULL,
  `natural_code` varchar(12) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `users_chk_1` CHECK ((`age` >= 18))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (112255,'ALIREZA','MAARAM','ALIREZAMAR@GMAIL.COM','024236%^98sbasdh^*&*h4dsadakljd390242364hsbbkj@kHJ!^jadhsdjhks','2020-05-10 23:11:05','0025877611','1990-10-03',30),(445588,'مرجان','محمدي','mjMohamm@dyNaz','dsadakljd39024236478sdfhsbbkj@kHJ!^%^98sbasdh^*&*hjadhsdjhksakdhajsd','2020-05-10 23:11:05','0025877611','1995-10-03',25),(448877,'MOHSEN','BAHRAMI','BAHMAHMO@dyNaz','024236%^98sbasdh^*&*h4dsadakljd390242364hsbbkj@kHJ!^jadhsdjhks','2020-05-10 23:11:05','0025877611','1995-10-03',25),(557744,'اميرحسين','حسيني','amirParishanHosain','dsadaklj*&*hjadhsdbkj8sbas@kHJ!^%^9dh^jhksak@kHJ!^%^9dhaj@kHJ!^%^9sd','2005-11-18 05:45:00','0177899550','1983-07-30',37);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_addre`
--

DROP TABLE IF EXISTS `users_addre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_addre` (
  `serial` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`serial`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_addre_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_addre`
--

LOCK TABLES `users_addre` WRITE;
/*!40000 ALTER TABLE `users_addre` DISABLE KEYS */;
INSERT INTO `users_addre` VALUES (1,445588,'TEHRAN','تهران، تهران پارس، فکه سوم، ميدان پروين، خيابان 202، پلاک 50'),(2,557744,'PARDIS','پرديس، فروردين جنوبي، خيابان ستاره، جنب کوروش'),(3,557744,'PARDIS','پرديس، فروردين جنوبي، خيابان ستاره، جنب کوروش'),(4,557744,'PARDIS','پرديس، فروردين جنوبي، خيابان ستاره، جنب کوروش'),(5,557744,'PARDIS','پرديس، فروردين جنوبي، خيابان ستاره، جنب کوروش'),(6,557744,'PARDIS','پرديس، فروردين جنوبي، خيابان ستاره، جنب کوروش'),(7,445588,'TEHRAN','تهران، تهران پارس، فکه سوم، ميدان پروين، خيابان 202، پلاک 50'),(8,445588,'TEHRAN','تهران، تهران پارس، فکه سوم، ميدان پروين، خيابان 202، پلاک 50'),(9,445588,'TEHRAN','تهران، تهران پارس، فکه سوم، ميدان پروين، خيابان 202، پلاک 50'),(10,445588,'TEHRAN','تهران، تهران پارس، فکه سوم، ميدان پروين، خيابان 202، پلاک 50');
/*!40000 ALTER TABLE `users_addre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19  9:24:36
