CREATE DATABASE  IF NOT EXISTS `mybank_eascorp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mybank_eascorp`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: mysql.storage.cloud.wso2.com    Database: mybank_eascorp
-- ------------------------------------------------------
-- Server version	5.6.31-google-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='3478a97b-415f-11e7-8278-42010a960004:1-22568857';

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_ID` int(11) NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(10) NOT NULL,
  `agency` varchar(10) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  PRIMARY KEY (`account_ID`),
  KEY `FK_customer_idx` (`customer_ID`),
  CONSTRAINT `FK_customer` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'3456','1180',1),(11,'4988','1180',2),(12,'9893','1359',3),(13,'2409','1359',4),(14,'1154','3490',5);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Hommer J. Simpson','hsimpson@gmail.com',3500.00,'new Account adicionado','+5511966191434'),(2,'Clark Kent','ckent@planetadiario.com',9000.00,'ex cliente do Itau','+12044560987'),(3,'Catherine Reynolds','creynolds@npyd.com',11347.00,'Recebeu Aportes ','+120445609819'),(4,'Vincent Keller','vincent_keller2000@hotmail.com',900.00,'Bom investidor','+12044560945'),(5,'Joseph Terrance Forbes','jt.forbes@mit.edu.br',6800.00,'Recebeu aporte','+12044560911'),(7,'Edgar Silva','edgarsilva@gmail.com',NULL,'Novo comentario teste','+55 11 9661211'),(8,'José do Carmo','josedocarmo@yahoo.com.br',NULL,'','(11) 9834-3333');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transacation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `details` varchar(200) NOT NULL,
  `transacationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(8,2) NOT NULL,
  `account_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`transacation_ID`),
  KEY `FK_idx` (`account_ID`),
  CONSTRAINT `FK` FOREIGN KEY (`account_ID`) REFERENCES `account` (`account_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'CREDIT','OPENING ACCOUNT','2016-08-30 21:27:38',45000.00,1),(2,'CREDIT','OPENING ACCOUNT','2016-08-30 21:27:38',32000.00,11),(3,'CREDIT','OPENING ACCOUNT','2016-08-30 21:27:38',22000.00,12),(4,'CREDIT','OPENING ACCOUNT','2016-08-30 21:27:38',90000.00,13),(5,'CREDIT','OPENING ACCOUNT','2016-08-30 21:27:38',120000.00,14),(6,'DEBIT','WITHDRAWN ATM 22343','2016-08-30 21:55:13',180.00,1),(7,'CREDIT','EXPENSE REPORT PAYMENT','2016-09-14 00:58:15',120.00,1),(8,'CREDIT','ADIANTAMENTO SALARIO','2016-09-14 14:40:59',1000.00,1),(9,'CREDIT','PRUEBA REAL','2016-09-14 18:14:57',5000.00,1),(10,'CREDIT','EXPENSE PAYMENT','2016-09-22 11:45:26',100.00,1),(13,'CREDIT','EXPENSE PAYMENT','2016-09-29 10:04:56',100.00,1),(14,'CREDIT','EXPENSE PAYMENT - Dinner','2016-09-29 10:05:20',129.00,1);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-10  0:33:56
