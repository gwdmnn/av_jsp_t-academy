-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`moderadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`moderadores` (
  `id_moderador` INT NOT NULL AUTO_INCREMENT,
  `nome_moderador` VARCHAR(45) NULL,
  `senha_moderador` VARCHAR(15) NULL,
  PRIMARY KEY (`id_moderador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`posts` (
  `id_post` INT NOT NULL AUTO_INCREMENT,
  `titulo_post` VARCHAR(1000) NULL,
  `conteudo_post` VARCHAR(45) NULL,
  `moderadores_id_moderador` INT NOT NULL,
  PRIMARY KEY (`id_post`),
  INDEX `fk_posts_moderadores1_idx` (`moderadores_id_moderador` ASC) VISIBLE,
  CONSTRAINT `fk_posts_moderadores1`
    FOREIGN KEY (`moderadores_id_moderador`)
    REFERENCES `blog`.`moderadores` (`id_moderador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome_usuario` VARCHAR(45) NULL,
  `senha_usuario` VARCHAR(15) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comentarios` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `conteudo_comentario` VARCHAR(500) NULL,
  `usuarios_id_usuario` INT NOT NULL,
  `posts_id_post` INT NOT NULL,
  `comentario_liberado` VARCHAR(3) NULL,
  PRIMARY KEY (`id_comentario`),
  INDEX `fk_comentarios_usuarios1_idx` (`usuarios_id_usuario` ASC) VISIBLE,
  INDEX `fk_comentarios_posts1_idx` (`posts_id_post` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `blog`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_posts1`
    FOREIGN KEY (`posts_id_post`)
    REFERENCES `blog`.`posts` (`id_post`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
