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
INSERT INTO `country` VALUES (1,'Afghanistan'), (2,'Albania'), (3,'Algeria'), (4,'Andorra'), (5,'Angola'), (6,'Antigua and Barbuda'), (7,'Argentina'), (8,'Armenia'), (9,'Australia'), (10,'Austria'), (11,'Azerbaijan'), (12,'Bahamas'), (13,'Bahrain'), (14,'Bangladesh'), (15,'Barbados'), (16,'Belarus'), (17,'Belgium'), (18,'Belize'), (19,'Benin'), (20,'Bhutan'), (21,'Bolivia'), (22,'Bosnia and Herzegovina'), (23,'Botswana'), (24,'Brazil'), (25,'Brunei'), (26,'Bulgaria'), (27,'Burkina Faso'), (28,'Burundi'), (29,'Cambodia'), (30,'Cameroon'), (31,'Canada'), (32,'Cape Verde'), (33,'Central African Republic'), (34,'Chad'), (35,'Chile'), (36,'China'), (37,'Colombia'), (38,'Comoros'), (39,'Congo, Democratic Republic of the'), (40,'Congo, Republic of the'), (41,'Cook Islands'), (42,'Costa Rica'), (43,'Croatia'), (44,'Cuba'), (45,'Cyprus'), (46,'Czech Republic'), (47,'Democratic People\'s Republic of Korea'), (48,'Denmark'), (49,'Djibouti'), (50,'Dominica'), (51,'Dominican Republic'), (52,'East Timor'), (53,'Ecuador'), (54,'Egypt'), (55,'El Salvador'), (56,'Equatorial Guinea'), (57,'Eritrea'), (58,'Estonia'), (59,'Ethiopia'), (60,'Fiji'), (61,'Finland'), (62,'France'), (63,'Gabon'), (64,'Gambia, The'), (65,'Georgia'), (66,'Germany'), (67,'Ghana'), (68,'Greece'), (69,'Grenada'), (70,'Guatemala'), (71,'Guinea'), (72,'Guinea-Bissau'), (73,'Guyana'), (74,'Haiti'), (75,'Honduras'), (76,'Hungary'), (77,'Iceland'), (78,'India'), (79,'Indonesia'), (80,'Iran'), (81,'Iraq'), (82,'Ireland'), (83,'Israel'), (84,'Italy'), (85,'Ivory Coast'), (86,'Jamaica'), (87,'Japan'), (88,'Jordan'), (89,'Kazakhstan'), (90,'Kenya'), (91,'Kiribati'), (92,'Kosovo'), (93,'Kuwait'), (94,'Kyrgyzstan'), (95,'Laos'), (96,'Latvia'), (97,'Lebanon'), (98,'Lesotho'), (99,'Liberia'), (100,'Libya'), (101,'Liechtenstein'), (102,'Lithuania'), (103,'Luxembourg'), (104,'Macedonia'), (105,'Madagascar'), (106,'Malawi'), (107,'Malaysia'), (108,'Maldives'), (109,'Mali'), (110,'Malta'), (111,'Marshall Islands'), (112,'Mauritania'), (113,'Mauritius'), (114,'Mexico'), (115,'Micronesia'), (116,'Moldova'), (117,'Monaco'), (118,'Mongolia'), (119,'Montenegro'), (120,'Morocco'), (121,'Mozambique'), (122,'Myanmar'), (123,'Namibia'), (124,'Nauru'), (125,'Nepal'), (126,'Netherlands'), (127,'New Zealand'), (128,'Nicaragua'), (129,'Niger'), (130,'Nigeria'), (131,'Niue'), (132,'Norway'), (133,'Oman'), (134,'Pakistan'), (135,'Palau'), (136,'Palestine'), (137,'Panama'), (138,'Papua New Guinea'), (139,'Paraguay'), (140,'People\'s Republic of China'), (141,'Peru'), (142,'Philippines'), (143,'Poland'), (144,'Portugal'), (145,'Qatar'), (146,'Republic of Korea'), (147,'Romania'), (148,'Russia'), (149,'Rwanda'), (150,'Saint Kitts and Nevis'), (151,'Saint Lucia'), (152,'Saint Vincent and the Grenadines'), (153,'Samoa'), (154,'San Marino'), (155,'São Tomé and Príncipe'), (156,'Saudi Arabia'), (157,'Senegal'), (158,'Serbia'), (159,'Seychelles'), (160,'Sierra Leone'), (161,'Singapore'), (162,'Slovakia'), (163,'Slovenia'), (164,'Solomon Islands'), (165,'Somalia'), (166,'South Africa'), (167,'South Sudan'), (168,'Spain'), (169,'Sri Lanka'), (170,'Sudan'), (171,'Suriname'), (172,'Swaziland'), (173,'Sweden'), (174,'Switzerland'), (175,'Syria'), (176,'Taiwan'), (177,'Tajikistan'), (178,'Tanzania'), (179,'Thailand'), (180,'Togo'), (181,'Tonga'), (182,'Trinidad and Tobago'), (183,'Tunisia'), (184,'Turkey'), (185,'Turkmenistan'), (186,'Tuvalu'), (187,'Uganda'), (188,'Ukraine'), (189,'United Arab Emirates'), (190,'United Kingdom'), (191,'United States'), (192,'Uruguay'), (193,'Uzbekistan'), (194,'Vanuatu'), (195,'Vatican City'), (196,'Venezuela'), (197,'Vietnam'), (198,'Yemen'), (199,'Zambia'), (200,'Zimbabwe');
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
INSERT INTO `demographic_data` VALUES (1,30,1,'C1','postgraduate',NULL,'intermediate','user1010',NULL),(2,27,2,'C2','undergraduate',NULL,'intermediate','user002',NULL),(7,21,1,'A1','secondary','','basic','user020',NULL),(9,21,1,'A1','secondary',NULL,NULL,'user030',NULL),(11,50,3,'C1','undergraduate',NULL,NULL,'user040',NULL),(12,50,3,'C1','undergraduate',NULL,NULL,'user050',NULL),(13,50,1,'C1','undergraduate',NULL,NULL,'user060',NULL),(15,50,1,'C1','undergraduate',NULL,NULL,'user070',NULL),(16,50,1,'C1','undergraduate',NULL,NULL,'user080',NULL),(18,50,5,'C1','undergraduate',NULL,NULL,'user090',NULL),(19,50,5,'C1','undergraduate',NULL,NULL,'user100',NULL),(20,40,5,'C2','postgraduate',NULL,NULL,'user200',NULL),(21,40,5,'C2','postgraduate',NULL,NULL,'user300',NULL),(22,40,5,'C2','postgraduate',NULL,NULL,'user400',NULL);
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


LOCK TABLES `interaction_data_lexical` WRITE;
INSERT INTO `interaction_data_lexical` VALUES (1,'amend','change','At least every 4 years or whenever the Council wishes to amend its Scheme , an Independent Remuneration Panel has to consider the Scheme and make recommendations to the Council .', '11', 0, NULL, '224'), (2,'amend','remedy','At least every 4 years or whenever the Council wishes to amend its Scheme , an Independent Remuneration Panel has to consider the Scheme and make recommendations to the Council .', '11', 0, NULL, '224'), (3,'amend','remediate','At least every 4 years or whenever the Council wishes to amend its Scheme , an Independent Remuneration Panel has to consider the Scheme and make recommendations to the Council .', '11', 0, NULL, '224'), (4,'award','give','Make sure your child s name is placed on the register at the Learning Destination , and they ll send us their register to let us know to award credits .','28', 1, NULL, '224'), (5,'award','granted','Make sure your child s name is placed on the register at the Learning Destination , and they ll send us their register to let us know to award credits .','28', 0, NULL, '224'), (6,'award','submit','Make sure your child s name is placed on the register at the Learning Destination , and they ll send us their register to let us know to award credits .','28', 0, NULL, '224'), (7,'oversees','manages','The Committee promotes and maintains high standards of conduct by Councillors and Co-opted Members and oversees the Members Code of Conduct .','15', 1, NULL, '224'), (8,'oversees','oversaw','The Committee promotes and maintains high standards of conduct by Councillors and Co-opted Members and oversees the Members Code of Conduct .','15', 0, NULL, '224'), (9,'oversees','supervised','The Committee promotes and maintains high standards of conduct by Councillors and Co-opted Members and oversees the Members Code of Conduct .','15', 0, NULL, '224');
UNLOCK TABLES;

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
INSERT INTO `languages` VALUES (1,'Abkhazian'), (2,'Afar'), (3,'Afrikaans'), (4,'Akan'), (5,'Albanian'), (6,'Amharic'), (7,'Arabic'), (8,'Aragonese'), (9,'Armenian'), (10,'Assamese'), (11,'Avaric'), (12,'Avestan'), (13,'Aymara'), (14,'Azerbaijani'), (15,'Bambara'), (16,'Bashkir'), (17,'Basque'), (18,'Belarusian'), (19,'Bengali'), (20,'Bihari languages'), (21,'Bislama'), (22,'Bosnian'), (23,'Breton'), (24,'Bulgarian'), (25,'Burmese'), (26,'Catalan'), (27,'Central Khmer'), (28,'Chamorro'), (29,'Chechen'), (30,'Chichewa'), (31,'Chinese'), (32,'Chuvash'), (33,'Cornish'), (34,'Corsican'), (35,'Cree'), (36,'Croatian'), (37,'Czech'), (38,'Danish'), (39,'Divehi'), (40,'Dutch'), (41,'Dzongkha'), (42,'English'), (43,'Esperanto'), (44,'Estonian'), (45,'Ewe'), (46,'Faroese'), (47,'Fijian'), (48,'Filipino'), (49,'Finnish'), (50,'French'), (51,'Fulah'), (52,'Gaelic'), (53,'Galician'), (54,'Ganda'), (55,'Georgian'), (56,'German'), (57,'Greek'), (58,'Guaraní'), (59,'Gujarati'), (60,'Haitian'), (61,'Hausa'), (62,'Hebrew'), (63,'Herero'), (64,'Hindi'), (65,'Hiri Motu'), (66,'Hungarian'), (67,'Icelandic'), (68,'Ido'), (69,'Igbo'), (70,'Indonesian'), (71,'Interlingua'), (72,'Interlingue'), (73,'Inuktitut'), (74,'Inupiaq'), (75,'Irish'), (76,'Italian'), (77,'Japanese'), (78,'Javanese'), (79,'Kalaallisut'), (80,'Kannada'), (81,'Kanuri'), (82,'Kashmiri'), (83,'Kazakh'), (84,'Kikuyu'), (85,'Kinyarwanda'), (86,'Kirghiz'), (87,'Komi'), (88,'Kongo'), (89,'Korean'), (90,'Kuanyama'), (91,'Kurdish'), (92,'Lao'), (93,'Latin'), (94,'Latvian'), (95,'Limburgan'), (96,'Lingala'), (97,'Lithuanian'), (98,'Luba-Katanga'), (99,'Luxembourgish'), (100,'Macedonian'), (101,'Malagasy'), (102,'Malay'), (103,'Malayalam'), (104,'Maltese'), (105,'Manx'), (106,'Maori'), (107,'Marathi'), (108,'Marshallese'), (109,'Mongolian'), (110,'Nauru'), (111,'Navajo'), (112,'Ndonga'), (113,'Nepali'), (114,'North Ndebele'), (115,'Northern Sami'), (116,'Norwegian'), (117,'Norwegian Bokmål'), (118,'Norwegian Nynorsk'), (119,'Occitan'), (120,'Ojibwa'), (121,'Oriya'), (122,'Oromo'), (123,'Ossetian'), (124,'Pali'), (125,'Panjabi'), (126,'Pashto'), (127,'Persian'), (128,'Polish'), (129,'Portuguese'), (130,'Quechua'), (131,'Romanian'), (132,'Romansh'), (133,'Rundi'), (134,'Russian'), (135,'Samoan'), (136,'Sango'), (137,'Sanskrit'), (138,'Sardinian'), (139,'Serbian'), (140,'Shona'), (141,'Sichuan Yi'), (142,'Sindhi'), (143,'Sinhala'), (144,'Slovak'), (145,'Slovenian'), (146,'Somali'), (147,'South Ndebele'), (148,'Southern Sotho'), (149,'Spanish'), (150,'Sundanese'), (151,'Swahili'), (152,'Swati'), (153,'Swedish'), (154,'Tagalog'), (155,'Tahitian'), (156,'Tajik'), (157,'Tamil'), (158,'Tatar'), (159,'Telugu'), (160,'Thai'), (161,'Tibetan'), (162,'Tigrinya'), (163,'Tonga'), (164,'Tsonga'), (165,'Tswana'), (166,'Turkish'), (167,'Turkmen'), (168,'Twi'), (169,'Uighur'), (170,'Ukrainian'), (171,'Urdu'), (172,'Uzbek'), (173,'Venda'), (174,'Vietnamese'), (175,'Volapük'), (176,'Walloon'), (177,'Welsh'), (178,'Western Frisian'), (179,'Wolof'), (180,'Xhosa'), (181,'Yiddish'), (182,'Yoruba'), (183,'Zhuang'), (184,'Zulu'), (185,'Other/Unlisted');
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
