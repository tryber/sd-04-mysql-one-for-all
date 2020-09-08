-- Drop the database if exist
DROP DATABASE IF EXISTS SpotifyClone;

-- Create new Schema
CREATE DATABASE SpotifyClone;

-- Use the new created schema
USE SpotifyClone;

-- Create a table containing subscriptions types
CREATE TABLE subscriptions (
    subscription_id INT NOT NULL AUTO_INCREMENT,
    subscription VARCHAR(30) NOT NULL,
    price DOUBLE(3, 2) NOT NULL,
    PRIMARY KEY (subscription_id),
    UNIQUE INDEX subscription_id_UNIQUE (subscription_id ASC)
) ENGINE = INNODB,
COMMENT = "Subscriprions types";

-- Create Users table
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    age INT,
    subscription INT NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE INDEX user_id_UNIQUE (user_id ASC),
    CONSTRAINT FK_UserSubscription FOREIGN KEY (subscription) REFERENCES subscriptions (subscription_id)
) ENGINE = INNODB,
COMMENT = "Users data";

-- Create Artists table
CREATE TABLE artists (
    artist_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (artist_id),
    UNIQUE INDEX artist_id_UNIQUE (artist_id ASC)
) ENGINE = INNODB,
COMMENT = "Artist info";

-- Create Album table
CREATE TABLE albuns (
    album_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (album_id),
    UNIQUE INDEX album_id_UNIQUE (album_id ASC),
    CONSTRAINT FK_AlbumArtist FOREIGN KEY (artist) REFERENCES artists (artist_id)
) ENGINE = INNODB,
COMMENT = "Albuns data";

-- Create Songs table
CREATE TABLE songs (
    song_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    album INT NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (song_id),
    UNIQUE INDEX song_id_UNIQUE (song_id ASC),
    CONSTRAINT FK_AlbumSong FOREIGN KEY (album) REFERENCES albuns (album_id),
    CONSTRAINT FK_ArtistSong FOREIGN KEY (artist) REFERENCES artists (artist_id)
) ENGINE = INNODB,
COMMENT = "Songs data";

-- Create followers table
CREATE TABLE followers (
    follow_id INT NOT NULL AUTO_INCREMENT,
    user INT NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (follow_id, user, artist),
    UNIQUE INDEX follow_id_UNIQUE (follow_id ASC),
    CONSTRAINT FK_FollowersUsers FOREIGN KEY (user) REFERENCES users (user_id),
    CONSTRAINT FK_FollowersArtists FOREIGN KEY (artist) REFERENCES artists (artist_id)
) ENGINE = INNODB,
COMMENT = "Artists fallowers data";

-- Create history table
CREATE TABLE songs_history (
    history_id INT NOT NULL AUTO_INCREMENT,
    user INT NOT NULL,
    song INT NOT NULL,
    play_date TIMESTAMP,
    PRIMARY KEY (history_id, user, song),
    UNIQUE INDEX history_id_UNIQUE (history_id ASC),
    CONSTRAINT FK_SongsHistoryUsers FOREIGN KEY (user) REFERENCES users (user_id),
    CONSTRAINT FK_SongsHistorySong FOREIGN KEY (song) REFERENCES songs (song_id)
) ENGINE = INNODB,
COMMENT = "Users played songs history";

-- Insert data into subscriptions table
INSERT INTO subscriptions (subscription, price)
VALUES ("gratuito", 0.00),
    ("universitário", 7.99),
    ("familiar", 5.99);

-- Insert data into users table
INSERT INTO users (username, age, subscription)
VALUES ("Thati", 23, 1),
    ("cintia", 35, 3),
    ("Bill", 20, 2),
    ("Roger", 45, 1);

-- Insert artirts data into artists table
INSERT INTO artists (name)
VALUES ("Walter Phoenix"),
    ("Peter Strong"),
    ("Lance Day"),
    ("Freedie Shannon");

-- Inser data into albums table
INSERT INTO albuns (name, artist) VALUE ("Envious", 1),
    ("Exuberant", 1),
    ("Hallowed Steam", 2),
    ("Incandescent", 3),
    ("Temporary Culture", 4);

-- Insert data into songs table
INSERT INTO songs (name, album, artist)
VALUES ("Soul For Us", 1, 1),
    ("Reflections Of Magic", 1, 1),
    ("Dance With Her Own", 1, 1),
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
    ("Honey, Let's Be Silly", 4, 3),
    ("Thang Of Thunder", 5, 4),
    ("Words Of Her Life", 5, 4),
    ("Without My Streets", 5, 4);

-- Add data into played songs history
INSERT INTO songs_history (user, song)
VALUES  (1, 1),
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

-- Insert data into followers table
INSERT INTO followers (user, artist)
VALUES  (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);
