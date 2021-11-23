-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Time_Database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Time_Database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Time_Database` DEFAULT CHARACTER SET utf8 ;
USE `Time_Database` ;

-- -----------------------------------------------------
-- Table `Time_Database`.`Classes_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Time_Database`.`Classes_Table` (
  `Class_Code` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Credits` INT NULL,
  `Level` INT NULL,
  `Type` INT NULL,
  `Honours` TINYINT NULL,
  `Online` TINYINT NULL,
  `Uni_Year` INT NULL,
  PRIMARY KEY (`Class_Code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Time_Database`.`Records_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Time_Database`.`Records_Table` (
  `Record_Id` VARCHAR(45) NOT NULL,
  `Start_Time` TIME NULL,
  `Time_of_Day` INT NULL,
  `End_Time` TIME NULL,
  `Duration` INT NULL,
  `Date` DATE NULL,
  `Period` INT NULL,
  `Class_Code_Records` INT NULL,
  PRIMARY KEY (`Record_Id`),
  INDEX `Class_Code_idx` (`Class_Code_Records` ASC) VISIBLE,
  CONSTRAINT `Class_Code_Records`
    FOREIGN KEY (`Class_Code_Records`)
    REFERENCES `Time_Database`.`Classes_Table` (`Class_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Time_Database`.`Grades_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Time_Database`.`Grades_Table` (
  `Grade_Id` INT NOT NULL AUTO_INCREMENT,
  `Grade` DECIMAL(3,1) NULL,
  `Grade_Type` INT NULL,
  `Class_Code_Grades` INT NULL,
  PRIMARY KEY (`Grade_Id`),
  INDEX `Class_Code_idx` (`Class_Code_Grades` ASC) VISIBLE,
  CONSTRAINT `Class_Code_Grades`
    FOREIGN KEY (`Class_Code_Grades`)
    REFERENCES `Time_Database`.`Classes_Table` (`Class_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
