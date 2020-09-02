DROP DATABASE SpotifyClone;

CREATE DATABASE SpotifyClone;

USE `SpotifyClone` ;


CREATE TABLE   artista (
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL)
ENGINE = InnoDB;

INSERT INTO
    artista (name)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

CREATE TABLE album (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(255) NOT NULL,
  artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
    REFERENCES artista(artista_id))
ENGINE = InnoDB;

INSERT INTO
    album (album_name, artista_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);


CREATE TABLE cançoes(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  album_id INT NOT NULL,
  musica VARCHAR(255) NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id))
ENGINE = InnoDB;

INSERT INTO
    cançoes (album_id, musica )
VALUES
    (1, "Soul For Us"),
    (1, "Reflections Of Magic"),
    (1, "Dance With Her Own"),
    (2, "Troubles Of My Inner Fire"),
    (2, "Time Fireworks"),
    (3, "Magic Circus"),
    (3, "Honey, So Do I"),
    (3, "Sweetie, Let's Go Wild"),
    (3, "She Knows"),
    (4, "Fantasy For Me"),
    (4, "Celebration Of More"),
    (4, "Rock His Everything"),
    (4, "Home Forever"),
    (4, "Diamond Power"),
    (4, "Honey, Let's Be Silly"),
    (5, "Thang Of Thunder"),
    (5, "Words Of Her Life"),
    (5, "Without My Streets");


CREATE TABLE planos(
  planos_id INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(30) NOT NULL,
  valor_plano VARCHAR(10) NULL DEFAULT '0')
ENGINE = InnoDB;

INSERT INTO
    planos (planos_id, plano,  valor_plano)
VALUES
    (1, 'gratuito' , 0),
    (2, 'universitário' ,5.99),
    (3, 'familiar' ,7.99);


CREATE TABLE usuarios (
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NULL DEFAULT '0',
    FOREIGN KEY (plano_id) REFERENCES planos(planos_id))
ENGINE = InnoDB;

INSERT INTO
    usuarios (usuario_id, usuario, idade, plano_id)
VALUES
    (1, 'Thati', 23, 1),
    (2, 'Cintia', 35, 3),
    (3, 'Bill', 20, 2),
    (4, 'Roger', 45, 1);


CREATE TABLE seguindo (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id))
ENGINE = InnoDB;

INSERT INTO 
seguindo ( usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);

CREATE TABLE historico (
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
    FOREIGN KEY (musica_id) REFERENCES cançoes(musica_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    PRIMARY KEY (usuario_id, musica_id))
ENGINE = InnoDB;

INSERT INTO
    historico (usuario_id, musica_id)
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
