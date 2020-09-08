DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE planos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  valor DECIMAL(10, 2) NOT NULL DEFAULT 0
) engine = InnoDB;

CREATE TABLE usuarios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  id_plano INT NOT NULL,
  FOREIGN KEY (id_plano) REFERENCES planos (id)
) engine = InnoDB;

CREATE TABLE albums(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  id_artista INT NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES artistas (id)
) engine = InnoDB;

CREATE TABLE cancoes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  id_album INT NOT NULL,
  FOREIGN KEY (id_album) REFERENCES albums (id)
) engine = InnoDB;

CREATE TABLE seguindo_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (artista_id) REFERENCES artistas (id),
  PRIMARY KEY (usuario_id, artista_id)
)engine = InnoDB;

CREATE TABLE historico_reproducoes(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes (id),
  PRIMARY KEY (usuario_id, cancao_id)
)engine = InnoDB;

INSERT INTO artistas (nome)
  VALUES
      ('Walter Phoenix'),
      ('Peter Strong'),
      ('Lance Day'),
      ('Freedie Shannon');

INSERT INTO planos(nome, valor)
  VALUES
      ('gratuito', 0),
      ('familiar', 7.99),
      ('universitário', 5.99);

INSERT INTO usuarios(  nome, idade, id_plano)
  VALUES
      ('Thati', 23, 1),
      ('Cintia', 35, 2),
      ('Bill', 20, 3),
      ('Roger', 45, 1);

INSERT INTO albums(nome, id_artista)
  VALUES
      ('Envious', 1),
      ('Exuberant', 1),
      ('Hallowed Steam', 2),
      ('Incandescent', 3),
      ('Temporary Culture', 4);

INSERT INTO cancoes(nome, id_album)
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

INSERT INTO seguindo_artistas(usuario_id, artista_id)
  VALUES
      (1, 1),
      (1, 3),
      (1, 4),
      (2, 1),
      (2, 3),
      (3, 1),
      (3, 2),
      (4, 4);

INSERT INTO historico_reproducoes(usuario_id, cancao_id)
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
