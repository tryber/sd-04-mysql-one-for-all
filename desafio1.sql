DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plans`
-- -----------------------------------------------------

CREATE TABLE plans (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------

CREATE TABLE users (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `age` INT NOT NULL,
  `plan` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plan`)
    REFERENCES plans (`id`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------

CREATE TABLE artists (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------

CREATE TABLE album (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artist`)
    REFERENCES artists (`id`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------

CREATE TABLE songs (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NULL,
  `album` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`album`)
    REFERENCES album (`id`)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`favorite_artists`
-- -----------------------------------------------------

CREATE TABLE favorite_artists (
  `user` INT NOT NULL,
  `artist` INT NOT NULL,
  PRIMARY KEY (`user`, artist),
  FOREIGN KEY (`user`)
    REFERENCES users (`id`),
  FOREIGN KEY (`artist`)
    REFERENCES artists (`id`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`playback_history`
-- -----------------------------------------------------

CREATE TABLE playback_history (
  `user` INT NOT NULL,
  `song` INT NOT NULL,
  PRIMARY KEY (`user`, `song`),
  FOREIGN KEY (`user`)
    REFERENCES users (`id`),
  FOREIGN KEY (`song`)
    REFERENCES songs (`id`)
)
ENGINE = InnoDB;

USE `SpotifyClone`;

-- -----------------------------------------------------
-- Dumping data for table 'plans'
-- -----------------------------------------------------

INSERT INTO plans (`type`, `price`)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99);

-- -----------------------------------------------------
-- Dumping data for table 'users'
-- -----------------------------------------------------

INSERT INTO users (`name`, `age`, `plan`)
VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);

-- -----------------------------------------------------
-- Dumping data for table 'artists'
-- -----------------------------------------------------

INSERT INTO artists (`name`)
VALUES
    ('Freedie Shannon'),
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day');

-- -----------------------------------------------------
-- Dumping data for table 'album'
-- -----------------------------------------------------

INSERT INTO album (`title`, `artist`)
VALUES
    ('Envious', 2),
    ('Exuberant', 2),
    ('Hallowed Steam', 3),
    ('Incandescent', 4),
    ('Temporary Culture', 1);

-- -----------------------------------------------------
-- Dumping data for table 'songs'
-- -----------------------------------------------------

INSERT INTO songs (`title`, `album`)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Time Fireworks', 2),
    ('Troubles Of My Inner Fire', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ("Sweetie, Let's Go Wild", 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ("Honey, Let's Be Silly", 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);

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
