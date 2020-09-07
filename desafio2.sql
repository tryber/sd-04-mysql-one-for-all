create view teste2 as
select count(m.musica_id) as cancoes,
(select count(ar.artista_id) from SpotifyClone.artistas ar) artistas,
(select count(a.album_id) albuns from SpotifyClone.albuns a) albuns
from SpotifyClone.musicas m;