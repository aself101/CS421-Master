-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2014 at 04:48 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cs421-database-2.1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_administrator`
--

CREATE TABLE IF NOT EXISTS `tbl_administrator` (
  `user_id` varchar(8) NOT NULL,
  `approval_flag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_and_equivalent`
--

CREATE TABLE IF NOT EXISTS `tbl_and_equivalent` (
  `eid` int(10) NOT NULL,
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approves`
--

CREATE TABLE IF NOT EXISTS `tbl_approves` (
  `aid` int(10) NOT NULL,
  `user_id` varchar(8) NOT NULL,
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `approval_time_stamp` datetime NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `fk_tblApproves_tblAdministrator` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equivalent_course`
--

CREATE TABLE IF NOT EXISTS `tbl_equivalent_course` (
  `eid` int(10) NOT NULL AUTO_INCREMENT,
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `conn` enum('AND','OR') DEFAULT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  `date_updated` date NOT NULL,
  `pr` char(1) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_institution`
--

CREATE TABLE IF NOT EXISTS `tbl_institution` (
  `institution_name` varchar(50) NOT NULL,
  `city` varchar(60) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`institution_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_or_equivalent`
--

CREATE TABLE IF NOT EXISTS `tbl_or_equivalent` (
  `eid` int(10) NOT NULL AUTO_INCREMENT,
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_regular_staff`
--

CREATE TABLE IF NOT EXISTS `tbl_regular_staff` (
  `user_id` varchar(8) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE IF NOT EXISTS `tbl_student` (
  `user_id` varchar(8) NOT NULL,
  `major` varchar(100) NOT NULL DEFAULT 'undeclared',
  `term` varchar(6) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfers_in`
--

CREATE TABLE IF NOT EXISTS `tbl_transfers_in` (
  `user_id` varchar(8) NOT NULL,
  `transfer_course_alpha` varchar(6) NOT NULL,
  `transfer_course_num` varchar(6) NOT NULL,
  `transfer_inst_name` varchar(50) NOT NULL,
  `submission_time_stamp` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`transfer_course_alpha`,`transfer_course_num`,`transfer_inst_name`),
  KEY `transfer_inst_name` (`transfer_inst_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfer_course`
--

CREATE TABLE IF NOT EXISTS `tbl_transfer_course` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `transfer_course_alpha` varchar(6) NOT NULL,
  `transfer_course_num` varchar(6) NOT NULL,
  `transfer_inst_name` varchar(50) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `transfer_hours` varchar(8) NOT NULL,
  `effective_term` varchar(6) NOT NULL,
  `grp` char(1) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `fk_tblTransfer_Course_tblTransfers_In` (`transfer_inst_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` varchar(8) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_initital` varchar(1) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_and_equivalent`
--
ALTER TABLE `tbl_and_equivalent`
  ADD CONSTRAINT `tbl_and_equivalent_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `tbl_equivalent_course` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_approves`
--
ALTER TABLE `tbl_approves`
  ADD CONSTRAINT `tbl_approves_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_administrator` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_approves_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `tbl_equivalent_course` (`eid`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_equivalent_course`
--
ALTER TABLE `tbl_equivalent_course`
  ADD CONSTRAINT `tbl_equivalent_course_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `tbl_transfer_course` (`tid`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_or_equivalent`
--
ALTER TABLE `tbl_or_equivalent`
  ADD CONSTRAINT `tbl_or_equivalent_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `tbl_equivalent_course` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_regular_staff`
--
ALTER TABLE `tbl_regular_staff`
  ADD CONSTRAINT `tbl_regular_staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD CONSTRAINT `tbl_student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_transfers_in`
--
ALTER TABLE `tbl_transfers_in`
  ADD CONSTRAINT `tbl_transfers_in_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_student` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_transfer_course`
--
ALTER TABLE `tbl_transfer_course`
  ADD CONSTRAINT `tbl_transfer_course_ibfk_1` FOREIGN KEY (`transfer_inst_name`) REFERENCES `tbl_institution` (`institution_name`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
