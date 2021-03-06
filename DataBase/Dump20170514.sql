-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce_1423_1507
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_conversations_users1_idx` (`sender_id`),
  KEY `fk_conversations_users2_idx` (`receiver_id`),
  CONSTRAINT `fk_conversations_users1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conversations_users2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `body` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_messages_conversations1_idx` (`conversation_id`),
  CONSTRAINT `fk_messages_conversations1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `guests` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,1,1,NULL,NULL,NULL),(2,3,3,NULL,NULL,NULL),(3,4,4,NULL,NULL,NULL),(4,3,1,NULL,NULL,NULL),(5,4,1,NULL,NULL,NULL),(6,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residences`
--

DROP TABLE IF EXISTS `residences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `about` varchar(45) DEFAULT NULL,
  `cancellation_policy` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `rules` varchar(255) DEFAULT NULL,
  `amenities` varchar(255) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `rooms` int(11) DEFAULT '1',
  `baths` int(11) DEFAULT '0',
  `kitchen` tinyint(1) DEFAULT NULL,
  `living_room` tinyint(1) DEFAULT NULL,
  `view` varchar(50) DEFAULT NULL,
  `space_area` double DEFAULT NULL,
  `photos` varchar(45) DEFAULT NULL,
  `guests` int(11) DEFAULT NULL,
  `available_date_start` date DEFAULT NULL,
  `available_date_end` date DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  `additional_cost_per_person` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `fk_residences_1` FOREIGN KEY (`host_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residences`
--

LOCK TABLES `residences` WRITE;
/*!40000 ALTER TABLE `residences` DISABLE KEYS */;
INSERT INTO `residences` VALUES (1,2,'no','about','no','Greece','fjjgrp','athens','no','no',1,2,2,1,1,'yes',20.5,'no',1,'2017-05-07','2017-05-07',200,50),(2,5,'no','about','no','France','ggrijgpr','Paris','no','no',2,1,1,1,0,'no',60.5,'no',1,'2017-05-07','2017-05-07',250,40),(3,6,'no','about','no','Netherlands','grifgjr','Amsterdam','no','no',3,1,1,1,1,'no',45.5,'no',1,'2017-05-07','2017-05-07',300,30);
/*!40000 ALTER TABLE `residences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `residence_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rating` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_residences1_idx` (`residence_id`),
  KEY `fk_reviews_users1_idx` (`host_id`),
  KEY `fk_reviews_users2_idx` (`tenant_id`),
  CONSTRAINT `fk_reviews_residences1` FOREIGN KEY (`residence_id`) REFERENCES `residences` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`host_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users2` FOREIGN KEY (`tenant_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,2,1,'good',4),(2,2,5,3,'good',3),(3,3,6,4,'very good',5);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `residence_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `beds` int(11) DEFAULT NULL,
  `bed_type` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT '0',
  `space_area` double DEFAULT NULL,
  `view` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `bed_type` (`bed_type`),
  KEY `fk_rooms_residences1_idx` (`residence_id`),
  KEY `fk_rooms_users1_idx` (`host_id`),
  CONSTRAINT `fk_rooms_residences1` FOREIGN KEY (`residence_id`) REFERENCES `residences` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rooms_users1` FOREIGN KEY (`host_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,2,2,NULL,1,NULL,NULL),(2,1,2,1,NULL,1,NULL,NULL),(3,2,5,2,NULL,1,NULL,NULL),(4,3,6,2,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_searches_1_idx` (`user_id`),
  CONSTRAINT `fk_searches_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
INSERT INTO `searches` VALUES (1,2,'Paris'),(2,3,'Berlin'),(3,4,'Madrid'),(4,3,'Paris');
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `about` varchar(45) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `host` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `host_id` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sissy','Themeli','sissythem','sissythem','sissy@email.com','1236547892','Greece','Athens','photo','2017-05-12 23:27:31','about','1990-08-05','0'),(2,'Nikiforos','Pittaras','nikpit','nikpit','nik@email.com','1254883587','France','Paris',NULL,'2017-05-07 14:43:36',NULL,NULL,'1'),(3,'Eva','Themeli','evathem','evathem','eva@email.com','1258893345','Germany','Berlin',NULL,'2017-05-07 14:43:36',NULL,NULL,'0'),(4,'Minos','Themelis','minosthem','minosthem','minos@email.com','1234559668','Netherlands','Amsterdam',NULL,'2017-05-07 14:43:36',NULL,NULL,'0'),(5,'Kostas','Themelis','kostasthem','kostasthem','kostas@email.com','7559966358','Greece','Athens',NULL,'2017-05-07 14:43:36',NULL,NULL,'1'),(6,'Anna','Karavokiri','annakara','annakara','anna@email.com','4552587563','Greece','Athens',NULL,'2017-05-07 14:43:36',NULL,NULL,'1'),(7,NULL,NULL,'npit','npit','nikpit@gmail.com',NULL,'greece','athens','photo',NULL,'about',NULL,'0');
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

-- Dump completed on 2017-05-14 11:25:26
