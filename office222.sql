-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: office_development
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-10-04 03:49:25','2018-10-04 03:49:25');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `costs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplierid` int(11) DEFAULT NULL,
  `suppliesid` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costs`
--

LOCK TABLES `costs` WRITE;
/*!40000 ALTER TABLE `costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supply_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supply_id` (`supply_id`),
  CONSTRAINT `inventories_ibfk_1` FOREIGN KEY (`supply_id`) REFERENCES `supplies` (`suppliesid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` VALUES (1,1,500,'2018-10-03 00:00:00','2018-10-03 00:00:00'),(2,2,150,'2018-10-03 00:00:00','2018-10-03 00:00:00'),(3,4,200,'2018-10-03 00:00:00','2018-10-03 00:00:00'),(4,3,300,'2018-10-03 00:00:00','2018-10-03 00:00:00'),(5,5,20,'2018-10-03 00:00:00','2018-10-03 00:00:00');
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_statuses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderstatusid` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `complete` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `suppliesid` int(11) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL,
  `suppliersid` int(11) DEFAULT NULL,
  `totalcost` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliesid` (`suppliesid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`suppliesid`) REFERENCES `supplies` (`suppliesid`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`suppliesid`) REFERENCES `supplies` (`suppliesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180928003337'),('20180928004417'),('20180928004447'),('20180928004535'),('20180928004654'),('20180928141605'),('20180928192811'),('20180928204644');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phonenum` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Dunder Mifflin','1725 Slough Avenue','Scranton','Pennsylvania','123-456-7890','2018-10-05 00:00:00','2018-10-05 00:00:00'),(2,'Scott Paper Company','1725 Slough Avenue','Scranton','Pennsylvania','555-555-5555','2018-10-05 00:00:00','2018-10-05 00:00:00'),(3,'Pencil Pushers','123 Pencil Lane','Penciltown','Kansas','777-888-9999','2018-10-05 00:00:00','2018-10-05 00:00:00'),(4,'Printer Company','888 Printer Avenue','Ink','Florida','999-999-9999','2018-10-05 00:00:00','2018-10-05 00:00:00'),(5,'Folder Company','11 Folder Street','Fold','New York','777-777-7777','2018-10-05 00:00:00','2018-10-05 00:00:00'),(6,'Fake Co','8 Fake Street','Faketown','Texas','000-000-0000','2018-10-05 00:00:00','2018-10-05 00:00:00'),(7,'Initech','4120 Freidrich Lane','Austin','Texas','444-444-4444','2018-10-05 00:00:00','2018-10-05 00:00:00'),(8,'Globex Corporation','2300 Michigan St','Hammond','Indiana','555-666-7777','2018-10-05 00:00:00','2018-10-05 00:00:00'),(9,'Acme Corp','1 Acme Lane','Acme','California','222-333-4444','2018-10-05 00:00:00','2018-10-05 00:00:00'),(10,'Stark Industries','7 Stark Way','Los Angeles','California','333-333-3333','2018-10-05 00:00:00','2018-10-05 00:00:00');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplies` (
  `suppliesid` int(11) NOT NULL AUTO_INCREMENT,
  `supplyname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`suppliesid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'Pencils','2018-10-03 00:00:00','2018-10-03 00:00:00'),(2,'Pens','2018-10-03 00:00:00','2018-10-03 00:00:00'),(3,'Paper','2018-10-03 00:00:00','2018-10-03 00:00:00'),(4,'Paperclips','2018-10-03 00:00:00','2018-10-03 00:00:00'),(5,'Folders','2018-10-03 00:00:00','2018-10-03 00:00:00');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jack','Sparrow','1234 Nowhere','Fake','TX','456-777-5555','fake@mail.com','$2a$11$MsV23udLdahSRo..M3BdNO/0euFPlxLDOwwQYlGM9wnMECb/gclJu',NULL,NULL,NULL,'2018-10-04 03:56:59','2018-10-04 03:56:59'),(2,'Eli','Jah','123 Oak Lane','Oswego','IL','999-888-7777','fake@fake.com','$2a$11$SshFI03bbyEZI.Bgo0QkAe/jvuYmIKNv983.0LPwhSgkuTqZvrtO.',NULL,NULL,NULL,'2018-10-05 00:32:17','2018-10-08 15:24:31'),(3,'Khalil ','Mack','1 Halas Hall','Chicago','IL','123-456-7890','mack@attack.com','$2a$11$BDRgS6DVB2p39PmN00rTeOwhaMNF59L3qK1uUtLgcxfi3lgzNGkYK',NULL,NULL,NULL,'2018-10-05 00:37:24','2018-10-05 00:37:24'),(4,'Jackson','Teller','878 Nowhere','Charming','CA','555-555-5555','jt@mail.com','$2a$11$ZuXZ5BTcVDvf/MTVOCG/ye2gHDBrPLLYIXpp/iVN4frDf6G3ROXnG',NULL,NULL,NULL,'2018-10-05 01:33:32','2018-10-05 01:33:32'),(5,'Jack','Smith','888 Smith Street','Smithsville','IL','787-787-7878','smith@mail.com','$2a$11$Y52JSHP2ldHRwlaeq.62NuqSZXnt9puVxFgVzXx4WT/3m2BeuT69W',NULL,NULL,NULL,'2018-10-05 01:44:23','2018-10-05 01:44:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-11 11:04:01
