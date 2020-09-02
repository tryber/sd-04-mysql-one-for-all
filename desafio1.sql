DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

create table artista (
artista_id int primary key auto_increment,
nome varchar(100) not null
);

insert into artista (artista_id,nome) value (1,'Walter Phoenix'),(2,'Lance Day'),(3,'Freedie Shannon'),(4,'Peter Strong');

create table album (
album_id int primary key auto_increment,
titulo varchar(100) not null,
artista_id int not null,

constraint `album_artista_artista_id` FOREIGN KEY(artista_id) references artista(artista_id)
);

insert into album (album_id,titulo, artista_id) 
value 
(1,'Envious', 1),
(2,'Exuberant', 1),
(3,'Hallowed Steam', 4),
(4,'Incandescent', 2),
(5,'Temporary Culture', 3);

create table cancoes (
cancao_id int primary key auto_increment,
titulo varchar(100) not null,
album_id int not null,

constraint `cancoes_album_album_id` foreign key(album_id) references album(album_id)
);

insert into cancoes (cancao_id,titulo, album_id)
value
(1,'Soul For Us',1),
(2,'Reflections Of Magic', 1),
(3,'Dance With Her Own', 1),
(4,'Troubles Of My Inner Fire', 2),
(5,'Time', 2),
(6,"Magic Circus",3),
(7,"Honey, So Do I",3),
(8,"Sweetie, Let's Go Wild",3),
(9,"She Knows",3),
(10,"Fantasy For Me",4),
(11,"Celebration Of More",4),
(12,"Rock His Everything",4),
(13,"Home Forever",4),
(14,"Diamond Power",4),
(15,"Honey, Let's Be Silly",4),
(16,"Thang Of Thunder",5),
(17,"Words Of Her Life",5),
(18,"Without My Streets",5);


create table plano (
plano_id int primary key auto_increment,
titulo varchar(100) not null,
valor decimal(10,2) not null
);

insert into plano (plano_id, titulo, valor) values (1, 'gratuito', 0),
(2, 'familiar', 7.99), (3,'universitario', 5.99);

create table usuario (
usuario_id int primary key auto_increment,
nome varchar(100) not null,
idade int not null,
plano_id int not null,

constraint `usuario_plano_id` foreign key (plano_id) references plano(plano_id)    
);

insert into usuario (usuario_id, nome, idade, plano_id) values (1, 'Thati', 23,1),
(2,'Cintia',35,2),(3,'Bill',20,3),(4,'Roger',45,1);

create table usuario_segue_artista (
usuario_id int not null,
artista_id int not null,
primary key (usuario_id,artista_id),
constraint `FK_usuario_id` foreign key (usuario_id) references usuario(usuario_id),
constraint `FK_artista_id` foreign key (artista_id) references artista(artista_id)
);

insert into usuario_segue_artista (usuario_id, artista_id) 
values (1,1),(1,3),(1,2),(2,1),(2,2),(3,4),(3,1),(4,3);

create table historico_de_reproducoes (
usuario_id int not null,
cancao_id int not null,
primary key(usuario_id,cancao_id),
constraint `FK_historico_usuario_id` foreign key (usuario_id) references usuario(usuario_id),
constraint `FK_cancao_id` foreign key (cancao_id) references cancoes(cancao_id)
);

insert into historico_de_reproducoes (usuario_id,cancao_id) values 
(1, 1),(1,6),(1,14),(1,16),
(2,13),(2,17),(2,2),(2,15),
(3,4),(3,16),(3,6),
(4,3),(4,18),(4,11);
