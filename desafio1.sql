DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone ;

CREATE TABLE Plano (
    id INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    valor DECIMAL(3 , 2 ) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    plano INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (plano)
        REFERENCES SpotifyClone.Plano (id)
)  ENGINE=INNODB;

CREATE TABLE Artista (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE Seguindo (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (artista_id , usuario_id),
    FOREIGN KEY (usuario_id)
        REFERENCES SpotifyClone.Usuario (id),
    FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.Artista (id)
)  ENGINE=INNODB;

CREATE TABLE Album (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.Artista (id)
)  ENGINE=INNODB;

CREATE TABLE Musica (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (album_id)
        REFERENCES SpotifyClone.Album (id),
    FOREIGN KEY (artista_id)
        REFERENCES SpotifyClone.Artista (id)
)  ENGINE=INNODB;

CREATE TABLE Historico_Reproducao (
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    PRIMARY KEY (usuario_id , musica_id),
    FOREIGN KEY (usuario_id)
        REFERENCES SpotifyClone.Usuario (id),
    FOREIGN KEY (musica_id)
        REFERENCES SpotifyClone.Musica (id)
)  ENGINE=INNODB;

INSERT INTO Plano (tipo, valor)
VALUES
("gratuito", 0),
("familiar", 7.99),
("universitário", 5.99);

INSERT INTO Usuario (nome, idade, plano)
VALUES
("Thati", 23, 1),
("Cintia", 35, 2),
("Bill", 20, 3),
("Roger", 45, 1);

INSERT INTO Artista (nome)
VALUES
("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freedie Shannon");

INSERT INTO Seguindo (usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO Album (nome, artista_id)
VALUES
("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 2),
("Incandescent", 3),
("Temporary Culture", 4);

INSERT INTO Musica (nome, album_id, artista_id)
VALUES
("Soul For Us", 1, 1),
("Reflections Of Magic", 1, 1),
("Dance With Her Own", 1, 1),
("Troubles Of My Inner Fire", 2, 1),
("Time Fireworks", 2, 1),
("Magic Circus", 3, 2),
("Honey, So Do I", 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
("She Knows", 3, 2),
("Fantasy For Me", 4, 3),
("Celebration Of More", 4, 3),
("Rock His Everything", 4, 3),
("Home Forever", 4, 3),
("Diamond Power", 4, 3),
("Honey, Let's Be Silly", 4, 3),
("Thang Of Thunder", 5, 4),
("Words Of Her Life", 5, 4),
("Without My Streets", 5, 4);

INSERT INTO Historico_Reproducao (usuario_id, musica_id )
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
