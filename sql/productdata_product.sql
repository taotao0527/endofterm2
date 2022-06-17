CREATE DATABASE  IF NOT EXISTS `productdata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `productdata`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: productdata
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PROID` varchar(3) NOT NULL,
  `PROName` varchar(40) DEFAULT NULL,
  `Classification` varchar(10) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Page` varchar(40) DEFAULT NULL,
  `Photo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PROID`),
  UNIQUE KEY `PROID` (`PROID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('p01','色彩繽紛的小鎮','風景1',40,1080,'landscape1.jsp','landscape_river.jpg'),('p02','愛丁堡馬戲團巷','風景1',5,1475,'landscape2.jsp','landscape_street.jpg'),('p03','日本富士山','風景1',10,1030,'landscape3.jsp','landscape_fuji.jpg'),('p04','義大利','風景2',15,1450,'landscape4.jsp','landscape_city.jpg'),('p05','瓦胡島','風景2',15,1000,'landscape5.jsp','landscape_sea.jpg'),('p06','老街','風景2',10,1000,'landscape6.jsp','old.jpg'),('p07','清明上河圖','世界名畫1',10,1499,'painting1.jsp','painting_chinese.jpg'),('p08','米勒-拾穗者','世界名畫1',15,1080,'painting2.jsp','painting_farm.jpg'),('p09','約翰內斯-戴珍珠耳環的少女','世界名畫1',10,1499,'painting3.jsp','painting_pearl.jpg'),('p10','愛德華-吶喊','世界名畫2',15,1599,'painting4.jsp','painting_skrik.jpg'),('p11','梵谷-星空','世界名畫2',10,1499,'painting5.jsp','painting_stars.jpg'),('p12','毆仁-自由引導人','世界名畫2',10,1980,'painting6.jsp','painting_war.jpg'),('p13','雪','星空1',20,1050,'star1.jsp','stars_1.jpg'),('p14','生存','星空1',20,1290,'star2.jsp','stars_2.jpg'),('p15','嚮往','星空1',20,1000,'star3.jsp','stars_3.jpg'),('p16','盡頭','星空2',15,1000,'star4.jsp','stars_4.jpg'),('p17','凌晨','星空2',15,1000,'star5.jsp','stars_5.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 12:28:25
