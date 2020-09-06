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
    price DOUBLE NOT NULL,
    PRIMARY KEY (subscription_id),
    UNIQUE INDEX subscription_id_UNIQUE (subscription_id ASC)
)  ENGINE=INNODB , COMMENT='Subscriprions types';

-- Create Users table
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    age INT,
    subscription INT NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE INDEX user_id_UNIQUE (user_id ASC),
    CONSTRAINT FK_UserSubscription FOREIGN KEY (subscription)
        REFERENCES subscriptions (subscription_id)
)  ENGINE=INNODB , COMMENT='Users data';

-- Create Artists table
CREATE TABLE artists (
    artist_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (artist_id),
    UNIQUE INDEX artist_id_UNIQUE (artist_id ASC)
)  ENGINE=INNODB , COMMENT='Artist info';

-- Create Album table
CREATE TABLE albuns (
    album_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (album_id),
    UNIQUE INDEX album_id_UNIQUE (album_id ASC),
    CONSTRAINT FK_AlbumArtist FOREIGN KEY (artist)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB , COMMENT='Albuns data';

-- Create Songs table
CREATE TABLE songs (
    song_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    album INT NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (song_id),
    UNIQUE INDEX song_id_UNIQUE (song_id ASC),
    CONSTRAINT FK_AlbumSong FOREIGN KEY (album)
        REFERENCES albuns (album_id),
    CONSTRAINT FK_ArtistSong FOREIGN KEY (artist)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB , COMMENT='Songs data';

-- Create followers table
CREATE TABLE followers (
    follow_id INT NOT NULL AUTO_INCREMENT,
    user INT NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (follow_id),
    UNIQUE INDEX follow_id_UNIQUE (follow_id ASC),
    CONSTRAINT UC_UserArtist UNIQUE (user , artist),
    CONSTRAINT FK_FollowersUsers FOREIGN KEY (user)
        REFERENCES users (user_id),
    CONSTRAINT FK_FollowersArtists FOREIGN KEY (artist)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB , COMMENT='Artists fallowers data';

-- Create history table
CREATE TABLE songs_history (
    hisotry_id INT NOT NULL AUTO_INCREMENT,
    user INT NOT NULL,
    song INT NOT NULL,
    data TIMESTAMP,
    PRIMARY KEY (hisotry_id),
    UNIQUE INDEX hisotry_id_UNIQUE (hisotry_id ASC),
    CONSTRAINT UC_UserSong UNIQUE (user , song),
    CONSTRAINT FK_SongsHistoryUsers FOREIGN KEY (user)
        REFERENCES users (user_id),
    CONSTRAINT FK_SongsHistorySong FOREIGN KEY (song)
        REFERENCES songs (song_id)
)  ENGINE=INNODB , COMMENT='Users played songs history';

-- Insert data into subscriptions table
INSERT INTO subscriptions (subscription, price)
VALUES	('gratuito', '0.00'), 
		('universitário', '7.99'), 
		('familiar', '5.99');

-- Insert data into users table
INSERT INTO users (username, age, subscription)
VALUES	('Thati', 23, 1),
		('cintia', 35, 3),
        ('Bill', 20, 2),
        ('Roger', 45, 1);

-- Insert artirts data into artists table
INSERT INTO	artists	(name)
VALUES	('Walter Phoenix'),
		('Peter Strong'),
		('Lance Day'), 
        ('Freedie Shannon');

-- Inser data into albums table
INSERT INTO albuns (name, artist)
VALUE	('Envious', 1),
		('Exuberant', 1),
		('Hallowed Steam', 2),
		('Incandescent', 3),
		('Temporary Culture', 4);
