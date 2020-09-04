DROP PROCEDURE IF EXISTS albuns_do_artista;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(70))
BEGIN 
SELECT artistas.artista, albuns.album from SpotifyClone.albuns AS albuns
LEFT JOIN SpotifyClone.artistas AS artistas
ON albuns.artista_id = artistas.artista_id
WHERE artista = nomeArtista
ORDER BY 2;
END $$

DELIMITER ;
