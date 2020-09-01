DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT PRIMARY KEY auto_increment,
    plano VARCHAR(50) not null,
    valor_plano decimal(5,3) null
)engine=InnoDB;

CREATE TABLE usuarios(
    usuario_id INT PRIMARY KEY auto_increment,
    usuario VARCHAR(50) not null,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) references planos(plano_id)
)engine=InnoDB;

CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY auto_increment,
    cancao VARCHAR(70) not null
)engine=InnoDB;

CREATE TABLE historico_reprod(
    reprod_id INT PRIMARY KEY auto_increment,
    cancao_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
)engine=InnoDB;

CREATE TABLE artistas(
    artista_id INT PRIMARY KEY auto_increment,
    artista VARCHAR(70) not null
)engine=InnoDB;

CREATE TABLE albuns(
    album_id INT PRIMARY KEY auto_increment,
    album VARCHAR(70) not null,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) references artistas(artista_id)
)engine=InnoDB;

CREATE TABLE seguidores_artistas(
    seguidores_artistas_id INT PRIMARY KEY auto_increment,
    artista_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
)engine=InnoDB;

CREATE TABLE albuns_cancoes(
    albuns_cancoes_id INT PRIMARY KEY auto_increment,
    album_id INT NOT NULL,
    cancao_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
)engine=InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
	('gratuito', 0),
    ('universitário', 5.99),
    ('familiar', 7.99);

INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
	('Thati', 23, 1),
    ('Cintia', 35, 3),
    ('Bill', 20, 2),
    ('Roger', 45, 1);
    
INSERT INTO cancoes (cancao)
VALUES
	('Soul For Us'),
    ('Reflections Of Magic'),
    ('Dance With Her Own'),
    ('Troubles Of My Inner Fire'),
    ('Time Fireworks'),
    ('Magic Circus'),
    ('Honey, So Do I'),
    ("Sweetie, Let's Go Wild"),
    ('She Knows'),
    ('Fantasy For Me'),
    ('Celebration Of More'),
    ('Rock His Everything'),
    ('Home Forever'),
    ('Diamond Power'),
    ("Honey, Let's Be Silly"),
    ('Thang Of Thunder'),
    ('Words Of Her Life'),
    ('Without My Streets');

INSERT INTO historico_reprod (cancao_id, usuario_id)
VALUES 
	(1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 2),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 3),
    (4, 3),
    (2, 3),
    (10, 4),
    (11, 4),
    (12, 4);

INSERT INTO artistas(artista)
VALUES
	('Walter Phoenix'),
    ('Freedie Shannon'),
    ('Lance Day'),
    ('Peter Strong');

INSERT INTO albuns(album, artista_id)
VALUES
	('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 4),
    ('Incandescent', 3),
    ('Temporary Culture', 2);
    
INSERT INTO seguidores_artistas(artista_id, usuario_id)
VALUES
	(1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (4, 3),
    (1, 3),
    (2, 4);
    
INSERT INTO albuns_cancoes(album_id, cancao_id)
VALUES 
	(1, 1),
    (1, 7),
    (1, 10),
    (2, 9),
    (2, 13),
    (3, 2),
    (3, 14),
    (3, 15),
    (3, 16),
    (4, 17),
    (4, 12),
    (4, 18),
    (4, 5), 
    (4, 3),
    (4, 8),
    (5, 4), 
    (5, 6),
    (5, 11);
