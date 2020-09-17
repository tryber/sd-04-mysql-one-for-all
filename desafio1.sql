DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE planos(
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano_nome VARCHAR(30),
  valor_plano DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (plano_id)
)engine = InnoDB;

INSERT INTO planos(plano_id, plano_nome, valor_plano)
VALUES
(1, "gratuito", 0),
(2, "familiar", 7.99),
(3, "universitário", 5.99);
CREATE TABLE usuarios(
  usuario_id INT NOT NULL AUTO_INCREMENT,
  usuario_nome VARCHAR(60) NOT NULL,
  usuario_idade INT NOT NULL,
  plano_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (plano_id) REFERENCES planos(plano_id),
  PRIMARY KEY (usuario_id)
)engine = InnoDB;

INSERT INTO usuarios(usuario_id, usuario_nome, usuario_idade, plano_id)
VALUES
(1, "Thati", 23, 1),
(2, "Cintia", 35, 2),
(3, "Bill", 20, 3),
(4, "Roger", 45, 1);

CREATE TABLE artistas(
  artista_id INT NOT NULL AUTO_INCREMENT,
  artista_nome VARCHAR(60),
  PRIMARY KEY (artista_id)
)engine = InnoDB;

INSERT INTO artistas(artista_id, artista_nome)
VALUES
(1, "Walter Phoenix"),
(2, "Peter Strong"),
(3, "Lance Day"),
(4, "Freedie Shannon");

CREATE TABLE albuns(
  album_id INT NOT NULL AUTO_INCREMENT,
  album_nome VARCHAR(60),
  artista_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY  (artista_id) REFERENCES artistas(artista_id),
  PRIMARY KEY (album_id)
)engine = InnoDB;

INSERT INTO albuns(album_id, album_nome, artista_id)
VALUES
(1, "Envious", 1),
(2, "Exuberant", 1),
(3, "Hallowed Steam", 2),
(4, "Incandescent", 3),
(5, "Temporary Culture", 4);

CREATE TABLE cancoes(
  cancao_id INT NOT NULL AUTO_INCREMENT,
  album_id INT NOT NULL,
  cancao_nome VARCHAR(60),
  CONSTRAINT FOREIGN KEY (album_id) REFERENCES albuns(album_id),
  PRIMARY KEY (cancao_id)
)engine = InnoDB;

INSERT INTO cancoes(cancao_id, album_id, cancao_nome)
VALUES
(1, 1, "Soul For Us"),
(2, 1, "Reflections Of Magic"),
(3, 1, "Dance With Her Own"),
(4, 2, "Troubles Of My Inner Fire"),
(5, 2, "Time Fireworks"),
(6, 3, "Magic Circus"),
(7, 3, "Honey, So Do I"),
(8, 3, "Sweetie, Let's Go Wild"),
(9, 3, "She Knows"),
(10, 4, "Fantasy For Me"),
(11, 4, "Celebration Of More"),
(12, 4, "Rock His Everything"),
(13, 4, "Home Forever"),
(14, 4, "Diamond Power"),
(15, 4, "Honey, Let's Be Silly"),
(16, 5, "Thang Of Thunder"),
(17, 5, "Words Of Her Life"),
(18, 5, "Without My Streets");

CREATE TABLE historico(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  CONSTRAINT FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
)engine = InnoDB;

INSERT INTO historico(usuario_id, cancao_id)
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

CREATE TABLE seguindo(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
)engine = InnoDB;

INSERT INTO seguindo(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
