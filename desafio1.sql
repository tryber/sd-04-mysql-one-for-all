CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

-- ======================================== ARTISTAS =======================================
CREATE TABLE artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(30) NOT NULL
);

INSERT INTO artistas(artista_id, artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');
  
  select * from artistas;
    
-- ======================================== ALBUNS =======================================
CREATE TABLE albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(30) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);


INSERT INTO albuns(album_id, album, artista_id)
VALUES 
	(1, 'Envious', 1),
    (2, 'Exuberant', 1),
    (3, 'Hallowed Steam', 2),
    (4, 'Incandescent', 3),
    (5, 'Temporary Culture', 4);

-- ======================================== CANCOES =======================================
CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancoes VARCHAR(30) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id),
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

INSERT INTO cancoes(cancao_id, cancoes, album_id, artista_id)
VALUES 
	(1, 'Soul For Us', 1, 1),
	(2, 'Reflections Of Magic', 1, 1),
	(3, 'Dance With Her Own', 1, 1),
	(4, 'Troubles Of My Inner Fire', 2, 1),
	(5, 'Magic Circus', 3, 2),
    (6, 'Honey, So Do I', 3, 2),
    (7, "Sweetie, Let's Go Wild", 3, 2),
    (8, 'She Knows', 3, 2),
    (9, 'Fantasy For Me', 4, 3),
    (10, 'Celebration Of More', 4, 3),
    (11, 'Rock His Everything', 4, 3),
    (12, 'Home Forever', 4, 3),
    (13, 'Diamond Power', 4, 3),
    (14, "Honey, Let's Be Silly", 4, 3),
	(15, 'Thang Of Thhuder', 5, 4),
	(16, 'Words Of Her Life', 5, 4),
	(17, 'Without My Streets', 5, 4);

-- ======================================== PLANOS =======================================
CREATE TABLE planos(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(30) NOT NULL,
    valor_plano DECIMAL(6,2) NOT NULL
);

INSERT INTO planos(plano_id, plano, valor_plano)
VALUES 
	(1, 'gratuito', 0),
    (2, 'universitário', 5.99),
    (3, 'familiar', 7.99);
    
-- ======================================== USUÁRIOS =======================================
CREATE TABLE usuarios(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(30) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
	FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

INSERT INTO usuarios(usuario_id, usuario, idade, plano_id)
VALUES 
	(1, 'Thati', 23, 1),
    (2, 'Cintia', 35, 3),
    (3, 'Bill', 20, 2),
    (4, 'Roger', 45, 1);
    
-- ======================================== SEGUINDO ARTISTAS =======================================
CREATE TABLE seguindo_artistas(
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
	FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES 
	(1, 1),
	(1, 3),
    (1, 4),
	(2, 1),
    (2, 3),
	(3, 1),
    (3, 2),
	(4, 4);
    
-- ================================= HISTORICO DE REPRODUCOES ================
CREATE TABLE historico_de_reproducoes(
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
	FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
);

INSERT INTO historico_de_reproducoes(usuario_id, cancao_id)
VALUES 
	(1, 1),
    (1, 5),
    (1, 13),
	(1, 15),
    (2, 12),
    (2, 16),
    (2, 2),
	(2, 14),
	(3, 4),
	(3, 15),
	(3, 5),
	(4, 3),
	(4, 17),
	(4, 10);
