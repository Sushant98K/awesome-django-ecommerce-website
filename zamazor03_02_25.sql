-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zamazor
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add product',7,'add_product'),(26,'Can change product',7,'change_product'),(27,'Can delete product',7,'delete_product'),(28,'Can view product',7,'view_product'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add login history',10,'add_loginhistory'),(38,'Can change login history',10,'change_loginhistory'),(39,'Can delete login history',10,'delete_loginhistory'),(40,'Can view login history',10,'view_loginhistory'),(41,'Can add cart',11,'add_cart'),(42,'Can change cart',11,'change_cart'),(43,'Can delete cart',11,'delete_cart'),(44,'Can view cart',11,'view_cart'),(45,'Can add order placed',12,'add_orderplaced'),(46,'Can change order placed',12,'change_orderplaced'),(47,'Can delete order placed',12,'delete_orderplaced'),(48,'Can view order placed',12,'view_orderplaced'),(49,'Can add payment',13,'add_payment'),(50,'Can change payment',13,'change_payment'),(51,'Can delete payment',13,'delete_payment'),(52,'Can view payment',13,'view_payment'),(53,'Can add order item',14,'add_orderitem'),(54,'Can change order item',14,'change_orderitem'),(55,'Can delete order item',14,'delete_orderitem'),(56,'Can view order item',14,'view_orderitem'),(57,'Can add reset pass',15,'add_resetpass'),(58,'Can change reset pass',15,'change_resetpass'),(59,'Can delete reset pass',15,'delete_resetpass'),(60,'Can view reset pass',15,'view_resetpass');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$bW05MutuYYSyvufZ16hREZ$7bV/1TXM3TcloMfdGhx4QlowxrMSSTMuN4hE6Jn/L+w=','2025-02-02 22:11:20.909511',1,'toy','','','toy@gmail.com',1,1,'2025-01-06 19:55:13.423095'),(2,'pbkdf2_sha256$870000$dqOZenymKGyLcmm8IYu1uD$8msBwrH2d3lEVVx72lSt9S9ANFMoAABQ4JvpJcocgX4=','2025-02-02 22:04:55.883152',0,'Sushant Kate','Shawn                      ','Thunderbolt                      ','sushant98k@gmail.com',0,1,'2025-01-12 17:35:03.921537'),(3,'pbkdf2_sha256$870000$CnkZJB6rPs3upGQdANBG0H$ba2awMazI3yDXFzENy+EMXA6eYKijh27e1w1iZn6jhY=','2025-01-23 18:48:24.304482',0,'ToyBreaker','Shawn','Thunderbolt','sushantkate1998@gmail.com',0,1,'2025-01-14 15:31:19.962254'),(4,'pbkdf2_sha256$870000$IGZfib8dm7ugVuVVqJ0yIt$6Cs3tf3Fqz3Gdb9A/BH404ssoKxtx/hVoAj9loiQiow=','2025-01-19 11:34:35.304829',0,'sumit','Jane','Smith','ssghadye1121@gmail.co',0,1,'2025-01-19 10:53:33.376111');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-01-07 16:15:35.123936','1','Product object (1)',1,'[{\"added\": {}}]',7,1),(2,'2025-01-07 16:19:22.731660','2','Product object (2)',1,'[{\"added\": {}}]',7,1),(3,'2025-01-07 16:20:43.812733','3','Product object (3)',1,'[{\"added\": {}}]',7,1),(4,'2025-01-07 16:26:12.006312','4','Product object (4)',1,'[{\"added\": {}}]',7,1),(5,'2025-01-07 16:26:44.937454','5','Product object (5)',1,'[{\"added\": {}}]',7,1),(6,'2025-01-07 16:27:25.595331','6','Product object (6)',1,'[{\"added\": {}}]',7,1),(7,'2025-01-07 16:28:11.234049','7','Product object (7)',1,'[{\"added\": {}}]',7,1),(8,'2025-01-07 16:28:58.573238','8','Product object (8)',1,'[{\"added\": {}}]',7,1),(9,'2025-01-07 16:29:32.443908','9','Product object (9)',1,'[{\"added\": {}}]',7,1),(10,'2025-01-07 16:31:32.597853','10','Product object (10)',1,'[{\"added\": {}}]',7,1),(11,'2025-01-07 16:32:07.981233','11','Product object (11)',1,'[{\"added\": {}}]',7,1),(12,'2025-01-07 16:33:25.919357','12','Product object (12)',1,'[{\"added\": {}}]',7,1),(13,'2025-01-07 16:33:55.958142','13','Product object (13)',1,'[{\"added\": {}}]',7,1),(14,'2025-01-07 16:35:28.851179','14','Product object (14)',1,'[{\"added\": {}}]',7,1),(15,'2025-01-07 16:36:01.452965','15','Product object (15)',1,'[{\"added\": {}}]',7,1),(16,'2025-01-07 16:37:50.064391','16','Product object (16)',1,'[{\"added\": {}}]',7,1),(17,'2025-01-07 16:38:16.817044','17','Product object (17)',1,'[{\"added\": {}}]',7,1),(18,'2025-01-07 16:39:49.791712','18','Product object (18)',1,'[{\"added\": {}}]',7,1),(19,'2025-01-07 16:40:22.704657','19','Product object (19)',1,'[{\"added\": {}}]',7,1),(20,'2025-01-07 16:42:10.844895','20','Product object (20)',1,'[{\"added\": {}}]',7,1),(21,'2025-01-07 16:42:42.919858','21','Product object (21)',1,'[{\"added\": {}}]',7,1),(22,'2025-01-07 16:47:11.266509','22','Product object (22)',1,'[{\"added\": {}}]',7,1),(23,'2025-01-07 16:47:43.432563','23','Product object (23)',1,'[{\"added\": {}}]',7,1),(24,'2025-01-07 16:49:38.311494','24','Product object (24)',1,'[{\"added\": {}}]',7,1),(25,'2025-01-07 16:50:15.149428','25','Product object (25)',1,'[{\"added\": {}}]',7,1),(26,'2025-01-07 16:52:00.622775','26','Product object (26)',1,'[{\"added\": {}}]',7,1),(27,'2025-01-07 16:52:27.599506','27','Product object (27)',1,'[{\"added\": {}}]',7,1),(28,'2025-01-07 16:53:35.219428','28','Product object (28)',1,'[{\"added\": {}}]',7,1),(29,'2025-01-07 16:54:29.742670','29','Product object (29)',1,'[{\"added\": {}}]',7,1),(30,'2025-01-07 16:56:17.998670','30','Product object (30)',1,'[{\"added\": {}}]',7,1),(31,'2025-01-07 16:57:01.717465','31','Product object (31)',1,'[{\"added\": {}}]',7,1),(32,'2025-01-10 17:19:27.701178','31','Product object (31)',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',7,1),(33,'2025-01-10 18:13:33.823927','33','Product object (33)',1,'[{\"added\": {}}]',7,1),(34,'2025-01-16 14:55:06.271357','1','Cart(toy, Herbal Face Wash, Quantity: 1)',3,'',11,1),(35,'2025-01-16 14:55:09.460189','3','Cart(toy, Non-Stick Cookware Set, Quantity: 1)',3,'',11,1),(36,'2025-01-16 14:55:12.997863','5','Cart(toy, Ceramic Dinnerware Set, Quantity: 1)',3,'',11,1),(37,'2025-01-16 15:39:55.553887','7','Cart(toy, Ceramic Dinnerware Set, Quantity: 2)',2,'[{\"changed\": {\"fields\": [\"Quantity\"]}}]',11,1),(38,'2025-01-16 16:01:00.346367','10','Cart(toy, Organic Basmati Rice, Quantity: 1)',3,'',11,1),(39,'2025-01-16 16:17:50.574052','13','Cart(toy, Bluetooth Speaker, Quantity: 2)',3,'',11,1),(40,'2025-01-16 16:19:10.103870','14','Cart(toy, Bluetooth Speaker, Quantity: 1)',3,'',11,1),(41,'2025-01-16 16:19:28.622693','15','Cart(toy, Bluetooth Speaker, Quantity: 1)',3,'',11,1),(42,'2025-01-16 16:20:35.110830','16','Cart(toy, Bluetooth Speaker, Quantity: 1)',3,'',11,1),(43,'2025-01-16 16:21:41.809602','17','Cart(toy, Bluetooth Speaker, Quantity: 2)',3,'',11,1),(44,'2025-01-16 16:22:05.473548','18','Cart(toy, Bluetooth Speaker, Quantity: 2)',3,'',11,1),(45,'2025-01-16 16:24:58.214926','12','Cart(toy, Pet Food Storage Container, Quantity: 2)',3,'',11,1),(46,'2025-01-16 16:24:58.214926','11','Cart(toy, Dog Chew Toys Set, Quantity: 1)',3,'',11,1),(47,'2025-01-16 16:24:58.214926','7','Cart(toy, Ceramic Dinnerware Set, Quantity: 2)',3,'',11,1),(48,'2025-01-16 16:24:58.214926','6','Cart(toy, Cotton Casual T-Shirt, Quantity: 1)',3,'',11,1),(49,'2025-01-16 16:25:03.753675','19','Cart(toy, Bluetooth Speaker, Quantity: 1)',3,'',11,1),(50,'2025-01-16 17:53:20.694672','20','Cart(toy, Bluetooth Speaker, Quantity: 1)',3,'',11,1),(51,'2025-01-17 21:35:16.293562','20','OrderPlaced object (20)',3,'',12,1),(52,'2025-01-17 21:35:16.293562','19','OrderPlaced object (19)',3,'',12,1),(53,'2025-01-17 21:35:16.293562','18','OrderPlaced object (18)',3,'',12,1),(54,'2025-01-17 21:35:16.293562','17','OrderPlaced object (17)',3,'',12,1),(55,'2025-01-17 21:35:16.293562','16','OrderPlaced object (16)',3,'',12,1),(56,'2025-01-17 21:35:16.293562','15','OrderPlaced object (15)',3,'',12,1),(57,'2025-01-17 21:35:16.293562','14','OrderPlaced object (14)',3,'',12,1),(58,'2025-01-17 21:35:16.293562','13','OrderPlaced object (13)',3,'',12,1),(59,'2025-01-17 21:35:16.293562','12','OrderPlaced object (12)',3,'',12,1),(60,'2025-01-17 21:35:16.293562','11','OrderPlaced object (11)',3,'',12,1),(61,'2025-01-17 21:35:16.293562','10','OrderPlaced object (10)',3,'',12,1),(62,'2025-01-17 21:35:16.293562','9','OrderPlaced object (9)',3,'',12,1),(63,'2025-01-17 21:35:16.293562','8','OrderPlaced object (8)',3,'',12,1),(64,'2025-01-17 21:35:16.293562','7','OrderPlaced object (7)',3,'',12,1),(65,'2025-01-17 21:35:16.293562','6','OrderPlaced object (6)',3,'',12,1),(66,'2025-01-17 21:35:16.293562','5','OrderPlaced object (5)',3,'',12,1),(67,'2025-01-17 21:35:16.293562','4','OrderPlaced object (4)',3,'',12,1),(68,'2025-01-17 21:35:16.293562','3','OrderPlaced object (3)',3,'',12,1),(69,'2025-01-17 21:35:16.293562','2','OrderPlaced object (2)',3,'',12,1),(70,'2025-01-17 21:35:16.293562','1','OrderPlaced object (1)',3,'',12,1),(71,'2025-01-18 06:55:24.105404','40','OrderPlaced object (40)',3,'',12,1),(72,'2025-01-18 06:55:24.105404','39','OrderPlaced object (39)',3,'',12,1),(73,'2025-01-18 06:55:24.105404','38','OrderPlaced object (38)',3,'',12,1),(74,'2025-01-18 06:55:24.105404','37','OrderPlaced object (37)',3,'',12,1),(75,'2025-01-18 06:55:24.105404','36','OrderPlaced object (36)',3,'',12,1),(76,'2025-01-18 06:55:24.105404','35','OrderPlaced object (35)',3,'',12,1),(77,'2025-01-18 06:55:24.106907','34','OrderPlaced object (34)',3,'',12,1),(78,'2025-01-18 06:55:24.106907','33','OrderPlaced object (33)',3,'',12,1),(79,'2025-01-18 06:55:24.106907','32','OrderPlaced object (32)',3,'',12,1),(80,'2025-01-18 06:55:24.106907','31','OrderPlaced object (31)',3,'',12,1),(81,'2025-01-18 06:55:24.106907','30','OrderPlaced object (30)',3,'',12,1),(82,'2025-01-18 06:55:24.106907','29','OrderPlaced object (29)',3,'',12,1),(83,'2025-01-18 06:55:24.106907','28','OrderPlaced object (28)',3,'',12,1),(84,'2025-01-18 06:55:24.106907','27','OrderPlaced object (27)',3,'',12,1),(85,'2025-01-18 06:55:24.106907','26','OrderPlaced object (26)',3,'',12,1),(86,'2025-01-18 06:55:24.106907','25','OrderPlaced object (25)',3,'',12,1),(87,'2025-01-18 06:55:24.106907','24','OrderPlaced object (24)',3,'',12,1),(88,'2025-01-18 06:55:24.106907','23','OrderPlaced object (23)',3,'',12,1),(89,'2025-01-18 06:55:24.106907','22','OrderPlaced object (22)',3,'',12,1),(90,'2025-01-18 06:55:24.106907','21','OrderPlaced object (21)',3,'',12,1),(91,'2025-01-18 06:55:30.621061','26','Payment object (26)',3,'',13,1),(92,'2025-01-18 06:55:30.621061','25','Payment object (25)',3,'',13,1),(93,'2025-01-18 06:55:30.621061','24','Payment object (24)',3,'',13,1),(94,'2025-01-18 06:55:30.621061','23','Payment object (23)',3,'',13,1),(95,'2025-01-18 06:55:30.621061','22','Payment object (22)',3,'',13,1),(96,'2025-01-18 06:55:30.621061','21','Payment object (21)',3,'',13,1),(97,'2025-01-18 06:55:30.621061','20','Payment object (20)',3,'',13,1),(98,'2025-01-18 06:55:30.621061','19','Payment object (19)',3,'',13,1),(99,'2025-01-18 06:55:30.621061','18','Payment object (18)',3,'',13,1),(100,'2025-01-18 06:55:30.621061','17','Payment object (17)',3,'',13,1),(101,'2025-01-18 06:55:30.621061','16','Payment object (16)',3,'',13,1),(102,'2025-01-18 06:55:30.621061','15','Payment object (15)',3,'',13,1),(103,'2025-01-18 06:55:30.621061','14','Payment object (14)',3,'',13,1),(104,'2025-01-18 06:55:30.621061','13','Payment object (13)',3,'',13,1),(105,'2025-01-18 06:55:30.621061','12','Payment object (12)',3,'',13,1),(106,'2025-01-18 06:55:30.621061','11','Payment object (11)',3,'',13,1),(107,'2025-01-18 06:55:30.621061','10','Payment object (10)',3,'',13,1),(108,'2025-01-18 06:55:30.621061','9','Payment object (9)',3,'',13,1),(109,'2025-01-18 06:55:30.621061','8','Payment object (8)',3,'',13,1),(110,'2025-01-18 06:55:30.621061','7','Payment object (7)',3,'',13,1),(111,'2025-01-18 06:55:30.621061','6','Payment object (6)',3,'',13,1),(112,'2025-01-18 06:55:30.621061','5','Payment object (5)',3,'',13,1),(113,'2025-01-18 06:55:30.621061','4','Payment object (4)',3,'',13,1),(114,'2025-01-18 06:55:30.621061','3','Payment object (3)',3,'',13,1),(115,'2025-01-18 06:55:30.622061','2','Payment object (2)',3,'',13,1),(116,'2025-01-18 06:55:30.622061','1','Payment object (1)',3,'',13,1),(117,'2025-01-19 09:02:15.827258','57','OrderPlaced object (57)',3,'',12,1),(118,'2025-01-19 09:02:15.827258','56','OrderPlaced object (56)',3,'',12,1),(119,'2025-01-19 09:02:15.827258','55','OrderPlaced object (55)',3,'',12,1),(120,'2025-01-19 09:02:15.827258','54','OrderPlaced object (54)',3,'',12,1),(121,'2025-01-19 09:02:15.827258','53','OrderPlaced object (53)',3,'',12,1),(122,'2025-01-19 09:02:15.827258','52','OrderPlaced object (52)',3,'',12,1),(123,'2025-01-19 09:02:15.827258','51','OrderPlaced object (51)',3,'',12,1),(124,'2025-01-19 09:02:15.827258','50','OrderPlaced object (50)',3,'',12,1),(125,'2025-01-19 09:02:15.827258','49','OrderPlaced object (49)',3,'',12,1),(126,'2025-01-19 09:02:15.827258','48','OrderPlaced object (48)',3,'',12,1),(127,'2025-01-19 09:02:15.827258','47','OrderPlaced object (47)',3,'',12,1),(128,'2025-01-19 09:02:15.827258','46','OrderPlaced object (46)',3,'',12,1),(129,'2025-01-19 09:02:15.827258','45','OrderPlaced object (45)',3,'',12,1),(130,'2025-01-19 09:02:15.827258','44','OrderPlaced object (44)',3,'',12,1),(131,'2025-01-19 09:02:15.827258','43','OrderPlaced object (43)',3,'',12,1),(132,'2025-01-19 09:02:15.827258','42','OrderPlaced object (42)',3,'',12,1),(133,'2025-01-19 09:02:15.827258','41','OrderPlaced object (41)',3,'',12,1),(134,'2025-01-19 11:33:32.072742','3','sumit',1,'[{\"added\": {}}]',9,1),(135,'2025-01-24 15:13:33.833553','1','Fashion',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(136,'2025-01-24 15:14:23.548043','1','Fashion',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(137,'2025-01-24 15:49:42.412614','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(138,'2025-01-24 15:51:01.058826','3','Home and Kitchen',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(139,'2025-01-24 15:53:40.016596','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(140,'2025-01-24 15:53:49.243891','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(141,'2025-01-24 15:55:10.685623','3','Home and Kitchen',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(142,'2025-01-24 15:55:18.610811','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(143,'2025-01-24 15:55:28.397504','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(144,'2025-01-24 15:56:11.566851','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(145,'2025-01-24 15:56:28.842098','2','Electronics',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(146,'2025-01-24 15:58:59.131897','3','Home and Kitchen',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(147,'2025-01-24 16:34:31.645533','4','Beauty and Personal Care',2,'[{\"changed\": {\"fields\": [\"Category img\"]}}]',8,1),(148,'2025-01-24 21:35:27.452377','13','Library',1,'[{\"added\": {}}]',8,1),(149,'2025-01-24 21:35:38.226898','13','Library',3,'',8,1),(150,'2025-01-27 18:29:12.033550','36','Test',2,'[{\"changed\": {\"fields\": [\"Product img\"]}}]',7,1),(151,'2025-01-27 18:29:36.846708','37','Test22',1,'[{\"added\": {}}]',7,1),(152,'2025-01-27 18:29:53.367758','38','Test asdaw',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'product','category'),(7,'product','product'),(6,'sessions','session'),(11,'shopcart','cart'),(14,'shopcart','orderitem'),(12,'shopcart','orderplaced'),(13,'shopcart','payment'),(15,'userauth','resetpass'),(10,'userprofile','loginhistory'),(9,'userprofile','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-05 17:31:04.492420'),(2,'auth','0001_initial','2025-01-05 17:31:17.681930'),(3,'admin','0001_initial','2025-01-05 17:31:20.155669'),(4,'admin','0002_logentry_remove_auto_add','2025-01-05 17:31:20.257467'),(5,'admin','0003_logentry_add_action_flag_choices','2025-01-05 17:31:20.320180'),(6,'contenttypes','0002_remove_content_type_name','2025-01-05 17:31:21.549781'),(7,'auth','0002_alter_permission_name_max_length','2025-01-05 17:31:22.500424'),(8,'auth','0003_alter_user_email_max_length','2025-01-05 17:31:22.768166'),(9,'auth','0004_alter_user_username_opts','2025-01-05 17:31:22.812498'),(10,'auth','0005_alter_user_last_login_null','2025-01-05 17:31:23.595574'),(11,'auth','0006_require_contenttypes_0002','2025-01-05 17:31:23.657156'),(12,'auth','0007_alter_validators_add_error_messages','2025-01-05 17:31:23.703090'),(13,'auth','0008_alter_user_username_max_length','2025-01-05 17:31:24.621921'),(14,'auth','0009_alter_user_last_name_max_length','2025-01-05 17:31:25.685696'),(15,'auth','0010_alter_group_name_max_length','2025-01-05 17:31:25.866234'),(16,'auth','0011_update_proxy_permissions','2025-01-05 17:31:25.921346'),(17,'auth','0012_alter_user_first_name_max_length','2025-01-05 17:31:27.176477'),(18,'sessions','0001_initial','2025-01-05 17:31:27.833176'),(19,'product','0001_initial','2025-01-06 19:54:47.771736'),(20,'product','0002_category','2025-01-10 16:46:41.607912'),(21,'product','0003_alter_product_category','2025-01-10 17:16:58.792807'),(22,'product','0004_alter_product_category','2025-01-12 17:29:59.172631'),(23,'userprofile','0001_initial','2025-01-14 20:00:52.487621'),(24,'userprofile','0002_alter_profile_user','2025-01-15 15:21:51.011495'),(25,'userprofile','0003_loginhistory','2025-01-15 17:24:41.166529'),(26,'userprofile','0004_alter_loginhistory_city_alter_loginhistory_country_and_more','2025-01-15 17:45:58.484024'),(27,'shopcart','0001_initial','2025-01-16 07:19:01.575580'),(28,'shopcart','0002_cart_added_at','2025-01-16 07:26:21.818689'),(29,'shopcart','0003_alter_cart_unique_together','2025-01-16 07:30:58.966184'),(30,'shopcart','0004_payment_orderplaced','2025-01-17 19:23:57.155591'),(31,'shopcart','0005_orderplaced_razorpay_order_id','2025-01-17 21:32:06.865446'),(32,'userprofile','0003_alter_profile_phone','2025-01-17 21:34:25.422727'),(33,'userprofile','0004_profile_email','2025-01-17 21:54:33.949934'),(34,'userprofile','0005_alter_profile_email_alter_profile_first_name_and_more','2025-01-17 22:20:10.674073'),(35,'shopcart','0005_remove_orderplaced_payment_remove_orderplaced_status_and_more','2025-01-18 07:41:18.298516'),(36,'shopcart','0006_orderplaced_payment_id_orderplaced_status_and_more','2025-01-18 08:49:08.997825'),(37,'shopcart','0007_remove_orderplaced_product_orderitem','2025-01-18 08:58:31.210297'),(38,'userauth','0001_initial','2025-01-20 22:14:05.471935'),(39,'product','0005_alter_category_category_img','2025-01-24 15:22:20.016088'),(40,'product','0006_alter_category_category_img','2025-01-24 15:26:17.752510');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('15g40rysxn31gyy5fz1l5wh5qz4hr2mk','e30:1tcfw6:kxURaYI7xKz_-PjZjRHZZZRLXlfWj3K6ELn9GBof4h0','2025-02-11 07:23:02.086726'),('6032zutav5qtxeo3u61klidsenm1tuzt','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teb0f:2vvXvYLduuOG5IzMjSnEX5VsVdCc3EqyssG0AtEw4ps','2025-02-02 14:36:41.422276'),('a0tx0jopy0eoxe1uxs0lzi27ka3xl840','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1tcsGC:5kOqHwAfoAlm5Ep33AzQXH1d3QBzEjUPIB-3jyUBzRk','2025-02-11 20:32:36.960868'),('cjmodxlhc36w9bku3m6hvzyxolzhw3xo','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teGUn:ynDePauweLHzqIT7ZUdY4Gh66Bz6YYBh_sr8weCs4QI','2025-02-01 16:42:25.227144'),('d1afpekxmn8dz01weq7mc08209kbbmfy','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1tUtey:ZbR02Hd6EMkIxGx-p0JKUpr-LgXtLcDh581zYYzaXmQ','2025-01-20 20:25:12.923497'),('e325cxdms9mr6xpr8gxe8rmj1z4ctkhj','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teiEM:IAd7D8hx2P8bvMf0-yLOjBBizKrEVLS-T63ZWDlBO0M','2025-02-02 22:19:18.172949'),('fx5aaf9nhfk4kfdd1vdhwa1z84nj4bwb','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1tdAVt:zBNTmKYQLk1gcrW1K__a8CLIvahhVIWa-0BSubnwUH4','2025-02-12 16:02:01.657216'),('hfb07aoqatv1pl9yzrkm8y0h1tyxgex7','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teasV:q_xz7Ur1LnCQ4MNKbrTL_ZCPe7eOLFvnisOmbn9vd6I','2025-02-02 14:28:15.137704'),('nqcm8nqnvpnv64gbwupfw4ui37g7bz22','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1tWIA7:rOKX5peL7O9tFCkFhI_N5WS2xLB5JH3tjGsASqOXIns','2025-01-24 16:47:07.766386'),('pej6m3zchoqvl030p728uwefc7ci9468','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1tebYP:IUg2HcCAlqFmMlWsCry1JoJOntfuWP1Ke1MAD6Xb1YQ','2025-02-02 15:11:33.943113'),('pjhj7rkct1rqf4aogh5knxv7gtw3ghqf','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teclF:1CpBpfF-4nLt1SYj3E8l_oJzNz6ni9fCs9SdPBGG1ZY','2025-02-02 16:28:53.364526'),('qvm3m7y224ahdf1m0hqlhe7b4i5o18ue','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teGDG:QqeC_XSrE-3zu59vhbQAVqPibbUvgRpXBsTUOAiwUOI','2025-02-01 16:24:18.520846'),('ub4qmw9v79m54b9jo2owlnerw2q629fw','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teHNF:r2R3jlGtqAvTHaFGZhDQ23w4axukTlcJDTCVEitCAC0','2025-02-01 17:38:41.307701'),('uygwl9g3gqzosm7ts4fzgf181fayoxga','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1teFw9:kj8D1UwboifLLzCsnTko4zHU1olCxSbY4oL6Agugd3k','2025-02-01 16:06:37.144633'),('y0zxdcavlkumrwpe3yh9d7lo4ms5sxwr','.eJxVjLEOwjAMRP8lM4qaGtcpIzvfEDl2SgsokZp2Qvw7rdQBhlvuvbu3CbwuY1hrmsOk5mKcOf12keWZ8g70wflerJS8zFO0u2IPWu2taHpdD_fvYOQ6bmvspZXogahBdcDkFAfvhqYFURQPQoR87hCogzhw14CH1OoWgj6h-XwByfY3GQ:1tdZbT:f2SF_B2v4yhSRTbLF1vSj8fA15ivPdT31q0zTSUrZ70','2025-02-13 18:49:27.625837');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `shortform` varchar(2) NOT NULL,
  `description` longtext NOT NULL,
  `product_count` int NOT NULL,
  `category_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Fashion','fa','All fashion-related products.',9,'category/fa.png'),(2,'Electronics','el','Electronic gadgets and devices.',3,'category/el.png'),(3,'Home and Kitchen','hk','Home and kitchen appliances.',2,'category/hk.png'),(4,'Beauty and Personal Care','bc','Beauty and personal care items.',2,'category/bc.png'),(5,'Sports and Outdoors','so','Sports and outdoor equipment.',2,'category/healthandwellness.jpg'),(6,'Books and Stationery','bs','Books and office stationery.',2,''),(7,'Toys and Games','tg','Toys and games for all ages.',2,''),(8,'Health and Wellness','hw','Health and wellness products.',2,''),(9,'Automotive','au','Automotive accessories.',2,''),(10,'Pet Supplies','ps','Supplies for pets and animals.',2,''),(11,'Groceries and Essentials','gr','Daily groceries and essentials.',2,''),(12,'Jewelry and Accessories','ja','Jewelry and fashion accessories.',2,'');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pname` varchar(120) NOT NULL,
  `selling_price` double NOT NULL,
  `discounted_price` double NOT NULL,
  `description` longtext NOT NULL,
  `composition` longtext NOT NULL,
  `prodapp` longtext NOT NULL,
  `category_id` varchar(2) NOT NULL,
  `product_img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'Cotton Casual T-Shirt',499,399,'A lightweight cotton t-shirt designed for comfort and breathability.','100% cotton with reinforced stitching for durability.','Ideal for casual outings, gym wear, or layering.','1','product/Cotton_Casual_T-Shirt.jpg'),(2,'Slim Fit Denim Jeans',1499,1199,'Trendy slim-fit jeans that pair well with any outfit.','98% cotton, 2% elastane for flexibility.','Suitable for casual wear, dates, and semi-formal occasions.','1','product/Slim_Fit_Denim_Jeans.jpg'),(3,'Leather Jacket',5999,4999,'A premium leather jacket with a soft inner lining for all-weather use.','100% genuine leather.','Perfect for biker enthusiasts and winter outings.','1','product/Leather_Jacket.jpg'),(4,'Woolen Scarf',799,699,'Stylish woolen scarf available in multiple colors.','100% merino wool.','Ideal for keeping warm and accessorizing winter outfits.','1','product/Woolen_Scarf.jpg'),(5,'Running Shoes',2999,2499,'Lightweight running shoes with superior cushioning.','Mesh upper, EVA sole.','Perfect for jogging, gym, and casual outings.','1','product/Running_Shoes.jpg'),(6,'Aviator Sunglasses',1499,1199,'Classic aviator sunglasses with UV protection.','Metal frame, polarized lenses.','Ideal for protecting eyes from harsh sunlight while enhancing style.','1','product/Aviator_Sunglasses.jpg'),(7,'Backpack Handbag',1999,1499,'Convertible backpack and handbag for women.','Vegan leather.','Great for office, college, and casual outings.','1','product/Backpack_Handbag.jpg'),(8,'Printed Summer Dress',1799,1399,'Floral printed summer dress with a comfortable fit.','Cotton blend.','Perfect for brunches, picnics, and casual outings.','1','product/Printed_Summer_Dress.jpg'),(9,'Formal Blazer',3999,3499,'Tailored blazer with a slim-fit design for professionals.','Polyester blend.','Ideal for office meetings, events, and formal gatherings.','1','product/Formal_Blazer.jpg'),(10,'Wireless Earbuds',2999,2499,'True wireless earbuds with noise cancellation.','Plastic, silicone tips','Ideal for music lovers and hands-free calls.','2','product/Wireless_Earbuds.jpg'),(11,'Smartwatch',4999,3999,'A sleek smartwatch with fitness tracking.','Metal casing, silicone strap','Tracks steps, heart rate, and sleep patterns.','2','product/Smartwatch.jpg'),(12,'Non-Stick Cookware Set',2799,2399,'A 3-piece non-stick cookware set.','Aluminum with non-stick coating','Perfect for oil-free cooking.','3','product/Non-Stick_Cookware_Set_YBXQDy9.jpg'),(13,'Ceramic Dinnerware Set',3999,3499,'12-piece dinnerware set with a glossy finish.','Ceramic','Ideal for formal dinners and parties.','3','product/Ceramic_Dinnerware_Set.jpg'),(14,'Herbal Face Wash',299,249,'Gentle face wash enriched with aloe vera.','Aloe vera, neem extracts','Removes dirt and impurities, suitable for all skin types.','4','product/Herbal_Face_Wash.jpg'),(15,'Vitamin C Serum',799,699,'Skin-brightening serum with natural vitamin C.','Vitamin C, hyaluronic acid','Reduces dark spots and fine lines.','4','product/Vitamin_C_Serum.jpg'),(16,'Cricket Bat',2499,1999,'Professional-grade cricket bat for players.','English willow','Perfect for tournaments and practice sessions.','5','product/Cricket_Bat.jpg'),(17,'Yoga Mat',1199,999,'High-quality anti-slip yoga mat.','PVC','Provides excellent grip and comfort during workouts.','5','product/Yoga_Mat.jpg'),(18,'Hardcover Notebook',399,299,'Durable hardcover notebook with ruled pages.','Paper, cardboard cover','Ideal for students and professionals.','6','product/Hardcover_Notebook.jpg'),(19,'Ballpoint Pen Set',199,149,'Pack of 5 smooth-writing ballpoint pens.','Plastic body, ink cartridge','Suitable for everyday writing tasks.','6','product/Ballpoint_Pen_Set.jpg'),(20,'LEGO Building Blocks',2999,2499,'Creative building block set for kids.','Plastic','Enhances creativity and motor skills.','7','product/LEGO_Building_Blocks.jpg'),(21,'RC Car',1799,1499,'Remote-controlled car with high-speed motors.','Plastic, electronic components','Great for outdoor fun and racing.','7','product/RC_Car.jpg'),(22,'Digital Blood Pressure Monitor',3499,2999,'Automatic digital blood pressure monitor with large display and memory function.','Plastic body, electronic sensors, adjustable cuff.','Ideal for tracking blood pressure and pulse rate at home.','8','product/Digital_Blood_Pressure_Monitor.jpg'),(23,'Infrared Forehead Thermometer',2499,1999,'Non-contact infrared thermometer with instant temperature reading and memory storage.','Plastic body, advanced infrared sensors.','Ideal for measuring body, surface, and room temperature without physical contact.','8','product/Infrared_Forehead_Thermometer.jpg'),(24,'Car Vacuum Cleaner',1999,1699,'Compact, high-suction car vacuum cleaner with multiple attachments.','ABS plastic and stainless steel filter.','Perfect for cleaning car interiors, seats, and carpets.','9','product/Car_Vacuum_Cleaner.jpg'),(25,'Magnetic Phone Mount',799,599,'Universal magnetic car phone mount with a 360-degree adjustable design.','Aluminum alloy and strong neodymium magnets.','Holds your phone securely for hands-free navigation.','9','product/Magnetic_Phone_Mount.jpg'),(26,'Pet Food Storage Container',1599,1299,'Airtight pet food storage container with a 10-liter capacity.','BPA-free plastic with a sealing lid.','Keeps pet food fresh and moisture-free.','10','product/Pet_Food_Storage_Container.jpg'),(27,'Dog Chew Toys Set',999,799,'Set of 5 chew toys for dogs, including a rope toy and rubber bone.','Natural rubber and cotton rope.','Great for teething, chewing, and interactive play.','10','product/Dog_Chew_Toys_Set.jpg'),(28,'Organic Basmati Rice',799,699,'Premium long-grain organic basmati rice with a rich aroma and taste.','100% organic basmati rice, certified pesticide-free.','Perfect for biryanis, pilafs, and daily meals.','11','product/Organic_Basmati_Rice.jpg'),(29,'Cold-Pressed Olive Oil',1499,1299,'Extra virgin cold-pressed olive oil with a fresh, fruity flavor.','100% pure extra virgin olive oil.','Suitable for salads, sautéing, and marinades.','11','product/Cold-Pressed_Olive_Oil.jpg'),(30,'Sterling Silver Pendant Necklace',2499,1999,'Elegant sterling silver necklace with a heart-shaped pendant.','92.5 sterling silver with cubic zirconia stones.','Perfect for gifting or accessorizing evening wear.','12','product/Sterling_Silver_Pendant_Necklace.jpg'),(31,'Leather Strap Wristwatch',3999,3299,'Classic wristwatch with a genuine leather strap and quartz movement.','Stainless steel case, leather strap, mineral glass.','Suitable for formal occasions and everyday wear.','12','product/Leather_Strap_Wristwatch.jpg'),(32,'Bluetooth Speaker',2499,2199,'Compact, waterproof Bluetooth speaker with rich bass.','Plastic body, silicone covering.','Perfect for outdoor parties and travel.','2','product/Bluetooth_Speaker_NIAd9cn.jpg');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart_cart`
--

DROP TABLE IF EXISTS `shopcart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `added_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopcart_cart_user_id_product_id_3c38cf81_uniq` (`user_id`,`product_id`),
  KEY `shopcart_cart_product_id_58f424e5_fk_product_product_id` (`product_id`),
  CONSTRAINT `shopcart_cart_product_id_58f424e5_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `shopcart_cart_user_id_43687568_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shopcart_cart_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart_cart`
--

LOCK TABLES `shopcart_cart` WRITE;
/*!40000 ALTER TABLE `shopcart_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopcart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart_orderitem`
--

DROP TABLE IF EXISTS `shopcart_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopcart_orderitem_order_id_2a139be5_fk_shopcart_orderplaced_id` (`order_id`),
  KEY `shopcart_orderitem_product_id_e9062bdc_fk_product_product_id` (`product_id`),
  CONSTRAINT `shopcart_orderitem_order_id_2a139be5_fk_shopcart_orderplaced_id` FOREIGN KEY (`order_id`) REFERENCES `shopcart_orderplaced` (`id`),
  CONSTRAINT `shopcart_orderitem_product_id_e9062bdc_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `shopcart_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart_orderitem`
--

LOCK TABLES `shopcart_orderitem` WRITE;
/*!40000 ALTER TABLE `shopcart_orderitem` DISABLE KEYS */;
INSERT INTO `shopcart_orderitem` VALUES (1,1,2499.00,74,20),(2,1,2499.00,75,10),(3,1,1199.00,76,6),(4,1,2199.00,77,32),(5,1,699.00,79,15),(6,1,699.00,80,15),(7,1,399.00,81,1),(8,1,699.00,81,15),(9,1,399.00,82,1),(10,1,699.00,82,15),(11,1,399.00,83,1),(12,1,699.00,83,15),(13,1,399.00,84,1),(14,1,699.00,84,15),(15,1,399.00,85,1),(16,1,699.00,85,15),(17,1,3499.00,86,13),(18,1,2399.00,87,12),(19,1,699.00,87,15),(20,1,149.00,87,19),(21,1,999.00,88,17),(22,1,149.00,89,19),(23,2,7998.00,91,11),(24,1,1299.00,91,29),(25,2,2398.00,92,2),(26,1,4999.00,92,3);
/*!40000 ALTER TABLE `shopcart_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart_orderplaced`
--

DROP TABLE IF EXISTS `shopcart_orderplaced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart_orderplaced` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `profile_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `orderId` varchar(50) NOT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopcart_orderplaced_profile_id_ae2a9bfc_fk_userprofi` (`profile_id`),
  KEY `shopcart_orderplaced_user_id_38835111_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shopcart_orderplaced_profile_id_ae2a9bfc_fk_userprofi` FOREIGN KEY (`profile_id`) REFERENCES `userprofile_profile` (`id`),
  CONSTRAINT `shopcart_orderplaced_user_id_38835111_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shopcart_orderplaced_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart_orderplaced`
--

LOCK TABLES `shopcart_orderplaced` WRITE;
/*!40000 ALTER TABLE `shopcart_orderplaced` DISABLE KEYS */;
INSERT INTO `shopcart_orderplaced` VALUES (74,1,'2025-01-21 21:11:40.778056',2549.00,1,2,NULL,'2025012274','pay_PmEmAXM5XVIa9l','Paid'),(75,1,'2025-01-21 21:14:01.912482',2549.00,1,2,NULL,'2025012275','pay_PmEoV7bsAputm3','Paid'),(76,1,'2025-01-22 17:22:05.044257',1249.00,4,3,NULL,'2025012276','pay_PmZOdNLdStkXlS','Paid'),(77,1,'2025-01-22 19:50:44.388536',2249.00,1,2,NULL,'2025012377','pay_PmbvmAsgmCPLE3','Paid'),(78,1,'2025-01-22 20:12:08.469074',50.00,1,2,NULL,'2025012378',NULL,'Pending'),(79,1,'2025-01-23 18:48:48.522090',749.00,4,3,NULL,'2025012479',NULL,'Pending'),(80,1,'2025-01-23 18:48:58.696383',749.00,4,3,NULL,'2025012480',NULL,'Pending'),(81,1,'2025-01-23 18:49:29.119361',1148.00,4,3,NULL,'2025012481',NULL,'Pending'),(82,1,'2025-01-23 18:51:10.537439',1148.00,4,3,NULL,'2025012482',NULL,'Pending'),(83,1,'2025-01-23 18:51:15.635180',1148.00,4,3,NULL,'2025012483',NULL,'Pending'),(84,1,'2025-01-23 18:52:21.243363',1148.00,4,3,NULL,'2025012484',NULL,'Pending'),(85,1,'2025-01-23 18:53:27.572243',1148.00,4,3,NULL,'2025012485','pay_PmzUKiYq71ua7n','Paid'),(86,1,'2025-01-23 18:57:08.307681',3549.00,1,2,NULL,'2025012486','pay_PmzY8UmsdYd9Fb','Paid'),(87,1,'2025-01-23 19:07:02.469568',3297.00,1,2,NULL,'2025012487','pay_PmzicArvzd8LmS','Paid'),(88,1,'2025-01-25 20:57:51.242127',1049.00,1,2,NULL,'2025012688','pay_PnofyGL78xfNhT','Paid'),(89,1,'2025-01-28 20:25:03.157017',199.00,1,2,NULL,'2025012989','pay_PozicQUqTHyiag','Paid'),(90,1,'2025-01-28 20:30:28.547702',50.00,1,2,NULL,'2025012990',NULL,'Pending'),(91,1,'2025-01-28 20:30:53.684145',9347.00,1,2,NULL,'2025012991','pay_PozolR23ahPXTU','Paid'),(92,1,'2025-02-02 22:06:55.284820',7447.00,1,2,NULL,'2025020392','pay_Pr07tYlYjC57ww','Paid');
/*!40000 ALTER TABLE `shopcart_orderplaced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauth_resetpass`
--

DROP TABLE IF EXISTS `userauth_resetpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauth_resetpass` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `forget_pass_token` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forget_pass_token` (`forget_pass_token`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `userauth_resetpass_user_id_07bea77b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauth_resetpass`
--

LOCK TABLES `userauth_resetpass` WRITE;
/*!40000 ALTER TABLE `userauth_resetpass` DISABLE KEYS */;
INSERT INTO `userauth_resetpass` VALUES (7,'c51b8684-c3ba-490f-a5f2-d563b692d193','2025-01-21 14:42:14.366733',2),(8,'a08b0c54-a9a8-475b-a640-42ebf5abcde1','2025-01-22 17:12:47.942498',3);
/*!40000 ALTER TABLE `userauth_resetpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile_profile`
--

DROP TABLE IF EXISTS `userprofile_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(225) NOT NULL,
  `last_name` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `shipping_address` longtext NOT NULL,
  `billing_address` longtext NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `email` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userprofile_profile_user_id_f37c6bb1` (`user_id`),
  CONSTRAINT `userprofile_profile_user_id_f37c6bb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile_profile`
--

LOCK TABLES `userprofile_profile` WRITE;
/*!40000 ALTER TABLE `userprofile_profile` DISABLE KEYS */;
INSERT INTO `userprofile_profile` VALUES (1,'Shawn                      ','Thunderbolt                      ','97683 68524        ','456 Elm Street, Suite 200, Los Angeles, CA, 90001','Suite 200','Los Angeles','CA','United States','90001','2001-02-07','456 Elm Street, Suite 200, Los Angeles, CA, 90001','456 Elm Street, Suite 200, Los Angeles, CA, 90001','2025-01-18 07:13:33.217579',2,' sushant98k@gmail.com '),(3,'Jane','Smith','097683 68524','456 Elm Street, Suite 200, Los Angeles, CA, 90001','Suite 200','Los Angeles','CA','India','90001','1998-12-02','456 Elm Street, Suite 200, Los Angeles, CA, 90001','','2025-01-19 11:33:32.071741',4,NULL),(4,'Shawn','Thunderbolt','996985214','adai panvel','new village','mumbai','Raigarh','India','401235','1994-05-25','456 Elm Street, Suite 200, Los Angeles, CA, 90001','456 Elm Street, Suite 200, Los Angeles, CA, 90001','2025-01-22 17:21:37.678363',3,NULL),(5,'','','','','','','','India','','1991-10-22','','','2025-02-02 15:14:08.126969',1,NULL);
/*!40000 ALTER TABLE `userprofile_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-03  3:50:36
