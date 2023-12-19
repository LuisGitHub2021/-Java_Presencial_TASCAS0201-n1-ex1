-- MySQL Workbench Synchronization
-- Generated: 2023-12-03 18:43
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: luiss

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica`.`proveedor` (
  `proveedor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `proveedor_name` VARCHAR(45) NOT NULL COMMENT 'Razon social proveedor',
  `proveedor_telefono` VARCHAR(45) NOT NULL COMMENT 'telefono proveedor',
  `proveedor_fax` VARCHAR(45) NOT NULL COMMENT 'fax del proveedor',
  `proveedor_nif` VARCHAR(45) NOT NULL COMMENT 'Identificacion fiscal proveedor',
  PRIMARY KEY (`proveedor_id`),
  UNIQUE INDEX `proveedor_nif_UNIQUE` (`proveedor_nif` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`proveedor` (`proveedor_id`, `proveedor_name`, `proveedor_telefono`, `proveedor_fax`, `proveedor_nif`) VALUES (1, 'prov1', '934566547', '934566590', 'B60569035');
INSERT INTO `optica`.`proveedor` (`proveedor_id`, `proveedor_name`, `proveedor_telefono`, `proveedor_fax`, `proveedor_nif`) VALUES (2, 'prov2', '972789258', '972789290', 'A34541209');
INSERT INTO `optica`.`proveedor` (`proveedor_id`, `proveedor_name`, `proveedor_telefono`, `proveedor_fax`, `proveedor_nif`) VALUES (3, 'prov3', '977213321', '977213390', 'B67982091');

CREATE TABLE IF NOT EXISTS `optica`.`modelosGafas` (
  `modelosGafas_id` INT(11) NOT NULL AUTO_INCREMENT,
  `modelosGafas_marca` VARCHAR(45) NOT NULL COMMENT 'TODAS LAS MARCAS\nmarca1\nmarca2\nmarca3\nmarca4\nmarca5\n',
  `modelosGafas_modelo` VARCHAR(45) NOT NULL COMMENT 'MODELOS\nPremium\nMedium\nStandard\n*Si existe mas de un modelo Premium / Medium / Standard de una misma marca se diferencia con numeracion\n*Ejemplo: Standar1, Standar2',
  `modelosGafas_precio` DECIMAL(6,2) NOT NULL COMMENT 'Precio Gafas (incluye montura y vidrios)',
  `proveedor_proveedor_id` INT(11) NOT NULL,
  PRIMARY KEY (`modelosGafas_id`),
  INDEX `fk_modelosGafas_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  CONSTRAINT `fk_modelosGafas_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (1, 'marca1', 'Premium', 900.25, 1);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (2, 'marca1', 'Premium', 1250.32, 1);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (3, 'marca2', 'Premium', 1002.36, 1);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (4, 'marca3', 'Medium1', 620.45, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (5, 'marca3', 'Medium2', 580.25, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (6, 'marca3', 'Standard', 251.32, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (7, 'marca4', 'Premium1', 1352.65, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (8, 'marca4', 'Premium2', 1159.35, 2);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (9, 'marca5', 'Standard1', 180.32, 3);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (10, 'marca5', 'Standard2', 192.32, 3);
INSERT INTO `optica`.`modelosGafas` (`modelosGafas_id`, `modelosGafas_marca`, `modelosGafas_modelo`, `modelosGafas_precio`, `proveedor_proveedor_id`) VALUES (11, 'marca5', 'Standard3', 109.99, 3);

CREATE TABLE IF NOT EXISTS `optica`.`gafasCliente` (
  `gafasCliente_id` INT(11) NOT NULL AUTO_INCREMENT,
  `gafasCliente_montura` VARCHAR(45) NOT NULL COMMENT 'TIPO DE MONTURA\nF=Flotante\nP=Pasta\nM=Metálica',
  `gafasCliente_colorMontura` VARCHAR(45) NOT NULL COMMENT 'COLORES\nsegún carta colores',
  `gafasCliente_colorVidrio` VARCHAR(45) NOT NULL COMMENT 'COLOR DEL VIDRIO\nT=Transparente\nA=Ambar\nO=Oscuros',
  `gafasCliente_od` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `gafasCliente_os` DECIMAL(5,2) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `gafasCliente_aod` TINYINT(1) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `gafasCliente_aos` TINYINT(1) NULL DEFAULT NULL COMMENT 'LEYENDA DE GRADUACION\nOD=ojo derecho\nOS=ojo izquierdo\n00.00 to 99.99 = Hipermetropia\n00.00 to -99.99 = Miopia\n1-180=Astigmatismo',
  `modelosGafas_modelosGafas_id` INT(11) NOT NULL,
  `gafasCliente_fechaCreacion` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gafasCliente_id`),
  INDEX `fk_gafasCliente_modelosGafas1_idx` (`modelosGafas_modelosGafas_id` ASC),
  CONSTRAINT `fk_gafasCliente_modelosGafas1`
    FOREIGN KEY (`modelosGafas_modelosGafas_id`)
    REFERENCES `optica`.`modelosGafas` (`modelosGafas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (1, 'F', 'Golden', 'T', 1.25, 0.75, NULL, NULL, 1, '2023-11-10');
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (2, 'P', 'Negras', 'O', 1.25, 0.75, NULL, NULL, 4, '2021-11-10');
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (3, 'M', 'Amarillo', 'A', 2.75, 1.25, 30, 50, 5, '2023-11-10');
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (4, 'M', 'Rojo', 'T', 2.75, 1.25, 30, 50, 8, '2019-11-10');
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (5, 'F', 'Tigre', 'O', 2.75, 1.25, 30, 50, 9, '2018-11-10');
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (6, 'P', 'Verde', 'T', -1.25, -1.50, 25, 25, 2, '2023-11-10');
INSERT INTO `optica`.`gafasCliente` (`gafasCliente_id`, `gafasCliente_montura`, `gafasCliente_colorMontura`, `gafasCliente_colorVidrio`, `gafasCliente_od`, `gafasCliente_os`, `gafasCliente_aod`, `gafasCliente_aos`, `modelosGafas_modelosGafas_id`, `gafasCliente_fechaCreacion`) VALUES (7, 'F', 'Golden', 'T', -1.75, -1.50, NULL, NULL, 5, '2022-11-10');

CREATE TABLE IF NOT EXISTS `optica`.`direccion` (
  `direccion_id` INT(11) NOT NULL AUTO_INCREMENT,
  `direccion_calle` VARCHAR(45) NOT NULL,
  `direccion_numero` VARCHAR(45) NOT NULL,
  `direccion_piso` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_puerta` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_ciudad` VARCHAR(45) NOT NULL,
  `direccion_cp` VARCHAR(5) NOT NULL,
  `direccion_pais` VARCHAR(45) NOT NULL,
  `proveedor_proveedor_id` INT(11) NOT NULL COMMENT 'id proveedor',
  PRIMARY KEY (`direccion_id`),
  INDEX `fk_direccion_proveedor1_idx` (`proveedor_proveedor_id` ASC),
  CONSTRAINT `fk_direccion_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica`.`proveedor` (`proveedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `proveedor_proveedor_id`) VALUES (1, 'Calle Pio', '23', '4', '2', 'Barcelona', '08004', 'España', 1);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `proveedor_proveedor_id`) VALUES (2, 'Paseo Roura 32', '12', NULL, NULL, 'Castelldefels', '08960', 'España', 2);
INSERT INTO `optica`.`direccion` (`direccion_id`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_cp`, `direccion_pais`, `proveedor_proveedor_id`) VALUES (3, 'Av Republica Francesa', '60', '10', '5', 'L\'Hospitalet de Llobregat', '08905', 'España', 3);

CREATE TABLE IF NOT EXISTS `optica`.`clientes` (
  `clientes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `clientes_nombre` VARCHAR(45) NOT NULL COMMENT 'nombre cliente',
  `clientes_cp` VARCHAR(45) NOT NULL,
  `clientes_telefono` VARCHAR(45) NOT NULL COMMENT 'telefono cliente',
  `clientes_email` VARCHAR(255) NOT NULL COMMENT 'email cliente',
  `clientes_fechaCreacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clientes_recomendadoPorCliente` INT(11) NULL DEFAULT NULL,
  `vendedor_vendedor_id` INT(11) NOT NULL,
  PRIMARY KEY (`clientes_id`),
  INDEX `fk_clientes_vendedor1_idx` (`vendedor_vendedor_id` ASC),
  INDEX `fk_clientes_clientes1_idx` (`clientes_recomendadoPorCliente` ASC),
  CONSTRAINT `fk_clientes_vendedor1`
    FOREIGN KEY (`vendedor_vendedor_id`)
    REFERENCES `optica`.`vendedor` (`vendedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_clientes1`
    FOREIGN KEY (`clientes_recomendadoPorCliente`)
    REFERENCES `optica`.`clientes` (`clientes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`clientes` (`clientes_id`, `clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_fechaCreacion`, `clientes_recomendadoPorCliente`, `vendedor_vendedor_id`) VALUES (1, 'Juan', '08001', '654471158', 'j.munoz@gmail.com', '2021-11-28', 3, 1);
INSERT INTO `optica`.`clientes` (`clientes_id`, `clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_fechaCreacion`, `clientes_recomendadoPorCliente`, `vendedor_vendedor_id`) VALUES (2, 'Ana', '08020', '687456321', 'ana.p122@hotmail.com', '2022-11-28', 1, 2);
INSERT INTO `optica`.`clientes` (`clientes_id`, `clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_fechaCreacion`, `clientes_recomendadoPorCliente`, `vendedor_vendedor_id`) VALUES (3, 'Eva', '08040', '632147895', 'evaP@gmail.com', '2020-11-28', 2, 2);
INSERT INTO `optica`.`clientes` (`clientes_id`, `clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_fechaCreacion`, `clientes_recomendadoPorCliente`, `vendedor_vendedor_id`) VALUES (4, 'Ada', '08022', '654812793', 'aaddaaK1992@gamil.com', '2023-11-28', 1, 3);
INSERT INTO `optica`.`clientes` (`clientes_id`, `clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_fechaCreacion`, `clientes_recomendadoPorCliente`, `vendedor_vendedor_id`) VALUES (5, 'Pol', '08006', '633225489', 'polpol@polingenieria.es', '2019-11-28', NULL, 3);
INSERT INTO `optica`.`clientes` (`clientes_id`, `clientes_nombre`, `clientes_cp`, `clientes_telefono`, `clientes_email`, `clientes_fechaCreacion`, `clientes_recomendadoPorCliente`, `vendedor_vendedor_id`) VALUES (6, 'Lua', '08007', '688774412', 'LuaCampeon@gmail.com', '2019-11-28', NULL, 1);

CREATE TABLE IF NOT EXISTS `optica`.`vendedor` (
  `vendedor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `vendedor_nombre` VARCHAR(45) NOT NULL COMMENT 'nombre del vendedor',
  `vendedor_cp` VARCHAR(45) NOT NULL COMMENT 'dni del vendedor',
  `vendedor_telefono` VARCHAR(45) NOT NULL COMMENT 'telefono del vendedor',
  `vendedor_email` VARCHAR(255) NOT NULL COMMENT 'email del vendedor',
  PRIMARY KEY (`vendedor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`vendedor` (`vendedor_id`, `vendedor_nombre`, `vendedor_cp`, `vendedor_telefono`, `vendedor_email`) VALUES (1, 'Cris', '08022', '655227789', 'cris.ramiro@optica.com');
INSERT INTO `optica`.`vendedor` (`vendedor_id`, `vendedor_nombre`, `vendedor_cp`, `vendedor_telefono`, `vendedor_email`) VALUES (2, 'Gael', '08960', '656993322', 'gael.garcia@optica.com');
INSERT INTO `optica`.`vendedor` (`vendedor_id`, `vendedor_nombre`, `vendedor_cp`, `vendedor_telefono`, `vendedor_email`) VALUES (3, 'Klausy', '08017', '641417474', 'klausy.suyak@optica.com');

CREATE TABLE IF NOT EXISTS `optica`.`gafasCliente_has_clientes` (
  `gafasCliente_gafasCliente_id` INT(11) NOT NULL,
  `clientes_clientes_id` INT(11) NOT NULL,
  PRIMARY KEY (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`),
  INDEX `fk_gafasCliente_has_clientes_clientes1_idx` (`clientes_clientes_id` ASC),
  INDEX `fk_gafasCliente_has_clientes_gafasCliente1_idx` (`gafasCliente_gafasCliente_id` ASC),
  CONSTRAINT `fk_gafasCliente_has_clientes_gafasCliente1`
    FOREIGN KEY (`gafasCliente_gafasCliente_id`)
    REFERENCES `optica`.`gafasCliente` (`gafasCliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gafasCliente_has_clientes_clientes1`
    FOREIGN KEY (`clientes_clientes_id`)
    REFERENCES `optica`.`clientes` (`clientes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (1, 1);
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (2, 1);
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (3, 2);
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (4, 3);
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (5, 4);
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (6, 5);
INSERT INTO `optica`.`gafasCliente_has_clientes` (`gafasCliente_gafasCliente_id`, `clientes_clientes_id`) VALUES (7, 6);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
