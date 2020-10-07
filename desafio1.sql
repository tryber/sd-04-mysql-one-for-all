-- Dropar Banco de dados
DROP DATABASE IF EXISTS SpotifyClone;

-- Criar Banco de dados
CREATE DATABASE SpotifyClone;

-- Usar Banco de dados
USE SpotifyClone;

-- Cria tabela planos
CREATE TABLE planos (
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_plano VARCHAR(100) NOT NULL,
    valor_plano DECIMAL(5 , 2 ) NULL
)  ENGINE=INNODB;

INSERT INTO planos (tipo_plano, valor_plano)
VALUES 
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

-- Cria tabela Artistas
CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

INSERT INTO artistas(nome_artista)
VALUES 
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong');

-- Cria tabela usuario
CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
)  ENGINE=INNODB;

INSERT INTO usuarios (nome_usuario, idade, plano_id)
VALUES 
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);


-- Cria tabela Album
CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo_album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

INSERT INTO albuns(titulo_album, artista_id)
VALUES 
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 4),
  ('Incandescent', 3),
  ('Temporary Culture', 2);

-- Cria tabela Canções
CREATE TABLE cancoes (
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo_cancao VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
)  ENGINE=INNODB;

INSERT INTO cancoes (titulo_cancao, album_id)
VALUES 
  ('Soul For Us',1),
  ('Magic Circus',3),
  ('Diamond Power',4),
  ('Thang Of Thunder',5),
  ('Home Forever',4),
  ('Words Of Her Life',5),
  ('Reflections Of Magic', 1),
  ("Honey, Let's Be Silly", 4),
  ('Troubles Of My Inner Fire', 2),
  ('Dance With Her Own', 1),
  ('Without My Streets', 5),
  ('Celebration Of More', 4),
  ('Time Fireworks', 2),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Rock His Everything',4);

-- Cria tabela de histórico de reproduções do usuário
CREATE TABLE historico_reproducoes (
    cancao_id INT NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (cancao_id , usuario_id),
    FOREIGN KEY (cancao_id)
        REFERENCES cancoes (cancao_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
)  ENGINE=INNODB;

INSERT INTO historico_reproducoes (cancao_id, usuario_id)
VALUES 
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 2),
  (6, 2),
  (7, 2),
  (8, 2),
  (9, 3),
  (4, 3),
  (2, 3),
  (10, 4),
  (11, 4),
  (12, 4);

-- Cria Tabela Seguidires dos Artistas
CREATE TABLE seguindo_artistas  (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
    PRIMARY KEY (artista_id , usuario_id),
)  ENGINE=INNODB;

INSERT INTO seguindo_artistas (artista_id, usuario_id)
VALUES 
  (1, 1),
  (2, 1),
  (3, 1),
  (1, 2),
  (3, 2),
  (4, 3),
  (1, 3),
  (2, 4);
