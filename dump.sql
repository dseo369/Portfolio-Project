-- Host: classmysql.engr.oregonstate.edu    Database: cs340_seod
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB-log MariaDB Server

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 
-- Table Structure for 'Passenger' Table
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Passenger` (
    `accountID` int(11) NOT NULL,
    `first_name` varchar(100) NOT NULL,
    `last_name` varchar(100) NOT NULL,
    `flightID` int(11) NOT NULL,
    PRIMARY KEY(`accountID`),
    FOREIGN KEY(`flightID`) REFERENCES `Flight`(`flightID`)
);

--
-- Dumping data for table `Passenger`
-- Comment: For the flightID value do we enter a value like '2', or do we just write 'flightID' since it's a refernce???
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES (1, 'Daniel', 'Seo', 2), (2, 'Max', 'Fu', 3), (3, 'Donald', 'Duck', 4), (4, 'Keanu', 'Reeves', 5), (5, 'Lebron', 'James', 6), (6, 'Linus', 'Pauling', 7);
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table Structure for 'Plane' Table
-- Comment: Should `airports` be an FK referencing Airport's `name`???
--

DROP TABLE IF EXISTS `Plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plane` (
    `modelID` int(11) NOT NULL,
    `airports` varchar(100) NOT NULL,
    `type` varchar(100) NOT NULL,
    PRIMARY KEY(`modelID`)
);

--
-- Dumping data for table `Plane`
-- Comment: Same reference issue as in 'Passenger'....
--

LOCK TABLES `Plane` WRITE;
/*!40000 ALTER TABLE `Plane` DISABLE KEYS */;
INSERT INTO `Plane` VALUES (100, 'Portland International Airport', 'Turbopop'), (101, 'Los Angeles International Airport', 'Piston'), (103, 'Seattle-Tacoma International Airport', 'Commuter Liner'), (104, 'Incheon International Airport', 'Airbus'), (105, 'Narita International Airport', 'Commuter Liner');
/*!40000 ALTER TABLE `Plane` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table Structure for 'City' Table
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
    `name` varchar(255) NOT NULL,
    `location` varchar(100) NOT NULL,
    PRIMARY KEY(`name`)
);

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES ('Portland', 'Oregon'), ('Los Angeles', 'California'), ('Seattle', 'Washington'), ('Incheon', 'South Korea'), ('Tokyo', 'Japan');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table Structure for 'Airport' Table
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Airport` (
    `name` varchar(255) NOT NULL,
    `location` varchar(100) NOT NULL,
    PRIMARY KEY(`name`),
    FOREIGN KEY(`location`) REFERENCES `City`(`name`)
);

--
-- Dumping data for table `Airport`
-- Same issue with placing the value for location as in 'Passenger' since its an FK reference...
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('Portland International Airport', 'Portland'), ('Los Angeles International Airport', 'Los Angeles'), ('Seattle-Tacoma International Airport', 'Seattle'), ('Incheon International Airport', 'Incheon'), ('Narita International Airport', 'Tokyo');
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table Structure for 'Flight' Table'
-- Comment: Are 'from' and 'to' FKs referencing the City's 'name'???
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight` (
    `flightID` int(11) NOT NULL,
    `from` varchar(100) NOT NULL,
    `to` varchar(100) NOT NULL,
    `eta` int(11) NOT NULL,
    `passengers` varchar(100) NOT NULL,
    PRIMARY KEY(`flightID`),
    FOREIGN KEY(`passengers`) REFERENCES `Passenger`(`accountID`)
);

--
-- Dumping data for table `Flight`
-- Same issue with placing the value for location as in 'Passenger' since its an FK reference...
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES (200, 'Portland', 'Los Angeles', 90, 1), (201, 'Los Angeles', 'Seattle', 120, 2), (202, 'Seattle', 'Incheon', 780, 3), (203, 'Incheon', 'Tokyo', 150, 4), (204, 'Tokyo', 'Portland', 840, 5);
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `flight_passenger`;

CREATE TABLE `flight_passenger`
(
   `flightId` int(11),
   `accountId` int(11)

PRIMARY KEY (`flightId`,`accountId`),
CONSTRAINT FOREIGN KEY (flightId) REFERENCES flight(flightID),
CONSTRAINT FOREIGN KEY (accountId) REFERENCES passenger(accountID)
);
