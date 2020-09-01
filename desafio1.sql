DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL,
    valor DECIMAL(6, 2)
);

CREATE TABLE artistas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
);

CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(15) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (plano_id) REFERENCES planos(id)
);

CREATE TABLE album(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas(id)
);

CREATE TABLE cancoes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (album_id) REFERENCES album(id),
    CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artista(id)
);
    
    CREATE TABLE seguindo(
    id INT PRIMARY KEY AUTO_INCREMENT,
    artista_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artista(id)
);

	CREATE TABLE historico(
    id INT PRIMARY KEY NOT NULL,
    nome_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (id) REFERENCES usuarios(id),
    CONSTRAINT FOREIGN KEY (nome_id) REFERENCES cancoes(id)
);

INSERT INTO planos (nome, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', '5.99');

INSERT INTO artistas (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO usuarios (nome, idade, plano)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO album (nome, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
  
INSERT INTO cancoes (nome, album_id, artista_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 2, 1),
  ('Time Fireworks', 2, 1),
  ('Magic Circus', 3, 2),
  ('Honey, So Do I', 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ('She Knows', 3, 2),
  ('Fantasy For Me', 4, 3),
  ('Celebration Of More', 4, 3),
  ('Rock His Everything', 4, 3),
  ('Home Forever', 4, 3),
  ('Diamond Power', 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ('Thang Of Thunder', 5, 4),
  ('Words Of Her Life', 5, 4),
  ('Without My Streets', 5, 4);
  
  INSERT INTO seguindo (artista_id)
  VALUES
  (1),
  (4),
  (3),
  (1),
  (3),
  (2),
  (1),
  (4);
  
  INSERT INTO
  historico (id, nome_id)
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
