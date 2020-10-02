create view estatisticas_musicais
as select count(songs) as cancoes,
count( distinct name) as artistas,
count( distinct albuns) as albuns
from song
inner join album
on album.album_id = song.album_id
inner join artist
on artist.artist_id = album.artist_id;
