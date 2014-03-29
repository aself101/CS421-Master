SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
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
  `user_id` VARCHAR(8) NOT NULL,
  `transfer_course_alpha` VARCHAR(6) NOT NULL,
  `transfer_course_num` VARCHAR(6) NOT NULL,
  `transfer_inst_name` VARCHAR(50) NOT NULL,
  `time_stamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`user_id`, `transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`),
  CONSTRAINT `fk_tblTransfers_In_tblStudent1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`tblStudent` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`),
  CONSTRAINT `fk_tblTransfer_Course_tblTransfers_In`
    FOREIGN KEY (`transfer_inst_name`)
    REFERENCES `mydb`.`tblTransfers_In` (`transfer_inst_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `transfer_inst_name` VARCHAR(50) NOT NULL,
  `eq_course_alpha` VARCHAR(6) NOT NULL,
  `eq_course_num` VARCHAR(6) NOT NULL,
  `course_title` VARCHAR(50) NOT NULL,
  `eq_hours` VARCHAR(5) NOT NULL,
  `conn` ENUM('AND','OR') NULL,
  `uhh_atr` VARCHAR(5) NULL,
  `date_updated` DATE NOT NULL,
  `pr` CHAR(1) NULL,
  PRIMARY KEY (`transfer_inst_name`, `eq_course_alpha`, `eq_course_num`),
  INDEX `fk_tblEquivalent_Course_tblTransfer_Course1_idx` (`eq_course_alpha` ASC, `eq_course_num` ASC, `transfer_inst_name` ASC),
  CONSTRAINT `fk_tblEquivalent_Course_tblTransfer_Course1`
    FOREIGN KEY (`eq_course_alpha` , `eq_course_num` , `transfer_inst_name`)
    REFERENCES `mydb`.`tblTransfer_Course` (`transfer_course_alpha` , `transfer_course_alpha` , `transfer_inst_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `approval_flag` BIT NULL DEFAULT 0,
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
  PRIMARY KEY (`user_id`, `eq_course_alpha`, `eq_course_num`),
  INDEX `fk_tblApproves_tblEquivalent_Course1_idx` (`eq_course_alpha` ASC, `eq_course_num` ASC),
  CONSTRAINT `fk_tblApproves_tblAdministrator1`
    FOREIGN KEY (`user_id` , `eq_course_alpha` , `eq_course_num`)
    REFERENCES `mydb`.`tblAdministrator` (`user_id` , `user_id` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblApproves_tblEquivalent_Course1`
    FOREIGN KEY (`eq_course_alpha` , `eq_course_num`)
    REFERENCES `mydb`.`tblEquivalent_Course` (`eq_course_alpha` , `eq_course_alpha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`eq_course_alpha`, `eq_course_num`),
  CONSTRAINT `fk_tblAnd_Equivalent_tblEquivalent_Course1`
    FOREIGN KEY (`eq_course_alpha` , `eq_course_num`)
    REFERENCES `mydb`.`tblEquivalent_Course` (`eq_course_alpha` , `eq_course_alpha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`eq_course_alpha`, `eq_course_num`),
  CONSTRAINT `fk_tblOr_Equivalent_tblEquivalent_Course1`
    FOREIGN KEY (`eq_course_alpha` , `eq_course_num`)
    REFERENCES `mydb`.`tblEquivalent_Course` (`eq_course_alpha` , `eq_course_alpha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
