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
  `tblOr_Equivalent_eq_course_alpha` VARCHAR(6) NOT NULL,
  `tblOr_Equivalent_eq_course_num` VARCHAR(6) NOT NULL,
  `tblAnd_Equivalent_eq_course_alpha` VARCHAR(6) NOT NULL,
  `tblAnd_Equivalent_eq_course_num` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`transfer_course_alpha`, `transfer_course_num`, `transfer_inst_name`),
  INDEX `fk_tblTransfer_Course_tblOr_Equivalent1_idx` (`tblOr_Equivalent_eq_course_alpha` ASC, `tblOr_Equivalent_eq_course_num` ASC),
  INDEX `fk_tblTransfer_Course_tblAnd_Equivalent1_idx` (`tblAnd_Equivalent_eq_course_alpha` ASC, `tblAnd_Equivalent_eq_course_num` ASC),
  CONSTRAINT `fk_tblTransfer_Course_tblOr_Equivalent1`
    FOREIGN KEY (`tblOr_Equivalent_eq_course_alpha` , `tblOr_Equivalent_eq_course_num`)
    REFERENCES `mydb`.`tblOr_Equivalent` (`eq_course_alpha` , `eq_course_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTransfer_Course_tblAnd_Equivalent1`
    FOREIGN KEY (`tblAnd_Equivalent_eq_course_alpha` , `tblAnd_Equivalent_eq_course_num`)
    REFERENCES `mydb`.`tblAnd_Equivalent` (`eq_course_alpha` , `eq_course_num`)
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
  `tblTransfer_Course_transfer_course_alpha` VARCHAR(6) NOT NULL,
  `tblTransfer_Course_transfer_course_num` VARCHAR(6) NOT NULL,
  `tblTransfer_Course_transfer_inst_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_tblInstitution_tblTransfer_Course1_idx` (`tblTransfer_Course_transfer_course_alpha` ASC, `tblTransfer_Course_transfer_course_num` ASC, `tblTransfer_Course_transfer_inst_name` ASC),
  CONSTRAINT `fk_tblInstitution_tblTransfer_Course1`
    FOREIGN KEY (`tblTransfer_Course_transfer_course_alpha` , `tblTransfer_Course_transfer_course_num` , `tblTransfer_Course_transfer_inst_name`)
    REFERENCES `mydb`.`tblTransfer_Course` (`transfer_course_alpha` , `transfer_course_num` , `transfer_inst_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `tblAdministrator_user_id1` VARCHAR(8) NOT NULL,
  `tblEquivalent_Course_eq_course_alpha` VARCHAR(6) NOT NULL,
  `tblEquivalent_Course_eq_course_num` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`user_id`, `eq_course_alpha`, `eq_course_num`, `tblAdministrator_user_id`, `tblAdministrator_tblStaff_user_id`, `tblAdministrator_tblStaff_tblUser_user_id`, `tblAdministrator_user_id1`, `tblEquivalent_Course_eq_course_alpha`, `tblEquivalent_Course_eq_course_num`),
  INDEX `fk_tblApproves_tblAdministrator1_idx` (`tblAdministrator_user_id1` ASC),
  INDEX `fk_tblApproves_tblEquivalent_Course1_idx` (`tblEquivalent_Course_eq_course_alpha` ASC, `tblEquivalent_Course_eq_course_num` ASC),
  CONSTRAINT `fk_tblApproves_tblAdministrator1`
    FOREIGN KEY (`tblAdministrator_user_id1`)
    REFERENCES `mydb`.`tblAdministrator` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblApproves_tblEquivalent_Course1`
    FOREIGN KEY (`tblEquivalent_Course_eq_course_alpha` , `tblEquivalent_Course_eq_course_num`)
    REFERENCES `mydb`.`tblEquivalent_Course` (`eq_course_alpha` , `eq_course_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblStudent_has_tblTransfers_In`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblStudent_has_tblTransfers_In` (
  `tblStudent_user_id` VARCHAR(8) NOT NULL,
  `tblTransfers_In_transfer_course_alpha` VARCHAR(6) NOT NULL,
  `tblTransfers_In_transfer_course_num` VARCHAR(6) NOT NULL,
  `tblTransfers_In_transfer_inst_name` VARCHAR(50) NOT NULL,
  `tblTransfers_In_user_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`tblStudent_user_id`, `tblTransfers_In_transfer_course_alpha`, `tblTransfers_In_transfer_course_num`, `tblTransfers_In_transfer_inst_name`, `tblTransfers_In_user_id`),
  INDEX `fk_tblStudent_has_tblTransfers_In_tblTransfers_In1_idx` (`tblTransfers_In_transfer_course_alpha` ASC, `tblTransfers_In_transfer_course_num` ASC, `tblTransfers_In_transfer_inst_name` ASC, `tblTransfers_In_user_id` ASC),
  INDEX `fk_tblStudent_has_tblTransfers_In_tblStudent1_idx` (`tblStudent_user_id` ASC),
  CONSTRAINT `fk_tblStudent_has_tblTransfers_In_tblStudent1`
    FOREIGN KEY (`tblStudent_user_id`)
    REFERENCES `mydb`.`tblStudent` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblStudent_has_tblTransfers_In_tblTransfers_In1`
    FOREIGN KEY (`tblTransfers_In_transfer_course_alpha` , `tblTransfers_In_transfer_course_num` , `tblTransfers_In_transfer_inst_name` , `tblTransfers_In_user_id`)
    REFERENCES `mydb`.`tblTransfers_In` (`transfer_course_alpha` , `transfer_course_num` , `transfer_inst_name` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblTransfers_In_has_tblTransfer_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblTransfers_In_has_tblTransfer_Course` (
  `tblTransfers_In_transfer_course_alpha` VARCHAR(6) NOT NULL,
  `tblTransfers_In_transfer_course_num` VARCHAR(6) NOT NULL,
  `tblTransfers_In_transfer_inst_name` VARCHAR(50) NOT NULL,
  `tblTransfers_In_user_id` VARCHAR(8) NOT NULL,
  `tblTransfer_Course_transfer_course_alpha` VARCHAR(6) NOT NULL,
  `tblTransfer_Course_transfer_course_num` VARCHAR(6) NOT NULL,
  `tblTransfer_Course_transfer_inst_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tblTransfers_In_transfer_course_alpha`, `tblTransfers_In_transfer_course_num`, `tblTransfers_In_transfer_inst_name`, `tblTransfers_In_user_id`, `tblTransfer_Course_transfer_course_alpha`, `tblTransfer_Course_transfer_course_num`, `tblTransfer_Course_transfer_inst_name`),
  INDEX `fk_tblTransfers_In_has_tblTransfer_Course_tblTransfer_Cours_idx` (`tblTransfer_Course_transfer_course_alpha` ASC, `tblTransfer_Course_transfer_course_num` ASC, `tblTransfer_Course_transfer_inst_name` ASC),
  INDEX `fk_tblTransfers_In_has_tblTransfer_Course_tblTransfers_In1_idx` (`tblTransfers_In_transfer_course_alpha` ASC, `tblTransfers_In_transfer_course_num` ASC, `tblTransfers_In_transfer_inst_name` ASC, `tblTransfers_In_user_id` ASC),
  CONSTRAINT `fk_tblTransfers_In_has_tblTransfer_Course_tblTransfers_In1`
    FOREIGN KEY (`tblTransfers_In_transfer_course_alpha` , `tblTransfers_In_transfer_course_num` , `tblTransfers_In_transfer_inst_name` , `tblTransfers_In_user_id`)
    REFERENCES `mydb`.`tblTransfers_In` (`transfer_course_alpha` , `transfer_course_num` , `transfer_inst_name` , `user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblTransfers_In_has_tblTransfer_Course_tblTransfer_Course1`
    FOREIGN KEY (`tblTransfer_Course_transfer_course_alpha` , `tblTransfer_Course_transfer_course_num` , `tblTransfer_Course_transfer_inst_name`)
    REFERENCES `mydb`.`tblTransfer_Course` (`transfer_course_alpha` , `transfer_course_num` , `transfer_inst_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tblStaff_has_tblPrivilege_Set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tblStaff_has_tblPrivilege_Set` (
  `tblStaff_user_id` VARCHAR(8) NOT NULL,
  `tblPrivilege_Set_user_id` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`tblStaff_user_id`, `tblPrivilege_Set_user_id`),
  INDEX `fk_tblStaff_has_tblPrivilege_Set_tblPrivilege_Set1_idx` (`tblPrivilege_Set_user_id` ASC),
  INDEX `fk_tblStaff_has_tblPrivilege_Set_tblStaff1_idx` (`tblStaff_user_id` ASC),
  CONSTRAINT `fk_tblStaff_has_tblPrivilege_Set_tblStaff1`
    FOREIGN KEY (`tblStaff_user_id`)
    REFERENCES `mydb`.`tblStaff` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblStaff_has_tblPrivilege_Set_tblPrivilege_Set1`
    FOREIGN KEY (`tblPrivilege_Set_user_id`)
    REFERENCES `mydb`.`tblPrivilege_Set` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
