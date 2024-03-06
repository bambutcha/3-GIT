-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: cars
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.23.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Toyota'),(2,'Mercedes-Benz'),(3,'BMW'),(4,'Honda'),(5,'Volkswagen'),(6,'Porsche'),(7,'Audi'),(8,'Kia Motors');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `prod_yr` int DEFAULT NULL,
  `vrc` varchar(20) DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `owner_id` (`owner_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `person` (`entity_id`),
  CONSTRAINT `car_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `model` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,2024,'888 YO 000',1,10),(2,2012,'77 TK 123456',3,8),(3,2018,'111 PRNHUB 365',8,2);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `area` int DEFAULT NULL,
  `population` float DEFAULT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Russia',17098242,146.6),(2,'Canada',9984670,37.7),(3,'China',9596961,1400),(4,'USA',9525067,330.6),(5,'Brazil',8515767,211.8),(6,'Australia',7692024,25.7),(7,'India',3287263,1300);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factory` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `country_id` (`country_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `factory_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`entity_id`),
  CONSTRAINT `factory_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (1,1,3),(2,4,1),(3,3,1),(4,5,7),(5,2,4),(6,6,5),(7,7,2),(8,1,8),(9,1,6),(10,3,6);
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int DEFAULT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `line_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line`
--

LOCK TABLES `line` WRITE;
/*!40000 ALTER TABLE `line` DISABLE KEYS */;
INSERT INTO `line` VALUES (1,3,'X6'),(2,3,'X7'),(3,1,'Camry'),(4,1,'Corolla'),(5,2,'A-class'),(6,2,'B-class'),(7,8,'K');
/*!40000 ALTER TABLE `line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `line_id` int DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `line` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'XV10',3),(2,'XV70',3),(3,'Auris',4),(4,'Axio',4),(5,'X6 Hybrid',1),(8,'xDrive50i',1),(9,'K5',7),(10,'K7',7);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `entity_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Daniel','Yagolnik',17,1,'+7 919-899-29-85'),(2,'Alexander','Yagolnik',26,1,'+7 910-503-80-45'),(3,'Alexander','Butenko',22,1,'+7 988-531-91-46'),(4,'Artyom','Dmitrov',18,1,'+7 988-895-59-70'),(5,'Anna','Lagutenko',17,0,'+7 989-528-18-09'),(6,'Veronika','Aleshina',17,0,'+7 950-860-22-78'),(7,'Vladislava','Retivykh',18,0,'+7 988-478-59-80'),(8,'Vasya','Pupkin',15,1,'+7 800-555-35-35');
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

-- Dump completed on 2024-03-06 22:45:37
