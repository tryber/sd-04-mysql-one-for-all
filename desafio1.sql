DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE artistas(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL
) engine = InnoDB;
INSERT INTO artistas (artista_id, nome)
VALUES (null, 'Walter Phoenix'),
  (null, 'Peter Strong'),
  (null, 'Lance Day'),
  (null, 'Freedie Shannon');
CREATE TABLE planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(30) NOT NULL,
  valor DECIMAL(5, 2) NOT NULL DEFAULT 0
) engine = InnoDB;
INSERT INTO planos(plano_id, plano, valor)
VALUES (1, 'gratuito', 0),
  (null, 'familiar', 7.99),
  (null, 'universitário', 5.99);
CREATE TABLE usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;
INSERT INTO usuarios(usuario_id, nome, idade, plano_id)
VALUES (1, 'Thati', 23, 1),
  (null, 'Cintia', 35, 2),
  (null, 'Bill', 20, 3),
  (null, 'Roger', 45, 1);
CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(30) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;
INSERT INTO albuns(album_id, album, artista_id)
VALUES (1, 'Envious', 1),
  (null, 'Exuberant', 1),
  (null, 'Hallowed Steam', 2),
  (null, 'Incandescent', 3),
  (null, 'Temporary Culture', 4);
CREATE TABLE musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  musica VARCHAR(30) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;
INSERT INTO musicas(musica_id, musica, album_id)
VALUES (1, 'Soul For Us', 1),
  (null, 'Reflections Of Magic', 1),
  (null, 'Dance With Her Own', 1),
  (null, 'Troubles Of My Inner Fire', 2),
  (null, 'Time Fireworks', 2),
  (null, 'Magic Circus', 3),
  (null, 'Honey, So Do I', 3),
  (null, "Sweetie, Let's Go Wild", 3),
  (null, 'She Knows', 3),
  (null, 'Fantasy For Me', 4),
  (null, 'Celebration Of More', 4),
  (null, 'Rock His Everything', 4),
  (null, 'Home Forever', 4),
  (null, 'Diamond Power', 4),
  (null, "Honey, Let's Be Silly", 4),
  (null, 'Thang Of Thunder', 5),
  (null, 'Words Of Her Life', 5),
  (null, 'Without My Streets', 5);
CREATE TABLE seguindo_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
  PRIMARY KEY (usuario_id, artista_id)
) engine = InnoDB;
INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);
CREATE TABLE historico_reproducoes(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (musica_id) REFERENCES musicas (musica_id),
  PRIMARY KEY (usuario_id, musica_id)
) engine = InnoDB;
INSERT INTO historico_reproducoes(usuario_id, musica_id)
VALUES (1, 1),
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
  