-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

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
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (49,73,5,'1','4',1,1,''),(50,73,5,'1','4',6,6,''),(51,73,5,'','',0,0,''),(52,73,5,'1','1',1,1,''),(75,4400,67,'123','1',5,1,''),(76,74,65,'15','25',35,45,''),(77,74,65,'31231','2321312',3123123,123123,''),(78,74,65,'31231','2321312',3123123,123123,''),(79,74,65,'123123','1231231321',12314,1,''),(80,74,65,'123','123123123',12312,3123,''),(81,74,65,'347900','Petrovskaya',40,1,''),(82,4400,65,'5919299','M.Jukova',99,12,''),(83,4851,67,'5888994','Krasnokholmskaya',11,4,''),(84,74,65,'1231','312312',3123,23123,''),(85,74,65,'1','1',1,1,''),(86,4400,65,'1','2',41,2,''),(87,74,65,'1','1',1,1,''),(88,74,65,'1','1',2,1,''),(89,74,65,'11','11',11,11111,''),(90,74,65,'4','1',12,3,''),(91,NULL,NULL,NULL,NULL,NULL,NULL,''),(92,74,65,'','',0,0,''),(93,4851,66,'1','1',1,1,''),(94,74,65,'123','1231',23123123,123,''),(95,74,65,'','',0,0,''),(96,4400,65,'','',0,0,''),(97,74,65,'1','1',1,1,''),(98,74,65,'5615314','Ð“Ñ€ÐµÑ‡ÐµÑÐºÐ°Ñ',55,12,'89184123454'),(99,74,65,'123123','ÐŸÐµÑ‚Ñ€Ð¾Ð²ÑÐºÐ°Ñ',123,123,'123'),(100,4400,65,'5712723','Ð›Ð¾Ð¼Ð¾Ð½Ð¾ÑÐ¾Ð²Ð°',18,27,'8718276481'),(101,74,65,'','',0,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (36,'1',NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,68),(37,'Âàñÿ',NULL,'202cb962ac59075b964b07152d234b70',NULL,67),(38,'123',NULL,'202cb962ac59075b964b07152d234b70',5.00,78),(39,'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€',NULL,'202cb962ac59075b964b07152d234b70',1.00,108);
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
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (140,'Nokkkkial','12312313',11,123561.00,133),(141,'IPhone-5s','5123123',3,19929.00,133),(142,'Nokkkkial','12312313',3,123561.00,134),(143,'IPhone-5s','5123123',44,19929.00,134),(144,'Nokkkkial','12312313',3,123561.00,135),(145,'IPhone-5s','5123123',44,19929.00,135),(146,'Nokkkkial','12312313',1,123561.00,136),(147,'IPhone-5s','5123123',55,19929.00,136),(148,'IPhone-12','12322212312',33,99999999.99,136),(149,'Nokkkkial','12312313',14,123561.00,137),(150,'IPhone-5s','5123123',1,19929.00,137),(151,'IPhone-12','123123112',11,20.00,138),(152,'Nokkkkial','12312313',10,123561.00,139),(153,'IPhone-5s','5123123',1,19929.00,140),(154,'Nokkkkial','12312313',3,123561.00,140),(155,'Nokkkkial','12312313',6,123561.00,141),(156,'Nokkkkial','12312313',0,123561.00,142),(157,'Nokkkkial','12312313',12,123561.00,143),(158,'Nokkkkial','12312313',30,123561.00,144),(159,'Nokkkkial','12312313',30,123561.00,145),(160,'Nokkkkial','12312313',30,123561.00,146),(161,'Nokkkkial','12312313',30,123561.00,147),(162,'Nokkkkial','12312313',30,123561.00,148),(163,'Nokkkkial','12312313',30,123561.00,149),(164,'Nokkkkial','12312313',30,123561.00,150),(165,'Nokkkkial','12312313',30,123561.00,151),(166,'Nokkkkial','12312313',30,123561.00,152),(167,'Nokkkkial','12312313',30,123561.00,153),(168,'Nokkkkial','12312313',0,123561.00,154),(169,'Nokkkkial','12312313',0,123561.00,155),(170,'Nokkkkial','12312313',0,123561.00,156),(171,'Nokkkkial','12312313',0,123561.00,157),(172,'Nokkkkial','12312313',0,123561.00,158),(173,'Nokkkkial','12312313',0,123561.00,159),(174,'Nokkkkial','12312313',0,123561.00,160),(175,'Nokkkkial','12312313',0,123561.00,161),(176,'Nokkkkial','12312313',0,123561.00,162),(177,'Nokkkkial','12312313',0,123561.00,163),(178,'Nokkkkial','12312313',0,123561.00,164),(179,'Nokkkkial','12312313',30,123561.00,165),(180,'Nokkkkial','12312313',30,123561.00,166),(181,'Nokkkkial','12312313',30,123561.00,167),(182,'Nokkkkial','12312313',30,123561.00,168),(183,'Nokkkkial','12312313',30,123561.00,169),(184,'Nokkkkial','12312313',30,123561.00,170),(185,'Nokkkkial','12312313',60,123561.00,171),(186,'Nokkkkial','12312313',31,123561.00,172),(187,'IPhone-5s','5123123',66,19929.00,172),(188,'Nokkkkial','12312313',63,123561.00,173),(189,'IPhone-12','123123112',12,20.00,173),(190,'Nokkkkial','12312313',63,123561.00,174),(191,'IPhone-12','123123112',12,20.00,174),(192,'Nokkkkial','12312313',63,123561.00,175),(193,'IPhone-12','123123112',12,20.00,175),(194,'Nokkkkial','12312313',5,123561.00,176),(195,'Nokkkkial','12312313',5,123561.00,177),(196,'IPhone-12','123123112',1,20.00,179),(197,'IPhone-5s','5123123',2,19929.00,179),(198,'IPhone-6','12312312',1,10230102.00,179),(199,'IPhone-12','123123112',1,20.00,180),(200,'IPhone-5s','5123123',2,19929.00,180),(201,'IPhone-6','12312312',1,10230102.00,180),(202,'IPhone-12','123123112',1,20.00,181),(203,'IPhone-5s','5123123',2,19929.00,181),(204,'IPhone-6','12312312',1,10230102.00,181),(205,'Nokkkkial','12312313',1,123561.00,181),(206,'Nokkkkial','12312313',69,123561.00,186),(207,'IPhone-12','123123112',12,20.00,186),(208,'IPhone-5s','5123123',1,19929.00,186),(209,'Nokkkkial','12312313',69,123561.00,187),(210,'IPhone-12','123123112',12,20.00,187),(211,'IPhone-5s','5123123',1,19929.00,187),(212,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,188),(213,'LG E612 Optimus L5','100003',2,15999.00,188),(214,'ZTE V790 Black','100002',1,0.00,189),(215,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,189),(216,'NOKIA Asha 311 Dark Grey','100004',1,0.00,189),(217,'ZTE V790 Black','100002',2,0.00,190),(218,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,190),(219,'NOKIA Asha 311 Dark Grey','100004',1,0.00,190),(220,'ZTE V790 Black','100002',3,0.00,191),(221,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,191),(222,'SAMSUNG I9300 Galaxy S III','100001',2,12999.00,192),(223,'SAMSUNG I9300 Galaxy S III','100001',2,12999.00,193),(224,'LG E612 Optimus L5','100003',1,15999.00,193),(225,'ZTE V790 Black','100002',2,0.00,194),(226,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,194),(227,'ZTE V790 Black','100002',2,0.00,195),(228,'SAMSUNG I9300 Galaxy S III','100001',3,12999.00,195),(229,'ZTE V790 Black','100002',1,0.00,196),(230,'ZTE V790 Black','100002',1,0.00,197),(231,'ZTE V790 Black','100002',1,0.00,198),(232,'ZTE V790 Black','100002',1,0.00,199),(233,'ZTE V790 Black','100002',1,0.00,200),(234,'ZTE V790 Black','100002',1,0.00,201),(235,'ZTE V790 Black','100002',1,0.00,202),(236,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,203),(237,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,204),(238,'SAMSUNG I9300 Galaxy S III','100001',1,12999.00,205),(239,'SAMSUNG I9300 Galaxy S III','100001',2,12999.00,206);
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
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `distance` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `duration` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address_store_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `number_order` (`number_order`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (152,10152,'123','2014-04-24 00:22:44',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'','Pending','','',81),(153,10153,'123','2014-04-24 00:24:54',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,3706830,3706860,'Taganrog',0,'123','1',123,123,'','Pending','','',81),(186,10186,'123','2014-05-27 23:29:59',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',99,8545878,8545977,'Volgograd',0,'1','1',1,1,'','Pending',NULL,NULL,81),(187,10187,'123','2014-05-27 23:50:44',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',99,8545878,8545977,'Volgograd',0,'1','1',1,1,'','Pending',NULL,NULL,81),(188,10188,NULL,'2014-06-10 02:46:02',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,44997,45097,'Taganrog',0,'481828','ÐŸÐµÑ‚Ñ€Ð¾Ð²ÑÐºÐ°Ñ',48,11,'','Approve','1','1 min',81),(189,10189,'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€','2014-06-10 04:40:45',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,12999,13029,'Taganrog',0,'512412412','ÐŸÐµÑ‚Ñ€Ð¾Ð²ÑÐºÐ°Ñ',124,51,'89123123512','Pending','1','3 day, 1 min',81),(190,10190,'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€','2014-06-10 05:21:40',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,12999,13099,'Taganrog',0,'52395230','ÐŸÐµÑ‚Ñ€Ð¾Ð²ÑÐºÐ°Ñ',54,12,'89172838131','Pending','1','3 day, 1 min',81),(191,10191,NULL,'2014-06-11 13:02:18',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,12999,13029,'Taganrog',0,'5615314','Ð“Ñ€ÐµÑ‡ÐµÑÐºÐ°Ñ',55,12,'89184123454','Pending','537','3 day, 7 hours 18 mins',81),(192,10192,NULL,'2014-06-16 13:48:16',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,25998,26028,'Taganrog',0,'5123123','Ð“Ð¾Ð³Ð¾Ð»ÐµÐ²ÑÐºÐ¸Ð¹',290,19,'81728181822','Pending','1','3 day, 1 min',81),(193,10193,NULL,'2014-06-16 13:50:49',NULL,NULL,NULL,NULL,'fixed','Cash on delivery',100,41997,42097,'Volgograd',0,'5712723','Ð›Ð¾Ð¼Ð¾Ð½Ð¾ÑÐ¾Ð²Ð°',18,27,'8718276481','Ð£Ñ‚Ð²ÐµÑ€Ð´Ð¸Ñ‚ÑŒ','538','3 day, 7 hours 20 mins',81),(195,10195,'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€','2014-06-16 14:33:18',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,38997,39027,'Taganrog',0,'1','1',1,1,'','Pending','537','3 day, 7 hours 19 mins',81),(206,10206,NULL,'2014-06-18 00:39:51',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',30,25998,26028,'Taganrog',0,'','',0,0,'','Pending','537','3 day, 7 hours 19 mins',82);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_store`
--

LOCK TABLES `product_store` WRITE;
/*!40000 ALTER TABLE `product_store` DISABLE KEYS */;
INSERT INTO `product_store` VALUES (8,14,'5123123',12),(9,15,'5123123',52),(10,15,'12312313',0),(11,14,'12312313',0),(12,14,'123123131111111',23),(13,17,'5123123',12),(14,17,'12312312',121),(15,17,'123512313',12),(16,17,'123123112',614),(17,15,'123123112',0),(18,14,'100000',14),(19,14,'100001',0),(20,14,'100003',63),(21,14,'100004',3),(22,14,'100006',24),(23,14,'100007',61),(24,14,'10000',3),(25,14,'100002',0),(26,14,'100008',12),(27,14,'100009',15),(28,14,'100010',41),(29,14,'100011',55),(30,14,'100012',4),(31,14,'100013',17),(32,14,'100014',71),(33,14,'100015',4),(34,14,'100017',22),(35,14,'100018',19),(36,15,'100002',0),(37,15,'100010',61),(38,15,'100012',0),(39,15,'100011',22),(40,15,'100001',17),(41,15,'100007',5),(43,16,'100001',12);
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
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_product` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `qty` int(11) unsigned DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `special_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `sku_index` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (27,'SAMSUNG I9300 Galaxy S III','100001','/images/phone/1.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Samsung, Ð¢Ð¸Ð¿ â€” Exynos 4412, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1400 ÐœÐ“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 1 Ð“Ð±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 16 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4.8 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 720x1280 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾Ñ‚Ð° Ð² 3G-Ñ','phone',29,19999.00,12999.00),(28,'ZTE V790 Black','100002','/images/phone/2.jpg','','phone',0,5999.00,0.00),(29,'LG E612 Optimus L5','100003','/images/phone/3.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Qualcomm, Ð¢Ð¸Ð¿ â€” MSM7225A Cortex A5, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 800 ÐœÐ“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 512 ÐœÐ±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 3 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 320x480 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾Ñ‚Ð° Ð²','phone',63,17999.00,15999.00),(30,'LG E612 Optimus L2','10000','/images/phone/4.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Qualcomm, Ð¢Ð¸Ð¿ â€” MSM7225A Cortex A5, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 800 ÐœÐ“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 512 ÐœÐ±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 3 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 320x480 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾Ñ‚Ð° Ð²','phone',3,19999.00,17999.00),(31,'NOKIA Asha 311 Dark Grey','100004','/images/phone/5.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÐ¾Ð´Ð´ÐµÑ€Ð¶ÐºÐ° 2-Ñ… SIM-ÐºÐ°Ñ€Ñ‚ â€” Ð•ÑÑ‚ÑŒ, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Qualcomm, Ð¢Ð¸Ð¿ â€” Snapdragon S4, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1000 ÐœÐ“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 768 ÐœÐ±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 4 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 480x800 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€','phone',3,18999.00,0.00),(32,'APPLE iPhone 5S 16GB Space Gray','10006','/images/phone/6.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” iOS, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Apple, Ð¢Ð¸Ð¿ â€” A7, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1.3 Ð“Ð“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 1 Ð“Ð±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 16 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 640x1136 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾Ñ‚Ð° Ð² 3G-ÑÐµÑ‚ÑÑ… â€” Ð•Ñ','phone',0,34999.00,29999.00),(33,'EXPLAY Atom Black','100007','/images/phone/7.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÐ¾Ð´Ð´ÐµÑ€Ð¶ÐºÐ° 3-Ñ… SIM-ÐºÐ°Ñ€Ñ‚ â€” Ð•ÑÑ‚ÑŒ, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” MediaTek, Ð¢Ð¸Ð¿ â€” MT6572, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1 Ð“Ð“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 512 ÐœÐ±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 4 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 480x800 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ','phone',66,24999.00,22599.00),(34,'SAMSUNG I9190 Galaxy S4','100008','/images/phone/8.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1.7 Ð“Ð“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 8 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4.3 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 540x960 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾Ñ‚Ð° Ð² 3G-ÑÐµÑ‚ÑÑ… â€” Ð•ÑÑ‚ÑŒ, ÐšÐ¾Ð¼Ð¼ÑƒÐ½Ð¸ÐºÐ°Ñ†Ð¸Ð¸ Ð¸ ÑÐ²ÑÐ·ÑŒ: Wi-Fi â€” Ð•ÑÑ‚ÑŒ, Bluetooth â€” Ð•ÑÑ‚ÑŒ, GPS-Ð¼Ð¾Ð´ÑƒÐ','phone',12,20999.00,19999.00),(35,'SAMSUNG I9500 Galaxy S4 16Gb ','100009','/images/phone/9.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Samsung, Ð¢Ð¸Ð¿ â€” Exynos 5 Octa 5410, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1.6 Ð“Ð“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 2 Ð“Ð±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 16 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 5 Ð´ÑŽÐ¹Ð¼Ð¾Ð², Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 1080x1920 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾Ñ‚Ð° ','phone',15,23999.00,19999.00),(36,'SONY Xperia SP C5303 Black','100010','/images/phone/12.jpg','ÐžÐ±Ñ‰Ð¸Ðµ: Ð¤Ð¾Ñ€Ð¼-Ñ„Ð°ÐºÑ‚Ð¾Ñ€ â€” Ð¼Ð¾Ð½Ð¾Ð±Ð»Ð¾Ðº, ÐžÐ¿ÐµÑ€Ð°Ñ†Ð¸Ð¾Ð½Ð½Ð°Ñ ÑÐ¸ÑÑ‚ÐµÐ¼Ð° â€” Android, ÐŸÑ€Ð¾Ñ†ÐµÑÑÐ¾Ñ€: ÐŸÑ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒ â€” Qualcomm, Ð¢Ð¸Ð¿ â€” Snapdragon S4 MSM8960Pro, Ð§Ð°ÑÑ‚Ð¾Ñ‚Ð° â€” 1.7 Ð“Ð“Ñ†, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐžÐ¿ÐµÑ€Ð°Ñ‚Ð¸Ð²Ð½Ð°Ñ Ð¿Ð°Ð¼ÑÑ‚ÑŒ (RAM) â€” 1 Ð“Ð±, ÐžÐ±ÑŠÐµÐ¼ Ð²ÑÑ‚Ñ€Ð¾ÐµÐ½Ð½Ð¾Ð¹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” 8 Ð“Ð±, Ð­ÐºÑ€Ð°Ð½: Ð”Ð¸Ð°Ð³Ð¾Ð½Ð°Ð»ÑŒ â€” 4.6 Ð´ÑŽÐ¹Ð¼Ð°, Ð Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 720x1280 ÐŸÐ¸ÐºÑ, Ð¡Ñ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚Ñ‹ ÑÐ¾Ñ‚Ð¾Ð²Ð¾Ð¹ ÑÐ²ÑÐ·Ð¸: Ð Ð°Ð±Ð¾','phone',102,27855.00,24855.00),(37,'NIKON D3100 KIT 18-55VR','100012','/images/Photo/1.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 23.1x15.4 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 14.2 ÐœÐ¿Ð¸ÐºÑ, Ð—Ð°Ð¿Ð¸ÑÑŒ: ÐœÐ°ÐºÑ. Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´ÐµÐ¾Ñ€Ð¾Ð»Ð¸ÐºÐ° â€” 1920x1080 ÐŸÐ¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” AF-S DX NIKKOR 18â€“55VR, Ð¡Ñ‚Ð°Ð±Ð¸Ð»Ð¸Ð·Ð°Ñ‚Ð¾Ñ€ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ â€” Ð•ÑÑ‚ÑŒ, Ð ÐµÐ¶Ð¸Ð¼Ñ‹ ÑÑŠÐµÐ¼ÐºÐ¸: Ð”Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð²Ñ‹Ð´ÐµÑ€Ð¶ÐºÐ¸ â€” 30-1/4000 Ñ, ÐŸÐ¸Ñ‚Ð°Ð½Ð¸Ðµ: ÐÐ°Ð¸Ð¼Ðµ','Photo',4,23566.00,0.00),(38,'CANON EOS 1100D KIT 18-55DC','100013','/images/Photo/2.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 22.2x14.7 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 12.2 ÐœÐ¿Ð¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” Eye-Fi, SDXC, SDHC, SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” Canon Zoom Lens EF-S 18-55, Ð ÐµÐ¶Ð¸Ð¼Ñ‹ ÑÑŠÐµÐ¼ÐºÐ¸: Ð”Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð²Ñ‹Ð´ÐµÑ€Ð¶ÐºÐ¸ â€” 30-1/4000 Ñ, ÐŸÐ¸Ñ‚Ð°Ð½Ð¸Ðµ: ÐÐ°Ð¸Ð¼ÐµÐ½Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð°ÐºÐºÑƒÐ¼ÑƒÐ»ÑÑ‚Ð¾Ñ€Ð° â€” LP-E10, Ð¦Ð²ÐµÑ‚ â€” Ð§ÐµÑ€Ð½Ñ‹Ð¹','Photo',17,21555.00,14.00),(41,'CANON EOS 650D Kit EF-S 18-55 IS II','100015','',NULL,NULL,4,25000.00,24000.00),(43,'CANON EOS 600D EF-S kit 18-55IS II','100014','/images/Photo/4.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 22.3x14.9 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 18 ÐœÐ¿Ð¸ÐºÑ, Ð—Ð°Ð¿Ð¸ÑÑŒ: ÐœÐ°ÐºÑ. Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´ÐµÐ¾Ñ€Ð¾Ð»Ð¸ÐºÐ° â€” 1920x1080 ÐŸÐ¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” CANON EF-S 18-55IS II, Ð¡Ñ‚Ð°Ð±Ð¸Ð»Ð¸Ð·Ð°Ñ‚Ð¾Ñ€ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ â€” Ð•ÑÑ‚ÑŒ, Ð ÐµÐ¶Ð¸Ð¼Ñ‹ ÑÑŠÐµÐ¼ÐºÐ¸: Ð”Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð²Ñ‹Ð´ÐµÑ€Ð¶ÐºÐ¸ â€” 30-1/4000 Ñ, ÐŸÐ¸Ñ‚Ð°Ð½Ð¸Ðµ: ÐÐ°Ð¸Ð¼ÐµÐ½Ð¾Ð','Photo',71,22489.00,20489.00),(45,' NIKON D3100 18-55VR+55-200nonVR','100016','/images/Photo/5.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 23.1x15.4 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 14.2 ÐœÐ¿Ð¸ÐºÑ, Ð—Ð°Ð¿Ð¸ÑÑŒ: ÐœÐ°ÐºÑ. Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´ÐµÐ¾Ñ€Ð¾Ð»Ð¸ÐºÐ° â€” 1920x1080 ÐŸÐ¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” SDXC, SDHC, SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” AF-S DX NIKKOR 18â€“55VR Ð¸ AF-S DX NIKKOR 55-200, Ð¡Ñ‚Ð°Ð±Ð¸Ð»Ð¸Ð·Ð°Ñ‚Ð¾Ñ€ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ â€” Ð•ÑÑ‚ÑŒ, Ð ÐµÐ¶Ð¸Ð¼Ñ‹ ÑÑŠÐµÐ¼ÐºÐ¸: Ð”Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð²Ñ‹Ð´ÐµÑ€Ð¶ÐºÐ¸ â€” 30-','Photo',0,21999.00,0.00),(46,'NIKON D7000 KIT 18-105','100017','/images/Photo/6.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 23.6x15.8 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 16.2 ÐœÐ¿Ð¸ÐºÑ, Ð—Ð°Ð¿Ð¸ÑÑŒ: ÐœÐ°ÐºÑ. Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´ÐµÐ¾Ñ€Ð¾Ð»Ð¸ÐºÐ° â€” 1920x1080 ÐŸÐ¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” SDXC, SDHC, SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” NIKON NIKKOR, Ð¡Ñ‚Ð°Ð±Ð¸Ð»Ð¸Ð·Ð°Ñ‚Ð¾Ñ€ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ â€” Ð•ÑÑ‚ÑŒ, Ð ÐµÐ¶Ð¸Ð¼Ñ‹ ÑÑŠÐµÐ¼ÐºÐ¸: Ð”Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð²Ñ‹Ð´ÐµÑ€Ð¶ÐºÐ¸ â€” 30-1/8000 Ñ, ÐŸÐ¸Ñ‚Ð°Ð½Ð¸Ðµ: ÐÐ°Ð¸Ð¼Ðµ','Photo',22,37889.00,0.00),(47,'NIKON D5100 18-55VR+55-200VR','100018','/images/Photo/8.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 23.6x15.8 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 16.2 ÐœÐ¿Ð¸ÐºÑ, Ð—Ð°Ð¿Ð¸ÑÑŒ: ÐœÐ°ÐºÑ. Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´ÐµÐ¾Ñ€Ð¾Ð»Ð¸ÐºÐ° â€” 1920x1080 ÐŸÐ¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” NIKON NIKKOR DX 18-55/F3.5-5.6VR + ','Photo',19,26990.00,0.00),(48,'NIKON D5100 18-55VR+55-200VR','100019','/images/Photo/9.jpg','ÐœÐ°Ñ‚Ñ€Ð¸Ñ†Ð°: Ð Ð°Ð·Ð¼ÐµÑ€ â€” 23.6x15.8 Ð¼Ð¼, Ð¢Ð¸Ð¿ â€” CMOS, Ð­Ñ„Ñ„ÐµÐºÑ‚Ð¸Ð²Ð½Ð¾Ðµ Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ â€” 16.2 ÐœÐ¿Ð¸ÐºÑ, Ð—Ð°Ð¿Ð¸ÑÑŒ: ÐœÐ°ÐºÑ. Ñ€Ð°Ð·Ñ€ÐµÑˆÐµÐ½Ð¸Ðµ Ð²Ð¸Ð´ÐµÐ¾Ñ€Ð¾Ð»Ð¸ÐºÐ° â€” 1920x1080 ÐŸÐ¸ÐºÑ, ÐŸÐ°Ð¼ÑÑ‚ÑŒ: ÐšÐ°Ñ€Ñ‚Ñ‹ Ð¿Ð°Ð¼ÑÑ‚Ð¸ â€” SD, ÐžÐ¿Ñ‚Ð¸ÐºÐ°: ÐœÐ¾Ð´ÐµÐ»ÑŒ Ð¾Ð±ÑŠÐµÐºÑ‚Ð¸Ð²Ð° â€” NIKON NIKKOR DX 18-55/F3.5-5.6VR + NIKON NIKKOR DX 55-200/F4-5.6VR, Ð¡Ñ‚Ð°Ð±Ð¸Ð»Ð¸Ð·Ð°Ñ‚Ð¾Ñ€ Ð¸Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ â€” Ð•ÑÑ‚ÑŒ, Ð ÐµÐ¶Ð¸Ð¼Ñ‹ ÑÑŠÐµÐ¼ÐºÐ¸: Ð”Ð¸Ð°Ð¿Ð°Ð·Ð¾Ð½ Ð²Ñ‹Ð´ÐµÑ€Ð¶ÐºÐ¸ â€','Photo',0,39499.00,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_items`
--

LOCK TABLES `quote_items` WRITE;
/*!40000 ALTER TABLE `quote_items` DISABLE KEYS */;
INSERT INTO `quote_items` VALUES (44,1,1,65),(45,1,44,66),(46,1,14,67),(47,2,2,67),(48,1,3,68),(49,1,4,71),(50,2,111,71),(52,2,596,72),(53,1,58,72),(54,1,12,73),(55,2,3,73),(56,1,12,74),(57,2,3,74),(58,1,4,75),(59,2,4,75),(60,1,12,76),(61,2,33,76),(62,1,12,77),(63,2,3,77),(64,2,44,68),(68,1,14,81),(69,2,1,81),(70,9,11,82),(71,1,10,83),(72,2,1,84),(73,1,3,84),(74,1,5,85),(75,2,5,85),(76,1,7,87),(77,1,7,89),(78,1,7,90),(79,1,56,91),(80,1,57,92),(81,1,30,93),(82,1,69,78),(83,1,31,94),(84,2,66,94),(85,9,12,78),(86,1,NULL,96),(87,1,NULL,97),(88,1,5,99),(89,1,1,100),(90,9,1,102),(91,2,2,102),(92,3,1,102),(93,1,1,102),(96,2,2,78),(97,2,1,104),(98,2,1,105),(99,8,1,106),(100,27,1,107),(101,29,2,107),(102,27,1,78),(103,28,2,108),(106,28,3,109),(107,27,1,109),(108,27,2,110),(109,27,2,111),(110,29,1,111),(111,27,3,108),(113,27,2,112);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (65,NULL,NULL,NULL,NULL,NULL,NULL),(66,NULL,NULL,NULL,NULL,NULL,NULL),(67,48,'fixed','Cash on delivery',100,1769712,1769812),(68,52,'fixed','Cash on delivery',100,1247559,1247659),(69,NULL,NULL,NULL,NULL,NULL,NULL),(70,NULL,NULL,NULL,NULL,NULL,NULL),(71,53,'fixed','Cash on delivery',100,2706363,2706463),(72,54,'fixed','Cash on delivery',100,19044222,19044322),(73,55,'fixed','Cash on delivery',100,1542519,1542619),(74,56,'fixed','Cash on delivery',100,1542519,1542619),(75,57,'fixed','Cash on delivery',100,573960,574060),(76,58,'fixed','Cash on delivery',100,2140389,2140489),(77,59,'fixed','Cash on delivery',100,1418958,1419058),(78,60,'Table rate','Cash on delivery',99,8545878,8545977),(79,NULL,NULL,NULL,NULL,NULL,NULL),(80,NULL,NULL,NULL,NULL,NULL,NULL),(81,61,'fixed','Cash on delivery',100,1749783,1749883),(82,62,'fixed','Cash on delivery',100,220,320),(83,63,'fixed','Cash on delivery',100,1235610,1235710),(84,64,'fixed','Cash on delivery',100,390612,390712),(85,65,NULL,NULL,NULL,0,NULL),(86,NULL,NULL,NULL,NULL,NULL,NULL),(87,66,'Table rate','Cash on delivery',30,741366,741396),(88,NULL,NULL,NULL,NULL,NULL,NULL),(89,84,'Table rate','Cash on delivery',30,864927,864957),(90,85,'fixed','Cash on delivery',100,864927,865027),(91,87,'fixed','Cash on delivery',100,6919416,6919516),(92,88,'fixed','Cash on delivery',100,7042977,7043077),(93,89,'Table rate','Cash on delivery',30,3706830,3706860),(94,90,'Table rate','Cash on delivery',30,5145705,5145735),(95,91,NULL,NULL,NULL,0,NULL),(96,NULL,NULL,NULL,NULL,NULL,NULL),(97,NULL,NULL,NULL,NULL,NULL,NULL),(98,NULL,NULL,NULL,NULL,NULL,NULL),(99,92,'fixed','Cash on delivery',100,617805,617905),(100,NULL,NULL,NULL,NULL,NULL,NULL),(101,NULL,NULL,NULL,NULL,NULL,NULL),(102,93,'Table rate','Cash on delivery',1000,10393541,10394541),(103,NULL,NULL,NULL,NULL,NULL,NULL),(104,94,'Table rate',NULL,NULL,NULL,NULL),(105,95,NULL,NULL,NULL,NULL,NULL),(106,NULL,NULL,NULL,NULL,NULL,NULL),(107,96,'fixed','Cash on delivery',100,44997,45097),(108,97,'Table rate','Cash on delivery',30,38997,39027),(109,98,'Table rate','Cash on delivery',30,12999,13029),(110,99,'fixed','Cash on delivery',100,25998,26098),(111,100,'fixed','Cash on delivery',100,41997,42097),(112,101,'Table rate','Cash on delivery',30,25998,26028);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'ÐÐ»ÐµÐºÑÐ°Ð½Ð´Ñ€','aaa_92@gmail.com','Ð¥Ð¾Ñ€Ð¾ÑˆÐ¸Ð¹ Ñ‚Ð¾Ð²Ð°Ñ€',1,27,39);
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

-- Dump completed on 2014-06-22 14:15:14
