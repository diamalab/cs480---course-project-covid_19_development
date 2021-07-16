-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: covid_19_development
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Chicago'),(2,'Naperville'),(3,'Bolingbrook');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covid_results`
--

DROP TABLE IF EXISTS `covid_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_results` (
  `ID` int unsigned NOT NULL,
  `SSN` int unsigned NOT NULL,
  `test_day` varchar(45) NOT NULL,
  `diagnosis_day` varchar(45) NOT NULL,
  `results` varchar(45) NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `hospital_id_idx` (`hospital_id`),
  CONSTRAINT `hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_results`
--

LOCK TABLES `covid_results` WRITE;
/*!40000 ALTER TABLE `covid_results` DISABLE KEYS */;
INSERT INTO `covid_results` VALUES (1,652314569,'2021-01-19','2021-01-25','Negative',1),(2,753123654,'2021-02-03','2021-02-07','Negative',2),(3,784652319,'2021-03-05','2021-03-09','Negative',3);
/*!40000 ALTER TABLE `covid_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitals` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `City` int unsigned NOT NULL,
  `State` int unsigned NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `City_idx` (`City`),
  KEY `State_id_idx` (`State`),
  CONSTRAINT `City_id` FOREIGN KEY (`City`) REFERENCES `city` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `State_id` FOREIGN KEY (`State`) REFERENCES `state` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'Advocate Christ',2,3,'23 Jefferson St'),(2,'Delaware hospital',3,3,'89 Mckenzie blv'),(3,'UIC hospital',1,3,'789 Halsted st');
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `SSN` int unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `City` int unsigned NOT NULL,
  `State` int unsigned NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `City_idx` (`City`),
  KEY `State_idx` (`State`),
  CONSTRAINT `City` FOREIGN KEY (`City`) REFERENCES `city` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `State` FOREIGN KEY (`State`) REFERENCES `state` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (652314569,'Haoxuan Zeng','1998-10-05',3,3,'87 Belmont av'),(753123654,'William Escobar','1996-06-07',1,3,'65 Montrose st'),(784652319,'Heta Patel','1997-12-17',2,3,'34 Flower st');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `ID` int unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Alaska'),(2,'Alabama'),(3,'Illinois');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES ('cs480','cs480','cs480@gmail.com');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccinated`
--

DROP TABLE IF EXISTS `vaccinated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccinated` (
  `SSN` int unsigned NOT NULL,
  `vaccination_day` varchar(45) NOT NULL,
  `doses_taken` int unsigned NOT NULL,
  `vaccine_id` int unsigned NOT NULL,
  `hospital_id` int unsigned NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `vaccine_id_idx` (`vaccine_id`),
  KEY `hospital_id_idx` (`hospital_id`),
  CONSTRAINT `hospitals_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`ID`),
  CONSTRAINT `vaccine_id` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccinated`
--

LOCK TABLES `vaccinated` WRITE;
/*!40000 ALTER TABLE `vaccinated` DISABLE KEYS */;
INSERT INTO `vaccinated` VALUES (652314569,'2021-06-01',1,1,2),(753123654,'2021-06-03',2,2,3),(784652319,'2021-06-04',1,3,1);
/*!40000 ALTER TABLE `vaccinated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine` (
  `ID` int unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Doses` int unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine`
--

LOCK TABLES `vaccine` WRITE;
/*!40000 ALTER TABLE `vaccine` DISABLE KEYS */;
INSERT INTO `vaccine` VALUES (1,'Pfizer',2),(2,'Moderna',2),(3,'Astrazeneca',2);
/*!40000 ALTER TABLE `vaccine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-14  0:11:01
