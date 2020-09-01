CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE `planos` (
  `idplano` int AUTO_INCREMENT,
  `plano` varchar(45) NOT NULL,
  `valor_plano` DECIMAL(6,2)NOT NULL,
  PRIMARY KEY (`idplano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO
  planos (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99);
  
CREATE TABLE `usuarios` (
  `idusuario` int(11) AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `idplano` int,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  CONSTRAINT  FOREIGN KEY (`idplano`)
  REFERENCES `planos(idplano)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO usuarios(usuario, idade, idplano)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 4);

CREATE TABLE `artistas` (
  `idartista` int(11) NOT NULL AUTO_INCREMENT,
  `artista` varchar(45) NOT NULL,
  PRIMARY KEY (`idartista`),
  UNIQUE KEY `idartista_UNIQUE` (`idartista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO artistas(artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');


CREATE TABLE `seguindo_artista` (
  `idartista` int(11) NOT NULL,
  `idusuario` int(11),
  PRIMARY KEY (`idartista`, `idusuario`),
  CONSTRAINT FK_ArtistaID FOREIGN KEY (`idartista`)
  REFERENCES `artista(idartista)`,
  CONSTRAINT FK_UsuarioID FOREIGN KEY (`idusuario`)
  REFERENCES `usuario(idusuario)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO
  seguindo_artista (idusuario, idartista)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 2),
  (2, 3),
  (3, 1);

CREATE TABLE `historico` (
  `idusuario` int(11) NOT NULL,
  `idcancao` int(11),
  PRIMARY KEY (`idcancao`, `idusuario`),
  CONSTRAINT FK_UsuarioID FOREIGN KEY (`idusuario`)
  REFERENCES `usuarios(idusuario)`,
  CONSTRAINT FK_CancaoID FOREIGN KEY (`idcancao`)
  REFERENCES `cancoes(idcancao)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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


CREATE TABLE `albuns` (
  `idalbum` int(11) NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(300) NOT NULL,
  `idartista` int(11) NOT NULL,
  PRIMARY KEY (`idalbum`),
  CONSTRAINT FK_ArtistaID FOREIGN KEY (`idartista`)
  REFERENCES `artista(idartista)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO
  albuns (album, idartista)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE `cancoes` (
  `idcancao` int(11) NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(300) NOT NULL,
  `idartista` int(11) NOT NULL,
  `idalbum` int(11) NOT NULL,
  PRIMARY KEY (`idcancao`),
  CONSTRAINT FK_AlbumID FOREIGN KEY (`idartista`)
  REFERENCES `artistas(idartista)`,
  CONSTRAINT FK_AlbumID FOREIGN KEY (`idalbum`)
  REFERENCES `albuns(idalbum)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

USE SpotifyClone;
