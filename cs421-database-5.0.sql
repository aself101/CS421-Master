-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2014 at 07:46 AM
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

--
-- Dumping data for table `tbl_administrator`
--

INSERT INTO `tbl_administrator` (`user_id`, `approval_flag`) VALUES
('00000000', b'1'),
('00040020', b'1'),
('48939764', b'0');

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

--
-- Dumping data for table `tbl_and_equivalent`
--

INSERT INTO `tbl_and_equivalent` (`eid`, `eq_course_alpha`, `eq_course_num`, `course_title`, `eq_hours`, `uhh_atr`) VALUES
(5, 'SPAN', '102', 'Spanish II', '6', NULL),
(6, 'AG', 'AG UPP', 'General UD AG Lab Substitution', '2.0', NULL),
(7, 'JPSNE', '102', 'Elementary Japanese II', '8.0', NULL);

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

--
-- Dumping data for table `tbl_approves`
--

INSERT INTO `tbl_approves` (`aid`, `user_id`, `eq_course_alpha`, `eq_course_num`, `approval_time_stamp`) VALUES
(1, '00000000', 'CHEM', '124', '2010-01-01 01:44:21'),
(2, '48939764', 'JPNSE', '101', '2014-06-04 01:44:21'),
(3, '00040020', 'MATH', '205', '2014-04-11 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_equivalent_course`
--

INSERT INTO `tbl_equivalent_course` (`eid`, `eq_course_alpha`, `eq_course_num`, `course_title`, `eq_hours`, `conn`, `uhh_atr`, `date_updated`, `pr`) VALUES
(1, 'CHEM', '124', 'Gen Chemistry', '3.0', NULL, NULL, '2014-04-14', NULL),
(2, 'JPNSE', '101', 'Elementary Japanese', '4.0', NULL, NULL, '2014-06-04', NULL),
(3, 'MATH', '205', 'Calculus I', '4.0', NULL, NULL, '2014-04-11', NULL),
(4, 'ENG', '252', 'Brit Lit: 1800 - Present', '3.0', NULL, NULL, '2013-04-12', NULL),
(5, 'SPAN', '101', 'Spanish I ', '6', 'AND', NULL, '2003-03-03', NULL),
(6, 'AG', 'AG UPP', 'Upper Division Agriculture', '2.0', 'AND', NULL, '2001-10-01', NULL),
(7, 'JPSNE', '101', 'Elementary Japanese I ', '8.0', 'AND', NULL, '2003-04-15', NULL);

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

--
-- Dumping data for table `tbl_institution`
--

INSERT INTO `tbl_institution` (`institution_name`, `city`, `state`, `zip`, `website`) VALUES
('Hawaii Community College', 'Hilo', 'HI', '96720', NULL),
('University of Hawaii Manoa', 'Manoa', 'HI', '967777', 'http://manoa.hawaii.edu'),
('University of Hawaii West Oahu', 'Kapolei', 'HI', '96771', NULL);

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

--
-- Dumping data for table `tbl_regular_staff`
--

INSERT INTO `tbl_regular_staff` (`user_id`) VALUES
('90903435');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE IF NOT EXISTS `tbl_staff` (
  `user_id` varchar(8) NOT NULL,
  `department` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`user_id`, `department`, `position`) VALUES
('00000000', 'Physics', 'Chair'),
('00040020', 'College of Arts and Sciences', 'Dean'),
('48939764', 'ITS', 'DBA'),
('90903435', 'Financial Aid', 'Student Assistant');

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

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`user_id`, `major`, `term`) VALUES
('00040020', 'Biology', 'sp2122'),
('12395498', 'Computer Science', 'fa2012'),
('48934932', 'Mathematics', 'sp0000'),
('56422044', 'Astronomy', 'sp2014');

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

--
-- Dumping data for table `tbl_transfers_in`
--

INSERT INTO `tbl_transfers_in` (`user_id`, `transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`, `submission_time_stamp`) VALUES
('00040020', 'ENG', '252', 'Hawaii Community College', '2005-08-21 10:32:00'),
('00040020', 'JPN', '105', 'University of Hawaii at Manoa', '2001-08-23 12:00:00'),
('12395498', 'Chem', '103', 'University of Hawaii at Manoa', '2014-04-19 17:25:00'),
('12395498', 'SPAN', '103', 'University of Hawaii at Manoa', '2012-02-29 10:21:00'),
('48934932', 'JPNSE', '101', 'Hawaii Community College', '1992-05-28 01:02:00'),
('56422044', 'MATH', '241', 'University of Hawaii West Oahu', '2000-01-01 00:00:00'),
('56422044', 'TPSS', '421', 'University of Hawaii at Manoa', '2013-12-25 04:23:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_transfer_course`
--

INSERT INTO `tbl_transfer_course` (`tid`, `transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`, `course_title`, `transfer_hours`, `effective_term`, `grp`) VALUES
(1, 'CHEM', '103', 'University of Hawaii Manoa', 'Introduction to Chemistry', '4.00', '196740', NULL),
(2, 'JPNSE', '101', 'Hawaii Community College', 'Elementary Japanese I', '4.00', '199140', NULL),
(3, 'MATH', '241', 'University of Hawaii West Oahu', 'CALCULUS I', '4.00', '201110', NULL),
(4, 'ENG', '252', 'Hawaii Community College', 'BRITISH LIT AFTER 1800', '3.00', '199540', '3'),
(5, 'SPAN', '103', 'University of Hawaii Manoa', 'INTENSTIVE ELEMENTARY SPANISH', '6.00', '199740', NULL),
(6, 'TPSS', '421', 'University of Hawaii Manoa', 'TROPICAL SEED SCIENCE', '2.00', '199340', NULL),
(7, 'JPN ', '105', 'University of Hawaii Manoa', 'ACCELERATED ELEM JAPANESE', '8.00', '199340', NULL);

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
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `first_name`, `middle_initital`, `last_name`, `phone`, `email`) VALUES
('00000000', 'Werner', 'A', 'Heis', '8082342393', 'Heisa'),
('00040020', 'Bunny', 'E', 'Easter', '8089659123', 'beaster@hawaii.edu'),
('00040021', 'Steven', 'S', 'Smithe', '1111111111', 'smithes'),
('01234567', 'Abcde', 'F', 'Ghij', '0123456789', 'abcde@hawaii.edu'),
('12395498', 'Alexander', 'D', 'Self', '8082913928', 'alexs@hawaii.edu'),
('45659875', 'Abu', 'T', 'Smith', '9234923492', 'Asmith'),
('48934932', 'David', 'P', 'Luis', '8089320923', 'davidl@hawaii.edu'),
('48939764', 'John', 'A', 'Silvers', '8083230334', 'jsilvers@hawaii.edu'),
('54934396', 'Jason', 'E', 'Remmer', '9245095404', 'jremer@hawaii.edu'),
('56422044', 'John', 'R', 'Evans', '8084345294', 'johne@hawaii.edu'),
('56423456', 'Eric', 'T', 'Takugawa', '0000000000', 'atakugawa@hawaii.edu'),
('90903435', 'Linda', 'T', 'Wilson', '9034964323', 'wilsonl@hawaii.edu'),
('99999999', 'Betty', 'L', 'Washington', '9492094492', 'Bwash');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_administrator`
--
ALTER TABLE `tbl_administrator`
  ADD CONSTRAINT `tbl_administrator_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_staff` (`user_id`) ON UPDATE CASCADE;

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
  ADD CONSTRAINT `tbl_regular_staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_staff` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD CONSTRAINT `tbl_staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON UPDATE CASCADE;

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
