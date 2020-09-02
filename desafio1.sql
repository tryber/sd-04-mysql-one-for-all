DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plans (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE Users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  age TINYINT,
  plan_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (plan_id) REFERENCES Plans(id)
) engine = InnoDB;

CREATE TABLE Artists (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL
) engine = InnoDB;

CREATE TABLE Albums (
  id INT PRIMARY KEY AUTO_INCREMENT,
  artist_id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  CONSTRAINT FOREIGN KEY (artist_id) REFERENCES Artists(id)
) engine = InnoDB;

CREATE TABLE Songs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  album_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (album_id) REFERENCES Albums(id)
) engine = InnoDB;

CREATE TABLE Songs_History (
  PRIMARY KEY(user_id, song_id),
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (song_id) REFERENCES Songs(id),
  CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id)
) engine = InnoDB;

CREATE TABLE Users_Following (
  PRIMARY KEY(user_id, artist_id),
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT FOREIGN KEY (user_id) REFERENCES Users(id),
  CONSTRAINT FOREIGN KEY (artist_id) REFERENCES Artists(id)
) engine = innoDB;

INSERT INTO Plans (name, price) VALUES 
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO Users (name, age, plan_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO Artists (name) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO Albums (artist_id, name) VALUES
(1, 'Envious'),
(1, 'Exuberant'),
(2, 'Hallowed Steam'),
(3, 'Incandescent'),
(4, 'Temporary Culture');

INSERT INTO Songs (album_id, name) VALUES
(1, 'Soul For Us'),
(1, 'Reflections Of Magic'),
(1, 'Dance With Her Own'),
(2, 'Troubles Of My Inner Fire'),
(2, 'Time Fireworks'),
(3, 'Magic Circus'),
(3, 'Honey, So Do I'),
(3, 'Sweetie, Let\'s Go Wild'),
(3, 'She Knows'),
(4, 'Fantasy For Me'),
(4, 'Celebration Of More'),
(4, 'Rock His Everything'),
(4, 'Home Forever'),
(4, 'Diamond Power'),
(4, 'Honey, Let\'s Be Silly'),
(5, 'Thang Of Thunder'),
(5, 'Words Of Her Life'),
(5, 'Without My Streets');

INSERT INTO Songs_History (user_id, song_id)
(SELECT 1, id FROM Songs WHERE name IN ('Soul For Us', 'Magic Circus', 'Diamond Power', 'Thang Of Thunder'))
  UNION ALL
(SELECT 2, id FROM Songs WHERE name IN ('Home Forever', 'Words Of Her Life', 'Reflections Of Magic', 'Honey, Let\'s Be Silly'))
  UNION ALL
(SELECT 3, id FROM Songs WHERE name IN ('Troubles Of My Inner Fire', 'Thang Of Thunder', 'Magic Circus'))
  UNION ALL
(SELECT 4, id FROM Songs WHERE name IN ('Dance With Her Own', 'Without My Streets', 'Celebration Of More'));

INSERT INTO Users_following (user_id, artist_id)
(SELECT 1, id FROM Artists WHERE name IN ('Walter Phoenix', 'Freedie Shannon', 'Lance Day'))
  UNION ALL
(SELECT 2, id FROM Artists WHERE name IN ('Walter Phoenix', 'Lance Day'))
  UNION ALL
(SELECT 3, id FROM Artists WHERE name IN ('Peter Strong', 'Walter Phoenix'))
  UNION ALL
(SELECT 4, id FROM Artists WHERE name = 'Freedie Shannon');
