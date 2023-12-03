-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema don_galleto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema don_galleto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `don_galleto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `don_galleto` ;

-- -----------------------------------------------------
-- Table `don_galleto`.`inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`inventario` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`inventario` (
  `idInventario` INT NOT NULL AUTO_INCREMENT,
  `existencia` INT NOT NULL,
  PRIMARY KEY (`idInventario`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`galleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`galleta` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`galleta` (
  `idGalleta` INT NOT NULL AUTO_INCREMENT,
  `idInventario` INT NOT NULL,
  `nombre` VARCHAR(129) NOT NULL,
  `precio` VARCHAR(129) NOT NULL,
  PRIMARY KEY (`idGalleta`),
  UNIQUE INDEX `nombre` (`nombre` ASC) VISIBLE,
  INDEX `fk_galleta_inventario` (`idInventario` ASC) VISIBLE,
  CONSTRAINT `fk_galleta_inventario`
    FOREIGN KEY (`idInventario`)
    REFERENCES `don_galleto`.`inventario` (`idInventario`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`venta` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`venta` (
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATE NOT NULL,
  `total_venta` INT NOT NULL,
  PRIMARY KEY (`idVenta`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`detalle_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`detalle_venta` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`detalle_venta` (
  `idDetalle_venta` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `tipo_venta` INT NOT NULL,
  `idGalleta` INT NOT NULL,
  `venta_idVenta` INT NOT NULL,
  PRIMARY KEY (`idDetalle_venta`, `venta_idVenta`),
  INDEX `idGalleta` (`idGalleta` ASC) VISIBLE,
  INDEX `fk_venta_galleta_venta1_idx` (`venta_idVenta` ASC) VISIBLE,
  CONSTRAINT `idGalleta`
    FOREIGN KEY (`idGalleta`)
    REFERENCES `don_galleto`.`galleta` (`idGalleta`),
  CONSTRAINT `fk_venta_galleta_venta1`
    FOREIGN KEY (`venta_idVenta`)
    REFERENCES `don_galleto`.`venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`material`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`material` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`material` (
  `idMaterial` INT NOT NULL AUTO_INCREMENT,
  `idInventario` INT NOT NULL,
  `ingrediente` VARCHAR(100) NOT NULL,
  `cantidad` INT NOT NULL,
  `detalle_cantidad` VARCHAR(50) NOT NULL,
  `costo_material` FLOAT NOT NULL,
  PRIMARY KEY (`idMaterial`),
  INDEX `fk_material_inventario` (`idInventario` ASC) VISIBLE,
  CONSTRAINT `fk_material_inventario`
    FOREIGN KEY (`idInventario`)
    REFERENCES `don_galleto`.`inventario` (`idInventario`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`receta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`receta` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`receta` (
  `idReceta` INT NOT NULL AUTO_INCREMENT,
  `idGalleta` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idReceta`),
  INDEX `fk_receta_galleta` (`idGalleta` ASC) VISIBLE,
  CONSTRAINT `fk_receta_galleta`
    FOREIGN KEY (`idGalleta`)
    REFERENCES `don_galleto`.`galleta` (`idGalleta`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`material_has_receta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`material_has_receta` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`material_has_receta` (
  `idMateriales_recetas` INT NOT NULL AUTO_INCREMENT,
  `idMaterial` INT NOT NULL,
  `idReceta` INT NOT NULL,
  PRIMARY KEY (`idMateriales_recetas`),
  INDEX `fk_material_receta_material` (`idMaterial` ASC) VISIBLE,
  INDEX `fk_material_receta_receta` (`idReceta` ASC) VISIBLE,
  CONSTRAINT `fk_material_receta_material`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `don_galleto`.`material` (`idMaterial`),
  CONSTRAINT `fk_material_receta_receta`
    FOREIGN KEY (`idReceta`)
    REFERENCES `don_galleto`.`receta` (`idReceta`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`merma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`merma` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`merma` (
  `idMerma` INT NOT NULL AUTO_INCREMENT,
  `idMaterial` INT NOT NULL,
  `idGalleta` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idMerma`),
  INDEX `fk_merma_material` (`idMaterial` ASC) VISIBLE,
  INDEX `fk_merma_galleta` (`idGalleta` ASC) VISIBLE,
  CONSTRAINT `fk_merma_galleta`
    FOREIGN KEY (`idGalleta`)
    REFERENCES `don_galleto`.`galleta` (`idGalleta`),
  CONSTRAINT `fk_merma_material`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `don_galleto`.`material` (`idMaterial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`mermagalleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`mermagalleta` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`mermagalleta` (
  `idMermaGalleta` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `idGalleta` INT NOT NULL,
  PRIMARY KEY (`idMermaGalleta`),
  INDEX `fkIdGalleta` (`idGalleta` ASC) VISIBLE,
  CONSTRAINT `fkIdGalleta`
    FOREIGN KEY (`idGalleta`)
    REFERENCES `don_galleto`.`galleta` (`idGalleta`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`mermamaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`mermamaterial` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`mermamaterial` (
  `idMermaMaterial` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `unidad` VARCHAR(10) NOT NULL,
  `idMaterial` INT NOT NULL,
  PRIMARY KEY (`idMermaMaterial`),
  INDEX `fkIdMaterial` (`idMaterial` ASC) VISIBLE,
  CONSTRAINT `fkIdMaterial`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `don_galleto`.`material` (`idMaterial`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `don_galleto`.`reporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`reporte` ;

CREATE TABLE IF NOT EXISTS `don_galleto`.`reporte` (
  `idReporte` INT NOT NULL AUTO_INCREMENT,
  `idVenta` INT NOT NULL,
  `gasto` FLOAT NOT NULL,
  PRIMARY KEY (`idReporte`),
  INDEX `fk_reporte_venta` (`idVenta` ASC) VISIBLE,
  CONSTRAINT `fk_reporte_venta`
    FOREIGN KEY (`idVenta`)
    REFERENCES `don_galleto`.`venta` (`idVenta`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `don_galleto` ;

-- -----------------------------------------------------
-- Placeholder table for view `don_galleto`.`inventariogalletas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `don_galleto`.`inventariogalletas` (`idInventario` INT, `existencia` INT, `idGalleta` INT, `nombreGalleta` INT, `precio` INT);

-- -----------------------------------------------------
-- Placeholder table for view `don_galleto`.`inventariomaterial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `don_galleto`.`inventariomaterial` (`idInventario` INT, `existencia` INT, `idMaterial` INT, `ingrediente` INT, `cantidad` INT, `detalle_cantidad` INT, `costo_material` INT);

-- -----------------------------------------------------
-- Placeholder table for view `don_galleto`.`vistamermagalleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `don_galleto`.`vistamermagalleta` (`idMermaGalleta` INT, `cantidad` INT, `idGalleta` INT, `nombre` INT, `precio` INT, `idInventario` INT, `existencia` INT);

-- -----------------------------------------------------
-- Placeholder table for view `don_galleto`.`vistamermamaterial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `don_galleto`.`vistamermamaterial` (`idMermaMaterial` INT, `cantidad` INT, `ingrediente` INT);

-- -----------------------------------------------------
-- View `don_galleto`.`inventariogalletas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`inventariogalletas`;
DROP VIEW IF EXISTS `don_galleto`.`inventariogalletas` ;
USE `don_galleto`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `don_galleto`.`inventariogalletas` AS select `i`.`idInventario` AS `idInventario`,`i`.`existencia` AS `existencia`,`g`.`idGalleta` AS `idGalleta`,`g`.`nombre` AS `nombreGalleta`,`g`.`precio` AS `precio` from (`don_galleto`.`inventario` `i` join `don_galleto`.`galleta` `g` on((`i`.`idInventario` = `g`.`idInventario`)));

-- -----------------------------------------------------
-- View `don_galleto`.`inventariomaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`inventariomaterial`;
DROP VIEW IF EXISTS `don_galleto`.`inventariomaterial` ;
USE `don_galleto`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `don_galleto`.`inventariomaterial` AS select `im`.`idInventario` AS `idInventario`,`im`.`existencia` AS `existencia`,`m`.`idMaterial` AS `idMaterial`,`m`.`ingrediente` AS `ingrediente`,`m`.`cantidad` AS `cantidad`,`m`.`detalle_cantidad` AS `detalle_cantidad`,`m`.`costo_material` AS `costo_material` from (`don_galleto`.`material` `m` join `don_galleto`.`inventario` `im` on((`m`.`idInventario` = `im`.`idInventario`)));

-- -----------------------------------------------------
-- View `don_galleto`.`vistamermagalleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`vistamermagalleta`;
DROP VIEW IF EXISTS `don_galleto`.`vistamermagalleta` ;
USE `don_galleto`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `don_galleto`.`vistamermagalleta` AS select `mg`.`idMermaGalleta` AS `idMermaGalleta`,`mg`.`cantidad` AS `cantidad`,`vg`.`idgalleta` AS `idGalleta`,`vg`.`nombre` AS `nombre`,`vg`.`precio` AS `precio`,`vg`.`idinventario` AS `idInventario`,`vg`.`existencia` AS `existencia` from (`don_galleto`.`mermagalleta` `mg` join (select `g`.`idGalleta` AS `idgalleta`,`g`.`nombre` AS `nombre`,`g`.`precio` AS `precio`,`i`.`idInventario` AS `idinventario`,`i`.`existencia` AS `existencia` from (`don_galleto`.`galleta` `g` join `don_galleto`.`inventario` `i` on((`g`.`idInventario` = `i`.`idInventario`)))) `vg` on((`vg`.`idgalleta` = `mg`.`idGalleta`)));

-- -----------------------------------------------------
-- View `don_galleto`.`vistamermamaterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `don_galleto`.`vistamermamaterial`;
DROP VIEW IF EXISTS `don_galleto`.`vistamermamaterial` ;
USE `don_galleto`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `don_galleto`.`vistamermamaterial` AS select `mg`.`idMermaMaterial` AS `idMermaMaterial`,concat(`mg`.`cantidad`,' ',`mg`.`unidad`) AS `cantidad`,`g`.`ingrediente` AS `ingrediente` from (`don_galleto`.`mermamaterial` `mg` join `don_galleto`.`material` `g`) where (`mg`.`idMaterial` = `g`.`idMaterial`);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
