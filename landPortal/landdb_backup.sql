-- MySQL dump 10.13  Distrib 5.5.46, for Linux (x86_64)
--
-- Host: localhost    Database: landdb
-- ------------------------------------------------------
-- Server version	5.5.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add employee',7,'add_employee'),(20,'Can change employee',7,'change_employee'),(21,'Can delete employee',7,'delete_employee'),(25,'Can add shift',9,'add_shift'),(26,'Can change shift',9,'change_shift'),(27,'Can delete shift',9,'delete_shift'),(28,'Can add customer',10,'add_customer'),(29,'Can change customer',10,'change_customer'),(30,'Can delete customer',10,'delete_customer'),(31,'Can add order',11,'add_order'),(32,'Can change order',11,'change_order'),(33,'Can delete order',11,'delete_order'),(34,'Can add product',12,'add_product'),(35,'Can change product',12,'change_product'),(36,'Can delete product',12,'delete_product'),(37,'Can add order item',13,'add_orderitem'),(38,'Can change order item',13,'change_orderitem'),(39,'Can delete order item',13,'delete_orderitem'),(67,'Can add thing',23,'add_thing'),(68,'Can change thing',23,'change_thing'),(69,'Can delete thing',23,'delete_thing'),(94,'Can add supplier',32,'add_supplier'),(95,'Can change supplier',32,'change_supplier'),(96,'Can delete supplier',32,'delete_supplier'),(97,'Can add part',33,'add_part'),(98,'Can change part',33,'change_part'),(99,'Can delete part',33,'delete_part'),(100,'Can add purchase',34,'add_purchase'),(101,'Can change purchase',34,'change_purchase'),(102,'Can delete purchase',34,'delete_purchase'),(103,'Can add purchase_ parts',35,'add_purchase_parts'),(104,'Can change purchase_ parts',35,'change_purchase_parts'),(105,'Can delete purchase_ parts',35,'delete_purchase_parts'),(106,'Can add production',36,'add_production'),(107,'Can change production',36,'change_production'),(108,'Can delete production',36,'delete_production'),(109,'Can add task',37,'add_task'),(110,'Can change task',37,'change_task'),(111,'Can delete task',37,'delete_task'),(112,'Can add task_ part',38,'add_task_part'),(113,'Can change task_ part',38,'change_task_part'),(114,'Can delete task_ part',38,'delete_task_part'),(115,'Can add task_ step',39,'add_task_step'),(116,'Can change task_ step',39,'change_task_step'),(117,'Can delete task_ step',39,'delete_task_step');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$Df5hkI4jTb7s$FBlp2N0o+Zmac1koxlpBEYaY7TBka5ZEaz/EQnnxZUQ=','2016-06-23 01:29:44',1,'jlandgrebe','','','landgrebejordan@gmail.com',1,1,'2016-05-28 19:06:59'),(3,'pbkdf2_sha256$24000$STLA7jVyMZwK$naNTgXW3q/S8UZL/mEH+aQpi3GSTtJUOnMzXUZBQp1E=','2016-06-17 17:20:38',0,'Jlan3025','','','',0,1,'2016-06-01 18:33:12'),(4,'pbkdf2_sha256$24000$6taubTjPPLyZ$3L7VqfSDJgitHK5uNa3iGHCMh/7HM36wN4W3Fetn9jE=','2016-06-20 22:32:23',0,'blandgrebe','','','',0,1,'2016-06-02 03:02:03'),(5,'pbkdf2_sha256$24000$2He9Hu20ilAx$Une3PReEzd57UNxL6JpBLPjlL4QFBTzoqcUZkCUuKsY=','2016-06-16 19:12:52',0,'nmartinez','','','',0,1,'2016-06-02 15:06:25'),(6,'pbkdf2_sha256$24000$IuDjKFHdtPa6$JwjQ+qUi3rFALoLRRWsgNWaFKwuHcr0sDoSdOadPyqo=','2016-06-23 02:05:52',0,'mrtest','','','',0,1,'2016-06-02 20:45:20'),(7,'pbkdf2_sha256$24000$qQid57jNLR62$tofiypAh3myQr87J9HgQSpegmYm2ddquRayH6aHE+nE=','2016-06-13 14:51:24',0,'murphytaylor','','','',0,1,'2016-06-02 21:06:04'),(8,'pbkdf2_sha256$24000$sRrlr8JSCCmC$wY0rle3WHLR/I8GNo1cuVuMr9jh5R+FlPNg2/8hKRbE=','2016-06-22 18:07:05',0,'Trswrench','','','',0,1,'2016-06-02 21:27:46'),(9,'pbkdf2_sha256$24000$JImXTnqRgdWR$q4cczxV5teTIbd62T+Zl3KDhx6MoUnBGxC5cvrIlvE4=','2016-06-02 21:41:55',0,'jjewell','','','',0,1,'2016-06-02 21:40:04'),(10,'pbkdf2_sha256$24000$zGf3NXjVDEIo$I82cfg7Ryq2XfLK4qj5taYlFsvkPGeGYasVPBxeknIk=','2016-06-20 23:52:49',0,'beth1947','','','',0,1,'2016-06-05 17:56:19'),(11,'pbkdf2_sha256$24000$b4WaSGpQg8aI$/Y9jm1uFWJy/G4fpHRcIa1yI8lpqDa8ko+7c/S/LAws=','2016-06-21 23:10:50',0,'jeremyland23','','','',0,1,'2016-06-05 18:03:50'),(12,'pbkdf2_sha256$24000$sXNj231XRVdo$+534dPKCI2aJ6iKJDD348I/kz+Zn6KsWIHlUYqPLbU8=','2016-06-21 19:35:55',0,'Jacob17rios','','','',0,1,'2016-06-12 17:20:16');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-30 04:01:54','1','Employee object',1,'Added.',7,1),(2,'2016-05-30 04:41:20','3','Shift object',3,'',9,1),(3,'2016-05-30 04:41:31','2','Shift object',3,'',9,1),(4,'2016-05-30 04:41:35','1','Shift object',3,'',9,1),(5,'2016-05-30 04:45:41','8','Shift object',3,'',9,1),(6,'2016-05-30 04:46:36','7','Shift object',3,'',9,1),(7,'2016-05-30 04:46:41','6','Shift object',3,'',9,1),(8,'2016-05-30 04:46:46','5','Shift object',3,'',9,1),(9,'2016-05-30 04:46:50','4','Shift object',3,'',9,1),(10,'2016-06-01 13:37:42','2','Jlan3025',1,'Added.',4,1),(11,'2016-06-01 13:50:14','2','Jlan3025',2,'Changed is_staff.',4,1),(12,'2016-06-01 18:31:57','2','Jlan3025',3,'',4,1),(13,'2016-06-01 18:33:12','3','Jlan3025',1,'Added.',4,1),(14,'2016-06-01 18:33:23','3','Jlan3025',2,'No fields changed.',4,1),(15,'2016-06-01 18:37:06','2','Employee object',2,'Changed emp_user, emp_address, emp_city, emp_state, emp_zip, emp_start_date and emp_notes.',7,1),(16,'2016-06-02 01:25:59','1','Employee object',2,'Changed emp_level.',7,1),(17,'2016-06-02 01:26:16','2','Employee object',2,'Changed emp_level.',7,1),(18,'2016-06-02 03:02:03','4','blandgrebe',1,'Added.',4,1),(19,'2016-06-02 03:03:11','3','Employee object',1,'Added.',7,1),(20,'2016-06-02 15:06:25','5','nmartinez',1,'Added.',4,1),(21,'2016-06-02 15:07:50','4','Employee object',1,'Added.',7,1),(22,'2016-06-02 20:45:20','6','mrtest',1,'Added.',4,1),(23,'2016-06-02 20:45:26','6','mrtest',2,'No fields changed.',4,1),(24,'2016-06-02 20:46:26','5','Employee object',1,'Added.',7,1),(25,'2016-06-02 21:06:04','7','murphytaylor',1,'Added.',4,1),(26,'2016-06-02 21:07:05','6','Employee object',1,'Added.',7,1),(27,'2016-06-02 21:27:46','8','Trswrench',1,'Added.',4,1),(28,'2016-06-02 21:28:53','7','Employee object',1,'Added.',7,1),(29,'2016-06-02 21:40:04','9','jjewell',1,'Added.',4,1),(30,'2016-06-02 21:41:19','8','Employee object',1,'Added.',7,1),(31,'2016-06-02 23:00:15','1','Employee object',2,'Changed emp_level.',7,1),(32,'2016-06-03 03:24:06','1','Employee object',2,'Changed emp_level.',7,1),(33,'2016-06-03 13:08:20','1','Employee object',2,'Changed emp_level.',7,1),(34,'2016-06-03 13:54:39','1','Employee object',2,'Changed emp_level.',7,1),(35,'2016-06-03 14:14:38','1','Employee object',2,'Changed emp_level.',7,1),(36,'2016-06-03 16:42:07','2','Employee object',2,'Changed emp_level.',7,1),(37,'2016-06-03 16:44:01','1','Employee object',2,'Changed emp_level.',7,1),(38,'2016-06-03 16:44:24','5','Employee object',2,'Changed emp_level.',7,1),(39,'2016-06-05 15:01:48','4','blandgrebe',2,'Changed password.',4,1),(40,'2016-06-05 17:56:19','10','beth1947',1,'Added.',4,1),(41,'2016-06-05 17:57:25','9','Employee object',1,'Added.',7,1),(42,'2016-06-05 18:03:50','11','jeremyland23',1,'Added.',4,1),(43,'2016-06-05 18:04:46','10','Employee object',1,'Added.',7,1),(44,'2016-06-10 14:16:32','8','Employee object',2,'Changed emp_active.',7,1),(45,'2016-06-10 14:16:38','7','Employee object',2,'Changed emp_active.',7,1),(46,'2016-06-10 14:16:44','6','Employee object',2,'Changed emp_active.',7,1),(47,'2016-06-10 14:16:52','5','Employee object',2,'Changed emp_active.',7,1),(48,'2016-06-10 14:16:58','4','Employee object',2,'Changed emp_active.',7,1),(49,'2016-06-10 14:17:04','3','Employee object',2,'Changed emp_active.',7,1),(50,'2016-06-10 14:17:09','2','Employee object',2,'Changed emp_active.',7,1),(51,'2016-06-10 14:17:15','1','Employee object',2,'Changed emp_active.',7,1),(52,'2016-06-10 14:18:15','9','Employee object',2,'Changed emp_active.',7,1),(53,'2016-06-12 17:20:16','12','Jacob17rios',1,'Added.',4,1),(54,'2016-06-12 17:21:54','11','Employee object',1,'Added.',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'portal','customer'),(7,'portal','employee'),(11,'portal','order'),(13,'portal','orderitem'),(33,'portal','part'),(12,'portal','product'),(36,'portal','production'),(34,'portal','purchase'),(35,'portal','purchase_parts'),(9,'portal','shift'),(32,'portal','supplier'),(37,'portal','task'),(38,'portal','task_part'),(39,'portal','task_step'),(23,'portal','thing'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-05-28 19:05:41'),(2,'auth','0001_initial','2016-05-28 19:05:41'),(3,'admin','0001_initial','2016-05-28 19:05:41'),(4,'admin','0002_logentry_remove_auto_add','2016-05-28 19:05:41'),(5,'contenttypes','0002_remove_content_type_name','2016-05-28 19:05:41'),(6,'auth','0002_alter_permission_name_max_length','2016-05-28 19:05:41'),(7,'auth','0003_alter_user_email_max_length','2016-05-28 19:05:41'),(8,'auth','0004_alter_user_username_opts','2016-05-28 19:05:41'),(9,'auth','0005_alter_user_last_login_null','2016-05-28 19:05:41'),(10,'auth','0006_require_contenttypes_0002','2016-05-28 19:05:41'),(11,'auth','0007_alter_validators_add_error_messages','2016-05-28 19:05:41'),(12,'portal','0001_initial','2016-05-28 19:05:42'),(13,'portal','0002_auto_20160528_0244','2016-05-28 19:05:42'),(14,'portal','0003_employee_emp_user','2016-05-28 19:05:42'),(15,'sessions','0001_initial','2016-05-28 19:05:42'),(16,'portal','0004_auto_20160530_0335','2016-05-30 03:44:01'),(17,'portal','0005_auto_20160530_0343','2016-05-30 03:44:01'),(18,'portal','0006_employee_shift','2016-05-30 03:45:20'),(19,'portal','0007_auto_20160530_0351','2016-05-30 03:51:13'),(20,'portal','0008_shift','2016-05-30 03:52:07'),(21,'portal','0009_auto_20160530_0353','2016-05-30 03:54:07'),(22,'portal','0010_auto_20160531_0257','2016-05-31 02:58:01'),(23,'portal','0011_employee_emp_active','2016-06-04 19:50:06'),(24,'portal','0012_customer_order','2016-06-05 00:10:25'),(25,'portal','0013_product','2016-06-05 00:51:00'),(26,'portal','0014_auto_20160610_1732','2016-06-10 17:33:05'),(27,'portal','0015_orderitem','2016-06-12 19:04:01'),(28,'portal','0016_auto_20160612_1959','2016-06-12 19:59:55'),(29,'portal','0017_auto_20160615_0244','2016-06-15 02:44:29'),(30,'portal','0018_auto_20160615_1440','2016-06-15 14:40:38'),(31,'portal','0019_auto_20160616_2008','2016-06-16 20:08:16'),(32,'portal','0020_auto_20160616_2204','2016-06-16 22:04:31'),(33,'portal','0021_order_internalid','2016-06-17 02:15:34'),(34,'portal','0022_thing','2016-06-22 20:47:21'),(35,'portal','0023_auto_20160622_2356','2016-06-22 23:56:49'),(36,'portal','0024_auto_20160623_0121','2016-06-23 01:21:46'),(37,'portal','0025_auto_20160623_0126','2016-06-23 01:26:21'),(38,'portal','0026_part','2016-06-23 01:26:56'),(39,'portal','0027_auto_20160623_0203','2016-06-23 02:16:54'),(40,'portal','0028_auto_20160623_0209','2016-06-23 02:16:54'),(41,'portal','0029_auto_20160623_0212','2016-06-23 02:16:54'),(42,'portal','0030_delete_supplier','2016-06-23 02:16:54'),(43,'portal','0031_supplier','2016-06-23 02:40:35'),(44,'portal','0032_part_production_purchase_purchase_parts_task_task_part_task_step','2016-06-23 02:42:23');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0zhzkh2p3e74i3shksvbu1dly3b5pew9','MDJjMTAwMjBmMjMyODIyZDBiZTExNTZhNWUzOTA2ZTM5ODljNzk0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3NWUxM2E4MDEzYWI3NjI1NjBhZjg2OTk5YzJiOThlOGQxZmEyZGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2016-07-01 17:26:29'),('19owuaseqzy0248nj2ix06bsm50wv7fp','OWM2NzFkODY3MzI2ODI3NzIxZTlmNjg2ODNmM2FiMDg0Nzg1ZTI5ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJjNTE3YjI5MGNjMjEyZTlmZmMzMzcxMTVjZjQ3YTEyMTZjOGFlZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-06-17 16:34:32'),('1p35p6a6q3n43b0b9nbzl24bzg5swrde','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-07-04 18:44:45'),('1vwq1j4nv3y3fbmvngaih1ougf1e8uh9','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-16 21:08:09'),('2w6advongi5hcwf6wv7r7ranjho896m2','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-22 22:52:03'),('489wfkougeifpljond0qum65lxrjn6qr','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-27 14:51:24'),('62w1627ztoa3km4z0x55yqi7sbt3o1y9','NDE1YTkwNzkyMzk0YWMxZTA3ODZiZjY3NWIxNTk5MTE0M2I0NGU4NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3ZmJjZTcxY2M3ZTE5OTgzODU0OWQ4NTdmOTU2YTc0NWQzZWMyMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2016-06-30 17:58:32'),('6tck4ydgd4sllno94gy9zde6ubk5xb31','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-25 22:07:26'),('6xq9gq1t5de6qov8oysavf0wbbbxulcd','YjAxMTMwZjY3N2M0Mzc0NTFjMzhhMTdiMWEwYjg1Y2MyMWM2ZDIyMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY4ZWQzMGU0ZjI3OGQxMWJmMmI0MjZhNmUzZmYzY2E2YTUzZmJjYjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9','2016-07-05 23:10:50'),('8km2k53etpgjzztr2w7f4j6ho21him8e','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-23 22:55:51'),('8y8u0ugkls8jurxmp2chb79s23ulwmd4','MDJjMTAwMjBmMjMyODIyZDBiZTExNTZhNWUzOTA2ZTM5ODljNzk0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3NWUxM2E4MDEzYWI3NjI1NjBhZjg2OTk5YzJiOThlOGQxZmEyZGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2016-06-23 02:24:54'),('8yf9ii8m9cz4s9lwzco4pg7gv1fti7mn','NDFjMWE2ZmZiNTY2MzQxZGNhOWMwNzYwNTMwOGNlMjBiY2E5MGRhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMDlhOWQ3MDM1YmRjYjRhNTViYjg4NGQzM2Y1NjJjZjVkYWMwZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-06-30 22:50:27'),('9e42222rrwxm23b5vbw5kie2sc546yez','YjQwMWIyNTYxMzIxNGQyZTlmMjljZGNiNmJlY2UzZGY4Y2QzMWE2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlYmJjYjMyMDU4ZjQyYTRlNzA1NmQxOWYzNGZlOGU5MjIxOTg3MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2016-07-07 02:05:52'),('9x9trschrmyr5fii49k0dt1122uodcgj','OWM2NzFkODY3MzI2ODI3NzIxZTlmNjg2ODNmM2FiMDg0Nzg1ZTI5ZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJjNTE3YjI5MGNjMjEyZTlmZmMzMzcxMTVjZjQ3YTEyMTZjOGFlZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-07-01 17:20:38'),('aiccamzhiqslc46tucx1i2ekw8qaii4w','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-06-29 14:19:31'),('av2omlye03o0de5430qyc5sk6y8fxijn','NDFjMWE2ZmZiNTY2MzQxZGNhOWMwNzYwNTMwOGNlMjBiY2E5MGRhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMDlhOWQ3MDM1YmRjYjRhNTViYjg4NGQzM2Y1NjJjZjVkYWMwZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-07-04 22:32:23'),('b9hzsieircjjzqtmjclmxwwcrbm604bp','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-22 18:05:29'),('clgfz4rah2bw5cl2wpta9muazaz98v1r','MDJjMTAwMjBmMjMyODIyZDBiZTExNTZhNWUzOTA2ZTM5ODljNzk0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3NWUxM2E4MDEzYWI3NjI1NjBhZjg2OTk5YzJiOThlOGQxZmEyZGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2016-06-16 22:44:03'),('cxpamo251avxmviaus8g8p0xktxmm47a','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-06-26 17:22:18'),('dexc81cm81xh8q94pzv7yu3y6xc3mbyo','YjQwMWIyNTYxMzIxNGQyZTlmMjljZGNiNmJlY2UzZGY4Y2QzMWE2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlYmJjYjMyMDU4ZjQyYTRlNzA1NmQxOWYzNGZlOGU5MjIxOTg3MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2016-06-17 13:25:13'),('f1fsc1rjbpqh98cnshjiyha3qv191o4v','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-07-04 21:01:38'),('fh45nimdmv6nw66909eckfd6dcfqy1qw','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-07-05 13:55:26'),('iitk5vztcq89oedivalp4f3dv5slnssd','MDJjMTAwMjBmMjMyODIyZDBiZTExNTZhNWUzOTA2ZTM5ODljNzk0ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3NWUxM2E4MDEzYWI3NjI1NjBhZjg2OTk5YzJiOThlOGQxZmEyZGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=','2016-06-16 22:41:59'),('ld64yuyktlkkfs7qmp6wv29u1j9k9xhp','YjQwMWIyNTYxMzIxNGQyZTlmMjljZGNiNmJlY2UzZGY4Y2QzMWE2ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFlYmJjYjMyMDU4ZjQyYTRlNzA1NmQxOWYzNGZlOGU5MjIxOTg3MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2016-07-05 23:09:57'),('mowm3ho4nkrn83356q4a82qezzizxhnu','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-07-04 13:51:48'),('mxxtl4ys3ynyucr7f36ibnq4xbh9cjco','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-06-27 14:44:05'),('n3biju6x2f6he5ksi67qodtf1r51nylo','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-06-29 16:52:38'),('ndtwqhur51ckp3l6bzd55c8n435nz4g6','YjUyODcwODg4N2NiMmM4OGJjYzA3ZDRhY2FmOGUxYWVkMjJmMGZkMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImU5N2E1MTg3ZTBiMzVlODExMTAyN2IwM2YyYTVhZWQ5NDk4NmUzM2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9','2016-07-05 19:35:55'),('nhq0r7dn45miedn3lmwkc368vtm4zpbv','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-23 14:39:36'),('ou0wrdn8s749aaemutsyvd7omm0hobwd','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-25 14:53:21'),('oyihug2kdq11re6e5ez3kikcn6eqs3cj','NDFjMWE2ZmZiNTY2MzQxZGNhOWMwNzYwNTMwOGNlMjBiY2E5MGRhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMDlhOWQ3MDM1YmRjYjRhNTViYjg4NGQzM2Y1NjJjZjVkYWMwZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-06-19 21:06:20'),('p0j1uzje13f59hmfnzfvhd6giampy7yr','YjAxMTMwZjY3N2M0Mzc0NTFjMzhhMTdiMWEwYjg1Y2MyMWM2ZDIyMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY4ZWQzMGU0ZjI3OGQxMWJmMmI0MjZhNmUzZmYzY2E2YTUzZmJjYjQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9','2016-06-19 18:07:02'),('qehcsp6q0l65lo0o51iunoo06296e3ok','NDE1YTkwNzkyMzk0YWMxZTA3ODZiZjY3NWIxNTk5MTE0M2I0NGU4NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3ZmJjZTcxY2M3ZTE5OTgzODU0OWQ4NTdmOTU2YTc0NWQzZWMyMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2016-06-30 19:12:52'),('qvpmtwbus2utnlfjlo6yzetbjqeu78jc','NDFjMWE2ZmZiNTY2MzQxZGNhOWMwNzYwNTMwOGNlMjBiY2E5MGRhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMDlhOWQ3MDM1YmRjYjRhNTViYjg4NGQzM2Y1NjJjZjVkYWMwZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-06-19 21:27:00'),('rp9h5g8wfr059lc9plyrrprvhi26714w','NDE1YTkwNzkyMzk0YWMxZTA3ODZiZjY3NWIxNTk5MTE0M2I0NGU4NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ3ZmJjZTcxY2M3ZTE5OTgzODU0OWQ4NTdmOTU2YTc0NWQzZWMyMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2016-06-16 15:08:36'),('rr38w9bzgkq3xfbk9f3dfjk4huor8f9n','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-25 17:29:49'),('s33etmqyqno2ux53t7rr17y5olga2tib','MzYwOTAxOTcwNzY2Zjc5MzczYTEwMmFmMGRiMGE0ZTNjOWRhZGJjMjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg2MWE0YmQyYjZmYjg1NzVhOGViNjU5YzAzYzIzZDYzYjY2NjgxN2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2016-06-23 17:37:10'),('xqutnxciazrrvwenznruwdz5mljntl90','NDFjMWE2ZmZiNTY2MzQxZGNhOWMwNzYwNTMwOGNlMjBiY2E5MGRhODp7Il9hdXRoX3VzZXJfaGFzaCI6IjMzMDlhOWQ3MDM1YmRjYjRhNTViYjg4NGQzM2Y1NjJjZjVkYWMwZDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=','2016-06-19 15:02:15'),('zqvkaoc4srokto2dzitdr3yjx1eb0hvh','NDc1MWRhMGVkM2Y5Y2Y2OTE5YWU5NzY2NzM1NTRlMDBmYWNlMmFkMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI3ZGE1NjUyZjFhZDMxNzI1NDIxYzI3YmUxMGU2ZTY3NGVlOTcxODMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-07 01:29:44');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_customer`
--

DROP TABLE IF EXISTS `portal_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_customer`
--

LOCK TABLES `portal_customer` WRITE;
/*!40000 ALTER TABLE `portal_customer` DISABLE KEYS */;
INSERT INTO `portal_customer` VALUES (117,'Jordan Landgrebe','1864 Glasgow St','Valparaiso','Indiana','46385','2197079679',NULL,'landgrebejordan@gmail.com',NULL),(118,'Thomas Sopchak','','','','','9998887777',NULL,'',NULL),(119,'John Culver','2525 W Bassett Pete Dr','Green Valley','AZ','85622','9998887777',NULL,'',NULL),(122,'Chris Bauereis','15507 Baltinglass Ct','Charlotte','NC','28273','9998887777',NULL,'',NULL),(123,'The Car Shop Trailer Sales','930 Ridgewood Ave','Holly Hill','FL','32117','9998887777',NULL,'',NULL),(124,'John DeCluette','4692 Frankfort Way','Denver','CO','80239','9998887777',NULL,'',NULL),(125,'Signature Auto','970 Pyott Rd','Crystal Lake','IL','60014','9998887777',NULL,'',NULL),(126,'Lyle Van Peeren','1388 Didrickson Rd','Frankford','MI','49635','9998887777',NULL,'',NULL),(127,'Nolan Cross','337 Clinton St','Ravenna','OH','44266','9998887777',NULL,'',NULL),(128,'Bob Witt','23706 S Schoolhouse','Manhatten','IL','','8155462357',NULL,'',NULL);
/*!40000 ALTER TABLE `portal_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_employee`
--

DROP TABLE IF EXISTS `portal_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) NOT NULL,
  `emp_phone` varchar(50) NOT NULL,
  `emp_address` varchar(100) DEFAULT NULL,
  `emp_city` varchar(50) DEFAULT NULL,
  `emp_state` varchar(50) DEFAULT NULL,
  `emp_zip` varchar(20) DEFAULT NULL,
  `emp_start_date` datetime DEFAULT NULL,
  `emp_level` varchar(20) NOT NULL,
  `emp_notes` longtext,
  `emp_user_id` int(11) DEFAULT NULL,
  `emp_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_user_id` (`emp_user_id`),
  CONSTRAINT `portal_employee_emp_user_id_3d48ba03_fk_auth_user_id` FOREIGN KEY (`emp_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_employee`
--

LOCK TABLES `portal_employee` WRITE;
/*!40000 ALTER TABLE `portal_employee` DISABLE KEYS */;
INSERT INTO `portal_employee` VALUES (1,'Jordan Landgrebe','2197079679','1864 Glasgow St','Valparaiso','Indiana','46385','2016-05-01 08:00:00','employee','These are some notes',1,1),(2,'Jacob Landgrebe','2195085130','1864 Glasgow st.','Valparaiso','IN','46385','2016-05-01 08:00:00','employee','No',3,1),(3,'Brian Landgrebe','2195089347','1864 Glasgow St','Valparaiso','Indiana','46385','2016-05-18 08:00:00','employee','none',4,1),(4,'Nicolas Martinez','2194766454','blank','blank','blank','blank','2016-06-02 10:00:00','employee','none',5,1),(5,'Mr Test','1234125135','blank','blank','blank','blank','2016-06-01 10:00:00','office','none',6,0),(6,'Taylor Murphy','2195088713','blank','blank','blank','blank','2016-05-01 10:00:00','employee','none',7,1),(7,'James Bragiel','2192405870','blank','blank','blank','blank','2016-08-21 08:00:00','employee','none',8,1),(8,'Jesse Jewell','2199213287','blank','blank','blank','blank','2016-10-01 05:00:00','employee','none',9,1),(9,'Beth Landgrebe','2194629587','blank','blank','blank','blank','2016-05-08 08:00:00','office','blank',10,0),(10,'Jeremy Landgrebe','2192529085','blank','blank','blank','blank','2016-05-16 08:00:00','employee','blank',11,1),(11,'Jacob Rios','2197077513','blank','blank','blank','blank','2016-05-12 08:30:00','employee','notes',12,1);
/*!40000 ALTER TABLE `portal_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_order`
--

DROP TABLE IF EXISTS `portal_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `exp_order_date` date DEFAULT NULL,
  `order_type` varchar(100) DEFAULT NULL,
  `ship_method` varchar(200) DEFAULT NULL,
  `payment_terms` varchar(200) DEFAULT NULL,
  `priority` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `order_flag` varchar(50) DEFAULT NULL,
  `order_flag2` varchar(50) DEFAULT NULL,
  `order_flag3` varchar(50) DEFAULT NULL,
  `order_notes` longtext,
  `cust_id_id` int(11) DEFAULT NULL,
  `internalID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cust_id_id` (`cust_id_id`),
  CONSTRAINT `portal_order_cust_id_id_e94d1640_fk_portal_customer_id` FOREIGN KEY (`cust_id_id`) REFERENCES `portal_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_order`
--

LOCK TABLES `portal_order` WRITE;
/*!40000 ALTER TABLE `portal_order` DISABLE KEYS */;
INSERT INTO `portal_order` VALUES (110,'2016-06-17 03:35:57','2016-06-15','direct','delivery','50%','high','Production',NULL,NULL,NULL,'',118,'OR-109'),(111,'2016-06-17 03:41:33','2016-06-14','Direct','TPD','50%','Med','Shipped',NULL,NULL,NULL,'',119,'OR-110'),(113,'2016-06-17 03:50:55','2016-06-30','Direct','TBD','50%','Med','Placed',NULL,NULL,NULL,'',122,'OR-111'),(114,'2016-06-17 03:57:47','2016-06-20','B2B','Pickup','50%','High','Completed',NULL,NULL,NULL,'',123,'OR-113'),(115,'2016-06-17 04:03:19','2016-07-01','Direct','Delivery','50%','Med','Placed',NULL,NULL,NULL,'',124,'OR-114'),(116,'2016-06-17 04:06:19','2016-06-21','Direct','Pickup','50%','Med','Placed',NULL,NULL,NULL,'',125,'OR-115'),(117,'2016-06-17 04:10:26','2016-06-25','Direct','TBD','50%','Med','Production',NULL,NULL,NULL,'',126,'OR-116'),(118,'2016-06-16 23:13:44','2016-06-27','Direct','Pickup','50%','Med','Paint',NULL,NULL,NULL,'',127,'OR-117'),(119,'2016-06-22 18:40:14','2016-06-30','Direct','Pickup','','High','Paint',NULL,NULL,NULL,'',128,'OR-118');
/*!40000 ALTER TABLE `portal_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_orderitem`
--

DROP TABLE IF EXISTS `portal_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `item_notes` longtext,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_orderitem_order_id_05721cfa_fk_portal_order_id` (`order_id`),
  KEY `portal_orderitem_product_id_417e322e_fk_portal_product_id` (`product_id`),
  CONSTRAINT `portal_orderitem_order_id_05721cfa_fk_portal_order_id` FOREIGN KEY (`order_id`) REFERENCES `portal_order` (`id`),
  CONSTRAINT `portal_orderitem_product_id_417e322e_fk_portal_product_id` FOREIGN KEY (`product_id`) REFERENCES `portal_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_orderitem`
--

LOCK TABLES `portal_orderitem` WRITE;
/*!40000 ALTER TABLE `portal_orderitem` DISABLE KEYS */;
INSERT INTO `portal_orderitem` VALUES (18,1,'',110,21),(19,1,'',110,26),(20,3,'',110,35),(21,1,'',110,41),(22,1,'',110,37),(23,1,'',110,32),(24,1,'',110,40),(25,1,'',110,42),(26,1,'',111,10),(27,1,'',111,28),(28,1,'',111,33),(29,1,'',111,32),(31,1,'',113,19),(32,1,'',113,26),(33,1,'',113,35),(34,1,'',113,40),(42,1,'',115,19),(43,1,'',115,38),(44,1,'',115,30),(45,1,'',115,36),(46,3,'',115,35),(47,1,'',115,40),(48,1,'',115,32),(49,1,'',116,17),(50,1,'',116,29),(51,1,'',116,34),(52,1,'',117,11),(53,1,'',117,25),(54,1,'',117,37),(55,1,'',117,33),(56,1,'',117,32),(57,1,'',118,9),(58,1,'',118,33),(59,1,'',119,11),(60,1,'',119,25),(61,1,'',119,27),(62,1,'10-20\" extra tongue length for bike rake',119,43),(63,1,'This item is a bike platform for the extra length tongue. The customer will provide the bike rack.  ',119,44),(64,1,'',119,33),(79,1,'',114,16),(80,1,'',114,18);
/*!40000 ALTER TABLE `portal_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_part`
--

DROP TABLE IF EXISTS `portal_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `unit` varchar(150) DEFAULT NULL,
  `supplier_part_id` varchar(50) DEFAULT NULL,
  `internal_part_id` varchar(50) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `notes` longtext,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplier_part_id` (`supplier_part_id`),
  UNIQUE KEY `internal_part_id` (`internal_part_id`),
  UNIQUE KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `portal_part_supplier_id_bf140437_fk_portal_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `portal_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_part`
--

LOCK TABLES `portal_part` WRITE;
/*!40000 ALTER TABLE `portal_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_product`
--

DROP TABLE IF EXISTS `portal_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(100) NOT NULL,
  `prod_desc` varchar(300) DEFAULT NULL,
  `prod_type` varchar(150) NOT NULL,
  `prod_active` tinyint(1) DEFAULT NULL,
  `prod_flag` varchar(100) DEFAULT NULL,
  `prod_price` double DEFAULT NULL,
  `prod_notes` longtext,
  `prod_internalID` varchar(100) NOT NULL,
  `prod_purchase` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prod_internalID` (`prod_internalID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_product`
--

LOCK TABLES `portal_product` WRITE;
/*!40000 ALTER TABLE `portal_product` DISABLE KEYS */;
INSERT INTO `portal_product` VALUES (1,'test',NULL,'test',NULL,NULL,NULL,NULL,'test',NULL),(9,'TD-40 Regular','72\" width regular tow-dolly - 2\" coupler - 5 bolt hub - 14\" LCR Tires','Regular Tow-Dolly',1,NULL,0,'','Re1',NULL),(10,'TD-40 R + 3','75\" width regular tow-dolly - 2\" coupler - 5 bolt hub - 14\" LCR Tire','Regular Tow-Dolly',1,NULL,0,'','Re9',NULL),(11,'TD-40 101','78\" width regular tow-dolly - 2\" coupler - 5 bolt hub - 14\" LRC tires','Regular Tow-Dolly',1,NULL,0,'','Re10',NULL),(16,'TD-40 101 +2','80\" width regular tow-dolly - 2\" coupler - 5 bolt hub - 14\" LRC tires','Regular Tow-Dolly',1,NULL,0,'','Re11',NULL),(17,'TD-40 Magnum','82\" width regular tow-dolly - 2-5/16\" electric coupler - 2\" hydraulic coupler - 6\" bolt hub - 15\" LRC tires','Regular Tow-Dolly',1,NULL,0,'','Re16',NULL),(18,'TD-40 MCD-24','78\" width motorcycle tow-dolly - 2-5/16\" coupler - 24x80 rack - 6 bolt hub - 15\" LRC tires','Motorcycle Tow-Dolly',1,NULL,0,'','Mo17',NULL),(19,'TD-40 MCD-32','78\" width motorcycle tow-dolly - 2-5/16\" coupler - 32x96 rack - 6 bolt hub - 15\" LRC tires','Motorcycle Tow-Dolly',1,NULL,0,'','Mo18',NULL),(20,'TD-40 MCD-40','78\" width motorcycle tow-dolly - 2-5/16\" coupler - 40x96 rack - 6 bolt hub - 15\" LRC tires','Motorcycle Tow-Dolly',1,NULL,0,'','Mo19',NULL),(21,'TD-40 MCD-48','78\" width motorcycle tow-dolly - 2-5/16\" coupler - 48x96 rack - 6 bolt hub - 15\" LRC tires','Motorcycle Tow-Dolly',1,NULL,0,'','Mo20',NULL),(22,'TD-40 MCD-60','78\" width motorcycle tow-dolly - 2-5/16\" coupler - 60x96 rack - 6 bolt hub - 15\" LRC tires','Motorcycle Tow-Dolly',1,NULL,0,'','Mo21',NULL),(23,'Magnum Body for MCD','Add-on body for motorcycle dolly - magnum body - 82\" width','Add-On',1,NULL,0,'','Ad22',NULL),(24,'Extra Loading Ramp','Additional loading ramp for motorcycle dolly 5\"x16\"x20\"','Add-On',1,NULL,0,'','Ad23',NULL),(25,'Electric Brakes','No brake-away ','Brakes',1,NULL,0,'','Br24',NULL),(26,'Electric Brakes - MAG & MCD','Battery Powered Brake-away Included','Brakes',1,NULL,0,'','Br25',NULL),(27,'Brake-away System','Add-on brake-away system for non MAG & MCD dollies ','Brakes',1,NULL,0,'','Br26',NULL),(28,'Hydraulic Brake Kit | 2\" - 2 bolt Titan','Hydraulic Brake kit with 2\" coupler with 2 bolt Titan coupler','Brakes',1,NULL,0,'','Br27',NULL),(29,'Hydraulic Brake Kit Magnum | 2\" - 3 bolt UFP coupler','Hydraulic Brake Kit for Magnum dolly with 2 inch, 3 bolt UFP coupler ','Brakes',1,NULL,0,'','Br28',NULL),(30,'Hydraulic Brake Kit MCD','Hydraulic Brake Kit for Motorcycle Dolly with Demco Actuater','Brakes',1,NULL,0,'','Br29',NULL),(31,'Hydraulic Disc Brake Kit','Hydraulic Disc Brake Kit with 5 bolt hubs - Only for regular tow-dollies','Brakes',1,NULL,0,'','Br30',NULL),(32,'Aluminium Fenders','16 gauge aluminum fenders','Accessory',1,NULL,0,'','Ac31',NULL),(33,'14\" LRC - Spare Tire','','Add-On',1,NULL,0,'','Ad32',NULL),(34,'15\" LRC - Spare Tire','','Add-On',1,NULL,0,'','Ad33',NULL),(35,'15\" LRC 6 Bolt - Spare Tire','','Add-On',1,NULL,0,'','Ad34',NULL),(36,'24\" PVC Rock Guard','24\" tall PVC Rock Guard','Accessory',1,NULL,0,'','Ac35',NULL),(37,'24\" Aluminium Rock Guard','24\" tall Aluminium Rock Guard','Accessory',1,NULL,0,'','Re36',NULL),(38,'30\" Aluminium Rock Guard ','30\" tall Aluminum Rock Guard','Accessory',1,NULL,0,'','Ac37',NULL),(39,'48\" Aluminium Rock Guard','48\" tall Aluminium Rock Guard','Accessory',1,NULL,0,'','Ac38',NULL),(40,'LED lights','Add-on for LED light kit on dolly','Add-On',1,NULL,0,'','Ad39',NULL),(41,'Aluminium Rack - 48\"','','Add-On',1,NULL,0,'','Ad40',NULL),(42,'Extra Straps - SM/MD/LG','','Add-On',1,NULL,0,'','Ad41',NULL),(43,'Custom Tongue','Custom length tongue which varies depending on the order','Add-On',1,NULL,0,'','Ad42',NULL),(44,'Custom Item','Placeholder for customer items, view item notes','Custom Work',1,NULL,0,'','Cu43',NULL);
/*!40000 ALTER TABLE `portal_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_production`
--

DROP TABLE IF EXISTS `portal_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `notes` longtext,
  `part_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_id` (`part_id`),
  CONSTRAINT `portal_production_part_id_1721318b_fk_portal_part_id` FOREIGN KEY (`part_id`) REFERENCES `portal_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_production`
--

LOCK TABLES `portal_production` WRITE;
/*!40000 ALTER TABLE `portal_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_purchase`
--

DROP TABLE IF EXISTS `portal_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `notes` longtext,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_purchase_supplier_id_7e99af93_fk_portal_supplier_id` (`supplier_id`),
  CONSTRAINT `portal_purchase_supplier_id_7e99af93_fk_portal_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `portal_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_purchase`
--

LOCK TABLES `portal_purchase` WRITE;
/*!40000 ALTER TABLE `portal_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_purchase_parts`
--

DROP TABLE IF EXISTS `portal_purchase_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_purchase_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `notes` longtext,
  `part_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_purchase_parts_part_id_ba45098f_fk_portal_part_id` (`part_id`),
  KEY `portal_purchase_parts_purchase_id_4745af36_fk_portal_purchase_id` (`purchase_id`),
  CONSTRAINT `portal_purchase_parts_purchase_id_4745af36_fk_portal_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `portal_purchase` (`id`),
  CONSTRAINT `portal_purchase_parts_part_id_ba45098f_fk_portal_part_id` FOREIGN KEY (`part_id`) REFERENCES `portal_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_purchase_parts`
--

LOCK TABLES `portal_purchase_parts` WRITE;
/*!40000 ALTER TABLE `portal_purchase_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_purchase_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_shift`
--

DROP TABLE IF EXISTS `portal_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_shift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_in` datetime NOT NULL,
  `shift_out` datetime DEFAULT NULL,
  `shift_notes` longtext,
  `emp_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_shift_emp_id_id_2b2007bc_fk_portal_employee_id` (`emp_id_id`),
  CONSTRAINT `portal_shift_emp_id_id_2b2007bc_fk_portal_employee_id` FOREIGN KEY (`emp_id_id`) REFERENCES `portal_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_shift`
--

LOCK TABLES `portal_shift` WRITE;
/*!40000 ALTER TABLE `portal_shift` DISABLE KEYS */;
INSERT INTO `portal_shift` VALUES (125,'2016-06-03 08:10:54','2016-06-03 08:25:38',NULL,5),(126,'2016-06-03 08:54:52','2016-06-03 14:02:38',NULL,1),(127,'2016-06-03 08:58:00','2016-06-03 13:42:48',NULL,7),(128,'2016-06-03 09:00:00','2016-06-03 13:24:14',NULL,4),(130,'2016-06-03 14:13:11','2016-06-03 17:41:17',NULL,7),(131,'2016-06-04 09:00:18','2016-06-04 12:57:16',NULL,4),(132,'2016-06-04 09:12:11','2016-06-04 13:48:00',NULL,1),(133,'2016-06-04 14:23:14','2016-06-04 16:35:34',NULL,1),(135,'2016-06-05 09:05:14','2016-06-05 17:03:15',NULL,1),(136,'2016-06-05 10:02:23','2016-06-05 16:27:06',NULL,3),(137,'2016-06-05 13:07:08','2016-06-05 16:26:42',NULL,10),(138,'2016-06-06 09:08:45','2016-06-06 18:12:03',NULL,1),(139,'2016-06-06 08:55:00','2016-06-06 13:20:48',NULL,7),(141,'2016-06-06 13:16:17','2016-06-06 17:27:07',NULL,4),(142,'2016-06-06 13:53:13','2016-06-06 17:29:53',NULL,7),(143,'2016-06-07 04:48:49','2016-06-07 19:24:36',NULL,1),(144,'2016-06-07 09:03:16','2016-06-07 11:46:41',NULL,7),(146,'2016-06-07 12:32:07','2016-06-07 17:30:25',NULL,7),(147,'2016-06-07 13:59:58','2016-06-07 18:10:00',NULL,4),(148,'2016-06-08 09:00:55','2016-06-08 13:18:16',NULL,4),(150,'2016-06-08 13:07:56','2016-06-08 17:52:06',NULL,6),(151,'2016-06-08 17:05:34','2016-06-08 19:39:01',NULL,3),(153,'2016-06-08 09:25:00','2016-06-08 18:10:15',NULL,1),(186,'2016-06-09 09:39:39','2016-06-09 12:37:13',NULL,6),(188,'2016-06-09 09:00:00','2016-06-09 13:12:31',NULL,4),(190,'2016-06-09 09:05:00','2016-06-09 12:43:46',NULL,7),(191,'2016-06-09 13:17:00','2016-06-09 17:40:46',NULL,7),(192,'2016-06-09 13:31:16','2016-06-09 17:56:53',NULL,6),(193,'2016-06-09 14:28:23','2016-06-09 18:05:43',NULL,4),(196,'2016-06-09 10:32:15','2016-06-09 17:12:07',NULL,1),(207,'2016-06-10 13:02:55','2016-06-10 17:34:22',NULL,7),(208,'2016-06-10 17:00:49','2016-06-10 20:30:56',NULL,3),(209,'2016-06-11 09:37:00','2016-06-11 18:40:12',NULL,1),(210,'2016-06-11 09:55:44','2016-06-11 12:29:51',NULL,6),(211,'2016-06-11 13:51:34','2016-06-11 17:07:28',NULL,6),(212,'2016-06-12 08:02:45','2016-06-12 17:50:44',NULL,1),(213,'2016-06-13 08:57:01','2016-06-13 12:59:29',NULL,4),(214,'2016-06-13 09:44:08','2016-06-13 13:03:39',NULL,11),(215,'2016-06-13 09:51:55','2016-06-13 13:04:18',NULL,6),(217,'2016-06-13 10:07:00','2016-06-13 17:53:34',NULL,1),(219,'2016-06-13 13:59:18','2016-06-13 17:56:30',NULL,6),(220,'2016-06-13 16:59:25','2016-06-13 19:39:47',NULL,3),(221,'2016-06-14 08:53:51','2016-06-14 13:04:49',NULL,7),(222,'2016-06-14 09:27:27','2016-06-14 13:15:00',NULL,6),(223,'2016-06-14 09:56:00','2016-06-14 18:23:00',NULL,1),(225,'2016-06-14 13:35:15','2016-06-14 17:33:51',NULL,7),(226,'2016-06-14 14:16:26','2016-06-14 17:59:57',NULL,6),(227,'2016-06-10 10:30:00','2016-06-10 13:45:00',NULL,1),(228,'2016-06-10 08:55:00','2016-06-10 12:32:00',NULL,7),(229,'2016-06-15 08:59:46','2016-06-15 11:53:41',NULL,7),(230,'2016-06-15 09:19:41','2016-06-15 13:01:09',NULL,11),(231,'2016-06-15 10:46:02','2016-06-15 12:53:02',NULL,6),(232,'2016-06-15 12:22:58','2016-06-15 15:19:41',NULL,7),(233,'2016-06-15 13:45:25','2016-06-15 17:02:49',NULL,6),(234,'2016-06-15 14:18:32','2016-06-15 17:02:33',NULL,4),(236,'2016-06-15 11:35:00','2016-06-15 16:36:00',NULL,1),(237,'2016-06-15 09:14:00','2016-06-15 10:13:00',NULL,1),(238,'2016-06-16 08:59:25','2016-06-16 12:58:34',NULL,4),(239,'2016-06-16 08:59:44','2016-06-16 12:58:24',NULL,7),(240,'2016-06-16 10:06:00','2016-06-16 19:00:39',NULL,1),(241,'2016-06-16 13:31:16','2016-06-16 15:34:00',NULL,7),(242,'2016-06-16 14:12:56','2016-06-16 17:47:10',NULL,4),(243,'2016-06-16 14:13:25','2016-06-16 17:16:51',NULL,6),(247,'2016-06-10 09:00:00','2016-06-10 12:00:00',NULL,6),(248,'2016-06-10 12:30:00','2016-06-10 16:00:00',NULL,6),(249,'2016-06-10 15:15:00','2016-06-10 17:23:00',NULL,1),(250,'2016-06-17 08:18:32','2016-06-17 18:59:51',NULL,1),(251,'2016-06-17 09:00:41','2016-06-17 12:26:34',NULL,7),(252,'2016-06-17 09:04:14','2016-06-17 12:58:33',NULL,4),(254,'2016-06-17 12:57:02','2016-06-17 15:30:48',NULL,7),(255,'2016-06-17 17:38:38','2016-06-17 20:28:09',NULL,3),(256,'2016-06-18 12:26:39','2016-06-18 14:47:30',NULL,3),(257,'2016-06-18 14:47:31','2016-06-18 14:47:33',NULL,3),(258,'2016-06-20 08:51:45','2016-06-20 12:45:23',NULL,7),(259,'2016-06-20 08:58:37','2016-06-20 16:01:43',NULL,11),(260,'2016-06-20 09:01:38','2016-06-20 12:59:03',NULL,4),(261,'2016-06-20 09:06:14','2016-06-20 12:59:56',NULL,6),(262,'2016-06-20 13:15:11','2016-06-20 14:59:26',NULL,7),(263,'2016-06-20 13:42:17','2016-06-20 18:17:09',NULL,6),(265,'2016-06-20 17:32:30','2016-06-20 19:38:19',NULL,3),(266,'2016-06-20 19:38:20','2016-06-20 20:37:27',NULL,3),(267,'2016-06-21 08:57:40','2016-06-21 14:35:57',NULL,11),(268,'2016-06-21 09:04:13','2016-06-21 12:04:52',NULL,6),(269,'2016-06-21 09:13:52','2016-06-21 12:57:11',NULL,4),(271,'2016-06-21 14:04:26','2016-06-21 17:57:01',NULL,4),(272,'2016-06-21 18:10:53','2016-06-21 20:02:46',NULL,10),(273,'2016-06-18 11:14:00','2016-06-18 14:43:00',NULL,1),(274,'2016-06-19 09:12:00','2016-06-19 15:00:00',NULL,1),(275,'2016-06-22 08:55:34','2016-06-22 13:07:14',NULL,7),(276,'2016-06-22 09:03:37','2016-06-22 13:07:47',NULL,4),(277,'2016-06-22 09:54:44','2016-06-22 13:03:47',NULL,6),(279,'2016-06-22 13:32:21','2016-06-22 17:25:48',NULL,6),(280,'2016-06-22 13:38:37','2016-06-22 15:38:15',NULL,7),(281,'2016-06-20 09:23:00','2016-06-20 18:47:00',NULL,1),(283,'2016-06-21 09:18:00','2016-06-21 18:56:00',NULL,1),(284,'2016-06-21 09:38:00','2016-06-22 18:38:23',NULL,1),(286,'2016-06-17 12:20:00','2016-06-17 18:11:00',NULL,2),(287,'2016-06-20 11:15:00','2016-06-20 13:00:00',NULL,2),(288,'2016-06-20 13:45:00','2016-06-20 18:03:00',NULL,2),(289,'2016-06-21 12:01:00','2016-06-21 17:59:00',NULL,2),(290,'2016-06-22 12:27:00','2016-06-22 17:27:02',NULL,2);
/*!40000 ALTER TABLE `portal_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_supplier`
--

DROP TABLE IF EXISTS `portal_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_supplier`
--

LOCK TABLES `portal_supplier` WRITE;
/*!40000 ALTER TABLE `portal_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_task`
--

DROP TABLE IF EXISTS `portal_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `notes` longtext,
  `production_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_task_production_id_02ec18e0_fk_portal_production_id` (`production_id`),
  CONSTRAINT `portal_task_production_id_02ec18e0_fk_portal_production_id` FOREIGN KEY (`production_id`) REFERENCES `portal_production` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_task`
--

LOCK TABLES `portal_task` WRITE;
/*!40000 ALTER TABLE `portal_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_task_part`
--

DROP TABLE IF EXISTS `portal_task_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_task_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_id` (`part_id`),
  KEY `portal_task_part_task_id_728b4856_fk_portal_task_id` (`task_id`),
  CONSTRAINT `portal_task_part_task_id_728b4856_fk_portal_task_id` FOREIGN KEY (`task_id`) REFERENCES `portal_task` (`id`),
  CONSTRAINT `portal_task_part_part_id_04a054ec_fk_portal_part_id` FOREIGN KEY (`part_id`) REFERENCES `portal_part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_task_part`
--

LOCK TABLES `portal_task_part` WRITE;
/*!40000 ALTER TABLE `portal_task_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_task_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_task_step`
--

DROP TABLE IF EXISTS `portal_task_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_task_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_task_step`
--

LOCK TABLES `portal_task_step` WRITE;
/*!40000 ALTER TABLE `portal_task_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_task_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_thing`
--

DROP TABLE IF EXISTS `portal_thing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_thing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_thing_employee_id_0fc9b5a1_fk_portal_employee_id` (`employee_id`),
  CONSTRAINT `portal_thing_employee_id_0fc9b5a1_fk_portal_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `portal_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_thing`
--

LOCK TABLES `portal_thing` WRITE;
/*!40000 ALTER TABLE `portal_thing` DISABLE KEYS */;
INSERT INTO `portal_thing` VALUES (10,'Grinding wheel','Cutoff wheel',5);
/*!40000 ALTER TABLE `portal_thing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-22 21:42:53
