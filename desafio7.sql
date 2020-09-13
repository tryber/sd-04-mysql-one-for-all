select a.artista as artista, al.album as album, count(p.artista_id) seguidores
from SpotifyClone.artistas a
inner join SpotifyClone.albuns al on al.artista_id = a.artista_id
inner join SpotifyClone.seguindo_artistas p on p.artista_id=a.artista_id
group by album, artista;
