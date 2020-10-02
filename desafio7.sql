create view perfil_artistas
as select artist.name as artista,
album.albuns as album,
(select count(follow_artist.artist_id) from follow_artist
where follow_artist.artist_id = artist.artist_id) as seguidores
from artist
inner join album
on artist.artist_id = album.artist_id
order by seguidores desc, artista, album;
