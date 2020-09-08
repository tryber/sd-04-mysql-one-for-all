DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- Plano
CREATE TABLE planos(
  id_plano INT NOT NULL AUTO_INCREMENT,
  plano  VARCHAR(30) NOT NULL,
  valor_plano DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (id_plano)  
)engine = InnoDB;

INSERT INTO planos(plano, valor_plano)
VALUES('gratuito',0), ('universitário',5.99), ('familiar',7.99);

-- Artista
CREATE TABLE artistas (
  id_artista INT NOT NULL AUTO_INCREMENT,
  nome_artista VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_artista)
)engine = InnoDB;

INSERT INTO artistas(nome_artista) 
VALUES('Walter Phoenix'),('Peter Strong'),('Lance Day'),('Freedie Shannon');

-- Albuns
CREATE TABLE albuns (
  id_album INT NOT NULL AUTO_INCREMENT,	
  nome_album VARCHAR(30) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY(id_album),
  CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas (id_artista)
)engine = InnoDB;

INSERT INTO albuns(nome_album, artista_id) 
VALUES 
('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4); 

-- Canções
CREATE TABLE cancoes (
  id_cancao INT NOT NULL AUTO_INCREMENT,
  titulo_cancao VARCHAR(30),
  album_id INT NOT NULL,
  PRIMARY KEY (id_cancao),
  CONSTRAINT FOREIGN KEY (album_id) REFERENCES albuns (id_album) 
)engine = InnoDB;

INSERT INTO cancoes(titulo_cancao, album_id)
VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Lets Go Wild", 3),
("She Knows", 3),
("Fantasy For Me", 4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

-- Usuario
CREATE TABLE usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nome_usuario VARCHAR(50) NOT NULL,
  idade_usuario INT,
  plano_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (plano_id) REFERENCES planos (id_plano),
  PRIMARY KEY (id_usuario)  
)engine = InnoDB;

INSERT INTO usuarios (nome_usuario, idade_usuario, plano_id) 
VALUES('Thati', 23, 1), ('Cintia', 35, 3), ('Bill', 20, 2), ('Roger', 45, 1);

-- Seguidores
CREATE TABLE artista_seguidores (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,  
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario),
  CONSTRAINT FOREIGN KEY (artista_id) REFERENCES artistas (id_artista),
  PRIMARY KEY (usuario_id, artista_id)
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
  cancao_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  CONSTRAINT FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario),
  CONSTRAINT FOREIGN KEY (cancao_id) REFERENCES cancoes (id_cancao)
)engine = InnoDB;

INSERT INTO historico_reproducoes(usuario_id, cancao_id)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 15),
(2,2),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);
