DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE plano(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  valor DECIMAL(6, 2)
) engine = InnoDB;
CREATE TABLE usuario(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  idade INT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY(plano_id) REFERENCES plano(id)
) engine = InnoDB;
CREATE TABLE artista(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL
) engine = InnoDB;
CREATE TABLE album (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(id)
) engine = InnoDB;
CREATE TABLE cancao(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY(album_id) REFERENCES album(id)
) engine = InnoDB;
CREATE TABLE artiste_followed(
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(id),
  usuario_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
CREATE TABLE playlist_history(
  usuario_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  cancao_id INT NOT NULL,
  FOREIGN KEY (cancao_id) REFERENCES cancao(id)
) engine = InnoDB;
INSERT INTO
  plano (nome, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
