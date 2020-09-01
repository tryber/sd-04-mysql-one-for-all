CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
id_plano SMALLINT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(20) NOT NULL,
valor DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

INSERT INTO plano (plano, valor)
VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

CREATE TABLE artista (
id_artista SMALLINT PRIMARY KEY AUTO_INCREMENT,
nome_artista VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

INSERT INTO artista (nome_artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedia Shannon');

CREATE TABLE album (
id_album SMALLINT PRIMARY KEY AUTO_INCREMENT,
nome_album VARCHAR(50) NOT NULL,
id_artista SMALLINT NOT NULL,
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
) ENGINE=InnoDB;

INSERT INTO album (nome_album, id_artista)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE cancao (
id_cancao SMALLINT PRIMARY KEY AUTO_INCREMENT,
nome_cancao VARCHAR(60) NOT NULL,
id_album SMALLINT NOT NULL,
FOREIGN KEY (id_album) REFERENCES album(id_album)
) ENGINE=InnoDB;

INSERT INTO cancao (nome_cancao, id_album)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Trouble Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let`s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let`s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

CREATE TABLE usuario (
id_usuario SMALLINT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(20) NOT NULL,
idade SMALLINT NOT NULL,
id_plano SMALLINT NOT NULL,
FOREIGN KEY (id_plano) REFERENCES plano(id_plano)
) ENGINE=InnoDB;

INSERT INTO usuario (nome_usuario, idade, id_plano)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE musica_usuario (
id_cancao SMALLINT NOT NULL,
id_usuario SMALLINT NOT NULL,
FOREIGN KEY (id_cancao) REFERENCES cancao(id_cancao),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
PRIMARY KEY (id_cancao, id_usuario)
) ENGINE=InnoDB;

INSERT INTO musica_usuario (id_cancao, id_usuario)
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

CREATE TABLE artista_usuario (
id_artista SMALLINT NOT NULL,
id_usuario SMALLINT NOT NULL,
FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
PRIMARY KEY (id_artista, id_usuario)
) ENGINE=InnoDB;

INSERT INTO artista_usuario (id_usuario, id_artista)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
