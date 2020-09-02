DROP TABLE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- Plano
CREATE TABLE plano(
  id_plano INT NOT NULL AUTO_INCREMENT,
  plano  VARCHAR(30) NOT NULL,
  valor_plano DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (id_plano)  
)engine = InnoDB;

INSERT INTO plano(plano, valor_plano)
VALUES('gratuito',0), ('universitário',5.99), ('familiar',7.99);

-- Artista
CREATE TABLE artista (
  id_artista INT NOT NULL AUTO_INCREMENT,
  artista_nome VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_artista)
)engine = InnoDB;

INSERT INTO artista(artista_nome) 
VALUES('Walter Phoenix'),('Peter Strong'),('Lance Day'),('Freedie Shannon');

-- Albuns
CREATE TABLE albuns (
  album_id INT NOT NULL AUTO_INCREMENT,	
  album_nome VARCHAR(30) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY(album_id),
  CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artista (id_artista)
)engine = InnoDB;

INSERT INTO albuns(album_nome, artista_id) 
VALUES 
('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4); 
 
-- Canções
CREATE TABLE cancoes (
  id_cancao INT NOT NULL AUTO_INCREMENT,
  titulo_cancao VARCHAR(30),
  album_id INT NOT NULL,
  PRIMARY KEY (id_cancao),
  CONSTRAINT FOREIGN KEY (album_id) REFERENCES albuns (album_id) 
);

INSERT INTO cancoes(titulo_cancao, album_id)
VALUES
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

-- Usuario
CREATE TABLE usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  usuario_nome VARCHAR(50) NOT NULL,
  idade INT,
  id_plano INT NOT NULL,
  CONSTRAINT FOREIGN KEY (id_plano) REFERENCES plano (id_plano),
  PRIMARY KEY (id_usuario)  
)engine = InnoDB;

INSERT INTO usuario (usuario_nome, idade, id_plano) 
VALUES('Thati', 23, 1), ('Cintia', 35, 3), ('Bill', 20, 2), ('Roger', 45, 1);

-- Seguidores
CREATE TABLE artista_seguidores (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
  CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artista (id_artista)
)engine = InnoDB;

INSERT INTO artista_seguidores(usuario_id, artista_id) 
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

-- Reprodução
CREATE TABLE historico_reproducoes (
  usuario_id INT NOT NULL,
  id_cancao INT NOT NULL,
  PRIMARY KEY (usuario_id, id_cancao),
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuario (id_usuario),
  CONSTRAINT FOREIGN KEY (id_cancao) REFERENCES cancoes (id_cancao)
)engine = InnoDB;

INSERT INTO historico_reproducoes(usuario_id, id_cancao)
VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 4),
(2, 5),
(2, 1),
(3, 2),
(3, 5),
(3, 3),
(4, 1),
(4, 5),
(4, 4);
