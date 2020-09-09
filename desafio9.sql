USE SpotifyClone;

DELIMITER $$ 
DROP PROCEDURE IF EXISTS albuns_do_artista;
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT artistas.artista AS artista,
albuns.album AS album
FROM SpotifyClone.artistas AS artistas
JOIN SpotifyClone.albuns AS albuns
ON albuns.artista_id = artistas.artista_id
WHERE artistas.artista = nome_artista
ORDER BY album;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
