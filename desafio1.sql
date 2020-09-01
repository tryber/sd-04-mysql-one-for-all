DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    id_plan INT NOT NULL,
    FOREIGN KEY (id_plan)
        REFERENCES plan (id)
)  ENGINE=INNODB;

CREATE TABLE artist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE follow (
    id_user INT NOT NULL,
    id_artist INT NOT NULL,
    PRIMARY KEY (id_user , id_artist),
    FOREIGN KEY (id_user)
        REFERENCES user (id),
    FOREIGN KEY (id_artist)
        REFERENCES artist (id)
)  ENGINE=INNODB;

CREATE TABLE album (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    id_artist INT NOT NULL,
    FOREIGN KEY (id_artist)
        REFERENCES artist (id)
)  ENGINE=INNODB;

CREATE TABLE song (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    id_artist INT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_artist)
        REFERENCES artist (id),
    FOREIGN KEY (id_album)
        REFERENCES album (id)
)  ENGINE=INNODB;

CREATE TABLE playback_history (
    id_user INT NOT NULL,
    id_song INT NOT NULL,
    PRIMARY KEY (id_user , id_song),
    FOREIGN KEY (id_user)
        REFERENCES user (id),
    FOREIGN KEY (id_song)
        REFERENCES song (id)
)  ENGINE=INNODB;

INSERT INTO plan (name, price)
VALUES
    ('gratuito', '0.00'),
    ('familiar', '7.99'),
    ('universitário', '5.99');

INSERT INTO user (name, birth_date, id_plan)
VALUES
    ('Thati', '1997-01-01', 1),
    ('Cintia', '1985-01-01', 2),
    ('Bill', '2000-01-01', 3),
    ('Roger','1975-01-01', 1);

INSERT INTO artist (name)
VALUES
    ("Walter Phoenix"),
    ("PETER Strong"),
    ("Lance Day"),
    ("Freedie Shannon");
    
INSERT INTO follow (id_user, id_artist)
VALUES
    (1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 4);

INSERT INTO album (name, id_artist)
VALUES
    ("Envious", 1),
    ("Exuberant", 1),
    ("Hallowed Steam", 2),
    ("Incandescent", 3),
    ("Temporary Culture", 4);

INSERT INTO song (name, id_artist, id_album)
VALUES
    ("Soul For Us", 1, 1),
    ("Reflections Of Magic", 1, 1),
    ("Dance With Her Own", 1, 1),
    ("Troubles Of My Inner Fire", 1, 2),
    ("Time Fireworks", 1, 2),
    ("Magic Circus", 2, 3),
    ("Honey, So Do I", 2, 3),
    ("Sweetie, Let's Go Wild", 2, 3),
    ("She Knows", 2, 3),
    ("Fantasy For Me", 3, 4),
    ("Celebration Of More", 3, 4),
    ("Rock His Everything", 3, 4),
    ("Home Forever", 3, 4),
    ("Diamond Power", 3, 4),
    ("Honey, Let's Be Silly", 3, 4),
    ("Thang Of Thunder", 4, 5),
    ("Words Of Her Life", 4, 5),
    ("Without My Streets", 4, 5);    

INSERT INTO playback_history (id_user, id_song)
VALUES
    (1,	1),
    (1,	2),
    (1,	14),
    (1,	6),
    (2,	13),
    (2,	17),
    (2,	2),
    (2,	15),
    (3,	4),
    (3,	16),
    (3,	6),
    (4,	3),
    (4,	18),
    (4,	11);
