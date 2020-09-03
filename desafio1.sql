DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

use SpotifyClone;

create table usuarios(
usuario_id int PRIMARY KEY auto_increment,
usuario varchar(30),
idade int NOT NULL
)ENGINE=InnoDB;

insert into usuarios (usuario_id, usuario, idade)
VALUES
(1, "Thati", 23),
(null, "Cintia", 35),
(null, "Bill", 20),
(null, "Roger", 45);

create table artistas(
artista_id int primary key auto_increment,
artista varchar(30)
)engine=InnoDB;

create table albuns(
album_id int PRIMARY KEY auto_increment,
album varchar(50),
artista_id int not null,
foreign key (artista_id) references artistas(artista_id)
)engine=InnoDB;

create table musicas(
musica_id int primary key auto_increment,
nome_musica varchar(50),
album_id int not null,
foreign key (album_id) references albuns(album_id)
)engine=InnoDB;

create table historicos(
usuario_id int not null,
musica_id int not null,
foreign key (usuario_id) references usuarios(usuario_id),
foreign key (musica_id) references musicas(musica_id)
)engine=InnoDB;

create table seguindo_artistas(
usuario_id int not null,
artista_id int not null,
foreign key (usuario_id) references usuarios(usuario_id),
foreign key (artista_id) references artistas(artista_id)
)engine=InnoDB;

create table planos(
usuario_id int not null,
plano varchar(15),
valor_plano decimal(5,2) not null,
foreign key (usuario_id) references usuarios(usuario_id)
)engine=InnoDB;

insert into artistas (artista_id, artista)
values
(null, "Walter Phoenix"),
(null, "Freedie Shannon"),
(null, "Lance Day"),
(null, "Peter Strong");

insert into albuns (album_id, album, artista_id)
values
(1, "Envious", 1),
(null, "Exuberant", 1),
(null, "Hallowed Steam", 4),
(null, "Incandescent", 3),
(null, "Temporary Culture", 2);

insert into musicas (musica_id, nome_musica, album_id)
values
(1, "Soul For Us", 1),
(null, "Reflections Of Magic", 1),
(null, "Dance With Her Own", 1),
(null, "Troubles Of My Inner Fire", 2),
(null, "Time Fireworks", 2),
(null, "Magic Circus", 3),
(null, "Honey, So Do I", 3),
(null, "Sweetie, Let's Go Wild", 3),
(null, "She Knows", 3),
(null, "Fantasy For Me", 4),
(null, "Celebration Of More", 4),
(null, "Rock His Everything", 4),
(null, "Home Forever", 4),
(null, "Diamond Power", 4),
(null, "Honey, Let's Be Silly", 4),
(null, "Thang Of Thunder", 5),
(null, "Words Of Her Life", 5),
(null, "Without My Streets", 5);

insert into historicos (usuario_id, musica_id)
values
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);

insert into seguindo_artistas (usuario_id, artista_id)
values
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,4),
(3,1),
(4,2);

insert into planos (usuario_id, plano, valor_plano)
values
(1, "gratuito", 0),
(2, "familiar", 0),
(3, "universitário", 0),
(4, "gratuito", 0);
