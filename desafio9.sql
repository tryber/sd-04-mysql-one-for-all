DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(60))
BEGIN 
SELECT artistas.artista_nome AS artista, albuns.album_nome AS album
FROM albuns
INNER JOIN artistas AS artistas ON (artistas.artista_id = albuns.artista_id)
WHERE artista = artistas.artista_nome
ORDER BY album;
END 
$$ DELIMITER ;
