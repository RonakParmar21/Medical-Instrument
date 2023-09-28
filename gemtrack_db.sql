-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: gemtrack
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `add_cart`
--

DROP TABLE IF EXISTS `add_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) NOT NULL,
  `p_id` int NOT NULL,
  `p_name` varchar(500) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_cart`
--

LOCK TABLES `add_cart` WRITE;
/*!40000 ALTER TABLE `add_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `add_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_signup`
--

DROP TABLE IF EXISTS `admin_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_signup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(500) NOT NULL,
  `admin_email` varchar(500) NOT NULL,
  `admin_password` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_signup`
--

LOCK TABLES `admin_signup` WRITE;
/*!40000 ALTER TABLE `admin_signup` DISABLE KEYS */;
INSERT INTO `admin_signup` VALUES (1,'ronak111','ronak111@gmail.com','ronak');
/*!40000 ALTER TABLE `admin_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_mobile` varchar(500) NOT NULL,
  `user_description` varchar(500) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'rutvik','rutvik123@gmail.com','1234567890','hello','2023-08-06 19:28:57'),(2,'rutvik','rutvik123@gmail.com','1234567890','hello','2023-08-06 19:31:06'),(3,'ronak','ronak@gmail.com','1234567890','hello, how are you?','2023-08-06 19:31:29'),(4,'khushi','khushi@gmail.com','1234567890','I am fine','2023-08-06 19:31:55'),(5,'yash','yash@gmail.com','9988776655','hii','2023-08-09 11:16:36'),(6,'ronak','ronak@gmail.com','9924450208','nice website','2023-08-20 21:19:09'),(7,'ronak','ronak@gmail.com','9924450208','nice website','2023-08-20 21:19:09'),(8,'ronak','rutvik123@gmail.com','9924450208','hello','2023-08-20 21:20:15');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_mobile` varchar(500) NOT NULL,
  `user_description` varchar(500) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'ronak','ronak@gmail.com','9924450208','hello ','2023-08-20 21:22:24'),(2,'<script>alert(1)</script>','rutvik123@gmail.com','9924450208','Hellow <script>alert(1)</script>','2023-08-21 13:23:14');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `inquiry_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_mobile` varchar(500) NOT NULL,
  `main_cat` varchar(500) NOT NULL,
  `sub_cat` varchar(500) NOT NULL,
  `product` varchar(500) NOT NULL,
  `sub_product` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (1,'ronak','ronak@gmail.com','9924450208','1','1','1','1','it is available in orange color','2023-09-09 14:42:58'),(2,'rutvik','rutvik123@gmail.com','1234567890','1','1','1','2','not available','2023-09-09 14:44:56'),(3,'jignasa','parmarjignasakishorbhai@gmail.com','9924450208','1','1','1','2','not available','2023-09-09 17:12:32'),(4,'ronak','rparmar21.2003@gmail.com','9924450208','1','1','1','2','it is available in orange color','2023-09-09 17:14:35'),(5,'smit rathod','punitvaghasiyap@gmail.com','9875250087','1','1','1','2','mane nathi khabar','2023-09-09 17:22:01'),(6,'sahil','sahilparmar1891@gmail.com','1234554333','1','1','1','2','what about dell products under 30000','2023-09-11 13:28:19'),(7,'rashesh','makawanarashesh61@gmail.com','6382838485','1','1','1','2','how are you?','2023-09-13 13:54:53'),(8,'dhruvil','pansuriyadhruvil@gmail.com','9192939495','1','1','1','2','how are you?','2023-09-13 13:58:02'),(9,'abhay','abhaysanchaniya11@gmail.com','1234512333','1','1','1','4','it available on red color??','2023-09-13 14:08:38'),(10,'madhav','madhavgediya1@gmail.com','9924450208','1','1','1','2','when it is available?','2023-09-21 13:18:18');
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_category`
--

DROP TABLE IF EXISTS `main_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_category` (
  `main_cat_id` int NOT NULL AUTO_INCREMENT,
  `main_cat_name` varchar(500) DEFAULT NULL,
  `main_cat_image` text NOT NULL,
  PRIMARY KEY (`main_cat_id`),
  UNIQUE KEY `main_cat_name_UNIQUE` (`main_cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_category`
--

LOCK TABLES `main_category` WRITE;
/*!40000 ALTER TABLE `main_category` DISABLE KEYS */;
INSERT INTO `main_category` VALUES (1,'Hospital Instrument','hospital instrument.jfif'),(2,'hp','gt-1-1.PNG');
/*!40000 ALTER TABLE `main_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `main_cat_id` int NOT NULL,
  `sub_cat_id` int NOT NULL,
  `product_name` varchar(500) DEFAULT NULL,
  `product_image` text NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,1,'OT Vantilator','ot vantilator.jfif'),(2,1,1,'OT Light','ot light.jfif'),(3,1,1,'OT Monitor','ot monitor.jfif'),(4,1,1,'OT leparoscopy','ot leparoscopy.jfif');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_password` varchar(500) NOT NULL,
  `user_cpassword` varchar(500) NOT NULL,
  `user_mobile` varchar(500) NOT NULL,
  `user_bdate` varchar(45) NOT NULL,
  `user_registration` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_profile` varchar(500) DEFAULT 'default.png',
  `user_verification_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup`
--

LOCK TABLES `signup` WRITE;
/*!40000 ALTER TABLE `signup` DISABLE KEYS */;
INSERT INTO `signup` VALUES (27,'Rutvik Dollar','rutvikdollar@gmail.com','RutvikDollar@123','RutvikDollar@123','1223344556','1221-12-12','2023-08-03 10:51:51','default.png',NULL),(28,'junagadh','junagadh@gmail.com','Junagadh','Junagadh','1234512345','3020-11-21','2023-08-05 19:12:50','default.png',NULL),(29,'Parmar Ronak','parmarronak111@gmail.com','ParmarRonak@21112003','ParmarRonak@21112003','9104320208','2003-11-21','2023-08-06 08:57:36','default.png',NULL),(30,'Aakash Odedara','aakashOd@gmail.com','AakashOdedara@123','AakashOdedara@123','0987654324','2003-11-21','2023-08-07 11:00:52','default.png',NULL),(31,'sujal','sujalthaker@gmail.com','sujal','sujal','1234543444','2004-06-09','2023-08-21 10:23:05','default.png',NULL),(32,'vadukar','vadukar@gmail.com','Vadukar@1234','Vadukar@1234','0987678787','2004-02-12','2023-08-21 10:40:28','default.png',NULL),(118,'madhav','madhavgediya1@gmail.com','Ronak@21','Ronak@21','9924450208','1111-11-21','2023-09-21 13:17:10','default.png','435884'),(119,'ronak','ronakagrava5504@gmail.com','Ronak@21','Ronak@21','9924450208','2003-11-21','2023-09-23 15:10:27','default.png','904167'),(120,'ronak','abhishekpaghdar28@gmail.com','Ronak@21','Ronak@21','9924450208','2003-11-21','2023-09-23 15:18:02','default.png','389322'),(121,'pradip','rudakiyapradip1995@gmail.com','Ronak@21','Ronak@21','9924450208','2003-11-21','2023-09-23 15:25:09','default.png','576509'),(122,'ronak','ronakbhalu07@gmail.com','Ronak@21','Ronak@21','9924450208','2222-11-21','2023-09-23 15:26:54','default.png','524450'),(123,'ronak','pr21112003@gmail.com','Ronak@21','Ronak@21','0987654321','2003-11-21','2023-09-25 10:20:33','default.png','67390');
/*!40000 ALTER TABLE `signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `sub_cat_id` int NOT NULL AUTO_INCREMENT,
  `main_cat_id` int NOT NULL,
  `sub_cat_name` varchar(500) DEFAULT NULL,
  `sub_cat_image` text NOT NULL,
  PRIMARY KEY (`sub_cat_id`),
  UNIQUE KEY `sub_cat_name_UNIQUE` (`sub_cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,1,'Operation Theatre','ot- 1.jfif'),(2,1,'ICU','icu.jfif'),(3,1,'Dental','dental.jfif'),(4,1,'Hospital Furniture','hospital furniture.jfif'),(5,1,'NICU','nicu.jfif'),(6,1,'Surgical','surgical.jfif');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_product`
--

DROP TABLE IF EXISTS `sub_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_product` (
  `sub_product_id` int NOT NULL AUTO_INCREMENT,
  `main_cat_id` int NOT NULL,
  `sub_cat_id` int NOT NULL,
  `product_id` int NOT NULL,
  `model_no` varchar(500) DEFAULT NULL,
  `description` text NOT NULL,
  `features` text NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `sub_product_image` text NOT NULL,
  PRIMARY KEY (`sub_product_id`),
  UNIQUE KEY `model_no_UNIQUE` (`model_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_product`
--

LOCK TABLES `sub_product` WRITE;
/*!40000 ALTER TABLE `sub_product` DISABLE KEYS */;
INSERT INTO `sub_product` VALUES (1,1,1,2,'OT Light 1','OT lights, also known as surgical light, are lamps that illuminate the surgical site, to get the best view of small, low-contrast objects at different depths in the incision and body cavity.','In recent years, LED OT light are slowly dominating the market, with features such as excellent cooling effect, good light quality, unlimited brightness regulation, uniform lighting, no screen flash, long life, energy saving and environmental protection.',10,100,'ot light - 1.PNG'),(2,1,1,2,'OT Light 2','OT lights, also known as surgical light, are lamps that illuminate the surgical site, to get the best view of small, low-contrast objects at different depths in the incision and body cavity.','In recent years, LED OT light are slowly dominating the market, with features such as excellent cooling effect, good light quality, unlimited brightness regulation, uniform lighting, no screen flash, long life, energy saving and environmental protection.',10,100,'ot light - 2.PNG'),(3,1,1,2,'OT Light 3','OT lights, also known as surgical light, are lamps that illuminate the surgical site, to get the best view of small, low-contrast objects at different depths in the incision and body cavity.','In recent years, LED OT light are slowly dominating the market, with features such as excellent cooling effect, good light quality, unlimited brightness regulation, uniform lighting, no screen flash, long life, energy saving and environmental protection.',10,200,'ot light - 3.PNG'),(4,1,1,1,'OT Vantilator 1','A ventilator is a machine that breathes for you or helps you breathe. It is also called a breathing machine or respirator.','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.',10,100,'ot vantilator 1.jfif'),(5,1,1,1,'OT Vantilator 2','A ventilator is a machine that breathes for you or helps you breathe. It is also called a breathing machine or respirator.','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.',10,1000,'ot vantilator 2.jfif'),(6,1,1,1,'OT Vantilator 3','A ventilator is a machine that breathes for you or helps you breathe. It is also called a breathing machine or respirator.','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.',10,2000,'ot vantilator 3.jfif'),(7,1,1,3,'monitor 1','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.',1000,5000,'ot monitor 1.jfif'),(8,1,1,4,'leparoscopy','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.','Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.Mechanical ventilators are machines that act as bellows to move air in and out of your lungs. Your respiratory therapist and doctor set the ventilator to control how often it pushes air into your lungs and how much air you get. You may be fitted with a mask to get air from the ventilator into your lungs.',100000,10,'laporoscopy.jfif');
/*!40000 ALTER TABLE `sub_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-28 19:32:59
