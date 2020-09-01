DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

create table artista (
artista_id int primary key auto_increment,
nome varchar(100) not null
);

create table album (
album_id int primary key auto_increment,
titulo varchar(100) not null,
artista_id int not null,

constraint `album_artista_artista_id` FOREIGN KEY(artista_id) references artista(artista_id)
);

create table cancoes (
cancao_id int primary key auto_increment,
titulo varchar(100) not null,
album_id int not null,

constraint `cancoes_album_album_id` foreign key(album_id) references album(album_id)
);

create table plano (
plano_id int primary key auto_increment,
titulo varchar(100) not null,
valor decimal(10,2) not null
);

create table usuario (
usuario_id int primary key auto_increment,
nome varchar(100) not null,
idade int not null,
plano_id int not null,

constraint `usuario_plano_id` foreign key (plano_id) references plano(plano_id)    
);

create table usuario_segue_artista (
id int primary key auto_increment,
usuario_id int not null,
artista_id int not null,

constraint `FK_usuario_id` foreign key (usuario_id) references usuario(usuario_id),
constraint `FK_artista_id` foreign key (artista_id) references artista(artista_id)
);

create table historico_de_reproducoes (
historico_id int primary key auto_increment,
usuario_id int not null,
cancao_id int not null,

constraint `FK_historico_usuario_id` foreign key (usuario_id) references usuario(usuario_id),
constraint `FK_cancao_id` foreign key (cancao_id) references cancoes(cancao_id)
);
