DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT,
    plano_id FOREIGN KEY REFERENCES planos(plano_id),
) ENGINE = InnoDB;

CREATE TABLE planos(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(100),
    valor_plano INT,
) ENGINE = InnoDB;

CREATE TABLE historico_tocadas (
    historico_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao_id FOREIGN KEY REFERENCES artistas(artista_id),
    usuario_id FOREIGN KEY REFERENCES usuarios(usuario_id),
) ENGINE = InnoDB;

CREATE TABLE artistas_seguidos (
    cancao_id FOREIGN KEY REFERENCES artistas(artista_id),
    usuario_id FOREIGN KEY REFERENCES usuarios(usuario_id),
) ENGINE = InnoDB;

CREATE TABLE artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
) ENGINE = InnoDB;

CREATE TABLE albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    artista_id FOREIGN KEY REFERENCES artistas(artista_id),
) ENGINE = InnoDB;

CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    album_id FOREIGN KEY REFERENCES albuns(album_id),
    artista_id FOREIGN KEY REFERENCES artistas(artista_id),
) ENGINE = InnoDB;

INSERT INTO
    usuarios (nome, idade, plano_id)
VALUES
    ("Thati", 23, 1),
    ("Cintia", 35, 2),
    ("Bill", 20, 3),
    ("Roger", 45, 1);

INSERT INTO
    planos (plano, valor_plano)
VALUES
    ("gratuito", 0),
    ("familiar", 7, 99),
    ("universitário", 5, 99);

INSERT INTO
    artistas (nome)
VALUES
    ("Walter Phoenix"),
    ("Peter Strong"),
    ("Lance Day"),
    ("Freedie Shannon");

INSERT INTO
    albuns (titulo, artista_id)
VALUES
    ("Envious", 1),
    ("Exuberant", 1),
    ("Halowed Steam", 2),
    ("Incandescent", 3),
    ("Temporary Culture", 4);

INSERT INTO
    cancoes (titulo, album_id, artista_id)
VALUES
    ("Soul For Us", 1, 1),
    ("Reflections Of Magic", 1, 1),
    ("Dance With Her Won", 1, 1),
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
    ("Honey", 4, 3),
    ("Honey, Let's Be Silly", 4, 3),
    ("Thang Of Thunder", 5, 4),
    ("Words Of Her Life", 5, 4),
    ("Without My Streets", 5, 4);

INSERT INTO
    artistas_seguidos (artista_id, usuario_id)
VALUES
    (1, 1),
    (4, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (2, 3),
    (1, 3),
    (4, 4);

INSERT INTO
    historico_tocadas (cancao_id, usuario_id)
VALUES
    (1, 1),
    (6, 1),
    (14, 1),
    (17, 1),
    (13, 2),
    (18, 2),
    (2, 2),
    (16, 2),
    (4, 3),
    (17, 3),
    (6, 3),
    (3, 4),
    (19, 4),
    (11, 4);
