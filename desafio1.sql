-- Desafio 1
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- Criação das tabelas
CREATE TABLE plano (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  valor DECIMAL(6, 2) NOT NULL
) ENGINE = INNODB;

CREATE TABLE usuario (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  CONSTRAINT `fk_plano` FOREIGN KEY (plano_id) REFERENCES plano(id)
) ENGINE = INNODB;

CREATE TABLE artista (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL  
) ENGINE = INNODB;

CREATE TABLE album (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT `fk_artista` FOREIGN KEY (artista_id) REFERENCES artista(id)
) ENGINE = INNODB;

CREATE TABLE cancao (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  CONSTRAINT `fk_album` FOREIGN KEY (album_id) REFERENCES album(id)
) ENGINE = INNODB;

CREATE TABLE seguindo_artista (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (artista_id) REFERENCES artista(id),
  PRIMARY KEY (usuario_id, artista_id)
) ENGINE = INNODB;

CREATE TABLE historico_reproducao (
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  CONSTRAINT `fk_usuario` FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  CONSTRAINT `fk_cancao` FOREIGN KEY (cancao_id) REFERENCES cancao(id),
  PRIMARY KEY(usuario_id, cancao_id)
) ENGINE = INNODB;

-- Inserindo valores na Tabela
INSERT INTO plano (id, nome, valor)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99);

INSERT INTO usuario (id, nome, idade, plano_id)
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 2),
  (3, 'Bill', 20, 3),
  (4, 'Roger', 45, 1);

INSERT INTO artista (id, nome)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');

INSERT INTO album (id, nome, artista_id)
VALUES
  (1, 'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4);

INSERT INTO cancao (id, nome, album_id)
VALUES
  (1, "Soul For Us", 1),
  (2, "Reflections Of Magic", 1),
  (3, "Dance With Her Own", 1),
  (4, "Troubles Of My Inner Fire", 2),
  (5, "Time Fireworks", 2),
  (6, "Magic Circus", 3),
  (7, "Honey, So Do I", 3),
  (8, "Sweetie, Let's Go Wild", 3),
  (9, "She Knows", 3),
  (10, "Fantasy For Me", 4),
  (11, "Celebration Of More", 4),
  (12, "Rock His Everything", 4),
  (13, "Home Forever", 4),
  (14, "Diamond Power", 4),
  (15, "Honey, Let's Be Silly", 4),
  (16, "Thang Of Thunder", 5),
  (17, "Words Of Her Life", 5),
  (18, "Without My Streets", 5);

INSERT INTO seguindo_artista (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

INSERT INTO historico_reproducao (usuario_id, cancao_id)
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
