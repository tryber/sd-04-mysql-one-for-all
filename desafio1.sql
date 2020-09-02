CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
id INT PRIMARY KEY AUTO_INCREMENT,
plan_type VARCHAR(30) NOT NULL,
plan_value DECIMAL(4, 2) NOT NULL
);

CREATE TABLE artist(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(30) NOT NULL
);

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
user VARCHAR(30) NOT NULL,
age INT NOT NULL,
plan_id INT NOT NULL,
CONSTRAINT `fk_plan` FOREIGN KEY (plan_id) REFERENCES plan(id) 
);

CREATE TABLE album(
id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(30) NOT NULL,
artist_id INT NOT NULL,
CONSTRAINT `fk_artist` FOREIGN KEY (artist_id) REFERENCES artist(id) 
);

CREATE TABLE songs(
id INT PRIMARY KEY AUTO_INCREMENT,
song_name VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
CONSTRAINT `fk_album` FOREIGN KEY (album_id) REFERENCES album(id)
);

CREATE TABLE history(
user_id INT NOT NULL,
song_id INT NOT NULL,
PRIMARY KEY (user_id, song_id),
CONSTRAINT `fk_userh` FOREIGN KEY (user_id) REFERENCES users(id),
CONSTRAINT `fk_songh` FOREIGN KEY (song_id) REFERENCES songs(id)
);

CREATE TABLE following(
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id, artist_id),
CONSTRAINT `fk_userf` FOREIGN KEY (user_id) REFERENCES users(id),
CONSTRAINT `fk_artistf` FOREIGN KEY (artist_id) REFERENCES artist(id)
);

INSERT INTO `SpotifyClone`.`plan` (`plan_type`, `plan_value`)
VALUES ('gratuito', 0 ), ('universitário', 5.99), ('familiar', 7.99);

INSERT INTO `SpotifyClone`.`artist` (`artist_name`)
VALUES ('Walter Phoenix'), ('Freedie Shannon'), ('Lance Day'), ('Peter Strong');

INSERT INTO `SpotifyClone`.`users` (`user`, `age`,`plan_id`)
VALUES ('Thati', 23, 1),('Cintia', 35, 3),('Bill', 20, 2),('Roger', 45, 1);

INSERT INTO `SpotifyClone`.`album` (`album_name`, `artist_id`)
VALUES ('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 4), ('Incandescent', 3), ('Temporary Culture', 2);

INSERT INTO `SpotifyClone`.`songs` (`song_name`, `album_id`)
VALUES ('Soul For Us', 1), ('Reflections Of Magic', 1), ('Dance With Her Own', 1), ("Troubles Of My Inner Fire", 2), ("Time Fireworks", 2), ("Magic Circus", 3),
("Honey, So Do I", 3),("Sweetie, Let's Go Wild", 3),("She Knows", 3),("Fantasy For Me", 4),("Celebration Of More", 4),("Rock His Everything", 4),("Home Forever", 4),
("Diamond Power", 4),("Honey, Let's Be Silly", 4),("Thang Of Thunder", 5),("Words Of Her Life", 5), ("Without My Streets", 5);

INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`)
VALUES (1, 1), 
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

INSERT INTO `SpotifyClone`.`following` (`user_id`, `artist_id`)
VALUES (1, 1), 
(1, 2), 
(1, 3), 
(2, 1), 
(2, 3), 
(3, 4), 
(3, 1), 
(4, 2);
