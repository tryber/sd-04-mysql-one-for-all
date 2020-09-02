DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

# ---------------- CREATE TABLES -------------------------------

CREATE TABLE plans(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  value DECIMAL(6, 2) NOT NULL
);

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES  plans (plan_id)
);

CREATE TABLE artists (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE songs (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums (album_id)
);

CREATE TABLE followers (
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE playback_history (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (song_id) REFERENCES songs (song_id)
);

# ---------------- INSERT DATA -------------------------------

USE SpotifyClone;
INSERT INTO plans (name, value) VALUES ('gratuito', 0);
INSERT INTO plans (name, value) VALUES ('familiar', 7.99);
INSERT INTO plans (name, value) VALUES ('universitário', 5.99);

INSERT INTO users (name, age, plan_id) VALUES ('Thati', 23, 1);
INSERT INTO users (name, age, plan_id) VALUES ('Cintia', 35, 2);
INSERT INTO users (name, age, plan_id) VALUES ('Bill', 20, 3);
INSERT INTO users (name, age, plan_id) VALUES ('Roger', 45, 1);

INSERT INTO artists (name) VALUES ('Walter Phoenix');
INSERT INTO artists (name) VALUES ('Peter Strong');
INSERT INTO artists (name) VALUES ('Lance Day');
INSERT INTO artists (name) VALUES ('Freedie Shannon');

INSERT INTO albums (name, artist_id) VALUES ('Envious', 1);
INSERT INTO albums (name, artist_id) VALUES ('Exuberant', 1);
INSERT INTO albums (name, artist_id) VALUES ('Hallowed Steam', 2);
INSERT INTO albums (name, artist_id) VALUES ('Incandescent', 3);
INSERT INTO albums (name, artist_id) VALUES ('Temporary Culture', 4);


INSERT INTO songs (name, album_id)
VALUES
    ("Soul For Us", 1),
    ("Reflections Of Magic", 1),
    ("Dance With Her Own", 1),
    ("Troubles Of My Inner Fire", 2),
    ("Time Fireworks", 2),
    ("Magic Circus", 3),
    ("Honey, So Do I", 3),
    ("Sweetie, Let's Go Wild", 3),
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

INSERT INTO followers (user_id, artist_id)
VALUES
    (1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 4);
    
INSERT INTO playback_history (user_id, song_id)
VALUES
    (1,	1),
    (1,	6),
    (1,	14),
    (1,	16),
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
