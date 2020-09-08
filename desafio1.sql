DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE subscrition_plans(
id INT PRIMARY KEY AUTO_INCREMENT,
plan_name VARCHAR(15) NOT NULL,
plan_price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(30) NOT NULL,
user_age INT(2) NOT NULL,
plan_id INT(2) NOT NULL,
FOREIGN KEY (plan_id) REFERENCES subscrition_plans(id)
) engine = InnoDB;

CREATE TABLE artists(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(30) NOT NULL
) engine = InnoDB;

CREATE TABLE albums(
id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(30) NOT NULL,
artist_id INT(2),
FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

CREATE TABLE songs(
id INT PRIMARY KEY AUTO_INCREMENT,
song_name VARCHAR(40) NOT NULL,
album_id INT(2),
FOREIGN KEY (album_id) REFERENCES albums(id)
) engine = InnoDB;

CREATE TABLE track_history(
user_id INT(2) NOT NULL,
song_id INT(2) NOT NULL,
PRIMARY KEY (user_id, song_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (song_id) REFERENCES songs(id)
) engine = InnoDB;

CREATE TABLE followers(
user_id INT(2) NOT NULL,
artist_id INT(2) NOT NULL,
PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (artist_id) REFERENCES artists(id)
) engine = InnoDB;

INSERT INTO subscrition_plans (plan_name, plan_price) 
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO users (user_name, user_age, plan_id) 
VALUES 
  ('Thati', 23, 1),
  ('Cintia', '35', 2),
  ('Bill', '20', 3),
  ('Roger', '45', 1);

INSERT INTO artists (artist_name) VALUES
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong');

INSERT INTO albums (album_name, artist_id)
VALUES 
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 4),
  ('Incandescent', 3),
  ('Temporary Culture', 2);

INSERT INTO songs (song_name, album_id)
VALUES
  ('Soul For Us', 1),
  ('Magic Circus', 3),
  ('Diamond Power', 4),
  ('Thang Of Thunder', 5),
  ('Home Forever', 4),
  ('Words Of Her Life', 5),
  ('Reflections Of Magic', 1),
  ('Honey, So Do I', 3),
  ('Troubles Of My Inner Fire', 2),
  ('Dance With Her Own', 1),
  ('Without My Streets', 4),
  ('Celebration Of More', 4),
  ('Fantasy For Me', 4),
  ('Time Fireworks', 2),
  ('Sweetie, Let\'s Go Wild', 3),
  ('She Knows', 3),
  ('Rock His Everything', 4),
  ('Honey, Let\'s Be Silly', 4);

INSERT INTO track_history (user_id, song_id) 
VALUES 
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 18),
  (3, 9),
  (3, 4),
  (3, 2),
  (4, 10),
  (4, 11),
  (4, 12);

INSERT INTO followers (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 4),
  (4, 2);
