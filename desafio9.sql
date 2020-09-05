DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artista_nome VARCHAR(100))
BEGIN
select distinct a.artista, al.album
from artistas a
inner join albuns al on a.idartista = al.idartista
having a.artista = artista_nome
order by album;

END $$
DELIMITER ;
