CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `plano_id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuario_id_UNIQUE` (`id` ASC),
  INDEX `fk_usuario_plano_idx` (`plano_id` ASC),
  CONSTRAINT `fk_usuario_plano`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_album_artista1_idx` (`artista_id` ASC),
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.cancao (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX id_UNIQUE (id ASC),
    INDEX fk_album_id_index (album_id ASC),
    CONSTRAINT fk_album_id FOREIGN KEY (album_id)
        REFERENCES SpotifyClone.album (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS SpotifyClone.historico_reproducao (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id)
        REFERENCES SpotifyClone.usuario (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_cancao_id FOREIGN KEY (cancao_id)
        REFERENCES SpotifyClone.cancao (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY (usuario_id , cancao_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista_seguido` (
    `usuario_id` INT NOT NULL,
    `artista_id` INT NOT NULL,
    INDEX `fk_artista_seguido_usuario1_idx` (`usuario_id` ASC),
    CONSTRAINT `fk_artista_seguido_artista1` FOREIGN KEY (`artista_id`)
        REFERENCES `SpotifyClone`.`artista` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_artista_seguido_usuario1` FOREIGN KEY (`usuario_id`)
        REFERENCES `SpotifyClone`.`usuario` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    PRIMARY KEY (usuario_id , artista_id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.plano (nome, valor) 
VALUES 
	('gratuito', 0),
	('universitário', 5.99),
	('familiar', 7.99);

INSERT INTO SpotifyClone.usuario (nome, idade, plano_id) 
VALUES 
	('Thati', 23, 1),
	('Cintia', 35, 3),
	('Bill', 20, 2),
	('Roger', 45, 1);

INSERT INTO SpotifyClone.artista (nome) 
VALUES 
	('Walter Phoenix'),
	('Peter Strong'),
	('Lance Day'),
	('Freedie Shannon');

INSERT INTO SpotifyClone.album (nome, artista_id) 
VALUES 
	('Envious', 1),
	('Exuberant', 1),
	('Hallowed Steam', 2),
	('Incandescent', 3),
	('Temporary Culture', 4);

INSERT INTO SpotifyClone.cancao (nome, album_id) 
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
    
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) 
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
 
INSERT INTO SpotifyClone.artista_seguido (usuario_id, artista_id) 
VALUES 
	(1, 1),
	(1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);
