DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50) NOT NULL,
    plan_price DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE user(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_age INT NOT NULL,
    plan_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
) engine = InnoDB;

CREATE TABLE song(
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL    
) engine = InnoDB;

CREATE TABLE artist(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL    
) engine = InnoDB;

CREATE TABLE album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    CONSTRAINT FOREIGN KEY (song_id) REFERENCES song(song_id)
) engine = InnoDB;

CREATE TABLE user_preferences(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES user(user_id),
    CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    CONSTRAINT FOREIGN KEY (song_id) REFERENCES song(song_id)
) engine = InnoDB;

INSERT INTO plan (plan_name, plan_price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO user (user_name, user_age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);  

INSERT INTO song (song_name)
VALUES
	('Soul For Us'),
    ('Reflections Of Magic'),
    ('Dance With Her Own'),
    ('Troubles Of My Inner Fire'),
    ('Time Fireworks'),
    ('Magic Circus'),
    ('Honey, So Do I'),
    ('Sweetie, Let’s Go Wild'),
    ('She Knows'),
    ('Fantasy For Me'),
    ('Celebration Of More'),
    ('Rock His Everything'),
    ('Home Forever'),
    ('Diamond Powe'),
    ('Honey, Let`s Be Silly'),
    ('Thang Of Thunder'),
    ('Words Of Her Life'),
    ('Without My Streets');
    
INSERT INTO artist (artist_name)
VALUES
	('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');
