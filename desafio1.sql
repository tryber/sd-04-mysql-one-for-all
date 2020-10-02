DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
plan_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
price_plan DECIMAL(4,2) NOT NULL,
PRIMARY KEY (plan_id));

INSERT INTO plan(name, price_plan)
VALUES ("gratuito",0),("familiar",7.99),("universitario",5.99);

CREATE TABLE user (
user_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
age INT NOT NULL,
plan_id INT NULL,
primary key(user_id),
FOREIGN KEY (plan_id)
REFERENCES plan (plan_id));

insert into user(name,age,plan_id)
values ("Thati",20,1),("Cintia",35,2),("Bill",40,3),("Roger",60,1);

CREATE TABLE artist (
artist_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (artist_id));

insert into artist(name)
values ("Walter Phoenix"),("Peter Strong"),("Lance Day"),("Freedie Shannon");

CREATE TABLE follow_artist (
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id)
REFERENCES user (user_id),
FOREIGN KEY (artist_id)
REFERENCES artist (artist_id));

insert into follow_artist(user_id,artist_id)
values(1,1),(1,4),(1,3),(2,1),(2,3),(3,2),(3,1),(4,4);

CREATE TABLE album (
album_id INT NOT NULL AUTO_INCREMENT,
albuns VARCHAR(50) NOT NULL,
artist_id int null,
PRIMARY KEY (album_id),
FOREIGN KEY (artist_id)
REFERENCES artist(artist_id)
);

insert into album(albuns,artist_id)
values("Envious",1),("Exuberant",1),("Hallowed Steam",2),
("Incandescent",3),("Temporary Culture",4);

CREATE TABLE song (
song_id INT NOT NULL AUTO_INCREMENT,
songs VARCHAR(50) NULL,
album_id int null,
PRIMARY KEY (song_id),
FOREIGN KEY (album_id)
REFERENCES album(album_id)
);

insert into song(songs,album_id)
values("Soul For Us",1),("Reflections Of Magic",1),("Dance With Her Own",1),
("Troubles Of My Inner Fire",2),("Time Fireworks",2),("Magic Circus",3),
( "Honey, So Do I",3),("Sweetie, Let's Go Wild",3),("She Knows",3),
("Fantasy For Me",4),("Celebration Of More",4),("Rock His Everything",4),
("Home Forever",4),( "Diamond Power",4),("Honey, Let's Be Silly",4),
("Thang Of Thunder",5),( "Words Of Her Life",5),("Without My Streets",5);

CREATE TABLE reproduction_history (
user_id INT NOT NULL,
song_id INT NOT NULL,
PRIMARY KEY (user_id, song_id),
FOREIGN KEY (user_id)
REFERENCES user (user_id),
FOREIGN KEY (song_id)
REFERENCES song (song_id)
);

insert into reproduction_history(user_id, song_id)
values(1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),
(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);
