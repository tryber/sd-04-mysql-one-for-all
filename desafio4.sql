create view top_3_artistas as
select a.artista as artista, count(s.usuario_id) as seguidores
from SpotifyClone.artistas a
inner join SpotifyClone.seguindo_artistas s on s.artista_id = a.artista_id
group by artista
order by seguidores desc, artista limit 3;