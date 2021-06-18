-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: university
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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `cour_id` int unsigned NOT NULL,
  `cour_name` varchar(30) DEFAULT NULL,
  `cour_unit` int DEFAULT NULL,
  `cour_duration` int DEFAULT NULL,
  `sub_study` enum('software','it','hardware','ict','robotic','pure accounting') DEFAULT NULL,
  PRIMARY KEY (`cour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int unsigned NOT NULL,
  `emp_natural_code` varchar(10) NOT NULL,
  `emp_fname` varchar(20) DEFAULT NULL,
  `emp_lname` varchar(30) DEFAULT NULL,
  `emp_degree` enum('Diploma','Bachelor','Master','PhD') DEFAULT NULL,
  `emp_age` int unsigned DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  `emp_tel` varchar(12) DEFAULT NULL,
  `emp_birth_date` date DEFAULT NULL,
  `emp_city` varchar(15) DEFAULT NULL,
  `emp_gender` tinyint(1) DEFAULT NULL,
  `emp_marriage` tinyint(1) DEFAULT NULL,
  `emp_background_years` int DEFAULT NULL,
  `cooperaion_date` date DEFAULT NULL,
  `resignation_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_natural_code` (`emp_natural_code`),
  CONSTRAINT `employees_chk_1` CHECK ((`emp_background_years` <= 32))
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
-- Table structure for table `final_eval`
--

DROP TABLE IF EXISTS `final_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final_eval` (
  `serial` int NOT NULL AUTO_INCREMENT,
  `std_id` int unsigned DEFAULT NULL,
  `cour_id` int unsigned DEFAULT NULL,
  `prof_id` int unsigned DEFAULT NULL,
  `cour_score` int unsigned DEFAULT NULL,
  PRIMARY KEY (`serial`),
  KEY `std_id` (`std_id`),
  KEY `cour_id` (`cour_id`),
  KEY `prof_id` (`prof_id`),
  CONSTRAINT `final_eval_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `students` (`std_id`),
  CONSTRAINT `final_eval_ibfk_2` FOREIGN KEY (`cour_id`) REFERENCES `courses` (`cour_id`),
  CONSTRAINT `final_eval_ibfk_3` FOREIGN KEY (`prof_id`) REFERENCES `professors` (`prof_id`),
  CONSTRAINT `final_eval_chk_1` CHECK ((`cour_score` between 0 and 20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_eval`
--

LOCK TABLES `final_eval` WRITE;
/*!40000 ALTER TABLE `final_eval` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_degrees`
--

DROP TABLE IF EXISTS `prof_degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prof_degrees` (
  `serial` int unsigned NOT NULL AUTO_INCREMENT,
  `prof_id` int unsigned NOT NULL,
  `prof_filed_sduty` varchar(50) DEFAULT NULL,
  `prof_degree` enum('Diploma','Bachelor','Master','PhD') DEFAULT NULL,
  PRIMARY KEY (`serial`),
  KEY `prof_id` (`prof_id`),
  CONSTRAINT `prof_degrees_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `professors` (`prof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_degrees`
--

LOCK TABLES `prof_degrees` WRITE;
/*!40000 ALTER TABLE `prof_degrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `prof_degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `prof_id` int unsigned NOT NULL,
  `prof_natural_code` varchar(10) NOT NULL,
  `prof_fname` varchar(20) DEFAULT NULL,
  `prof_lname` varchar(30) DEFAULT NULL,
  `prof_degree` enum('Diploma','Bachelor','Master','PhD') DEFAULT NULL,
  `prof_age` int DEFAULT NULL,
  `prof_city` varchar(30) DEFAULT NULL,
  `prof_email` varchar(100) DEFAULT NULL,
  `prof_tel` varchar(11) DEFAULT NULL,
  `prof_background_years` int DEFAULT NULL,
  PRIMARY KEY (`prof_id`),
  UNIQUE KEY `prof_natural_code` (`prof_natural_code`),
  CONSTRAINT `professors_chk_1` CHECK ((`prof_background_years` <= 40))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_sys`
--

DROP TABLE IF EXISTS `profile_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_sys` (
  `agents_id` int unsigned NOT NULL,
  `std_username` varchar(50) DEFAULT NULL,
  `std_password` varchar(150) DEFAULT NULL,
  `agent_type` enum('students','professors','employees') DEFAULT NULL,
  PRIMARY KEY (`agents_id`),
  UNIQUE KEY `std_username` (`std_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_sys`
--

LOCK TABLES `profile_sys` WRITE;
/*!40000 ALTER TABLE `profile_sys` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_sys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provide_courses`
--

DROP TABLE IF EXISTS `provide_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provide_courses` (
  `provide_id` int unsigned NOT NULL,
  `prof_id` int unsigned DEFAULT NULL,
  `cour_id` int unsigned DEFAULT NULL,
  `term` int unsigned DEFAULT NULL,
  `std_capacity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`provide_id`),
  KEY `prof_id` (`prof_id`),
  KEY `cour_id` (`cour_id`),
  CONSTRAINT `provide_courses_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `professors` (`prof_id`),
  CONSTRAINT `provide_courses_ibfk_2` FOREIGN KEY (`cour_id`) REFERENCES `courses` (`cour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provide_courses`
--

LOCK TABLES `provide_courses` WRITE;
/*!40000 ALTER TABLE `provide_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `provide_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_employees`
--

DROP TABLE IF EXISTS `sections_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_employees` (
  `serial` int unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int unsigned DEFAULT NULL,
  `section_id` int unsigned DEFAULT NULL,
  `agent_type` enum('employee','admin') DEFAULT NULL,
  `cooperaion_date_insection` date DEFAULT NULL,
  `resignation_date_insection` date DEFAULT NULL,
  PRIMARY KEY (`serial`),
  KEY `emp_id` (`emp_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `sections_employees_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`),
  CONSTRAINT `sections_employees_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `university_sections` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_employees`
--

LOCK TABLES `sections_employees` WRITE;
/*!40000 ALTER TABLE `sections_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `std_optained_units`
--

DROP TABLE IF EXISTS `std_optained_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `std_optained_units` (
  `serial` int unsigned NOT NULL AUTO_INCREMENT,
  `std_id` int unsigned DEFAULT NULL,
  `cour_id` int unsigned DEFAULT NULL,
  `term` int unsigned DEFAULT NULL,
  PRIMARY KEY (`serial`),
  KEY `std_id` (`std_id`),
  KEY `cour_id` (`cour_id`),
  CONSTRAINT `std_optained_units_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `students` (`std_id`),
  CONSTRAINT `std_optained_units_ibfk_2` FOREIGN KEY (`cour_id`) REFERENCES `courses` (`cour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `std_optained_units`
--

LOCK TABLES `std_optained_units` WRITE;
/*!40000 ALTER TABLE `std_optained_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `std_optained_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `std_id` int unsigned NOT NULL,
  `std_natural_code` varchar(10) DEFAULT NULL,
  `std_fname` varchar(20) DEFAULT NULL,
  `std_lname` varchar(30) DEFAULT NULL,
  `std_father_name` varchar(15) DEFAULT NULL,
  `std_age` int DEFAULT NULL,
  `std_gender` tinyint(1) DEFAULT NULL,
  `accepted_time` int DEFAULT NULL,
  `graduate_date` int DEFAULT NULL,
  `std_city` varchar(20) DEFAULT NULL,
  `std_address` text,
  `diploma_avg` int DEFAULT NULL,
  `std_email` varchar(100) DEFAULT NULL,
  `std_tel` varchar(12) DEFAULT NULL,
  `std_birth_date` date DEFAULT NULL,
  `std_field_study` enum('Computer','Accounting','electronic') DEFAULT NULL,
  `std_sub_study` enum('software','it','hardware','ict','robotic','pure accounting') DEFAULT NULL,
  PRIMARY KEY (`std_id`),
  UNIQUE KEY `std_natural_code` (`std_natural_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_sections`
--

DROP TABLE IF EXISTS `university_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university_sections` (
  `section_id` int unsigned NOT NULL,
  `section_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_sections`
--

LOCK TABLES `university_sections` WRITE;
/*!40000 ALTER TABLE `university_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `university_sections` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07  7:57:18
