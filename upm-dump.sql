-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: upm
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `upm`;
CREATE DATABASE `upm`;
USE `upm`;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryID` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Brazil'),(2,'United Kingdom'),(3,'Spain'),(4,'Italy'),(5,'Other');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographic_data`
--

DROP TABLE IF EXISTS `demographic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographic_data` (
  `demoID` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `country_birth` int(11) DEFAULT NULL,
  `proficiency` enum('A1','A2','B1','B2','C1','C2') DEFAULT NULL,
  `educational_level` enum('primary','secondary','undergraduate','postgraduate') DEFAULT NULL,
  `disability` set('physical','visual','hearing','mental','intellectual','learning') DEFAULT NULL,
  `familiarity_PA` enum('basic','intermediate','advanced') DEFAULT NULL,
  `userID` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `occupation` int(11) DEFAULT NULL,
  PRIMARY KEY (`demoID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  KEY `fk_demographic_data_country_idx` (`country_birth`),
  KEY `fk_demographic_data_occupation_idx` (`occupation`),
  CONSTRAINT `fk_demographic_data_country` FOREIGN KEY (`country_birth`) REFERENCES `country` (`countryID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_demographic_data_occupation` FOREIGN KEY (`occupation`) REFERENCES `occupation` (`occupationID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographic_data`
--

LOCK TABLES `demographic_data` WRITE;
/*!40000 ALTER TABLE `demographic_data` DISABLE KEYS */;
INSERT INTO `demographic_data` VALUES (1,30,1,'C1','postgraduate',NULL,'intermediate','user001',NULL),(2,27,2,'C2','undergraduate',NULL,'intermediate','user002',NULL),(7,21,1,'A1','secondary','','basic','user020',NULL),(9,21,1,'A1','secondary',NULL,NULL,'user030',NULL),(11,50,3,'C1','undergraduate',NULL,NULL,'user040',NULL),(12,50,3,'C1','undergraduate',NULL,NULL,'user050',NULL),(13,50,1,'C1','undergraduate',NULL,NULL,'user060',NULL),(15,50,1,'C1','undergraduate',NULL,NULL,'user070',NULL),(16,50,1,'C1','undergraduate',NULL,NULL,'user080',NULL),(18,50,5,'C1','undergraduate',NULL,NULL,'user090',NULL),(19,50,5,'C1','undergraduate',NULL,NULL,'user100',NULL),(20,40,5,'C2','postgraduate',NULL,NULL,'user200',NULL),(21,40,5,'C2','postgraduate',NULL,NULL,'user300',NULL),(22,40,5,'C2','postgraduate',NULL,NULL,'user400',NULL);
/*!40000 ALTER TABLE `demographic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaction_data_elaboration`
--

DROP TABLE IF EXISTS `interaction_data_elaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaction_data_elaboration` (
  `interactionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` enum('image','wikipedia') NOT NULL,
  `feedback` tinyint(4) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `demoID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`interactionID`),
  KEY `fk_interaction_data_elaboration_demo_idx` (`demoID`),
  CONSTRAINT `fk_interaction_data_elaboration_demo` FOREIGN KEY (`demoID`) REFERENCES `demographic_data` (`demoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interaction_data_wf`
--

DROP TABLE IF EXISTS `interaction_data_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaction_data_wf` (
  `interactionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback` tinyint(4) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `demoID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`interactionID`),
  KEY `fk_interaction_data_wf_demo_idx` (`demoID`),
  CONSTRAINT `fk_interaction_data_wf_demo` FOREIGN KEY (`demoID`) REFERENCES `demographic_data` (`demoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `interaction_data_syntactic`
--

DROP TABLE IF EXISTS `interaction_data_syntactic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaction_data_syntactic` (
  `interactionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `original_text` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `simplified_text` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `feedback` tinyint(4) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `demoID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`interactionID`),
  KEY `fk_interaction_data_syntactic_demo_idx` (`demoID`),
  CONSTRAINT `fk_interaction_data_syntactic_demo` FOREIGN KEY (`demoID`) REFERENCES `demographic_data` (`demoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `interaction_data_lexical`
--

DROP TABLE IF EXISTS `interaction_data_lexical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaction_data_lexical` (
  `interactionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `original_text` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `simplified_text` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `context` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `index_context` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `feedback` tinyint(4) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `demoID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`interactionID`),
  KEY `fk_interaction_data_lexical_demo_idx` (`demoID`),
  CONSTRAINT `fk_interaction_data_lexical_demo` FOREIGN KEY (`demoID`) REFERENCES `demographic_data` (`demoID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languageID` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`languageID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'Portuguese'),(2,'English'),(3,'Polish'),(4,'Spanish'),(5,'Galician'),(6,'Italian'),(7,'Other');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `native_languages`
--

DROP TABLE IF EXISTS `native_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `native_languages` (
  `nativeID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `native_language` int(11) DEFAULT NULL,
  PRIMARY KEY (`nativeID`),
  KEY `fk_native_languages_demo_idx` (`userID`),
  KEY `fk_native_languages_lang_idx` (`native_language`),
  CONSTRAINT `fk_native_languages_demo` FOREIGN KEY (`userID`) REFERENCES `demographic_data` (`demoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_native_languages_lang` FOREIGN KEY (`native_language`) REFERENCES `languages` (`languageID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `native_languages`
--

LOCK TABLES `native_languages` WRITE;
/*!40000 ALTER TABLE `native_languages` DISABLE KEYS */;
INSERT INTO `native_languages` VALUES (1,1,1),(2,2,2),(3,15,1),(4,16,1),(5,16,4),(6,16,2),(7,18,1),(8,18,4),(10,19,1),(11,19,4),(12,19,7),(13,20,2),(14,20,3),(15,20,7),(16,21,2),(17,21,3),(18,21,7),(19,22,2),(20,22,3),(21,22,7);
/*!40000 ALTER TABLE `native_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupation`
--

DROP TABLE IF EXISTS `occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupation` (
  `occupationID` int(11) NOT NULL AUTO_INCREMENT,
  `occupation` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`occupationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupation`
--

LOCK TABLES `occupation` WRITE;
/*!40000 ALTER TABLE `occupation` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `upID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userID` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `profile` int(11) DEFAULT NULL,
  PRIMARY KEY (`upID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  CONSTRAINT `fk_user_profiles_demo` FOREIGN KEY (`userID`) REFERENCES `demographic_data` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-05 15:38:38
