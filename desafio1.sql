DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE `planos` (
  `idplano` int AUTO_INCREMENT,
  `plano` varchar(45) NOT NULL,
  `valor_plano` DECIMAL(6,2)NOT NULL,
  PRIMARY KEY (`idplano`)
) ENGINE=InnoDB;

INSERT INTO
  planos (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99);
  
CREATE TABLE usuarios(
  idusuario INT PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  idplano INT NOT NULL,
  FOREIGN KEY (idplano) REFERENCES planos(idplano)
) ENGINE=INNODB;

INSERT INTO usuarios(usuario, idade, idplano)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

drop database SpotifyClone;
CREATE TABLE artistas (
  idartista INT PRIMARY KEY AUTO_INCREMENT,
  artista varchar(45) NOT NULL
) ENGINE=InnoDB;

INSERT INTO artistas(artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

CREATE TABLE seguindo_artista(
  idartista INT NOT NULL,
  idusuario INT NOT NULL,
  CONSTRAINT FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
  CONSTRAINT FOREIGN KEY (idartista) REFERENCES artistas(idartista),
  PRIMARY KEY(idusuario, idartista)
) ENGINE=INNODB;

INSERT INTO
  seguindo_artista (idusuario, idartista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

CREATE TABLE historico(
  idusuario INT NOT NULL,
  idcancao INT NOT NULL,
  CONSTRAINT FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario),
  CONSTRAINT FOREIGN KEY (idcancao) REFERENCES cancoes(idcancao),
  PRIMARY KEY(idusuario, idcancao)
) ENGINE=INNODB;

INSERT INTO
  historico (idusuario, idcancao)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2);

CREATE TABLE albuns(
  idalbum INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(50) NOT NULL,
  idartista INT NOT NULL,
  FOREIGN KEY (idartista) REFERENCES artistas(idartista)
) ENGINE=INNODB;

INSERT INTO
  albuns (album, idartista)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE cancoes (
  idcancao INT PRIMARY KEY AUTO_INCREMENT,
  cancao VARCHAR(300) NOT NULL,
  idartista int NOT NULL,
  idalbum int NOT NULL,
  CONSTRAINT FOREIGN KEY (idartista) REFERENCES artistas(idartista),
  CONSTRAINT FOREIGN KEY (idalbum) REFERENCES albuns(idalbum)
) ENGINE=InnoDB;

INSERT INTO
  cancoes (cancao, idalbum, idartista)
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
  