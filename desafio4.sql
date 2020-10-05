create view top_3_artistas
as select artist.name as artista,
count(follow_artist.artist_id) as seguidores 
from artist
inner join follow_artist
on artist.artist_id = follow_artist.artist_id
group by follow_artist.artist_id
order by seguidores desc, artista limit 3;
