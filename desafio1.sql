DROP DATABASE IF EXISTS SpotifyClone;
CREATE SCHEMA IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS artistas (
  id_artista INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  artista VARCHAR(45) NOT NULL
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS albuns (
  id_album INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  album VARCHAR(45) NOT NULL,
  id_artista INT NOT NULL,
  CONSTRAINT `fk_albuns_artista1`
    FOREIGN KEY (id_artista)
    REFERENCES artistas (id_artista)
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS cancoes (
  id_cancao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cancao VARCHAR(45) NOT NULL,
  id_album INT NOT NULL,
  CONSTRAINT `fk_cancoes_albuns1`
    FOREIGN KEY (id_album)
    REFERENCES albuns (id_album)
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS planos (
  id_plano INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  plano VARCHAR(45) NOT NULL,
  valor_plano DOUBLE NOT NULL
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(45) NOT NULL,
  idade VARCHAR(45) NOT NULL,
  id_plano INT NOT NULL,
  CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (id_plano)
    REFERENCES planos(id_plano)
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuarios_artista (
  id_usuario INT NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (id_usuario, id_artista),
  CONSTRAINT `fk_usuarios_has_artista_usuarios1`
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario),
  CONSTRAINT `fk_usuarios_has_artista_artista1`
    FOREIGN KEY (id_artista)
    REFERENCES artistas (id_artista)
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuarios_cancoes (
  id_usuario INT NOT NULL,
  id_cancao INT NOT NULL,
  PRIMARY KEY (id_usuario, id_cancao),
  CONSTRAINT `fk_usuarios_has_cancoes_usuarios1`
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario),
  CONSTRAINT `fk_usuarios_has_cancoes_cancoes1`
    FOREIGN KEY (id_cancao)
    REFERENCES cancoes (id_cancao)
    )
ENGINE = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuarios (usuario, idade, id_plano)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO albuns (album, id_artista )
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
  
  INSERT INTO cancoes (cancao, id_album)
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
  
  INSERT INTO usuarios_cancoes (id_usuario, id_cancao)
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
  
INSERT INTO usuarios_artista (id_usuario, id_artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
