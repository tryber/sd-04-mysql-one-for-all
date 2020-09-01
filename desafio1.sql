CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  valor DECIMAL(6, 2) NOT NULL
);

INSERT INTO
  plans (name, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99);

CREATE TABLE users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (`plano_id`) REFERENCES `SpotifyClone`.`plans` (`plano_id`)
);

INSERT INTO
  users (name, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

CREATE TABLE artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL
);

INSERT INTO
  artists (name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (`artist_id`) REFERENCES `SpotifyClone`.`artists` (`artist_id`)
);

INSERT INTO
  albuns (name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE songs(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (`artist_id`) REFERENCES `SpotifyClone`.`artists` (`artist_id`),
  CONSTRAINT FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`albuns` (`album_id`)
);

INSERT INTO
  songs (name, album_id, artist_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 2, 1),
  ('Time Fireworks', 2, 1),
  ('Magic Circus', 3, 2),
  ('Honey, So Do I', 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ('She Knows', 3, 2),
  ('Fantasy For Me', 4, 3),
  ('Celebration Of More', 4, 3),
  ('Rock His Everything', 4, 3),
  ('Home Forever', 4, 3),
  ('Diamond Power', 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ('Thang Of Thunder', 5, 4),
  ('Words Of Her Life', 5, 4),
  ('Without My Streets', 5, 4);

CREATE TABLE following(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (`artist_id`, `user_id`),
  CONSTRAINT FOREIGN KEY (`artist_id`) REFERENCES `SpotifyClone`.`artists` (`artist_id`),
  CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `SpotifyClone`.`users` (`user_id`)
);

INSERT INTO
  following (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

CREATE TABLE history(
  user_id INT NOT NULL,
  cancao_id INT NOT NULL,
  PRIMARY KEY (`user_id`, `cancao_id`),
  CONSTRAINT FOREIGN KEY (`user_id`) REFERENCES `SpotifyClone`.`users` (`user_id`),
  CONSTRAINT `fk_users_has_songs_songs1` FOREIGN KEY (`cancao_id`) REFERENCES `SpotifyClone`.`songs` (`cancao_id`)
);

INSERT INTO
  history (user_id, cancao_id)
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
