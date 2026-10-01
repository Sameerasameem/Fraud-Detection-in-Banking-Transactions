-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branch_id` int DEFAULT NULL,
  `branch_code` text,
  `branch_name` text,
  `city` text,
  `state` text,
  `country` text,
  `ifsc_code` text,
  `manager_name` text,
  `phone` text,
  `opening_time` text,
  `closing_time` text,
  `risk_region` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'BR0001','Thanjavur Main Branch','Thanjavur','Karnataka','India','BANK00000001','Manager 1','04455765673','09:30','16:30','High'),(2,'BR0002','Madurai Main Branch','Madurai','Tamil Nadu','India','BANK00000002','Manager 2','04484298167','09:30','16:30','Low'),(3,'BR0003','Mumbai Main Branch','Mumbai','Telangana','India','BANK00000003','Manager 3','04435036183','09:30','16:30','Medium'),(4,'BR0004','Bengaluru Main Branch','Bengaluru','Telangana','India','BANK00000004','Manager 4','04462768892','09:30','16:30','Medium'),(5,'BR0005','Trichy Main Branch','Trichy','Tamil Nadu','India','BANK00000005','Manager 5','04431790513','09:30','16:30','Low'),(6,'BR0006','Chennai Main Branch','Chennai','Telangana','India','BANK00000006','Manager 6','04425152558','09:30','16:30','Low'),(7,'BR0007','Salem Main Branch','Salem','Maharashtra','India','BANK00000007','Manager 7','04444796668','09:30','16:30','High'),(8,'BR0008','Salem Main Branch','Salem','Maharashtra','India','BANK00000008','Manager 8','04469541612','09:30','16:30','Medium'),(9,'BR0009','Salem Main Branch','Salem','Telangana','India','BANK00000009','Manager 9','04487628344','09:30','16:30','Low'),(10,'BR0010','Madurai Main Branch','Madurai','Telangana','India','BANK00000010','Manager 10','04456203283','09:30','16:30','Medium'),(11,'BR0011','Coimbatore Main Branch','Coimbatore','Karnataka','India','BANK00000011','Manager 11','04430886799','09:30','16:30','Low'),(12,'BR0012','Trichy Main Branch','Trichy','Maharashtra','India','BANK00000012','Manager 12','04444304690','09:30','16:30','Low'),(13,'BR0013','Coimbatore Main Branch','Coimbatore','Tamil Nadu','India','BANK00000013','Manager 13','04434927052','09:30','16:30','Medium'),(14,'BR0014','Bengaluru Main Branch','Bengaluru','Maharashtra','India','BANK00000014','Manager 14','04469318970','09:30','16:30','Medium'),(15,'BR0015','Hyderabad Main Branch','Hyderabad','Tamil Nadu','India','BANK00000015','Manager 15','04485201267','09:30','16:30','Medium'),(16,'BR0016','Bengaluru Main Branch','Bengaluru','Karnataka','India','BANK00000016','Manager 16','04410365993','09:30','16:30','High'),(17,'BR0017','Trichy Main Branch','Trichy','Maharashtra','India','BANK00000017','Manager 17','04472570695','09:30','16:30','High'),(18,'BR0018','Coimbatore Main Branch','Coimbatore','Tamil Nadu','India','BANK00000018','Manager 18','04413395834','09:30','16:30','Low'),(19,'BR0019','Salem Main Branch','Salem','Maharashtra','India','BANK00000019','Manager 19','04473594831','09:30','16:30','Low'),(20,'BR0020','Bengaluru Main Branch','Bengaluru','Karnataka','India','BANK00000020','Manager 20','04442413493','09:30','16:30','Medium'),(21,'BR0021','Mumbai Main Branch','Mumbai','Karnataka','India','BANK00000021','Manager 21','04487262906','09:30','16:30','Medium'),(22,'BR0022','Trichy Main Branch','Trichy','Karnataka','India','BANK00000022','Manager 22','04444112688','09:30','16:30','Medium'),(23,'BR0023','Salem Main Branch','Salem','Telangana','India','BANK00000023','Manager 23','04439995394','09:30','16:30','Low'),(24,'BR0024','Vellore Main Branch','Vellore','Tamil Nadu','India','BANK00000024','Manager 24','04454161175','09:30','16:30','Low'),(25,'BR0025','Madurai Main Branch','Madurai','Telangana','India','BANK00000025','Manager 25','04431136725','09:30','16:30','Medium'),(26,'BR0026','Bengaluru Main Branch','Bengaluru','Maharashtra','India','BANK00000026','Manager 26','04448290196','09:30','16:30','Medium'),(27,'BR0027','Hyderabad Main Branch','Hyderabad','Tamil Nadu','India','BANK00000027','Manager 27','04418624910','09:30','16:30','High'),(28,'BR0028','Erode Main Branch','Erode','Maharashtra','India','BANK00000028','Manager 28','04422310335','09:30','16:30','Low'),(29,'BR0029','Coimbatore Main Branch','Coimbatore','Tamil Nadu','India','BANK00000029','Manager 29','04453535195','09:30','16:30','Low'),(30,'BR0030','Thanjavur Main Branch','Thanjavur','Karnataka','India','BANK00000030','Manager 30','04455464986','09:30','16:30','Medium'),(31,'BR0031','Salem Main Branch','Salem','Maharashtra','India','BANK00000031','Manager 31','04430689330','09:30','16:30','Low'),(32,'BR0032','Hyderabad Main Branch','Hyderabad','Telangana','India','BANK00000032','Manager 32','04410027847','09:30','16:30','Low'),(33,'BR0033','Salem Main Branch','Salem','Maharashtra','India','BANK00000033','Manager 33','04490774313','09:30','16:30','High'),(34,'BR0034','Coimbatore Main Branch','Coimbatore','Tamil Nadu','India','BANK00000034','Manager 34','04415389116','09:30','16:30','Low'),(35,'BR0035','Tirunelveli Main Branch','Tirunelveli','Telangana','India','BANK00000035','Manager 35','04414501475','09:30','16:30','High'),(36,'BR0036','Bengaluru Main Branch','Bengaluru','Karnataka','India','BANK00000036','Manager 36','04484812460','09:30','16:30','High'),(37,'BR0037','Erode Main Branch','Erode','Telangana','India','BANK00000037','Manager 37','04480754164','09:30','16:30','High'),(38,'BR0038','Vellore Main Branch','Vellore','Tamil Nadu','India','BANK00000038','Manager 38','04499405376','09:30','16:30','Medium'),(39,'BR0039','Salem Main Branch','Salem','Tamil Nadu','India','BANK00000039','Manager 39','04413127686','09:30','16:30','Medium'),(40,'BR0040','Mumbai Main Branch','Mumbai','Maharashtra','India','BANK00000040','Manager 40','04440411886','09:30','16:30','Low'),(41,'BR0041','Chennai Main Branch','Chennai','Telangana','India','BANK00000041','Manager 41','04476964272','09:30','16:30','Medium'),(42,'BR0042','Salem Main Branch','Salem','Tamil Nadu','India','BANK00000042','Manager 42','04461146674','09:30','16:30','Low'),(43,'BR0043','Chennai Main Branch','Chennai','Telangana','India','BANK00000043','Manager 43','04456100894','09:30','16:30','High'),(44,'BR0044','Salem Main Branch','Salem','Karnataka','India','BANK00000044','Manager 44','04492851535','09:30','16:30','High'),(45,'BR0045','Trichy Main Branch','Trichy','Maharashtra','India','BANK00000045','Manager 45','04435582350','09:30','16:30','Low'),(46,'BR0046','Vellore Main Branch','Vellore','Tamil Nadu','India','BANK00000046','Manager 46','04413439104','09:30','16:30','High'),(47,'BR0047','Madurai Main Branch','Madurai','Tamil Nadu','India','BANK00000047','Manager 47','04430035597','09:30','16:30','Medium'),(48,'BR0048','Erode Main Branch','Erode','Telangana','India','BANK00000048','Manager 48','04481871785','09:30','16:30','High'),(49,'BR0049','Bengaluru Main Branch','Bengaluru','Maharashtra','India','BANK00000049','Manager 49','04477755350','09:30','16:30','Low'),(50,'BR0050','Trichy Main Branch','Trichy','Telangana','India','BANK00000050','Manager 50','04434536184','09:30','16:30','High'),(51,'BR0051','Trichy Main Branch','Trichy','Telangana','India','BANK00000051','Manager 51','04478202785','09:30','16:30','High'),(52,'BR0052','Tirunelveli Main Branch','Tirunelveli','Telangana','India','BANK00000052','Manager 52','04410519066','09:30','16:30','Low'),(53,'BR0053','Tirunelveli Main Branch','Tirunelveli','Maharashtra','India','BANK00000053','Manager 53','04478917245','09:30','16:30','High'),(54,'BR0054','Trichy Main Branch','Trichy','Maharashtra','India','BANK00000054','Manager 54','04480250522','09:30','16:30','Low'),(55,'BR0055','Trichy Main Branch','Trichy','Telangana','India','BANK00000055','Manager 55','04424239975','09:30','16:30','Low'),(56,'BR0056','Erode Main Branch','Erode','Karnataka','India','BANK00000056','Manager 56','04486651681','09:30','16:30','Medium'),(57,'BR0057','Thanjavur Main Branch','Thanjavur','Tamil Nadu','India','BANK00000057','Manager 57','04485181668','09:30','16:30','High'),(58,'BR0058','Salem Main Branch','Salem','Telangana','India','BANK00000058','Manager 58','04443346279','09:30','16:30','Medium'),(59,'BR0059','Trichy Main Branch','Trichy','Maharashtra','India','BANK00000059','Manager 59','04425963160','09:30','16:30','High'),(60,'BR0060','Chennai Main Branch','Chennai','Telangana','India','BANK00000060','Manager 60','04445256998','09:30','16:30','Medium');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-30 23:08:45
