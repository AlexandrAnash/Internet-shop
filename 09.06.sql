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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (49,73,5,'1','4',1,1),(50,73,5,'1','4',6,6),(51,73,5,'','',0,0),(52,73,5,'1','1',1,1),(53,73,5,'4','1',2,3),(54,73,5,'4','1',1,1),(55,78,5,'1','2',3,1),(56,73,5,'1','1',4,3),(57,73,5,'1','1',2,3),(58,73,5,'3','1',2,3),(59,73,5,'1','1',1,1),(60,4400,65,'1','1',1,1),(61,73,5,'12','1',1,1),(62,98,1149,'112','21',32,2),(63,73,5,'1','1',1,1),(64,73,5,'1','1',2,4),(65,NULL,NULL,NULL,NULL,NULL,NULL),(66,74,66,'13','12',2,1),(67,74,65,'123','12312312',3123,123123),(68,74,65,'123','12312312',3123,1232),(69,74,65,'123','12312312',3123,15555555),(70,74,65,'12','3123',1231,4294967295),(71,74,65,'123123','312312',3123213,12312312),(72,74,65,'123123','12',4294967295,4294967295),(73,74,65,'1231231','12312312',4294967295,4294967295),(74,74,65,'123123','123',411111,23),(75,4400,67,'123','1',5,1),(76,74,65,'15','25',35,45),(77,74,65,'31231','2321312',3123123,123123),(78,74,65,'31231','2321312',3123123,123123),(79,74,65,'123123','1231231321',12314,1),(80,74,65,'123','123123123',12312,3123),(81,74,65,'347900','Petrovskaya',40,1),(82,4400,65,'5919299','M.Jukova',99,12),(83,4851,67,'5888994','Krasnokholmskaya',11,4),(84,74,65,'1231','312312',3123,23123),(85,74,65,'1','1',1,1),(86,4400,65,'1','2',41,2),(87,74,65,'1','1',1,1),(88,74,65,'1','1',2,1),(89,74,65,'11','11',11,11111),(90,74,65,'4','1',12,3),(91,NULL,NULL,NULL,NULL,NULL,NULL),(92,74,65,'','',0,0),(93,4851,66,'1','1',1,1),(94,74,65,'123','1231',23123123,123),(95,74,65,'','',0,0);
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
INSERT INTO `customers` VALUES (36,'1',NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,68),(37,'Âàñÿ',NULL,'202cb962ac59075b964b07152d234b70',NULL,67),(38,'123',NULL,'202cb962ac59075b964b07152d234b70',5.00,78);
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
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (140,'Nokkkkial','12312313',11,123561.00,133),(141,'IPhone-5s','5123123',3,19929.00,133),(142,'Nokkkkial','12312313',3,123561.00,134),(143,'IPhone-5s','5123123',44,19929.00,134),(144,'Nokkkkial','12312313',3,123561.00,135),(145,'IPhone-5s','5123123',44,19929.00,135),(146,'Nokkkkial','12312313',1,123561.00,136),(147,'IPhone-5s','5123123',55,19929.00,136),(148,'IPhone-12','12322212312',33,99999999.99,136),(149,'Nokkkkial','12312313',14,123561.00,137),(150,'IPhone-5s','5123123',1,19929.00,137),(151,'IPhone-12','123123112',11,20.00,138),(152,'Nokkkkial','12312313',10,123561.00,139),(153,'IPhone-5s','5123123',1,19929.00,140),(154,'Nokkkkial','12312313',3,123561.00,140),(155,'Nokkkkial','12312313',6,123561.00,141),(156,'Nokkkkial','12312313',0,123561.00,142),(157,'Nokkkkial','12312313',12,123561.00,143),(158,'Nokkkkial','12312313',30,123561.00,144),(159,'Nokkkkial','12312313',30,123561.00,145),(160,'Nokkkkial','12312313',30,123561.00,146),(161,'Nokkkkial','12312313',30,123561.00,147),(162,'Nokkkkial','12312313',30,123561.00,148),(163,'Nokkkkial','12312313',30,123561.00,149),(164,'Nokkkkial','12312313',30,123561.00,150),(165,'Nokkkkial','12312313',30,123561.00,151),(166,'Nokkkkial','12312313',30,123561.00,152),(167,'Nokkkkial','12312313',30,123561.00,153),(168,'Nokkkkial','12312313',0,123561.00,154),(169,'Nokkkkial','12312313',0,123561.00,155),(170,'Nokkkkial','12312313',0,123561.00,156),(171,'Nokkkkial','12312313',0,123561.00,157),(172,'Nokkkkial','12312313',0,123561.00,158),(173,'Nokkkkial','12312313',0,123561.00,159),(174,'Nokkkkial','12312313',0,123561.00,160),(175,'Nokkkkial','12312313',0,123561.00,161),(176,'Nokkkkial','12312313',0,123561.00,162),(177,'Nokkkkial','12312313',0,123561.00,163),(178,'Nokkkkial','12312313',0,123561.00,164),(179,'Nokkkkial','12312313',30,123561.00,165),(180,'Nokkkkial','12312313',30,123561.00,166),(181,'Nokkkkial','12312313',30,123561.00,167),(182,'Nokkkkial','12312313',30,123561.00,168),(183,'Nokkkkial','12312313',30,123561.00,169),(184,'Nokkkkial','12312313',30,123561.00,170),(185,'Nokkkkial','12312313',60,123561.00,171),(186,'Nokkkkial','12312313',31,123561.00,172),(187,'IPhone-5s','5123123',66,19929.00,172),(188,'Nokkkkial','12312313',63,123561.00,173),(189,'IPhone-12','123123112',12,20.00,173),(190,'Nokkkkial','12312313',63,123561.00,174),(191,'IPhone-12','123123112',12,20.00,174),(192,'Nokkkkial','12312313',63,123561.00,175),(193,'IPhone-12','123123112',12,20.00,175),(194,'Nokkkkial','12312313',5,123561.00,176),(195,'Nokkkkial','12312313',5,123561.00,177),(196,'IPhone-12','123123112',1,20.00,179),(197,'IPhone-5s','5123123',2,19929.00,179),(198,'IPhone-6','12312312',1,10230102.00,179),(199,'IPhone-12','123123112',1,20.00,180),(200,'IPhone-5s','5123123',2,19929.00,180),(201,'IPhone-6','12312312',1,10230102.00,180),(202,'IPhone-12','123123112',1,20.00,181),(203,'IPhone-5s','5123123',2,19929.00,181),(204,'IPhone-6','12312312',1,10230102.00,181),(205,'Nokkkkial','12312313',1,123561.00,181),(206,'Nokkkkial','12312313',69,123561.00,186),(207,'IPhone-12','123123112',12,20.00,186),(208,'IPhone-5s','5123123',1,19929.00,186),(209,'Nokkkkial','12312313',69,123561.00,187),(210,'IPhone-12','123123112',12,20.00,187),(211,'IPhone-5s','5123123',1,19929.00,187);
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
  `phone` int(20) unsigned DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `distance` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `duration` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `number_order` (`number_order`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (187,10187,'123','2014-05-27 23:50:44',NULL,NULL,NULL,NULL,'Table rate','Cash on delivery',99,8545878,8545977,'Volgograd',0,'1','1',1,1,'','Pending',NULL,NULL);
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
INSERT INTO `product_store` VALUES (8,14,'5123123',12),(9,15,'5123123',52),(10,15,'12312313',0),(11,14,'12312313',0),(12,14,'123123131111111',23),(13,17,'5123123',12),(14,17,'12312312',121),(15,17,'123512313',12),(16,17,'123123112',614),(17,15,'123123112',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Nokkkkial','12312313','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',0,123561.00,NULL),(2,'IPhone-5s','5123123','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',76,19929.00,NULL),(3,'IPhone-6','12312312','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',121,10230102.00,NULL),(8,'Nokkkkial929','123512313','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',12,123561.00,999.00),(9,'IPhone-12','123123112','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',614,10230102.00,20.00),(10,'Mobila','1211233113','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',0,123561.00,NULL),(11,'IPhone-12','12322212312','http://www.theweblog.net/wp-content/uploads/2012/02/Nokia-Lumina-800.png','ssssssssssssss','',0,99999999.99,NULL),(12,'New Phone','1235123123','','asd asd as ga sdfsdf asdfsadf sadf asd fsa fasd fas fasd fasd fas fsad f sdfas fa sfas dfs','',0,5123.00,1235.00),(13,'Asus','12345123','','Notebook',NULL,0,123.00,111.00),(14,'123','123','','phone',NULL,0,2131.00,0.00),(15,'adadasda','sdasdasdas','','phone',NULL,0,123.00,123.00),(16,'Mobilellll','1234151231231','','Notebook',NULL,0,99999999.99,123.00),(17,'ffadf sdf asdf','123123','','adf asdf asd fasd fsdf asdfadf asdf asd fasd fsdf asdfadf asdf asd fasd fsdf asdfadf asdf asd fasd fsdf asdfadf asdf asd fasd fsdf asdfadf asdf asd fasd fsdf asdfadf asdf asd fasd fsdf asdf','Notebook',0,123.00,123.00),(18,'asdasdasd','123125412512','','asd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd fasd afsd fasdf asd fasd f','phone',0,123.00,0.00),(19,'fff','5125212','','123sad asd asd asd asd','phone',0,123.00,123.00),(21,'afasdafsdf','12366721','','asd','Notebook',0,123.00,0.00),(22,'tqweqwe','123667211','','14214124','Notebook',0,123.00,0.00),(23,'asdasdasd','12366721661','','412','phone',0,123.00,44.00),(24,'12312','312312','','12412 df sad f','phone',0,1324.00,0.00),(25,'123 12','151234124','','123123123123','phone',0,99999999.99,0.00),(26,'1231','2311231','','123','phone',0,231.00,123.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quote_items`
--

LOCK TABLES `quote_items` WRITE;
/*!40000 ALTER TABLE `quote_items` DISABLE KEYS */;
INSERT INTO `quote_items` VALUES (44,1,1,65),(45,1,44,66),(46,1,14,67),(47,2,2,67),(48,1,3,68),(49,1,4,71),(50,2,111,71),(52,2,596,72),(53,1,58,72),(54,1,12,73),(55,2,3,73),(56,1,12,74),(57,2,3,74),(58,1,4,75),(59,2,4,75),(60,1,12,76),(61,2,33,76),(62,1,12,77),(63,2,3,77),(64,2,44,68),(68,1,14,81),(69,2,1,81),(70,9,11,82),(71,1,10,83),(72,2,1,84),(73,1,3,84),(74,1,5,85),(75,2,5,85),(76,1,7,87),(77,1,7,89),(78,1,7,90),(79,1,56,91),(80,1,57,92),(81,1,30,93),(82,1,69,78),(83,1,31,94),(84,2,66,94),(85,9,12,78),(86,1,NULL,96),(87,1,NULL,97),(88,1,5,99),(89,1,1,100),(90,9,1,102),(91,2,2,102),(92,3,1,102),(93,1,1,102),(96,2,2,78),(97,2,1,104),(98,2,1,105),(99,8,1,106);
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (65,NULL,NULL,NULL,NULL,NULL,NULL),(66,NULL,NULL,NULL,NULL,NULL,NULL),(67,48,'fixed','Cash on delivery',100,1769712,1769812),(68,52,'fixed','Cash on delivery',100,1247559,1247659),(69,NULL,NULL,NULL,NULL,NULL,NULL),(70,NULL,NULL,NULL,NULL,NULL,NULL),(71,53,'fixed','Cash on delivery',100,2706363,2706463),(72,54,'fixed','Cash on delivery',100,19044222,19044322),(73,55,'fixed','Cash on delivery',100,1542519,1542619),(74,56,'fixed','Cash on delivery',100,1542519,1542619),(75,57,'fixed','Cash on delivery',100,573960,574060),(76,58,'fixed','Cash on delivery',100,2140389,2140489),(77,59,'fixed','Cash on delivery',100,1418958,1419058),(78,60,'Table rate','Cash on delivery',99,8545878,8545977),(79,NULL,NULL,NULL,NULL,NULL,NULL),(80,NULL,NULL,NULL,NULL,NULL,NULL),(81,61,'fixed','Cash on delivery',100,1749783,1749883),(82,62,'fixed','Cash on delivery',100,220,320),(83,63,'fixed','Cash on delivery',100,1235610,1235710),(84,64,'fixed','Cash on delivery',100,390612,390712),(85,65,NULL,NULL,NULL,0,NULL),(86,NULL,NULL,NULL,NULL,NULL,NULL),(87,66,'Table rate','Cash on delivery',30,741366,741396),(88,NULL,NULL,NULL,NULL,NULL,NULL),(89,84,'Table rate','Cash on delivery',30,864927,864957),(90,85,'fixed','Cash on delivery',100,864927,865027),(91,87,'fixed','Cash on delivery',100,6919416,6919516),(92,88,'fixed','Cash on delivery',100,7042977,7043077),(93,89,'Table rate','Cash on delivery',30,3706830,3706860),(94,90,'Table rate','Cash on delivery',30,5145705,5145735),(95,91,NULL,NULL,NULL,0,NULL),(96,NULL,NULL,NULL,NULL,NULL,NULL),(97,NULL,NULL,NULL,NULL,NULL,NULL),(98,NULL,NULL,NULL,NULL,NULL,NULL),(99,92,'fixed','Cash on delivery',100,617805,617905),(100,NULL,NULL,NULL,NULL,NULL,NULL),(101,NULL,NULL,NULL,NULL,NULL,NULL),(102,93,'Table rate','Cash on delivery',1000,10393541,10394541),(103,NULL,NULL,NULL,NULL,NULL,NULL),(104,94,'Table rate',NULL,NULL,NULL,NULL),(105,95,NULL,NULL,NULL,NULL,NULL),(106,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (28,'sdaf','sfasfs','dfsfafasdf',4,1,38),(29,'12','4213123','12',13,1,38),(31,'4124','124124','124124',412,1,38),(32,'123','123','123',123,1,38),(34,'4','41','1',1,1,38),(35,'4','4','4',111,1,38),(36,'2','2','1',1,1,38),(38,'1','1','1',1,1,38),(42,'1','2','3',3,2,38),(43,'3','2','1',4,2,38),(44,NULL,'','asdasdasd',1,1,38),(45,NULL,'123','123',1,1,38),(46,NULL,'','123',1,1,38),(47,NULL,'','123123123',1,1,38),(48,'123','','1231231',2,1,38),(49,'123','','123123',3,1,38),(50,'123','12312','3123123123123',4,8,38),(51,'123','','Çàùèòà äèïëîìà!',5,8,38);
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

-- Dump completed on 2014-06-09 21:53:21
