DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  valor DECIMAL(4, 2) NOT NULL
);

CREATE TABLE artistas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE albuns(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY(artista_id) REFERENCES artistas(id)
);

CREATE TABLE cancoes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY(album_id) REFERENCES albuns(id)
);

CREATE TABLE usuarios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT,
  plano_id INT NOT NULL,
  FOREIGN KEY(plano_id) REFERENCES planos(id)
);

CREATE TABLE usuarios_cancoes(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY(cancao_id) REFERENCES cancoes(id),
  PRIMARY KEY (usuario_id, cancao_id)
);

CREATE TABLE usuarios_artistas (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas (id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  PRIMARY KEY (artista_id, usuario_id)
);

INSERT INTO
  planos
VALUES
  (1, 'gratuito', 00.00),
  (2, 'universitario', 05.99),
  (3, 'familiar', 7.99);

INSERT INTO
  usuarios
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 3),
  (3, 'Bill', 20, 2),
  (4, 'Roger', 45, 1);

INSERT INTO
  artistas (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO
  `usuarios_artistas`
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);

INSERT INTO
  albuns
VALUES
  (1, 'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4);

INSERT INTO
  cancoes
VALUES
  (1, 'Soul For Us', 1),
  (2, 'Magic Circus', 3),
  (3, 'Diamond Power', 4),
  (4, 'Thang Of Thunder', 5),
  (5, 'Home Forever', 4),
  (6, 'Words Of Her Life', 5),
  (7, 'Reflections Of Magic', 1),
  (8, 'Honey, Let\'s Be Silly', 4),
  (9, 'Troubles Of My Inner Fire', 2),
  (10, 'Dance With Her Own', 1),
  (11, 'Without My Streets', 5),
  (12, 'Celebration Of More', 4),
  (13, 'Time Fireworks', 2),
  (14, 'Honey, So Do I', 3),
  (15, 'Sweetie, Let\'s Go Wild', 3),
  (16, 'She Knows', 3),
  (17, 'Fantasy For Me', 4),
  (18, 'Rock His Everything', 4);

INSERT INTO
  usuarios_cancoes
VALUES
  (1, 1),
  (1, 2),
  (3, 2),
  (1, 3),
  (1, 4),
  (3, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 8),
  (3, 9),
  (4, 10),
  (4, 11),
  (4, 12);
