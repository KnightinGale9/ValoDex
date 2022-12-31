-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ValoDex
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ValoDex` ;

-- -----------------------------------------------------
-- Schema ValoDex
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ValoDex` DEFAULT CHARACTER SET utf8 ;
USE `ValoDex` ;

-- -----------------------------------------------------
-- Table `ValoDex`.`Region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ValoDex`.`Region` ;

CREATE TABLE IF NOT EXISTS `ValoDex`.`Region` (
  `Name` VARCHAR(5) NOT NULL,
  `EloScale` INT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ValoDex`.`Tournament_Rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ValoDex`.`Tournament_Rating` ;

CREATE TABLE IF NOT EXISTS `ValoDex`.`Tournament_Rating` (
  `Type` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`Type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ValoDex`.`Tournament`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ValoDex`.`Tournament` ;

CREATE TABLE IF NOT EXISTS `ValoDex`.`Tournament` (
  `ValoDexID` INT NOT NULL AUTO_INCREMENT,
  `outsideID` VARCHAR(20) NULL,
  `Tournament_Name` VARCHAR(100) NOT NULL,
  `Region` VARCHAR(5) NOT NULL,
  `DateStart` DATETIME NOT NULL,
  `DateEnd` DATETIME NULL,
  `Tournament_Rating_Type` VARCHAR(2) NOT NULL,
  UNIQUE INDEX `ValoDexID_UNIQUE` (`ValoDexID` ASC) VISIBLE,
  PRIMARY KEY (`Tournament_Name`, `DateStart`, `Tournament_Rating_Type`),
  INDEX `fk_Tournament_Region1_idx` (`Region` ASC) VISIBLE,
  INDEX `fk_Tournament_Tournament_Rating1_idx` (`Tournament_Rating_Type` ASC) VISIBLE,
  CONSTRAINT `fk_Tournament_Region1`
    FOREIGN KEY (`Region`)
    REFERENCES `ValoDex`.`Region` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tournament_Tournament_Rating1`
    FOREIGN KEY (`Tournament_Rating_Type`)
    REFERENCES `ValoDex`.`Tournament_Rating` (`Type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ValoDex`.`Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ValoDex`.`Team` ;

CREATE TABLE IF NOT EXISTS `ValoDex`.`Team` (
  `TeamID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Abbreviation` VARCHAR(5) NOT NULL,
  `Region` VARCHAR(5) NOT NULL,
  `FA` BIT(1) NULL,
  PRIMARY KEY (`Name`, `Region`),
  INDEX `fk_Team_Region1_idx` (`Region` ASC) VISIBLE,
  UNIQUE INDEX `TeamID_UNIQUE` (`TeamID` ASC) VISIBLE,
  CONSTRAINT `fk_Team_Region1`
    FOREIGN KEY (`Region`)
    REFERENCES `ValoDex`.`Region` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ValoDex`.`Rating_Placement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ValoDex`.`Rating_Placement` ;

CREATE TABLE IF NOT EXISTS `ValoDex`.`Rating_Placement` (
  `Placement` INT NOT NULL,
  `Tournament_Rating_Type` VARCHAR(2) NOT NULL,
  `Elo` INT NULL,
  PRIMARY KEY (`Placement`, `Tournament_Rating_Type`),
  INDEX `fk_Rating_Placement_Tournament_Rating1_idx` (`Tournament_Rating_Type` ASC) VISIBLE,
  CONSTRAINT `fk_Rating_Placement_Tournament_Rating1`
    FOREIGN KEY (`Tournament_Rating_Type`)
    REFERENCES `ValoDex`.`Tournament_Rating` (`Type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ValoDex`.`Tournament_has_Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ValoDex`.`Tournament_has_Team` ;

CREATE TABLE IF NOT EXISTS `ValoDex`.`Tournament_has_Team` (
  `Tournament_Name` VARCHAR(100) NOT NULL,
  `Tournament_DateStart` DATETIME NOT NULL,
  `Tournament_Rating_Type` VARCHAR(2) NOT NULL,
  `Team_Name` VARCHAR(100) NOT NULL,
  `Team_Region` VARCHAR(5) NOT NULL,
  `Placement` INT NOT NULL,
  `Elo_placement` INT NOT NULL,
  `Extra_Elo_Scale` INT NULL DEFAULT 0,
  `Reason_For_Extra` VARCHAR(45) NULL,
  PRIMARY KEY (`Tournament_Name`, `Tournament_DateStart`, `Team_Name`, `Team_Region`, `Tournament_Rating_Type`),
  INDEX `fk_Tournament_has_Team_Team1_idx` (`Team_Name` ASC, `Team_Region` ASC) VISIBLE,
  INDEX `fk_Tournament_has_Team_Tournament1_idx` (`Tournament_Name` ASC, `Tournament_DateStart` ASC, `Tournament_Rating_Type` ASC) VISIBLE,
  CONSTRAINT `fk_Tournament_has_Team_Tournament1`
    FOREIGN KEY (`Tournament_Name` , `Tournament_DateStart` , `Tournament_Rating_Type`)
    REFERENCES `ValoDex`.`Tournament` (`Tournament_Name` , `DateStart` , `Tournament_Rating_Type`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tournament_has_Team_Team1`
    FOREIGN KEY (`Team_Name` , `Team_Region`)
    REFERENCES `ValoDex`.`Team` (`Name` , `Region`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
