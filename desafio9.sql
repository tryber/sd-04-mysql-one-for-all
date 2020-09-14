delimiter $$
create procedure albuns_do_artista(in nome_artista varchar(30))
begin
select a.artista, al.album as album
from SpotifyClone.artistas a
inner join SpotifyClone.albuns al on a.artista_id=al.artista_id
having a.artista=nome_artista
order by album;
End; $$
