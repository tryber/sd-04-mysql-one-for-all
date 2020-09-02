DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
planos_id INT PRIMARY KEY AUTO_INCREMENT,
planos_name VARCHAR(30) NOT NULL,
planos_valor DECIMAL(4,2) NOT NULL
);

CREATE TABLE artistas (
artistas_id INT PRIMARY KEY AUTO_INCREMENT,
artistas_name VARCHAR(50) NOT NULL
);

CREATE TABLE usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_name VARCHAR(50) NOT NULL,
usuario_idade INT NOT NULL,
id_planos INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_planos) REFERENCES planos(planos_id)
);

CREATE TABLE album (
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(30) NOT NULL,
id_artistas INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_artistas) REFERENCES artistas(artistas_id)
);

CREATE TABLE seguindo_artistas (
id_usuario INT NOT NULL,
id_artistas INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
CONSTRAINT FOREIGN KEY (id_artistas) REFERENCES artistas(artistas_id),
PRIMARY KEY(id_usuario, id_artistas)
);

CREATE TABLE cancoes(
cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
cancoes_name VARCHAR(50) NOT NULL,
id_album INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_album) REFERENCES album(album_id)
);

CREATE TABLE historico (
id_usuario INT NOT NULL,
id_cancoes INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
CONSTRAINT FOREIGN KEY (id_cancoes) REFERENCES cancoes(cancoes_id),
PRIMARY KEY(id_usuario, id_cancoes)
);

INSERT INTO planos ( planos_name, planos_valor ) VALUES
('gratuito', 0),
('universitário', 5.99),
('familia', 7.99);

INSERT INTO usuario ( usuario_name, usuario_idade, id_planos ) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artistas (artistas_name) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album ( album_name, id_artistas ) VALUES
('Envious',1),
('Exuberant',1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes ( cancoes_name, id_album ) VALUES 
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Lets Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Lets Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO seguindo_artistas (id_usuario, id_artistas) VALUES 
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);

INSERT INTO historico (id_usuario, id_cancoes) VALUES
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);
