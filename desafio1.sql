DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
-- DROP DATABASE spotify;
USE SpotifyClone;

CREATE TABLE planos (
planos_id INT PRIMARY KEY AUTO_INCREMENT,
planos_name VARCHAR(30) NOT NULL,
planos_valor DECIMAL(4,2) NOT NULL
);

CREATE TABLE artistas (
artistas_id INT PRIMARY KEY AUTO_INCREMENT,
artistas_name VARCHAR(50) NOT NULL
);

CREATE TABLE usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_name VARCHAR(50) NOT NULL,
usuario_idade INT NOT NULL,
id_plano INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_plano) REFERENCES planos(planos_id)
);

CREATE TABLE album (
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(30) NOT NULL,
id_artistas INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_artistas) REFERENCES artistas(artistas_id)
);

CREATE TABLE seguindo_artistas (
id_usuario INT NOT NULL,
id_artistas INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
CONSTRAINT FOREIGN KEY (id_artistas) REFERENCES artistas(artistas_id),
PRIMARY KEY(id_usuario, id_artistas)
);

CREATE TABLE cancoes(
cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
id_album INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_album) REFERENCES album(album_id)
);

CREATE TABLE historico (
id_usuario INT NOT NULL,
id_cancoes INT NOT NULL,
CONSTRAINT FOREIGN KEY (id_usuario) REFERENCES usuario(usuario_id),
CONSTRAINT FOREIGN KEY (id_cancoes) REFERENCES artistas(artistas_id),
PRIMARY KEY(id_usuario, id_cancoes)
);
