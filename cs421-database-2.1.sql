CREATE DATABASE  IF NOT EXISTS `cs421-database-2.1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cs421-database-2.1`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: cs421-database-2.1
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `tbl_administrator`
--

DROP TABLE IF EXISTS `tbl_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_administrator` (
  `user_id` varchar(8) NOT NULL,
  `approval_flag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblAdministrator_tblStaff` FOREIGN KEY (`user_id`) REFERENCES `tbl_staff` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_administrator`
--

LOCK TABLES `tbl_administrator` WRITE;
/*!40000 ALTER TABLE `tbl_administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_and_equivalent`
--

DROP TABLE IF EXISTS `tbl_and_equivalent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_and_equivalent` (
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`eq_course_alpha`,`eq_course_num`),
  CONSTRAINT `fk_tblAnd_Equivalent_tblEquivalent_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_equivalent_course` (`eq_course_alpha`, `eq_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_and_equivalent`
--

LOCK TABLES `tbl_and_equivalent` WRITE;
/*!40000 ALTER TABLE `tbl_and_equivalent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_and_equivalent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_approves`
--

DROP TABLE IF EXISTS `tbl_approves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_approves` (
  `user_id` varchar(8) NOT NULL,
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `approval_time_stamp` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`eq_course_alpha`,`eq_course_num`),
  KEY `fk_tblApproves_tblEquivalent_Course_idx` (`eq_course_alpha`,`eq_course_num`),
  CONSTRAINT `fk_tblApproves_tblEquivalent_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_equivalent_course` (`eq_course_alpha`, `eq_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblApproves_tblAdministrator` FOREIGN KEY (`user_id`) REFERENCES `tbl_administrator` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_approves`
--

LOCK TABLES `tbl_approves` WRITE;
/*!40000 ALTER TABLE `tbl_approves` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_approves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_equivalent_course`
--

DROP TABLE IF EXISTS `tbl_equivalent_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_equivalent_course` (
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `conn` enum('AND','OR') DEFAULT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  `date_updated` date NOT NULL,
  `pr` char(1) DEFAULT NULL,
  PRIMARY KEY (`eq_course_alpha`,`eq_course_num`),
  CONSTRAINT `fk_tblEquivalent_Course_tblTransfer_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_transfer_course` (`transfer_course_alpha`, `transfer_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_equivalent_course`
--

LOCK TABLES `tbl_equivalent_course` WRITE;
/*!40000 ALTER TABLE `tbl_equivalent_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_equivalent_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_institution`
--

DROP TABLE IF EXISTS `tbl_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_institution` (
  `institution_name` varchar(50) NOT NULL,
  `city` varchar(60) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`institution_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_institution`
--

LOCK TABLES `tbl_institution` WRITE;
/*!40000 ALTER TABLE `tbl_institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_or_equivalent`
--

DROP TABLE IF EXISTS `tbl_or_equivalent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_or_equivalent` (
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`eq_course_alpha`,`eq_course_num`),
  CONSTRAINT `fk_tblOr_Equivalent_tblEquivalent_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_equivalent_course` (`eq_course_alpha`, `eq_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_or_equivalent`
--

LOCK TABLES `tbl_or_equivalent` WRITE;
/*!40000 ALTER TABLE `tbl_or_equivalent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_or_equivalent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_regular_staff`
--

DROP TABLE IF EXISTS `tbl_regular_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_regular_staff` (
  `user_id` varchar(8) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblRegular_Staff_tblStaff` FOREIGN KEY (`user_id`) REFERENCES `tbl_staff` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_regular_staff`
--

LOCK TABLES `tbl_regular_staff` WRITE;
/*!40000 ALTER TABLE `tbl_regular_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_regular_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_staff`
--

DROP TABLE IF EXISTS `tbl_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_staff` (
  `user_id` varchar(8) NOT NULL,
  `department` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblStaff_tblUser` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_staff`
--

LOCK TABLES `tbl_staff` WRITE;
/*!40000 ALTER TABLE `tbl_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_student` (
  `user_id` varchar(8) NOT NULL,
  `major` varchar(100) NOT NULL DEFAULT 'undeclared',
  `term` varchar(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblStudent_tblUser` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student`
--

LOCK TABLES `tbl_student` WRITE;
/*!40000 ALTER TABLE `tbl_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transfer_course`
--

DROP TABLE IF EXISTS `tbl_transfer_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_transfer_course` (
  `transfer_course_alpha` varchar(6) NOT NULL,
  `transfer_course_num` varchar(6) NOT NULL,
  `transfer_inst_name` varchar(50) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `transfer_hours` varchar(8) NOT NULL,
  `effective_term` varchar(6) NOT NULL,
  `grp` char(1) DEFAULT NULL,
  PRIMARY KEY (`transfer_course_alpha`,`transfer_course_num`,`transfer_inst_name`),
  KEY `fk_tblTransfer_Course_tblTransfers_In_idx` (`transfer_inst_name`),
  CONSTRAINT `fk_tblTransfer_Course_tblTransfers_In` FOREIGN KEY (`transfer_inst_name`) REFERENCES `tbl_institution` (`institution_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transfer_course`
--

LOCK TABLES `tbl_transfer_course` WRITE;
/*!40000 ALTER TABLE `tbl_transfer_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_transfer_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_transfers_in`
--

DROP TABLE IF EXISTS `tbl_transfers_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_transfers_in` (
  `user_id` varchar(8) NOT NULL,
  `transfer_course_alpha` varchar(6) NOT NULL,
  `transfer_course_num` varchar(6) NOT NULL,
  `transfer_inst_name` varchar(50) NOT NULL,
  `submission_time_stamp` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`transfer_course_alpha`,`transfer_course_num`,`transfer_inst_name`),
  CONSTRAINT `fk_tblTransfers_In_tblStudent` FOREIGN KEY (`user_id`) REFERENCES `tbl_student` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transfers_in`
--

LOCK TABLES `tbl_transfers_in` WRITE;
/*!40000 ALTER TABLE `tbl_transfers_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_transfers_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `user_id` varchar(8) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_initital` varchar(1) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-28 20:51:15
