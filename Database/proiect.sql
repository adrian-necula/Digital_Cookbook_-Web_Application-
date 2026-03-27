-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: proiect
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `idingredient` int NOT NULL AUTO_INCREMENT,
  `NumeIngredient` varchar(100) DEFAULT NULL,
  `Alergen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Ou','oua'),(2,'Cascaval','lapte'),(3,'Bacon',NULL);
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reteta_ingredient`
--

DROP TABLE IF EXISTS `reteta_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reteta_ingredient` (
  `idreteta_ingredient` int NOT NULL AUTO_INCREMENT,
  `idreteta` int DEFAULT NULL,
  `idingredient` int DEFAULT NULL,
  `Cantitate` decimal(10,2) DEFAULT NULL,
  `Unitate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idreteta_ingredient`),
  KEY `fk_link_1_idx` (`idreteta`),
  KEY `fk_link_2_idx` (`idingredient`),
  CONSTRAINT `fk_link_1` FOREIGN KEY (`idreteta`) REFERENCES `retete` (`idreteta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_link_2` FOREIGN KEY (`idingredient`) REFERENCES `ingrediente` (`idingredient`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reteta_ingredient`
--

LOCK TABLES `reteta_ingredient` WRITE;
/*!40000 ALTER TABLE `reteta_ingredient` DISABLE KEYS */;
INSERT INTO `reteta_ingredient` VALUES (1,1,1,2.00,'buc'),(2,1,2,50.00,'g'),(3,2,3,100.00,'g');
/*!40000 ALTER TABLE `reteta_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retete`
--

DROP TABLE IF EXISTS `retete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retete` (
  `idreteta` int NOT NULL AUTO_INCREMENT,
  `NumeReteta` varchar(100) DEFAULT NULL,
  `Descriere` varchar(255) DEFAULT NULL,
  `TimpPreparareMin` int DEFAULT NULL,
  `Portii` int DEFAULT NULL,
  PRIMARY KEY (`idreteta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retete`
--

LOCK TABLES `retete` WRITE;
/*!40000 ALTER TABLE `retete` DISABLE KEYS */;
INSERT INTO `retete` VALUES (1,'Omleta cu cascaval','Omleta simpla cu cascaval ras.',10,1),(2,'Paste carbonara','Paste cu sos cremos si bacon.',25,2),(3,'Salata greceasca','Rosii, castraveti, feta, masline.',15,2);
/*!40000 ALTER TABLE `retete` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-18  1:43:28
