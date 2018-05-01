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

DROP DATABASE IF EXISTS `upm-es`;
CREATE DATABASE `upm-es`;
USE `upm-es`;

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
INSERT INTO `country` VALUES (1,'Afganistán'), (2,'Albania'), (3,'Alemania'), (4,'Andorra'), (5,'Angola'), (6,'Antigua y Barbuda'), (7,'Arabia Saudita / Arabia Saudí'), (8,'Argelia'), (9,'Argentina'), (10,'Armenia'), (11,'Australia'), (12,'Austria'), (13,'Azerbaiyán'), (14,'Bahamas'), (15,'Bangladés / Bangladesh'), (16,'Barbados'), (17,'Baréin / Bahréin'), (18,'Bélgica'), (19,'Belice'), (20,'Bielorrusia / Belarús'), (21,'Benín'), (22,'Myanmar / Birmania'), (23,'Bolivia'), (24,'Bosnia-Herzegovina / Bosnia'), (25,'Botsuana'), (26,'Brasil'), (27,'Brunéi'), (28,'Bulgaria'), (29,'Burkina Faso'), (30,'Burundi'), (31,'Bután'), (32,'Cabo Verde'), (33,'Camboya'), (34,'Camerún'), (35,'Canadá'), (36,'Catar / Qatar'), (37,'República Centroafricana'), (38,'Chad'), (39,'Chequia / República Checa'), (40,'Chile'), (41,'China'), (42,'Chipre'), (43,'Colombia'), (44,'Comoras'), (45,'República del Congo / Congo'), (46,'República Democrática del Congo'), (47,'Corea del Norte'), (48,'Corea del Sur'), (49,'Costa de Marfil / Côte d’Ivoire'), (50,'Costa Rica'), (51,'Croacia'), (52,'Cuba'), (53,'Dinamarca'), (54,'Dominica'), (55,'Dominicana / República Dominicana'), (56,'Ecuador'), (57,'Egipto'), (58,'El Salvador'), (59,'Emiratos Árabes Unidos'), (60,'Eritrea'), (61,'Eslovaquia'), (62,'Eslovenia'), (63,'España'), (64,'Estados Unidos'), (65,'Estonia'), (66,'Etiopía'), (67,'Filipinas'), (68,'Finlandia'), (69,'Fiyi'), (70,'Francia'), (71,'Gabón'), (72,'Gambia'), (73,'Georgia'), (74,'Ghana'), (75,'Granada'), (76,'Grecia'), (77,'Guatemala'), (78,'Guinea'), (79,'Guinea-Bisáu'), (80,'Guinea Ecuatorial'), (81,'Guyana'), (82,'Haití'), (83,'Honduras'), (84,'Hungría'), (85,'India'), (86,'Indonesia'), (87,'Irak / Iraq'), (88,'Irán'), (89,'Irlanda'), (90,'Islandia'), (91,'Israel'), (92,'Italia'), (93,'Jamaica'), (94,'Japón'), (95,'Jordania'), (96,'Kazajistán'), (97,'Kenia'), (98,'Kirguistán'), (99,'Kiribati'), (100,'Kuwait'), (101,'Laos'), (102,'Lesoto'), (103,'Letonia'), (104,'Líbano'), (105,'Liberia'), (106,'Libia'), (107,'Liechtenstein'), (108,'Lituania'), (109,'Luxemburgo'), (110,'Macedonia'), (111,'Madagascar'), (112,'Malasia'), (113,'Malaui'), (114,'Maldivas'), (115,'Malí / Mali'), (116,'Malta'), (117,'Marruecos'), (118,'Islas Marshall'), (119,'Mauricio'), (120,'Mauritania'), (121,'México'), (122,'Micronesia'), (123,'Moldavia'), (124,'Mónaco'), (125,'Mongolia'), (126,'Montenegro'), (127,'Mozambique'), (128,'Namibia'), (129,'Nauru'), (130,'Nepal'), (131,'Nicaragua'), (132,'Níger'), (133,'Nigeria'), (134,'Noruega'), (135,'Nueva Zelanda / Nueva Zelandia'), (136,'Omán'), (137,'Países Bajos'), (138,'Pakistán'), (139,'Palaos'), (140,'Palestina'), (141,'Panamá'), (142,'Papúa Nueva Guinea'), (143,'Paraguay'), (144,'Perú'), (145,'Polonia'), (146,'Portugal'), (147,'Reino Unido'), (148,'Ruanda'), (149,'Rumania / Rumanía'), (150,'Rusia'), (151,'Islas Salomón'), (152,'Samoa'), (153,'San Cristóbal y Nieves'), (154,'San Marino'), (155,'San Vicente y las Granadinas'), (156,'Santa Lucía'), (157,'Santo Tomé y Príncipe'), (158,'Senegal'), (159,'Serbia'), (160,'Seychelles'), (161,'Sierra Leona'), (162,'Singapur'), (163,'Siria'), (164,'Somalia'), (165,'Sri Lanka'), (166,'Suazilandia'), (167,'Sudáfrica'), (168,'Sudán'), (169,'Sudán del sur'), (170,'Suecia'), (171,'Suiza'), (172,'Surinam'), (173,'Tailandia'), (174,'Tanzania'), (175,'Tayikistán'), (176,'Timor Oriental'), (177,'Togo'), (178,'Tonga'), (179,'Trinidad y Tobago'), (180,'Túnez'), (181,'Turkmenistán'), (182,'Turquía'), (183,'Tuvalu'), (184,'Ucrania'), (185,'Uganda'), (186,'Uruguay'), (187,'Uzbekistán'), (188,'Vanuatu'), (189,'Vaticano / Ciudad del Vaticano'), (190,'Venezuela'), (191,'Vietnam'), (192,'Yemen'), (193,'Yibuti'), (194,'Zambia'), (195,'Zimbabue'), (196, 'Otro / no listado');
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
  `educational_level` enum('primaria','secundaria','licenciatura','postgrado') DEFAULT NULL,
  `disability` set('física','visual','auditiva','psíquica','intelectual','aprendizaje') DEFAULT NULL,
  `familiarity_PA` enum('básico','intermedio','avanzado') DEFAULT NULL,
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
INSERT INTO `demographic_data` VALUES (1,30,1,'C1','postgrado',NULL,'intermedio','user001',NULL),(2,27,2,'C2','universitario',NULL,'intermedio','user002',NULL),
(7,21,1,'A1','secundaria',NULL,'básico','user020',NULL),(9,21,1,'A1','secundaria',NULL,NULL,'user030',NULL),(11,50,3,'C1','licenciatura',NULL,NULL,'user040',NULL),
(12,50,3,'C1','licenciatura',NULL,NULL,'user050',NULL),(13,50,1,'C1','licenciatura',NULL,NULL,'user060',NULL),(15,50,1,'C1','licenciatura',NULL,NULL,'user070',NULL),
(16,50,1,'C1','licenciatura',NULL,NULL,'user080',NULL),(18,50,5,'C1','licenciatura',NULL,NULL,'user090',NULL),(19,50,5,'C1','licenciatura',NULL,NULL,'user100',NULL),
(20,40,5,'C2','postgrado',NULL,NULL,'user200',NULL),(21,40,5,'C2','postgrado',NULL,NULL,'user300',NULL),(22,40,5,'C2','postgrado',NULL,NULL,'user400',NULL);
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
INSERT INTO `languages` VALUES (1,'Abjaso'), (2,'Afrikáans'), (3,'Albanés'), (4,'Alemán'), (5,'Amhárico'), (6,'Árabe'), (7,'Aranés'), (8,'Armenio'), (9,'Arpitano o Franco-provenzal'), (10,'Asturiano'), (11,'Azerí'), (12,'Aimara'), (13,'Austro-bávaro'), (14,'Bahasa Indonesia'), (15,'Bale'), (16,'Bashkirio'), (17,'Bengalí'), (18,'Bielorruso'), (19,'Birmano'), (20,'Bislama'), (21,'Bosnio'), (22,'Bribri'), (23,'Búlgaro'), (24,'Buriato'), (25,'Cantonés'), (26,'Catalán'), (27,'Cingalés'), (28,'Coreano'), (29,'Cungo'), (30,'Chamorro'), (31,'Chavacano de Zamboanga'), (32,'Checo'), (33,'Chibcha'), (34,'Chichewa'), (35,'Chino mandarín'), (36,'Chuvasio'), (37,'Creole haitiano'), (38,'Danés'), (39,'Dhivehi'), (40,'Dzongkha'), (41,'Escocés'), (42,'Eslovaco'), (43,'Esloveno'), (44,'Español'), (45,'Esperanto'), (46,'Estonio'), (47,'Euskera'), (48,'Feroés'), (49,'Finés'), (50,'Francés'), (51,'Friuliano'), (52,'Frisón'), (53,'Gagauzo'), (54,'Gaélico escocés'), (55,'Gaélico irlandés'), (56,'Galés'), (57,'Gallego'), (58,'Gallurés'), (59,'Galo'), (60,'Gàn'), (61,'Garífuna'), (62,'Georgiano'), (63,'Gilbertés'), (64,'Griego'), (65,'Guaraní'), (66,'Guyaratí'), (67,'Hakka'), (68,'Hausa'), (69,'Hebreo'), (70,'Hindi'), (71,'Húngaro'), (72,'Ido'), (73,'Inglés'), (74,'Insubre'), (75,'Interlingua'), (76,'Islandés'), (77,'Italiano'), (78,'Japonés'), (79,'Javanés'), (80,'Jemer'), (81,'Judeoespañol'), (82,'Kaqchikel'), (83,'Kazajo'), (84,'Kede'), (85,'Kinyarwanda'), (86,'Kirguís'), (87,'Kirundi'), (88,'Kurdo'), (89,'Lao'), (90,'Lapón'), (91,'Latín'), (92,'Leonés'), (93,'Letón'), (94,'Lingala'), (95,'Lituano'), (96,'Lombardo'), (97,'Luxemburgués'), (98,'Macedonio'), (99,'Malayo'), (100,'Maltés'), (101,'Mallorquín'), (102,'Mam'), (103,'Maorí'), (104,'Mapuche o Mapudungun'), (105,'Marathi'), (106,'Marshalés'), (107,'Maya'), (108,'Min'), (109,'Mirandés'), (110,'Miskito'), (111,'Mixteco'), (112,'Moldavo'), (113,'Mongol'), (114,'Náhuatl'), (115,'Napolitano'), (116,'Nauruano'), (117,'Neerlandés'), (118,'Nepalí'), (119,'Noruego (Nynorsk y Bokmal)'), (120,'Occitano'), (121,'Oriya'), (122,'Oróbico'), (123,'Oromo'), (124,'Otomí'), (125,'Páez'), (126,'Panyabí'), (127,'Pashto'), (128,'Patois'), (129,'Persa'), (130,'Piamontés'), (131,'Pocomam'), (132,'Polaco'), (133,'Portugués'), (134,'Purépecha'), (135,'Quechua sureño'), (136,'Quichua'), (137,'Quiché'), (138,'Retorrománico o Romanche'), (139,'Rumano'), (140,'Ruso'), (141,'Ruteno'), (142,'Rapanui'), (143,'Serbocroata'), (144,'Seri'), (145,'Sesotho'), (146,'Shona'), (147,'Siciliano'), (148,'Sindhi'), (149,'Somalí'), (150,'Sorabo'), (151,'Sueco'), (152,'Sundanés'), (153,'Suajili'), (154,'Suazi'), (155,'Tagalo'), (156,'Tailandés'), (157,'Támil'), (158,'Tarahumara'), (159,'Tártaro'), (160,'Tayiko'), (161,'Téenek o Huasteco'), (162,'Télugu'), (163,'Tetun'), (164,'Tibetano'), (165,'Tigriña'), (166,'Tongano'), (167,'Toupuori'), (168,'Tswana'), (169,'Turco'), (170,'Turcomano'), (171,'Tuvaluano'), (172,'Tuvano'), (173,'Tzeltal'), (174,'Tzotzil'), (175,'Ucraniano'), (176,'Uigur'), (177,'Urdu'), (178,'Uzbeko'), (179,'Venda'), (180,'Veneciano'), (181,'Vietnamita'), (182,'Valenciano'), (183,'Wayuunaiki o Guajiro'), (184,'Wolof'), (185,'Wu'), (186,'Xinca'), (187,'Xhosa'), (188,'Yakuto'), (189,'Yidis'), (190,'Yoruba'), (191,'Zapoteca'), (192,'Zulú'), (193,'Otro / no listado');
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
