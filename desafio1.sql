CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista (
id INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(100) NOT NULL
);

CREATE TABLE album (
id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artista(id)
);

CREATE TABLE plano (
id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(50) NOT NULL,
valor_plano DECIMAL(5, 2) NOT NULL
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES plano(id)
);

CREATE TABLE cancao (
id INT PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(150) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(id)
);

CREATE TABLE historico_de_reproducao (
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuario(id),
FOREIGN KEY (cancao_id) REFERENCES cancao(id),
PRIMARY KEY (usuario_id, cancao_id)
);

CREATE TABLE seguindo_artista (
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuario(id),
FOREIGN KEY (artista_id) REFERENCES artista(id),
PRIMARY KEY (usuario_id, artista_id)
);

INSERT INTO artista (artista) VALUES
("Walter Phoenix"),
("Freedie Shannon"),
("Lance Day"),
("Peter Strong");

INSERT INTO plano (plano, valor_plano) VALUES
("gratuito", 0),
("familiar", 7.99),
("universitario", 5.99);

INSERT INTO usuario (usuario, idade, plano_id) VALUES
("Thati", 23, 1),
("Cintia", 35, 2),
("Bill", 20, 3),
("Roger", 45, 1);

INSERT INTO album (album, artista_id) VALUES
("Envious", 1),
("Exuberant", 1),
("Hallowed Steam", 4),
("Incandescent", 3),
("Temporary Culture", 2);

INSERT INTO cancao (cancao, album_id) VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Let's Go Wild", 3),
("She Knows", 3),
("Fantasy For Me",4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

INSERT INTO historico_de_reproducao (usuario_id, cancao_id) VALUES
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

INSERT INTO seguindo_artista (usuario_id, artista_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 4),
(3, 1),
(4, 2);
