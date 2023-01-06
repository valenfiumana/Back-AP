-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema integrador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `integrador` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ciudad` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `apodo` VARCHAR(10) NOT NULL,
  `sobre_mi` TEXT NOT NULL,
  `url_foto` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `ocupacion` VARCHAR(45) NOT NULL,
  `url_background` VARCHAR(100) NOT NULL,
  `mail` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `ciudad_id` INT NOT NULL,
  PRIMARY KEY (`id`, `ciudad_id`),
  INDEX `fk_persona_ciudad1_idx` (`ciudad_id` ASC) VISIBLE,
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE,
  CONSTRAINT `fk_persona_ciudad1`
    FOREIGN KEY (`ciudad_id`)
    REFERENCES `mydb`.`ciudad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyectos` (
  `id` INT NOT NULL,
  `url_imagen` VARCHAR(100) NOT NULL,
  `url_proyecto` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_proyectos_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tecnologias` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `porcentaje` INT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_tecnologias_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_tecnologias_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`institucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`institucion` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `url_logo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`educacion` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `inicio` DATE NOT NULL,
  `fin` DATE NOT NULL,
  `persona_id` INT NOT NULL,
  `institucion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `institucion_id`),
  INDEX `fk_educacion_persona1_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_educacion_institucion1_idx` (`institucion_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_institucion1`
    FOREIGN KEY (`institucion_id`)
    REFERENCES `mydb`.`institucion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia_laboral` (
  `id` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NOT NULL,
  `descripcion` TEXT NOT NULL,
  `persona_id` INT NOT NULL,
  `institucion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `institucion_id`),
  INDEX `fk_experiencia_laboral_persona_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_experiencia_laboral_institucion1_idx` (`institucion_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_laboral_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_laboral_institucion1`
    FOREIGN KEY (`institucion_id`)
    REFERENCES `mydb`.`institucion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`certificados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`certificados` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `persona_id` INT NOT NULL,
  `institucion_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `institucion_id`),
  INDEX `fk_certificados_persona1_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_certificados_institucion1_idx` (`institucion_id` ASC) VISIBLE,
  CONSTRAINT `fk_certificados_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_certificados_institucion1`
    FOREIGN KEY (`institucion_id`)
    REFERENCES `mydb`.`institucion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `integrador` ;

-- -----------------------------------------------------
-- Table `integrador`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`roles` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(25) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_6dotkott2kjsp8vw4d0m25fb7` (`email` ASC) VISIBLE,
  INDEX `FKp56c1712k691lhsyewcssf40f` (`role_id` ASC) VISIBLE,
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f`
    FOREIGN KEY (`role_id`)
    REFERENCES `integrador`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`cities` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`categories` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `img_url` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`products` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `category_id` BIGINT NOT NULL,
  `city_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id` ASC) VISIBLE,
  INDEX `FK1jpjau7sg3bb841s8e7e8o8ei` (`city_id` ASC) VISIBLE,
  CONSTRAINT `FK1jpjau7sg3bb841s8e7e8o8ei`
    FOREIGN KEY (`city_id`)
    REFERENCES `integrador`.`cities` (`id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9`
    FOREIGN KEY (`category_id`)
    REFERENCES `integrador`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`bookings` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `arrival_time` TIME NULL DEFAULT NULL,
  `checkin` DATE NULL DEFAULT NULL,
  `checkout` DATE NULL DEFAULT NULL,
  `city_of_origin` VARCHAR(255) NULL DEFAULT NULL,
  `product_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKeyog2oic85xg7hsu2je2lx3s6` (`user_id` ASC) VISIBLE,
  INDEX `FKlmdmerb98p3rhxcmvc9iunj2d` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FKeyog2oic85xg7hsu2je2lx3s6`
    FOREIGN KEY (`user_id`)
    REFERENCES `integrador`.`users` (`id`),
  CONSTRAINT `FKlmdmerb98p3rhxcmvc9iunj2d`
    FOREIGN KEY (`product_id`)
    REFERENCES `integrador`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`clientes` (
  `codigo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `domicilio` VARCHAR(30) NULL DEFAULT NULL,
  `ciudad` VARCHAR(20) NULL DEFAULT NULL,
  `codigoProvincia` TINYINT UNSIGNED NULL DEFAULT NULL,
  `telefono` VARCHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`features` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `icon_url` VARCHAR(255) NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`images` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `product_id` BIGINT NULL DEFAULT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKghwsjbjo7mg3iufxruvq6iu3q` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FKghwsjbjo7mg3iufxruvq6iu3q`
    FOREIGN KEY (`product_id`)
    REFERENCES `integrador`.`products` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 182
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`policies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`policies` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `type` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`products_have_features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`products_have_features` (
  `product_id` BIGINT NOT NULL,
  `feature_id` BIGINT NOT NULL,
  INDEX `FKoc4ra55aqymoedggjeu39gg2t` (`feature_id` ASC) VISIBLE,
  INDEX `FK9b93sxw9nxtegev8pbbv89065` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK9b93sxw9nxtegev8pbbv89065`
    FOREIGN KEY (`product_id`)
    REFERENCES `integrador`.`products` (`id`),
  CONSTRAINT `FKoc4ra55aqymoedggjeu39gg2t`
    FOREIGN KEY (`feature_id`)
    REFERENCES `integrador`.`features` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`products_have_policies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`products_have_policies` (
  `product_id` BIGINT NOT NULL,
  `politic_id` BIGINT NOT NULL,
  INDEX `FKardtkutm8l8em7nt8jmlqer91` (`politic_id` ASC) VISIBLE,
  INDEX `FKvmsnoxumclaiawygewfbhv6b` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FKardtkutm8l8em7nt8jmlqer91`
    FOREIGN KEY (`politic_id`)
    REFERENCES `integrador`.`policies` (`id`),
  CONSTRAINT `FKvmsnoxumclaiawygewfbhv6b`
    FOREIGN KEY (`product_id`)
    REFERENCES `integrador`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`provincias` (
  `codigo` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `integrador`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `integrador`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(20) NULL DEFAULT NULL,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  `sexo` VARCHAR(1) NULL DEFAULT NULL,
  `nivel` TINYINT NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  `marca` VARCHAR(20) NULL DEFAULT NULL,
  `compania` VARCHAR(20) NULL DEFAULT NULL,
  `saldo` FLOAT NULL DEFAULT NULL,
  `activo` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
