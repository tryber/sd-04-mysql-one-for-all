DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE `SpotifyClone`;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS plans ;

CREATE TABLE plans (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(50) NULL,
  `price` DECIMAL(2) ZEROFILL NOT NULL,
  PRIMARY KEY (`id_plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS users ;

CREATE TABLE users (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `age` INT ZEROFILL NULL,
  `plan` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  FOREIGN KEY (`plan`)
    REFERENCES plans (`id_plan`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS artists ;

CREATE TABLE IF NOT EXISTS artists (
  `id_artists` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_artists`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS album ;

CREATE TABLE album (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  FOREIGN KEY (`artist`)
    REFERENCES artists (`id_artists`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS songs ;

CREATE TABLE songs (
  `id_songs` INT NOT NULL,
  `title` VARCHAR(50) NULL,
  `album` INT NOT NULL,
  PRIMARY KEY (`id_songs`),
  FOREIGN KEY (`album`)
    REFERENCES album (`id_album`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`favorite_artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS favorite_artists ;

CREATE TABLE IF NOT EXISTS favorite_artists (
  `user` INT NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`user`, artist),
  FOREIGN KEY (`user`)
	REFERENCES users (`id_user`),
  FOREIGN KEY (`artist`)
	REFERENCES artists (`id_artists`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`playback_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS playback_history ;

CREATE TABLE playback_history (
  `user` INT NOT NULL,
  `song` INT NOT NULL,
  PRIMARY KEY (`user`, `song`),
  FOREIGN KEY (`user`)
	REFERENCES users (`id_user`),
  FOREIGN KEY (`song`)
    REFERENCES songs (`id_songs`)
)
ENGINE = InnoDB;

USE `SpotifyClone`;

-- -----------------------------------------------------
-- Dumping data for table 'plans'
-- -----------------------------------------------------

INSERT INTO plans (`id_plan`, `type`, `price`)
VALUES
	(1, 'gratuito', `0.00`),
    (2, 'familiar', `7.99`),
    (3, 'universitário', `5.99`);

-- -----------------------------------------------------
-- Dumping data for table 'users'
-- -----------------------------------------------------

INSERT INTO users (`id_user`, `name`, `age`, `plan`)
VALUES
	(1, 'Thati', 23, 1),
    (2, 'Cintia', 35, 2),
    (3, 'Bill', 20, 3),
    (4, 'Roger', 45, 1);

-- -----------------------------------------------------
-- Dumping data for table 'artists'
-- -----------------------------------------------------

INSERT INTO artists (`id_artists`, `name`)
VALUES
	(1, 'Freedie Shannon'),
    (2, 'Walter Phoenix'),
    (3, 'Peter Strong'),
    (4, 'Lance Day');

-- -----------------------------------------------------
-- Dumping data for table 'album'
-- -----------------------------------------------------

INSERT INTO album (`id_album`, `title`, `artist`)
VALUES
	(1, 'Envious', 2),
    (2, 'Exuberant', 2),
	(3, 'Hallowed Steam', 3),
    (4, 'Incandescent', 4),
    (5, 'Temporary Culture', 1);

-- -----------------------------------------------------
-- Dumping data for table 'songs'
-- -----------------------------------------------------

INSERT INTO songs (`id_songs`, `title`, `album`)
VALUES
	(1, 'Soul For Us', 1),
    (2, 'Reflections Of Magic', 1),
    (3, 'Dance With Her Own', 1),
    (4, 'Time Fireworks', 2),
    (5, 'Troubles Of My Inner Fire', 2),
    (6, 'Magic Circus', 3),
    (7, 'Honey, So Do I', 3),
    (8, `Sweetie, Let's Go Wild`, 3),
    (9, 'She Knows', 3),
    (10, 'Fantasy For Me', 4),
    (11, 'Celebration Of More', 4),
    (12, 'Rock His Everything', 4),
    (13, 'Home Forever', 4),
    (14, 'Diamond Power', 4),
    (15, `Honey, Let's Be Silly`, 4),
    (16, 'Thang Of Thunder', 5),
    (17, 'Words Of Her Life', 5),
    (18, 'Without My Streets', 5);

-- -----------------------------------------------------
-- Dumping data for table 'favorite_artists'
-- -----------------------------------------------------

INSERT INTO favorite_artists (`user`, `artist`)
VALUES
	(1, 1),
    (1, 2),
    (1, 4),
    (2, 2),
    (2, 4),
    (3, 2),
    (3, 3),
    (4, 1);

-- -----------------------------------------------------
-- Dumping data for table 'playback_history'
-- -----------------------------------------------------

INSERT INTO `playback_history` (`user`, `song`)
VALUES
	(1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 13),
    (2, 17),
    (2, 2),
    (2, 15),
    (3, 5),
    (3, 16),
    (3, 6),
    (4, 3),
    (4, 18),
    (4, 11);
    