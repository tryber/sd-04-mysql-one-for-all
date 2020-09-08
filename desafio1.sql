DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE `SpotifyClone`;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`plans` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(50) NULL,
  `price` DECIMAL(2) ZEROFILL NOT NULL,
  PRIMARY KEY (`id_plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`users` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `age` INT ZEROFILL NULL,
  `plan` INT NOT NULL,
  PRIMARY KEY (`id_user`, `plan`),
  CONSTRAINT `fk_users_plans`
    FOREIGN KEY (`plan`)
    REFERENCES `SpotifyClone`.`plans` (`id_plan`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artists` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `id_artists` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_artists`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`album` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`id_album`, `artist`),
  CONSTRAINT `fk_album_artists`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`id_artists`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`songs` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `id_songs` INT NOT NULL,
  `title` VARCHAR(50) NULL,
  `album` INT NOT NULL,
  PRIMARY KEY (`id_songs`, `album`),
  CONSTRAINT `fk_songs_album`
    FOREIGN KEY (`album`)
    REFERENCES `SpotifyClone`.`album` (`id_album`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`favorite_artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`favorite_artists` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`favorite_artists` (
  `artist` INT NOT NULL,
  `user` INT NOT NULL,
  PRIMARY KEY (`artist`, `user`),
  CONSTRAINT `fk_favorite_artists_users`
    FOREIGN KEY (`user`)
    REFERENCES `SpotifyClone`.`users` (`id_user`),
  CONSTRAINT `fk_favorite_artists_artists`
    FOREIGN KEY (`artist`)
    REFERENCES `SpotifyClone`.`artists` (`id_artists`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`play_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`playback_history` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`playback_history` (
  `user` INT NOT NULL,
  `song` INT NOT NULL,
  PRIMARY KEY (`users`, `songs`),
  CONSTRAINT `fk_playback_history_users`
    FOREIGN KEY (`users`)
    REFERENCES `SpotifyClone`.`users` (`id_user`),
  CONSTRAINT `fk_playback_history_songs`
    FOREIGN KEY (`songs`)
    REFERENCES `SpotifyClone`.`songs` (`id_songs`)
)
ENGINE = InnoDB;

USE `SpotifyClone`;

-- -----------------------------------------------------
-- Dumping data for table 'plans'
-- -----------------------------------------------------

INSERT INTO `plans` (`id_plan`, `type`, `price`) VALUES (1, 'gratuito', `0.00`);
INSERT INTO `plans` (`id_plan`, `type`, `price`) VALUES (2, 'familiar', `7.99`);
INSERT INTO `plans` (`id_plan`, `type`, `price`) VALUES (3, 'universitário', `5.99`);

-- -----------------------------------------------------
-- Dumping data for table 'users'
-- -----------------------------------------------------

INSERT INTO `users` (`id_user`, `name`, `age`, `plan`) VALUES (1, 'Thati', 23, 1);
INSERT INTO `users` (`id_user`, `name`, `age`, `plan`) VALUES (2, 'Cintia', 35, 2);
INSERT INTO `users` (`id_user`, `name`, `age`, `plan`) VALUES (3, 'Bill', 20, 3);
INSERT INTO `users` (`id_user`, `name`, `age`, `plan`) VALUES (4, 'Roger', 45, 1);

-- -----------------------------------------------------
-- Dumping data for table 'artists'
-- -----------------------------------------------------

INSERT INTO `artists` (`id_artists`, `name`) VALUES (1, 'Freedie Shannon');
INSERT INTO `artists` (`id_artists`, `name`) VALUES (2, 'Walter Phoenix');
INSERT INTO `artists` (`id_artists`, `name`) VALUES (3, 'Peter Strong');
INSERT INTO `artists` (`id_artists`, `name`) VALUES (4, 'Lance Day');

-- -----------------------------------------------------
-- Dumping data for table 'album'
-- -----------------------------------------------------

INSERT INTO `album` (`id_album`, `title`, `artist`) VALUES (1, 'Envious', 2);
INSERT INTO `album` (`id_album`, `title`, `artist`) VALUES (2, 'Exuberant', 2);
INSERT INTO `album` (`id_album`, `title`, `artist`) VALUES (3, 'Hallowed Steam', 3);
INSERT INTO `album` (`id_album`, `title`, `artist`) VALUES (4, 'Incandescent', 4);
INSERT INTO `album` (`id_album`, `title`, `artist`) VALUES (5, 'Temporary Culture', 1);

-- -----------------------------------------------------
-- Dumping data for table 'songs'
-- -----------------------------------------------------

INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (1, 'Soul For Us', 1);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (2, 'Reflections Of Magic', 1);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (3, 'Dance With Her Own', 1);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (4, 'Time Fireworks', 2);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (5, 'Troubles Of My Inner Fire', 2);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (6, 'Magic Circus', 3);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (7, 'Honey, So Do I', 3);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (8, `Sweetie, Let's Go Wild`, 3);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (9, 'She Knows', 3);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (10, 'Fantasy For Me', 4);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (11, 'Celebration Of More', 4);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (12, 'Rock His Everything', 4);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (13, 'Home Forever', 4);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (14, 'Diamond Power', 4);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (15, `Honey, Let's Be Silly`, 4);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (16, 'Thang Of Thunder', 5);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (17, 'Words Of Her Life', 5);
INSERT INTO `songs` (`id_songs`, `title`, `album`) VALUES (18, 'Without My Streets', 5);

-- -----------------------------------------------------
-- Dumping data for table 'favorite_artists'
-- -----------------------------------------------------

INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (1, 1);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (1, 4);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (2, 1);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (2, 2);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (2, 3);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (3, 3);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (4, 1);
INSERT INTO `favorite_artists` (`artist`, `user`) VALUES (4, 2);

-- -----------------------------------------------------
-- Dumping data for table 'playback_history'
-- -----------------------------------------------------

INSERT INTO `playback_history` (`user`, `song`) VALUES (1, 1);
INSERT INTO `playback_history` (`user`, `song`) VALUES (1, 6);
INSERT INTO `playback_history` (`user`, `song`) VALUES (1, 14);
INSERT INTO `playback_history` (`user`, `song`) VALUES (1, 16);
INSERT INTO `playback_history` (`user`, `song`) VALUES (2, 13);
INSERT INTO `playback_history` (`user`, `song`) VALUES (2, 17);
INSERT INTO `playback_history` (`user`, `song`) VALUES (2, 2);
INSERT INTO `playback_history` (`user`, `song`) VALUES (2, 15);
INSERT INTO `playback_history` (`user`, `song`) VALUES (3, 5);
INSERT INTO `playback_history` (`user`, `song`) VALUES (3, 16);
INSERT INTO `playback_history` (`user`, `song`) VALUES (3, 6);
INSERT INTO `playback_history` (`user`, `song`) VALUES (4, 3);
INSERT INTO `playback_history` (`user`, `song`) VALUES (4, 18);
INSERT INTO `playback_history` (`user`, `song`) VALUES (4, 11);