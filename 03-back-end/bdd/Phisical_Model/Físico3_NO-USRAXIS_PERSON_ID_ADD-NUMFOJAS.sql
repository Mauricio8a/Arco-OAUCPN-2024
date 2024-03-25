-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema archivo
-- -----------------------------------------------------
-- Base de datos del Archivo de Gestión de la Oficina de Atención al Usuario Cordero Plataforma Norte (OAUCPN) 2024

-- -----------------------------------------------------
-- Schema archivo
--
-- Base de datos del Archivo de Gestión de la Oficina de Atención al Usuario Cordero Plataforma Norte (OAUCPN) 2024
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `archivo` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `archivo` ;

-- -----------------------------------------------------
-- Table `archivo`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(13) NOT NULL,
  `firstname` VARCHAR(70) NULL,
  `lastname` VARCHAR(70) NULL,
  `names` VARCHAR(70) NULL,
  `dob` DATE NULL,
  `treat` VARCHAR(45) NULL,
  `email` VARCHAR(70) NULL,
  `phone` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`licence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`licence` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class` VARCHAR(2) NOT NULL,
  `desc` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `class_UNIQUE` (`class` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`procedure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kind` VARCHAR(70) NOT NULL,
  `desc` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `kind_UNIQUE` (`kind` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`usraxis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`usraxis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_usraxis_person1_idx` (`person_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_usraxis_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `archivo`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`procedure_has_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`procedure_has_person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `procedure_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  `licence_id` INT NOT NULL,
  `usraxis_id` INT NOT NULL,
  `fproc` DATE NOT NULL,
  `numproc` INT NOT NULL,
  `numfojas` INT NULL,
  PRIMARY KEY (`id`, `procedure_id`, `person_id`, `licence_id`, `usraxis_id`),
  INDEX `fk_procedure_has_person_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_procedure_has_person_procedure1_idx` (`procedure_id` ASC) VISIBLE,
  INDEX `fk_procedure_has_person_licence1_idx` (`licence_id` ASC) VISIBLE,
  INDEX `fk_procedure_has_person_usraxis1_idx` (`usraxis_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `numproc_UNIQUE` (`numproc` ASC) VISIBLE,
  CONSTRAINT `fk_procedure_has_person_procedure1`
    FOREIGN KEY (`procedure_id`)
    REFERENCES `archivo`.`procedure` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_has_person_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `archivo`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_has_person_licence1`
    FOREIGN KEY (`licence_id`)
    REFERENCES `archivo`.`licence` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_has_person_usraxis1`
    FOREIGN KEY (`usraxis_id`)
    REFERENCES `archivo`.`usraxis` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
