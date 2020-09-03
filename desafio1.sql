DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(50) NOT NULL,
  valor DECIMAL(6, 2) NOT NULL DEFAULT 0
) engine = InnoDB;

CREATE TABLE artistas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  planos_id INT NOT NULL,
  FOREIGN KEY (planos_id) REFERENCES planos (id)
) engine = InnoDB;

CREATE TABLE albuns(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  artistas_id INT NOT NULL,
  FOREIGN KEY (artistas_id) REFERENCES artistas (id)
) engine = InnoDB;

CREATE TABLE cancoes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  albuns_id INT NOT NULL,
  FOREIGN KEY (albuns_id) REFERENCES albuns (id)
) engine = InnoDB;

CREATE TABLE usuarios_seguindo_artistas(
  usuarios_id INT NOT NULL,
  artistas_id INT NOT NULL,
  FOREIGN KEY (usuarios_id) REFERENCES usuarios (id),
  FOREIGN KEY (artistas_id) REFERENCES artistas (id),
  PRIMARY KEY (usuarios_id, artistas_id)
) engine = InnoDB;

CREATE TABLE historico_reproducoes(
  cancoes_id INT NOT NULL,
  usuarios_id INT NOT NULL,
  FOREIGN KEY (cancoes_id) REFERENCES cancoes (id),
  FOREIGN KEY (usuarios_id) REFERENCES usuarios (id),
  PRIMARY KEY (cancoes_id, usuarios_id)
) engine = InnoDB;

INSERT INTO planos (plano, valor)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99);

INSERT INTO artistas (nome)
  VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO usuarios (nome, idade, planos_id)
  VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);

INSERT INTO albuns (nome, artistas_id)
  VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO cancoes (nome, albuns_id)
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

INSERT INTO usuarios_seguindo_artistas (usuarios_id, artistas_id)
  VALUES
    (1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 4);

INSERT INTO historico_reproducoes (cancoes_id, usuarios_id)
  VALUES
    (1, 1),
    (6, 1),
    (14, 1),
    (16, 1),
    (13, 2),
    (17, 2),
    (2, 2),
    (15, 2),
    (4, 3),
    (16, 3),
    (6, 3),
    (3, 4),
    (18, 4),
    (11, 4);
