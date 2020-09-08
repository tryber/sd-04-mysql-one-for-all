DROP SCHEMA IF EXISTS `SpotfyClone` ;

CREATE SCHEMA IF NOT EXISTS `SpotfyClone` ;
USE `SpotfyClone` ;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_plano` VARCHAR(55) NOT NULL,
  `valor_plano` DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(55) NOT NULL,
  `idade` INT NOT NULL,
  `id_plano` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_planos_idx` (`id_plano` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (`id_plano`)
    REFERENCES `SpotfyClone`.`planos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `SpotfyClone`.`artistas` ;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_artista` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`albuns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_album` VARCHAR(45) NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_albuns_artistas1_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_albuns_artistas1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotfyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_musica` VARCHAR(55) NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cancoes_albuns1_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_albuns1`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotfyClone`.`albuns` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`seguindo_artistas` (
  `id_artista` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_artista`, `id_usuario`),
  INDEX `fk_artistas_has_usuarios_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_artistas_has_usuarios_artistas1_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_artistas_has_usuarios_artistas1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotfyClone`.`artistas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artistas_has_usuarios_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotfyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotfyClone`.`historico_reproducao` (
  `id_cancao` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_cancao`, `id_usuario`),
  INDEX `fk_cancoes_has_usuarios_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_cancoes_has_usuarios_cancoes1_idx` (`id_cancao` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_has_usuarios_cancoes1`
    FOREIGN KEY (`id_cancao`)
    REFERENCES `SpotfyClone`.`cancoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancoes_has_usuarios_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotfyClone`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;