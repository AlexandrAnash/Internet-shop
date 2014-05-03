-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(11) unsigned DEFAULT NULL,
  `region_id` int(11) unsigned DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `home_number` int(6) unsigned DEFAULT NULL,
  `flat` int(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (49,73,5,'1','4',1,1),(50,73,5,'1','4',6,6),(51,73,5,'','',0,0),(52,73,5,'1','1',1,1),(53,73,5,'4','1',2,3),(54,73,5,'4','1',1,1),(55,78,5,'1','2',3,1),(56,73,5,'1','1',4,3),(57,73,5,'1','1',2,3),(58,73,5,'3','1',2,3),(59,73,5,'1','1',1,1),(60,4851,65,'1','Chertanvo',10,22),(61,73,5,'12','1',1,1),(62,98,1149,'112','21',32,2),(63,73,5,'1','1',1,1),(64,73,5,'1','1',2,4),(65,NULL,NULL,NULL,NULL,NULL,NULL),(66,74,66,'13','12',2,1),(67,74,65,'123','12312312',3123,123123),(68,74,65,'123','12312312',3123,1232),(69,74,65,'123','12312312',3123,15555555),(70,74,65,'12','3123',1231,4294967295),(71,74,65,'123123','312312',3123213,12312312),(72,74,65,'123123','12',4294967295,4294967295),(73,74,65,'1231231','12312312',4294967295,4294967295),(74,74,65,'123123','123',411111,23),(75,4400,67,'123','1',5,1),(76,74,65,'15','25',35,45),(77,74,65,'31231','2321312',3123123,123123),(78,74,65,'31231','2321312',3123123,123123),(79,74,65,'123123','1231231321',12314,1),(80,74,65,'123','123123123',12312,3123),(81,74,65,'347900','Petrovskaya',40,1),(82,4400,65,'5919299','M.Jukova',99,12),(83,4851,67,'5888994','Krasnokholmskaya',11,4),(84,74,65,'1231','312312',3123,23123),(85,74,65,'1','1',1,1),(86,4400,65,'1','2',41,2),(87,74,65,'1','1',1,1),(88,74,65,'1','1',2,1),(89,74,65,'11','11',11,11111),(90,74,65,'4','1',12,3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) unsigned NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`city_id`),
  KEY `country_id` (`country_id`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4852 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (74,55,65,'Taganrog'),(4400,57,67,'Volgograd'),(4851,56,66,'Moscow');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rating` decimal(10,2) DEFAULT NULL,
  `quote_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (36,'1',NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,68),(37,'Âàñÿ',NULL,'202cb962ac59075b964b07152d234b70',NULL,67),(38,'123',NULL,'202cb962ac59075b964b07152d234b70',NULL,78);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_products` (
  `order_product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `order_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (140,'Nokkkkial','12312313',11,123561.00,133),(141,'IPhone-5s','5123123',3,19929.00,133),(142,'Nokkkkial','12312313',3,123561.00,134),(143,'IPhone-5s','5123123',44,19929.00,134),(144,'Nokkkkial','12312313',3,123561.00,135),(145,'IPhone-5s','5123123',44,19929.00,135),(146,'Nokkkkial','12312313',1,123561.00,136),(147,'IPhone-5s','5123123',55,19929.00,136),(148,'IPhone-12','12322212312',33,99999999.99,136),(149,'Nokkkkial','12312313',14,123561.00,137),(150,'IPhone-5s','5123123',1,19929.00,137),(151,'IPhone-12','123123112',11,20.00,138),(152,'Nokkkkial','12312313',10,123561.00,139),(153,'IPhone-5s','5123123',1,19929.00,140),(154,'Nokkkkial','12312313',3,123561.00,140),(155,'Nokkkkial','12312313',6,123561.00,141),(156,'Nokkkkial','12312313',0,123561.00,142),(157,'Nokkkkial','12312313',12,123561.00,143),(158,'Nokkkkial','12312313',30,123561.00,144),(159,'Nokkkkial','12312313',30,123561.00,145),(160,'Nokkkkial','12312313',30,123561.00,146),(161,'Nokkkkial','12312313',30,123561.00,147),(162,'Nokkkkial','12312313',30,123561.00,148),(163,'Nokkkkial','12312313',30,123561.00,149),(164,'Nokkkkial','12312313',30,123561.00,150),(165,'Nokkkkial','12312313',30,123561.00,151),(166,'Nokkkkial','12312313',30,123561.00,152),(167,'Nokkkkial','12312313',30,123561.00,153),(168,'Nokkkkial','12312313',0,123561.00,154),(169,'Nokkkkial','12312313',0,123561.00,155),(170,'Nokkkkial','12312313',0,123561.00,156),(171,'Nokkkkial','12312313',0,123561.00,157),(172,'Nokkkkial','12312313',0,123561.00,158),(173,'Nokkkkial','12312313',0,123561.00,159),(174,'Nokkkkial','12312313',0,123561.00,160),(175,'Nokkkkial','12312313',0,123561.00,161),(176,'Nokkkkial','12312313',0,123561.00,162),(177,'Nokkkkial','12312313',0,123561.00,163),(178,'Nokkkkial','12312313',0,123561.00,164),(179,'Nokkkkial','12312313',30,123561.00,165),(180,'Nokkkkial','12312313',30,123561.00,166),(181,'Nokkkkial','12312313',30,123561.00,167),(182,'Nokkkkial','12312313',30,123561.00,168),(183,'Nokkkkial','12312313',30,123561.00,169),(184,'Nokkkkial','12312313',30,123561.00,170),(185,'Nokkkkial','12312313',60,123561.00,171),(186,'Nokkkkial','12312313',31,123561.00,172),(187,'IPhone-5s','5123123',66,19929.00,172),(188,'Nokkkkial','12312313',63,123561.00,173),(189,'IPhone-12','123123112',12,20.00,173),(190,'Nokkkkial','12312313',63,123561.00,174),(191,'IPhone-12','123123112',12,20.00,174),(192,'Nokkkkial','12312313',63,123561.00,175),(193,'IPhone-12','123123112',12,20.00,175);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number_order` int(5) unsigned DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `product_sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `shipping_method` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `payment_method` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `shipping` int(11) unsigned DEFAULT NULL,
  `subtotal` int(11) unsigned DEFAULT NULL,
  `grand_total` int(11) unsigned DEFAULT NULL,
  `city` varchar(128) NOT NULL DEFAULT '',
  `region` int(11) unsigned DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `home_number` int(6) unsigned DEFAULT NULL,
  `flat` int(6) unsigned DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `number_order` (`number_order`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (133,10133,NULL,'2014-02-01 23:41:21',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,1418958,1419058,'Âèëëà÷',0,'1','1',1,1,'Pending'),(134,10134,'1','2014-02-02 00:05:22',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,1247559,1247659,'Âèëëà÷',0,'1','1',1,1,'Pending'),(135,10135,'1','2014-02-02 00:05:35',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,1247559,1247659,'Âèëëà÷',0,'1','1',1,1,'Pending'),(136,10136,'123','2014-02-02 00:07:07',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,3301219656,3301219756,'Âèëëà÷',0,'1','1',131,12,'Pending'),(137,10137,NULL,'2014-02-20 14:09:02',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,1749783,1749883,'Âèëëà÷',0,'12','1',1,1,'Pending'),(138,10138,NULL,'2014-02-20 14:23:37',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,220,320,'Áèíàãàäè',0,'112','21',32,2,'Pending'),(139,10139,NULL,'2014-04-01 23:51:37',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,1235610,1235710,'Âèëëà÷',0,'1','1',1,1,'Pending'),(140,10140,NULL,'2014-04-02 00:11:02',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,390612,390712,'Âèëëà÷',0,'1','1',2,4,'Pending'),(141,10141,NULL,'2014-04-04 22:36:48',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,741366,741396,'Taganrog',0,'13','12',2,1,'Pending'),(142,10142,NULL,'2014-04-14 23:50:44',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,7042977,7043077,'Taganrog',0,'1','1',2,1,'Pending'),(143,10143,NULL,'2014-04-23 23:32:52',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',1000,1482732,1483732,'Moscow',0,'123','1',12,1,'Pending'),(144,10144,NULL,'2014-04-23 23:40:11',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'11','11',11,11111,'Pending'),(145,10145,'123','2014-04-23 23:48:46',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(146,10146,'123','2014-04-24 00:06:01',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(147,10147,'123','2014-04-24 00:06:55',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(148,10148,'123','2014-04-24 00:08:02',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(149,10149,'123','2014-04-24 00:12:14',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(150,10150,'123','2014-04-24 00:14:27',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(151,10151,'123','2014-04-24 00:16:11',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(152,10152,'123','2014-04-24 00:22:44',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(153,10153,'123','2014-04-24 00:24:54',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(154,10154,'123','2014-04-24 00:37:36',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'Pending'),(155,10155,'123','2014-04-24 00:38:09',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,0,30,'Taganrog',0,'123','1',123,123,'Pending'),(156,10156,'123','2014-04-24 00:39:19',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,0,30,'Taganrog',0,'123','1',123,123,'Pending'),(157,10157,'123','2014-04-24 00:39:30',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,0,30,'Taganrog',0,'123','1',123,123,'Pending'),(158,10158,'123','2014-04-24 00:40:06',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(159,10159,'123','2014-04-24 00:45:16',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(160,10160,'123','2014-04-24 23:20:21',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(161,10161,'123','2014-04-24 23:21:59',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'12','13',12312,123,'Pending'),(162,10162,'123','2014-04-24 23:33:08',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(163,10163,'123','2014-04-24 23:37:11',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(164,10164,'123','2014-04-24 23:39:33',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(165,10165,'123','2014-04-25 00:02:18',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(166,10166,'123','2014-04-25 00:03:33',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(167,10167,'123','2014-04-25 00:05:36',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(168,10168,'123','2014-04-25 00:06:25',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(169,10169,'123','2014-04-25 00:13:09',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(170,10170,'123','2014-04-25 00:28:19',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'1','1',1,1,'Pending'),(171,10171,'123','2014-04-25 00:31:31',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,7413660,7413690,'Taganrog',0,'1','1',1,1,'Pending'),(172,10172,NULL,'2014-04-26 14:28:13',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,5145705,5145735,'Taganrog',0,'4','1',12,3,'Pending'),(173,10173,'123','2014-04-26 17:38:23',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',1000,7784583,7785583,'Moscow',0,'1','Chertanvo',10,22,'Pending'),(174,10174,'123','2014-04-26 17:41:51',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',1000,7784583,7785583,'Moscow',0,'1','Chertanvo',10,22,'Pending'),(175,10175,'123','2014-04-26 17:42:32',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',1000,7784583,7785583,'Moscow',0,'1','Chertanvo',10,22,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_store`
--

DROP TABLE IF EXISTS `product_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_store` (
  `product_store_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL,
  `sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`product_store_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `product_store_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_store`
--

LOCK TABLES `product_store` WRITE;
/*!40000 ALTER TABLE `product_store` DISABLE KEYS */;
INSERT INTO `product_store` VALUES (8,14,'5123123',12),(9,15,'5123123',60),(10,15,'12312313',2),(11,14,'12312313',55),(12,14,'123123131111111',23),(13,17,'5123123',12),(14,17,'12312312',124),(15,17,'123512313',12),(16,17,'123123112',641),(17,15,'123123112',0);
/*!40000 ALTER TABLE `product_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `special_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `sku_index` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Nokkkkial','12312313','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',57,123561.00,NULL),(2,'IPhone-5s','5123123','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',84,19929.00,NULL),(3,'IPhone-6','12312312','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',124,10230102.00,NULL),(8,'Nokkkkial929','123512313','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',12,123561.00,999.00),(9,'IPhone-12','123123112','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',677,10230102.00,20.00),(10,'Mobila','1211233113','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',0,123561.00,NULL),(11,'IPhone-12','12322212312','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png',0,99999999.99,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quote_items`
--

DROP TABLE IF EXISTS `quote_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quote_items` (
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `quote_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_items`
--

LOCK TABLES `quote_items` WRITE;
/*!40000 ALTER TABLE `quote_items` DISABLE KEYS */;
INSERT INTO `quote_items` VALUES (44,1,1,65),(45,1,44,66),(46,1,14,67),(47,2,2,67),(48,1,3,68),(49,1,4,71),(50,2,111,71),(52,2,596,72),(53,1,58,72),(54,1,12,73),(55,2,3,73),(56,1,12,74),(57,2,3,74),(58,1,4,75),(59,2,4,75),(60,1,12,76),(61,2,33,76),(62,1,12,77),(63,2,3,77),(64,2,44,68),(68,1,14,81),(69,2,1,81),(70,9,11,82),(71,1,10,83),(72,2,1,84),(73,1,3,84),(74,1,5,85),(75,2,5,85),(76,1,7,87),(77,1,7,89),(78,1,7,90),(79,1,56,91),(80,1,57,92),(81,1,30,93),(82,1,63,78),(83,1,31,94),(84,2,66,94),(85,9,12,78);
/*!40000 ALTER TABLE `quote_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `quote_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(11) unsigned DEFAULT NULL,
  `shipping_method_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `payment_method_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `shipping` int(11) unsigned DEFAULT NULL,
  `subtotal` int(11) unsigned DEFAULT NULL,
  `grand_total` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (65,NULL,NULL,NULL,NULL,NULL,NULL),(66,NULL,NULL,NULL,NULL,NULL,NULL),(67,48,'fixed','Cash on delivery',100,1769712,1769812),(68,52,'fixed','Cash on delivery',100,1247559,1247659),(69,NULL,NULL,NULL,NULL,NULL,NULL),(70,NULL,NULL,NULL,NULL,NULL,NULL),(71,53,'fixed','Cash on delivery',100,2706363,2706463),(72,54,'fixed','Cash on delivery',100,19044222,19044322),(73,55,'fixed','Cash on delivery',100,1542519,1542619),(74,56,'fixed','Cash on delivery',100,1542519,1542619),(75,57,'fixed','Cash on delivery',100,573960,574060),(76,58,'fixed','Cash on delivery',100,2140389,2140489),(77,59,'fixed','Cash on delivery',100,1418958,1419058),(78,60,'Table rate','Cash on delivery',1000,7784583,7785583),(79,NULL,NULL,NULL,NULL,NULL,NULL),(80,NULL,NULL,NULL,NULL,NULL,NULL),(81,61,'fixed','Cash on delivery',100,1749783,1749883),(82,62,'fixed','Cash on delivery',100,220,320),(83,63,'fixed','Cash on delivery',100,1235610,1235710),(84,64,'fixed','Cash on delivery',100,390612,390712),(85,65,NULL,NULL,NULL,0,NULL),(86,NULL,NULL,NULL,NULL,NULL,NULL),(87,66,'Table rate','Cash on delivery',30,741366,741396),(88,NULL,NULL,NULL,NULL,NULL,NULL),(89,84,'Table rate','Cash on delivery',30,864927,864957),(90,85,'fixed','Cash on delivery',100,864927,865027),(91,87,'fixed','Cash on delivery',100,6919416,6919516),(92,88,'fixed','Cash on delivery',100,7042977,7043077),(93,89,'Table rate','Cash on delivery',30,3706830,3706860),(94,90,'Table rate','Cash on delivery',30,5145705,5145735);
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL DEFAULT '0',
  `city_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`region_id`),
  KEY `country_id` (`country_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (65,55,74,'Rostov obl'),(66,56,4400,'Murmonsk obl'),(67,57,4851,'Moscowskaya obl');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `text` varchar(1023) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rating` int(1) unsigned DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (28,'sdaf','sfasfs','dfsfafasdf',4,1,38),(29,'12','4213123','12',13,1,38),(31,'4124','124124','124124',412,1,38),(32,'123','123','123',123,1,38),(34,'4','41','1',1,1,38),(35,'4','4','4',111,1,38),(36,'2','2','1',1,1,38),(38,'1','1','1',1,1,38),(42,'1','2','3',3,2,38),(43,'3','2','1',4,2,38);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `seller_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Aleksandr','Taganrog',50012.00),(2,'Daniil','Taganrog',52142.00),(3,'Stanislav','Rostov-na-Donu',21112.00),(4,'Masha','Rostov-na-Donu',1112.00);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `store_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (14,'Store_1',81),(15,'Store_2',82),(16,'Store_3',83),(17,'Store_5',86);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-03 13:37:56
