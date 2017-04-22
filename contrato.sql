-- MySQL Script generated by MySQL Workbench
-- 04/17/17 19:40:06
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `contrato` DEFAULT CHARACTER SET utf8 ;
USE `contrato` ;

-- -----------------------------------------------------
-- Table `contrato`.`d_Fecha`
-- -----------------------------------------------------
CREATE TABLE `d_Fecha` (
  `ID_Fecha` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL,
  `ID_Anno` INT NULL,
  `ID_Mes` INT NULL,
  `ID_Dia` INT NULL,
  `DES_Mes` VARCHAR(45) NULL,
  `DES_Dia` VARCHAR(45) NULL,
  `DES_FechaCompleta` VARCHAR(60) NULL,
  PRIMARY KEY (`ID_Fecha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contrato`.`d_Objeto`
-- -----------------------------------------------------
CREATE TABLE `d_Objeto` (
  `ID_Objeto` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Objeto` VARCHAR(80) NULL,
  PRIMARY KEY (`ID_Objeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contrato`.`d_EntidadContratante`
-- -----------------------------------------------------
  CREATE TABLE `d_EntidadContratante` (
    `ID_EntidadContratante` INT NOT NULL AUTO_INCREMENT,
    `Nombre_EntidadContratante` VARCHAR(80) NULL,
    PRIMARY KEY (`ID_EntidadContratante`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contrato`.`d_Contratado`
-- -----------------------------------------------------
CREATE TABLE `d_Contratado` (
  `ID_Contratado` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Contratado` VARCHAR(100) NULL,
  `TipoContrato` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Contratado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contrato`.`f_Contratos_Menores`
-- -----------------------------------------------------
CREATE TABLE `f_Contratos_Menores` (
  `Importe_Licitacion` FLOAT NULL,
  `Importe_Adjudicacion` FLOAT NULL,
  `Num_Licitadores` INT NULL,
  `d_Fecha_ID_Fecha` INT NOT NULL,
  `d_Objeto_ID_Objeto` INT NOT NULL,
  `d_EntidadContratante_ID_EntidadContratante` INT NOT NULL,
  `d_Contratado_ID_Contratado` INT NOT NULL,
  INDEX `fk_f_Contratos_Menores_d_Fecha_idx` (`d_Fecha_ID_Fecha` ASC),
  INDEX `fk_f_Contratos_Menores_d_Objeto1_idx` (`d_Objeto_ID_Objeto` ASC),
  INDEX `fk_f_Contratos_Menores_d_EntidadContratante1_idx` (`d_EntidadContratante_ID_EntidadContratante` ASC),
  INDEX `fk_f_Contratos_Menores_d_Contratado1_idx` (`d_Contratado_ID_Contratado` ASC),
  CONSTRAINT `fk_f_Contratos_Menores_d_Fecha`
    FOREIGN KEY (`d_Fecha_ID_Fecha`)
    REFERENCES `contrato`.`d_Fecha` (`ID_Fecha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_Contratos_Menores_d_Objeto1`
    FOREIGN KEY (`d_Objeto_ID_Objeto`)
    REFERENCES `contrato`.`d_Objeto` (`ID_Objeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_Contratos_Menores_d_EntidadContratante1`
    FOREIGN KEY (`d_EntidadContratante_ID_EntidadContratante`)
    REFERENCES `contrato`.`d_EntidadContratante` (`ID_EntidadContratante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_f_Contratos_Menores_d_Contratado1`
    FOREIGN KEY (`d_Contratado_ID_Contratado`)
    REFERENCES `contrato`.`d_Contratado` (`ID_Contratado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;