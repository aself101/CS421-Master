-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2014 at 03:07 AM
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
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `university` text,
  `department` text,
  `course` text,
  `year` int(11) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140329000032');

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
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`eq_course_alpha`,`eq_course_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approves`
--

CREATE TABLE IF NOT EXISTS `tbl_approves` (
  `user_id` varchar(8) NOT NULL,
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `approval_time_stamp` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`eq_course_alpha`,`eq_course_num`),
  KEY `fk_tblApproves_tblEquivalent_Course_idx` (`eq_course_alpha`,`eq_course_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equivalent_course`
--

CREATE TABLE IF NOT EXISTS `tbl_equivalent_course` (
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `conn` enum('AND','OR') DEFAULT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  `date_updated` date NOT NULL,
  `pr` char(1) DEFAULT NULL,
  PRIMARY KEY (`eq_course_alpha`,`eq_course_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `eq_course_alpha` varchar(6) NOT NULL,
  `eq_course_num` varchar(6) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `eq_hours` varchar(5) NOT NULL,
  `uhh_atr` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`eq_course_alpha`,`eq_course_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `tbl_staff`
--

CREATE TABLE IF NOT EXISTS `tbl_staff` (
  `user_id` varchar(8) NOT NULL,
  `department` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
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
  PRIMARY KEY (`user_id`,`transfer_course_alpha`,`transfer_course_num`,`transfer_inst_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfer_course`
--

CREATE TABLE IF NOT EXISTS `tbl_transfer_course` (
  `transfer_course_alpha` varchar(6) NOT NULL,
  `transfer_course_num` varchar(6) NOT NULL,
  `transfer_inst_name` varchar(50) NOT NULL,
  `course_title` varchar(50) NOT NULL,
  `transfer_hours` varchar(8) NOT NULL,
  `effective_term` varchar(6) NOT NULL,
  `grp` char(1) DEFAULT NULL,
  PRIMARY KEY (`transfer_course_alpha`,`transfer_course_num`,`transfer_inst_name`),
  KEY `fk_tblTransfer_Course_tblTransfers_In_idx` (`transfer_inst_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Constraints for table `tbl_administrator`
--
ALTER TABLE `tbl_administrator`
  ADD CONSTRAINT `fk_tblAdministrator_tblStaff` FOREIGN KEY (`user_id`) REFERENCES `tbl_staff` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_and_equivalent`
--
ALTER TABLE `tbl_and_equivalent`
  ADD CONSTRAINT `fk_tblAnd_Equivalent_tblEquivalent_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_equivalent_course` (`eq_course_alpha`, `eq_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_approves`
--
ALTER TABLE `tbl_approves`
  ADD CONSTRAINT `fk_tblApproves_tblAdministrator` FOREIGN KEY (`user_id`) REFERENCES `tbl_administrator` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblApproves_tblEquivalent_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_equivalent_course` (`eq_course_alpha`, `eq_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_equivalent_course`
--
ALTER TABLE `tbl_equivalent_course`
  ADD CONSTRAINT `fk_tblEquivalent_Course_tblTransfer_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_transfer_course` (`transfer_course_alpha`, `transfer_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_or_equivalent`
--
ALTER TABLE `tbl_or_equivalent`
  ADD CONSTRAINT `fk_tblOr_Equivalent_tblEquivalent_Course` FOREIGN KEY (`eq_course_alpha`, `eq_course_num`) REFERENCES `tbl_equivalent_course` (`eq_course_alpha`, `eq_course_num`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_regular_staff`
--
ALTER TABLE `tbl_regular_staff`
  ADD CONSTRAINT `fk_tblRegular_Staff_tblStaff` FOREIGN KEY (`user_id`) REFERENCES `tbl_staff` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD CONSTRAINT `fk_tblStaff_tblUser` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD CONSTRAINT `fk_tblStudent_tblUser` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_transfers_in`
--
ALTER TABLE `tbl_transfers_in`
  ADD CONSTRAINT `fk_tblTransfers_In_tblStudent` FOREIGN KEY (`user_id`) REFERENCES `tbl_student` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_transfer_course`
--
ALTER TABLE `tbl_transfer_course`
  ADD CONSTRAINT `fk_tblTransfer_Course_tblTransfers_In` FOREIGN KEY (`transfer_inst_name`) REFERENCES `tbl_institution` (`institution_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
