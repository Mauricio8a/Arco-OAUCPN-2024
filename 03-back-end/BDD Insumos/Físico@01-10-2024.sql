-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema archivo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema archivo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `archivo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `archivo` ;

-- -----------------------------------------------------
-- Table `archivo`.`body`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`body` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `antecedentes` TEXT NULL DEFAULT NULL,
  `hallazgos` TEXT NULL DEFAULT NULL,
  `conclusiones` TEXT NULL DEFAULT NULL,
  `recomendaciones` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`province` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(70) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`city` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(70) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `province_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_province1_idx` (`province_id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_city_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `archivo`.`province` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(13) NOT NULL,
  `lastname` VARCHAR(70) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL,
  `firstname` VARCHAR(70) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL,
  `names` VARCHAR(70) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL,
  `dob` DATE NULL,
  `treat` VARCHAR(45) NULL,
  `cargo` VARCHAR(128) NULL,
  `email` VARCHAR(70) NULL,
  `phone` VARCHAR(10) NULL,
  `city_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_city1_idx` (`city_id` ASC) VISIBLE,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  CONSTRAINT `fk_person_city1`
    FOREIGN KEY (`city_id`)
    REFERENCES `archivo`.`city` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`footer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`footer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  `realizadox` INT NULL DEFAULT NULL,
  `revisadox` INT NULL DEFAULT NULL,
  `aprobadox` INT NULL DEFAULT NULL,
  `ffooter` DATE NULL DEFAULT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `person_id`),
  INDEX `fk_footer_person1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_footer_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `archivo`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`header`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`header` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `de` VARCHAR(45) NULL DEFAULT NULL,
  `para` VARCHAR(45) NULL DEFAULT NULL,
  `asunto` VARCHAR(90) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`legalbasis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`legalbasis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(128) NULL DEFAULT NULL,
  `contenido` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`license`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`license` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class` VARCHAR(2) NOT NULL,
  `desc` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `class_UNIQUE` (`class` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`procedure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kind` VARCHAR(70) NOT NULL,
  `desc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `kind_UNIQUE` (`kind` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`office` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `location` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`usraxis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`usraxis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `person_id` INT NOT NULL,
  `office_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_usraxis_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_usraxis_office1_idx` (`office_id` ASC) VISIBLE,
  CONSTRAINT `fk_usraxis_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `archivo`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usraxis_office1`
    FOREIGN KEY (`office_id`)
    REFERENCES `archivo`.`office` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`year` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(4) NOT NULL,
  `fstart` DATETIME NULL DEFAULT NULL,
  `fclose` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL,
  `building` VARCHAR(100) NULL,
  `floor` INT NULL,
  `section` VARCHAR(50) NULL,
  `shelf` VARCHAR(50) NULL,
  `box` VARCHAR(50) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`scan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`scan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(255) NULL,
  `path` VARCHAR(255) NULL,
  `fcreate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `filename_UNIQUE` (`filename` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `archivo`.`person_has_procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`person_has_procedure` (
  `procedure_id` INT NOT NULL,
  `identification` VARCHAR(13) NOT NULL,
  `usraxis_id` INT NOT NULL,
  `licence_id` INT NOT NULL,
  `year_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `fproc` DATETIME NOT NULL,
  `ffin` DATETIME NOT NULL,
  `numproc` INT NOT NULL,
  `numfojas` INT NULL DEFAULT NULL,
  `location_id` INT NULL,
  `scan_id` INT NULL,
  PRIMARY KEY (`procedure_id`),
  INDEX `fk_person_has_procedure_procedure1_idx` (`procedure_id` ASC) VISIBLE,
  INDEX `fk_person_has_procedure_usraxis1_idx` (`usraxis_id` ASC) VISIBLE,
  INDEX `fk_person_has_procedure_licence1_idx` (`licence_id` ASC) VISIBLE,
  INDEX `fk_person_has_procedure_year1_idx` (`year_id` ASC) VISIBLE,
  INDEX `fk_person_has_procedure_status1_idx` (`status_id` ASC) VISIBLE,
  UNIQUE INDEX `numproc_UNIQUE` (`numproc` ASC) VISIBLE,
  INDEX `fk_person_has_procedure_location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_person_has_procedure_scan1_idx` (`scan_id` ASC) VISIBLE,
  CONSTRAINT `fk_person_has_procedure_licence1`
    FOREIGN KEY (`licence_id`)
    REFERENCES `archivo`.`license` (`id`),
  CONSTRAINT `fk_person_has_procedure_procedure1`
    FOREIGN KEY (`procedure_id`)
    REFERENCES `archivo`.`procedure` (`id`),
  CONSTRAINT `fk_person_has_procedure_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `archivo`.`status` (`id`),
  CONSTRAINT `fk_person_has_procedure_usraxis1`
    FOREIGN KEY (`usraxis_id`)
    REFERENCES `archivo`.`usraxis` (`id`),
  CONSTRAINT `fk_person_has_procedure_year1`
    FOREIGN KEY (`year_id`)
    REFERENCES `archivo`.`year` (`id`),
  CONSTRAINT `fk_person_has_procedure_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `archivo`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_person_has_procedure_scan1`
    FOREIGN KEY (`scan_id`)
    REFERENCES `archivo`.`scan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numinfo` VARCHAR(45) NOT NULL,
  `person_has_procedure_person_id` INT NOT NULL,
  `person_has_procedure_procedure_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `legalbasis_id` INT NOT NULL,
  `footer_id` INT NOT NULL,
  `header_id` INT NOT NULL,
  `body_id` INT NOT NULL,
  PRIMARY KEY (`id`, `legalbasis_id`),
  INDEX `fk_report_person_has_procedure1_idx` (`person_has_procedure_person_id` ASC, `person_has_procedure_procedure_id` ASC) VISIBLE,
  INDEX `fk_report_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_report_legalbasis1_idx` (`legalbasis_id` ASC) VISIBLE,
  INDEX `fk_report_footer1_idx` (`footer_id` ASC) VISIBLE,
  INDEX `fk_report_header1_idx` (`header_id` ASC) VISIBLE,
  INDEX `fk_report_body1_idx` (`body_id` ASC) VISIBLE,
  UNIQUE INDEX `numinfo_UNIQUE` (`numinfo` ASC) VISIBLE,
  CONSTRAINT `fk_report_body1`
    FOREIGN KEY (`body_id`)
    REFERENCES `archivo`.`body` (`id`),
  CONSTRAINT `fk_report_footer1`
    FOREIGN KEY (`footer_id`)
    REFERENCES `archivo`.`footer` (`id`),
  CONSTRAINT `fk_report_header1`
    FOREIGN KEY (`header_id`)
    REFERENCES `archivo`.`header` (`id`),
  CONSTRAINT `fk_report_legalbasis1`
    FOREIGN KEY (`legalbasis_id`)
    REFERENCES `archivo`.`legalbasis` (`id`),
  CONSTRAINT `fk_report_person_has_procedure1`
    FOREIGN KEY (`person_has_procedure_procedure_id`)
    REFERENCES `archivo`.`person_has_procedure` (`procedure_id`),
  CONSTRAINT `fk_report_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `archivo`.`status` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numorder` INT NOT NULL,
  `freq` DATETIME NOT NULL,
  `qr` VARCHAR(90) NULL DEFAULT NULL,
  `obs` VARCHAR(128) NULL DEFAULT NULL,
  `person_has_procedure_person_id` INT NOT NULL,
  `person_has_procedure_procedure_id` INT NOT NULL,
  `report_id` INT NOT NULL,
  `person_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_request_person_has_procedure1_idx` (`person_has_procedure_person_id` ASC, `person_has_procedure_procedure_id` ASC) VISIBLE,
  INDEX `fk_request_report1_idx` (`report_id` ASC) VISIBLE,
  INDEX `fk_request_person1_idx` (`person_id` ASC) VISIBLE,
  UNIQUE INDEX `numorder_UNIQUE` (`numorder` ASC) VISIBLE,
  CONSTRAINT `fk_request_person_has_procedure1`
    FOREIGN KEY (`person_has_procedure_procedure_id`)
    REFERENCES `archivo`.`person_has_procedure` (`procedure_id`),
  CONSTRAINT `fk_request_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `archivo`.`report` (`id`),
  CONSTRAINT `fk_request_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `archivo`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `archivo`.`snapshot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `archivo`.`snapshot` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(128) NULL DEFAULT NULL,
  `report_id` INT NOT NULL,
  `report_legalbasis_id` INT NOT NULL,
  PRIMARY KEY (`id`, `report_id`, `report_legalbasis_id`),
  INDEX `fk_snapshot_report1_idx` (`report_id` ASC, `report_legalbasis_id` ASC) VISIBLE,
  CONSTRAINT `fk_snapshot_report1`
    FOREIGN KEY (`report_id` , `report_legalbasis_id`)
    REFERENCES `archivo`.`report` (`id` , `legalbasis_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
