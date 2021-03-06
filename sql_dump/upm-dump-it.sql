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

DROP DATABASE IF EXISTS `upm-it`;
CREATE DATABASE `upm-it`;
USE `upm-it`;

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
INSERT INTO `country` VALUES (1,'Afghanistan'), (2,'Albania'), (3,'Algeria'), (4,'Andorra'), (5,'Angola'), (6,'Antigua e Barbuda'), (7,'Arabia Saudita'), (8,'Argentina'), (9,'Armenia'), (10,'Australia'), (11,'Austria'), (12,'Azerbaigian'), (13,'Bahamas'), (14,'Bahrein'), (15,'Bangladesh'), (16,'Barbados'), (17,'Belgio'), (18,'Belize'), (19,'Benin'), (20,'Bhutan'), (21,'Bielorussia'), (22,'Bolivia'), (23,'Bosnia ed Erzegovina'), (24,'Botswana'), (25,'Brasile'), (26,'Brunei'), (27,'Bulgaria'), (28,'Burkina Faso'), (29,'Burundi'), (30,'Cambogia'), (31,'Camerun'), (32,'Canada'), (33,'Capo Verde'), (34,'Ciad'), (35,'Cile'), (36,'Cina'), (37,'Cipro'), (38,'Colombia'), (39,'Comore'), (40,'Rep. del Congo'), (41,'RD del Congo'), (42,'Corea del Nord'), (43,'Corea del Sud'), (44,'Costa d\'Avorio'), (45,'Costa Rica'), (46,'Croazia'), (47,'Cuba'), (48,'Danimarca'), (49,'Dominica'), (50,'Ecuador'), (51,'Egitto'), (52,'El Salvador'), (53,'Emirati Arabi Uniti'), (54,'Eritrea'), (55,'Estonia'), (56,'Etiopia'), (57,'Figi'), (58,'Filippine'), (59,'Finlandia'), (60,'Francia'), (61,'Gabon'), (62,'Gambia'), (63,'Georgia'), (64,'Germania'), (65,'Ghana'), (66,'Giamaica'), (67,'Giappone'), (68,'Gibuti'), (69,'Giordania'), (70,'Grecia'), (71,'Grenada'), (72,'Guatemala'), (73,'Guinea'), (74,'Guinea-Bissau'), (75,'Guinea Equatoriale'), (76,'Guyana'), (77,'Haiti'), (78,'Honduras'), (79,'India'), (80,'Indonesia'), (81,'Iran'), (82,'Iraq'), (83,'Irlanda'), (84,'Islanda'), (85,'Isole Marshall'), (86,'Isole Salomone'), (87,'Israele'), (88,'Italia'), (89,'Kazakistan'), (90,'Kenya'), (91,'Kirghizistan'), (92,'Kiribati'), (93,'Kuwait'), (94,'Laos'), (95,'Lesotho'), (96,'Lettonia'), (97,'Libano'), (98,'Liberia'), (99,'Libia'), (100,'Liechtenstein'), (101,'Lituania'), (102,'Lussemburgo'), (103,'Macedonia'), (104,'Madagascarar'), (105,'Malawi'), (106,'Maldive'), (107,'Malaysia'), (108,'Mali'), (109,'Malta'), (110,'Marocco'), (111,'Mauritania'), (112,'Mauritius'), (113,'Messico'), (114,'Micronesia'), (115,'Moldavia'), (116,'Monaco'), (117,'Mongolia'), (118,'Montenegro'), (119,'Mozambico'), (120,'Birmania'), (121,'Namibia'), (122,'Nauru'), (123,'Nepal'), (124,'Nicaragua'), (125,'Niger'), (126,'Nigeria'), (127,'Norvegia'), (128,'Nuova Zelanda'), (129,'Oman'), (130,'Paesi Bassi'), (131,'Pakistan'), (132,'Palau'), (133,'Palestina'), (134,'Panama'), (135,'Papua Nuova Guinea'), (136,'Paraguay'), (137,'Perù'), (138,'Polonia'), (139,'Portogallo'), (140,'Qatar'), (141,'Regno Unito'), (142,'Rep. Ceca'), (143,'Rep. Centrafricana'), (144,'Rep. Dominicana'), (145,'Sudafrica Repubblica'), (146,'Romania'), (147,'Ruanda'), (148,'Russia'), (149,'Saint Kitts e Nevis'), (150,'Saint Vincent e Grenadine'), (151,'Samoa'), (152,'San Marino'), (153,'Saint Lucia'), (154,'São Tomé'), (155,'Senegal'), (156,'Serbia'), (157,'Seychelles'), (158,'Sierra Leone'), (159,'Singapore'), (160,'Siria'), (161,'Slovacchia'), (162,'Slovenia'), (163,'Somalia'), (164,'Spagna'), (165,'Sri Lanka'), (166,'Stati Uniti'), (167,'Sudan'), (168,'Sudan del Sud'), (169,'Suriname'), (170,'Svezia'), (171,'Svizzera'), (172,'Swaziland'), (173,'Tagikistan'), (174,'Taiwan'), (175,'Tanzania'), (176,'Thailandia'), (177,'Timor Est'), (178,'Togo'), (179,'Tonga'), (180,'Trinidad e Tobago'), (181,'Tunisia'), (182,'Turchia'), (183,'Turkmenistan'), (184,'Tuvalu'), (185,'Ucraina'), (186,'Uganda'), (187,'Ungheria'), (188,'Uruguay'), (189,'Uzbekistan'), (190,'Vanuatu'), (191,'Città del Vaticano'), (192,'Venezuela'), (193,'Vietnam'), (194,'Yemen'), (195,'Zambia'), (196,'Zimbabwe'), (197, 'Altro / non elencato');
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
  `educational_level` enum('licenza elementare','licenza media','diploma','laurea', 'master/dottorato') DEFAULT NULL,
  `disability` set('fisica','visiva','uditiva','mentale','intellettiva','di apprendimento') DEFAULT NULL,
  `familiarity_PA` enum('base','intermedia','avanzata') DEFAULT NULL,
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
INSERT INTO `demographic_data` VALUES (1,30,1,'C1','laurea',NULL,'intermedia','user001',NULL),(2,27,2,'C2','diploma',NULL,'intermedia','user002',NULL),
(7,21,1,'A1','licenza media',NULL,'base','user020',NULL),(9,21,1,'A1','licenza media',NULL,NULL,'user030',NULL),(11,50,3,'C1','diploma',NULL,NULL,'user040',NULL),
(12,50,3,'C1','laurea',NULL,NULL,'user050',NULL),(13,50,1,'C1','laurea',NULL,NULL,'user060',NULL),(15,50,1,'C1','master/dottorato',NULL,NULL,'user070',NULL),
(16,50,1,'C1','diploma',NULL,NULL,'user080',NULL),(18,50,5,'C1','laurea',NULL,NULL,'user090',NULL),(19,50,5,'C1','diploma',NULL,NULL,'user100',NULL),
(20,40,5,'C2','master/dottorato',NULL,NULL,'user200',NULL),(21,40,5,'C2','laurea',NULL,NULL,'user300',NULL),(22,40,5,'C2','laurea',NULL,NULL,'user400',NULL);
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
INSERT INTO `languages` VALUES (1,'Akan'), (2,'Amarico'), (3,'Arabo'), (4,'Armeno'), (5,'Assamese'), (6,'Azero'), (7,'Baluchi'), (8,'Bengalese (Bangla)'), (9,'Bhojpuri'), (10,'Birmano'), (11,'Bulgaro'), (12,'Catalano'), (13,'Cebuano'), (14,'Ceco'), (15,'Chhattisgarhi'), (16,'Chichewa'), (17,'Chittagonian'), (18,'Cinese'), (19,'Coreano'), (20,'Creole Haitiano'), (21,'Curdo'), (22,'Danese'), (23,'Deccan'), (24,'Ebraico'), (25,'Filippino (Tagalog)'), (26,'Finlandese'), (27,'Francese'), (28,'Fula'), (29,'Gan'), (30,'Giapponese'), (31,'Giavanese'), (32,'Gikuyu'), (33,'Greco'), (34,'Gujarati'), (35,'Hakka'), (36,'Haryanvi'), (37,'Hausa'), (38,'Hindi-Urdu'), (39,'Igbo'), (40,'Ilocano'), (41,'Inglese'), (42,'Italiano'), (43,'Kanauji'), (44,'Kannada'), (45,'Kazako'), (46,'Khmer'), (47,'Kinyarwanda'), (48,'Konkani'), (49,'Madurese'), (50,'Magahi'), (51,'Maithili'), (52,'Malayalam'), (53,'Malese-Indonesiano'), (54,'Malgascio'), (55,'Marathi'), (56,'Marwari'), (57,'Min Bei'), (58,'Min Dong'), (59,'Min Nan (Taiwanese)'), (60,'Nepalese'), (61,'Olandese'), (62,'Oriya'), (63,'Oromo'), (64,'Pashto'), (65,'Persiano (Farsi)'), (66,'Polacco'), (67,'Portoghese'), (68,'Punjabi'), (69,'Quechua'), (70,'Rajasthani'), (71,'Rangpuri'), (72,'Rumeno'), (73,'Russo'), (74,'Serbo-Croato'), (75,'Shona'), (76,'Sindhi'), (77,'Singalese'), (78,'Slovacco'), (79,'Somalo'), (80,'Sondanese'), (81,'Spagnolo'), (82,'Svedese'), (83,'Sylheti'), (84,'Tamil'), (85,'Tataro'), (86,'Tedesco'), (87,'Telugu'), (88,'Thailandese'), (89,'Turco'), (90,'Turkmeno'), (91,'Ucraino'), (92,'Uiguro'), (93,'Ungherese'), (94,'Uzbeco'), (95,'Varhadi-Nagpuri'), (96,'Vietnamita'), (97,'Wu'), (98,'Xhosa'), (99,'Xiang (Hunanese)'), (100,'Yoruba'), (101,'Yue (Cantonese)'), (102,'Zhuang'), (103,'Zulu'), (104,'Altro / non elencato');
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
