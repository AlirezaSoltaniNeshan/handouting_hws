-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: online_shop
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
-- Table structure for table `cust_details`
--

DROP TABLE IF EXISTS `cust_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_details` (
  `cust_serial` int unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int unsigned DEFAULT NULL,
  `cust_address` text,
  `cust_phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`cust_serial`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `cust_details_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_details`
--

LOCK TABLES `cust_details` WRITE;
/*!40000 ALTER TABLE `cust_details` DISABLE KEYS */;
INSERT INTO `cust_details` VALUES (1,442587,'ايران، شهر پرديس، فروردين جنوبي، خيابان نيايس، مجتمع ستاره','21-76276585');
/*!40000 ALTER TABLE `cust_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_favorites`
--

DROP TABLE IF EXISTS `cust_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_favorites` (
  `favorites_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `cust_rated_product` int unsigned DEFAULT NULL,
  PRIMARY KEY (`favorites_id`),
  KEY `cust_id` (`cust_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cust_favorites_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  CONSTRAINT `cust_favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `cust_favorites_chk_1` CHECK ((`cust_rated_product` in (1,5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_favorites`
--

LOCK TABLES `cust_favorites` WRITE;
/*!40000 ALTER TABLE `cust_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cust_id` int unsigned NOT NULL,
  `cust_username` varchar(100) NOT NULL,
  `cust_password` varchar(200) NOT NULL,
  `cust_first_name` varchar(50) DEFAULT NULL,
  `cust_last_name` varchar(50) DEFAULT NULL,
  `cust_phone` varchar(12) DEFAULT NULL,
  `cust_input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_username` (`cust_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (442587,'alirezacodes','dd44$$dsjmncswq&=asddsgh558ddsfd20*','Alireza','Soltani','09198078346','2016-08-22 00:00:00');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `tnx_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `product_price_with_tax` decimal(15,3) DEFAULT NULL,
  `tnx_accepted` tinyint(1) DEFAULT NULL,
  `tnx_date` datetime DEFAULT NULL,
  `tnx_success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tnx_id`),
  KEY `cust_id` (`cust_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (100000,442587,5455151,44530000.000,1,'2020-11-19 00:00:00',1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `serial` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `product_color` varchar(15) DEFAULT NULL,
  `product_vendor` varchar(100) DEFAULT NULL,
  `product_vendor_branch` varchar(50) DEFAULT NULL,
  `product_vendor_address` varchar(200) DEFAULT NULL,
  `product_vendor_price` decimal(15,3) DEFAULT NULL,
  `product_vendor_product_qty` int unsigned DEFAULT NULL,
  PRIMARY KEY (`serial`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (1,3738701,'صورتي','ديجي کالا','تهران','ايران-تهران-جلفا',8270000.000,7),(2,3738701,'مشکي','ديجي کالا','تهران','ايران-تهران-جلفا',8270000.000,7),(3,3738701,'نقره اي','ديجي کالا','تهران','ايران-تهران-جلفا',8270000.000,7),(4,3738701,'نقره اي','کالا پلاس','تهران','ميدان صد',8270000.000,7),(8,5455151,'خاکستري','پيشرو تک','تهران','ايران-تهران-جلفا',44530000.000,7),(9,5455151,'خاکستري','رايان مال','تهران','ايران-تهران-جلفا',44545000.000,3),(10,109563,'سفيد','سافتپل','تهران','',2879000.000,10),(11,109563,'مشکي','سافتپل','تهران','',2879000.000,3),(12,109563,'سفيد','آواني','تهران','',2703990.000,5),(13,109563,'مشکي','آواني','تهران','',2700000.000,12);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int unsigned NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_brand` varchar(15) DEFAULT NULL,
  `product_categories` enum('digital','tools and instrument','clothing','cookware','toys','travel and exercise','food and drink') DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL,
  `product_main_price` decimal(15,2) DEFAULT NULL,
  `prodcut_available` tinyint(1) DEFAULT NULL,
  `product_qty` int unsigned DEFAULT NULL,
  `product_input_date` datetime DEFAULT NULL,
  `product_properties` text,
  `product_rating` int unsigned DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `products_chk_1` CHECK ((`product_rating` between 0 and 6))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (109563,'Magic Mouse 2','Apple','digital','Mouse',2879000.00,1,25,'2019-10-30 00:00:00','Wireless and Bluetooth',4),(3738701,'گوشی موبایل هوآوی مدل Y9a FRL-L22 دو سیم‌ کارت ظرفیت 128 گیگابایت','Huawei ','digital','Mobile',8270000.00,1,7,'2020-08-14 00:00:00','حافظه داخلی: 128 گیگابایت شبکه های ارتباطی: 4G، 3G، 2G سیستم عامل: Android ',4),(5455151,'MacBook Pro MXK32 2020','Apple','digital','Laptop',44530000.00,1,10,'2020-05-19 00:00:00','CPU: Core i5  quad-core 8th Generation (8257U) \n frequency:  1.4 - 3.9 GHz \n RAM: 8GB DDR3',4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_comment`
--

DROP TABLE IF EXISTS `users_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_comment` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `cust_id` int unsigned DEFAULT NULL,
  `comment_content` text,
  `comment_date_time` datetime DEFAULT NULL,
  `comment_rating` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `product_id` (`product_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `users_comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `users_comment_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  CONSTRAINT `users_comment_chk_1` CHECK ((`comment_rating` in (1,5)))
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_comment`
--

LOCK TABLES `users_comment` WRITE;
/*!40000 ALTER TABLE `users_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 16:17:36
