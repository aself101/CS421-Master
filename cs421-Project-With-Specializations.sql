SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tblUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblUser` (
  `user_id` VARCHAR(8) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `middle_initial` VARCHAR(1) NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `email` VARCHAR(25) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblStudent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblStudent` (
  `user_id` VARCHAR(8) NOT NULL,
  `major` VARCHAR(100) NOT NULL DEFAULT 'undeclared',
  `term` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblStudent_tblUser`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tblUser` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblTransfers_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblTransfers_In` (
  `transfer_course_alpha` VARCHAR(6) NOT NULL,
  `transfer_course_num` VARCHAR(6) NOT NULL,
  `transfer_inst_name` VARCHAR(50) NOT NULL,
  `user_id` VARCHAR(8) NOT NULL,
  `time_stamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`, `user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblTransfer_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblTransfer_Course` (
  `transfer_course_alpha` VARCHAR(6) NOT NULL,
  `transfer_course_num` VARCHAR(6) NOT NULL,
  `transfer_inst_name` VARCHAR(50) NOT NULL,
  `course_title` VARCHAR(50) NOT NULL,
  `transfer_hours` VARCHAR(8) NOT NULL,
  `effective_term` VARCHAR(6) NOT NULL,
  `grp` CHAR(1) NULL,
  PRIMARY KEY (`transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblInstitution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblInstitution` (
  `name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(60) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `zip` VARCHAR(20) NOT NULL,
  `website` VARCHAR(100) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblEquivalent_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblEquivalent_Course` (
  `eq_course_alpha` VARCHAR(6) NOT NULL,
  `eq_course_num` VARCHAR(6) NOT NULL,
  `course_title` VARCHAR(50) NOT NULL,
  `eq_hours` VARCHAR(5) NOT NULL,
  `uhh_atr` VARCHAR(5) NULL,
  `conn` ENUM('AND','OR') NULL,
  `date_updated` DATE NOT NULL,
  `pr` CHAR(1) NULL,
  PRIMARY KEY (`eq_course_alpha`, `eq_course_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblStaff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblStaff` (
  `user_id` VARCHAR(8) NOT NULL,
  `department` VARCHAR(50) NOT NULL,
  `position` VARCHAR(25) NOT NULL,
  `user_name` VARCHAR(10) NOT NULL,
  `password` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblStaff_tblUser`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tblUser` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblPrivilege_Set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblPrivilege_Set` (
  `user_id` VARCHAR(8) NOT NULL,
  `create` BIT NULL DEFAULT 0,
  `read` BIT NULL DEFAULT 0,
  `update` BIT NULL DEFAULT 0,
  `delete` BIT NULL DEFAULT 0,
  `approve` BIT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblRegular_Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblRegular_Staff` (
  `user_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblRegular_Staff_tblStaff`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tblStaff` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblAdministrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblAdministrator` (
  `user_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tblAdministrator_tblStaff`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tblStaff` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblApproves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblApproves` (
  `user_id` VARCHAR(8) NOT NULL,
  `eq_course_alpha` VARCHAR(6) NOT NULL,
  `eq_course_num` VARCHAR(6) NOT NULL,
  `approval_time_stamp` DATETIME NOT NULL,
  `tblAdministrator_user_id` VARCHAR(8) NOT NULL,
  `tblAdministrator_tblStaff_user_id` VARCHAR(8) NOT NULL,
  `tblAdministrator_tblStaff_tblUser_user_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`user_id`, `eq_course_alpha`, `eq_course_num`, `tblAdministrator_user_id`, `tblAdministrator_tblStaff_user_id`, `tblAdministrator_tblStaff_tblUser_user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblAnd_Equivalent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblAnd_Equivalent` (
  `eq_course_alpha` VARCHAR(6) NOT NULL,
  `eq_course_num` VARCHAR(6) NOT NULL,
  `course_title` VARCHAR(50) NOT NULL,
  `eq_hours` VARCHAR(5) NOT NULL,
  `uhh_atr` VARCHAR(5) NULL,
  PRIMARY KEY (`eq_course_alpha`, `eq_course_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblOr_Equivalent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblOr_Equivalent` (
  `eq_course_alpha` VARCHAR(6) NOT NULL,
  `eq_course_num` VARCHAR(6) NOT NULL,
  `course_title` VARCHAR(50) NOT NULL,
  `eq_hours` VARCHAR(5) NOT NULL,
  `uhh_atr` VARCHAR(5) NULL,
  PRIMARY KEY (`eq_course_alpha`, `eq_course_num`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
