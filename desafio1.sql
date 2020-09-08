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

INSERT INTO artistas (nome_artista)
  VALUES
      ('Walter Phoenix'),
      ('Peter Strong'),
      ('Lance Day'),
      ('Freedie Shannon');

INSERT INTO planos(nome_plano, valor_plano)
  VALUES
      ('gratuito', 0),
      ('familiar', 7.99),
      ('universitário', 5.99);

INSERT INTO usuarios(nome, idade, id_plano)
  VALUES
      ('Thati', 23, 1),
      ('Cintia', 35, 2),
      ('Bill', 20, 3),
      ('Roger', 45, 1);

INSERT INTO albuns(nome_album, id_artista)
  VALUES
      ('Envious', 1),
      ('Exuberant', 1),
      ('Hallowed Steam', 2),
      ('Incandescent', 3),
      ('Temporary Culture', 4);

INSERT INTO cancoes(nome_musica, id_album)
  VALUES
      ('Soul For Us', 1),
      ('Reflections Of Magic', 1),
      ('Dance With Her Own', 1),
      ('Troubles Of My Inner Fire', 2),
      ('Time Fireworks', 2),
      ('Magic Circus', 3),
      ('Honey, So Do I', 3),
      ("Sweetie, Let's Go Wild", 3),
      ('She Knows', 3),
      ('Fantasy For Me', 4),
      ('Celebration Of More', 4),
      ('Rock His Everything', 4),
      ('Home Forever', 4),
      ('Diamond Power', 4),
      ("Honey, Let's Be Silly", 4),
      ('Thang Of Thunder', 5),
      ('Words Of Her Life', 5),
      ('Without My Streets', 5);

INSERT INTO seguindo_artistas(id_usuario, id_artista)
  VALUES
      (1, 1),
      (1, 3),
      (1, 4),
      (2, 1),
      (2, 3),
      (3, 1),
      (3, 2),
      (4, 4);

INSERT INTO historico_reproducao(id_usuario, id_cancao)
  VALUES
      (1, 1),
      (1, 6),
      (1, 14),
      (1, 16),
      (2, 13),
      (2, 17),
      (2, 2),
      (2, 15),
      (3, 4),
      (3, 16),
      (3, 6),
      (4, 3),
      (4, 18),
      (4, 11);
