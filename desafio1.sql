CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `idplano` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  CONSTRAINT FK_PlanoID FOREIGN KEY (`idplano`)
  REFERENCES `planos(idplano)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `artistas` (
  `idartista` int(11) NOT NULL AUTO_INCREMENT,
  `artista` varchar(45) NOT NULL,
  `idusuario` int(11),
  PRIMARY KEY (`idartista`),
  UNIQUE KEY `idartista_UNIQUE` (`idartista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO usuarios(usuario, idade, idplano)
VALUES
('Thati', 23, 1);

CREATE TABLE `seguindo_artista` (
  `idartista` int(11) NOT NULL,
  `idusuario` int(11),
  PRIMARY KEY (`idartista`, `idusuario`),
  CONSTRAINT FK_ArtistaID FOREIGN KEY (`idartista`)
  REFERENCES `artista(idartista)`,
  CONSTRAINT FK_UsuarioID FOREIGN KEY (`idusuario`)
  REFERENCES `usuario(idusuario)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `historico` (
  `idusuario` int(11) NOT NULL,
  `idcancao` int(11),
  PRIMARY KEY (`idcancao`, `idusuario`),
  CONSTRAINT FK_UsuarioID FOREIGN KEY (`idusuario`)
  REFERENCES `usuarios(idusuario)`,
  CONSTRAINT FK_CancaoID FOREIGN KEY (`idcancao`)
  REFERENCES `cancoes(idcancao)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `planos` (
  `idplano` int(11) NOT NULL AUTO_INCREMENT,
  `plano` varchar(45) NOT NULL,
  `valor_plano` DECIMAL(6,2)NOT NULL,
  PRIMARY KEY (`idplano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `albuns` (
  `idalbum` int(11) NOT NULL AUTO_INCREMENT,
  `album` int(11),
  `idartista` int(11),
  PRIMARY KEY (`idalbum`),
  CONSTRAINT FK_ArtistaID FOREIGN KEY (`idartista`)
  REFERENCES `artista(idartista)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cancoes` (
  `idcancao` int(11) NOT NULL AUTO_INCREMENT,
  `cancao` int(11),
  `idartista` int(11),
  `idalbum` int(11),
  PRIMARY KEY (`idcancao`),
  CONSTRAINT FK_AlbumID FOREIGN KEY (`idartista`)
  REFERENCES `artistas(idartista)`,
  CONSTRAINT FK_AlbumID FOREIGN KEY (`idalbum`)
  REFERENCES `albuns(idalbum)`
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
