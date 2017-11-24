-- MySQL Script generated by MySQL Workbench
-- Sat Nov 25 00:44:58 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Tagtion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tagtion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tagtion` DEFAULT CHARACTER SET utf8 ;
USE `Tagtion` ;

-- -----------------------------------------------------
-- Table `Tagtion`.`USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tagtion`.`USER` ;

CREATE TABLE IF NOT EXISTS `Tagtion`.`USER` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tagtion`.`HASHTAGCOLLECTION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tagtion`.`HASHTAGCOLLECTION` ;

CREATE TABLE IF NOT EXISTS `Tagtion`.`HASHTAGCOLLECTION` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `User_ID`),
  INDEX `fk_HASHTAGCOLLECTION_USER1_idx` (`User_ID` ASC),
  CONSTRAINT `fk_HASHTAGCOLLECTION_USER1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Tagtion`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tagtion`.`HASHTAG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tagtion`.`HASHTAG` ;

CREATE TABLE IF NOT EXISTS `Tagtion`.`HASHTAG` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tagtion`.`HASHTAGCOLLECTION_HASHTAG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tagtion`.`HASHTAGCOLLECTION_HASHTAG` ;

CREATE TABLE IF NOT EXISTS `Tagtion`.`HASHTAGCOLLECTION_HASHTAG` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Hashtagcollection_ID` INT NOT NULL,
  `Hashtag_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Hashtagcollection_ID`, `Hashtag_ID`),
  INDEX `fk_HASHTAGCOLLECTION_HASHTAG_HASHTAGCOLLECTION_idx` (`Hashtagcollection_ID` ASC),
  INDEX `fk_HASHTAGCOLLECTION_HASHTAG_HASHTAG1_idx` (`Hashtag_ID` ASC),
  CONSTRAINT `fk_HASHTAGCOLLECTION_HASHTAG_HASHTAGCOLLECTION`
    FOREIGN KEY (`Hashtagcollection_ID`)
    REFERENCES `Tagtion`.`HASHTAGCOLLECTION` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HASHTAGCOLLECTION_HASHTAG_HASHTAG1`
    FOREIGN KEY (`Hashtag_ID`)
    REFERENCES `Tagtion`.`HASHTAG` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tagtion`.`HASHTAGPRESET`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tagtion`.`HASHTAGPRESET` ;

CREATE TABLE IF NOT EXISTS `Tagtion`.`HASHTAGPRESET` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `User_ID`),
  INDEX `fk_HASHTAGPRESET_USER1_idx` (`User_ID` ASC),
  CONSTRAINT `fk_HASHTAGPRESET_USER1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Tagtion`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tagtion`.`HASHTAGPRESET_HASHTAG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tagtion`.`HASHTAGPRESET_HASHTAG` ;

CREATE TABLE IF NOT EXISTS `Tagtion`.`HASHTAGPRESET_HASHTAG` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Hashtagpreset_ID` INT NOT NULL,
  `Hashtag_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Hashtagpreset_ID`, `Hashtag_ID`),
  INDEX `fk_HASHTAGPRESET_HASHTAG_HASHTAGPRESET1_idx` (`Hashtagpreset_ID` ASC),
  INDEX `fk_HASHTAGPRESET_HASHTAG_HASHTAG1_idx` (`Hashtag_ID` ASC),
  CONSTRAINT `fk_HASHTAGPRESET_HASHTAG_HASHTAGPRESET1`
    FOREIGN KEY (`Hashtagpreset_ID`)
    REFERENCES `Tagtion`.`HASHTAGPRESET` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HASHTAGPRESET_HASHTAG_HASHTAG1`
    FOREIGN KEY (`Hashtag_ID`)
    REFERENCES `Tagtion`.`HASHTAG` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
