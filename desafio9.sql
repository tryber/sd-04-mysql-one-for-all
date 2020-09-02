USE SpotifyClone;
DROP procedure IF EXISTS albuns_do_artista;

DELIMITER $$
USE SpotifyClone$$
CREATE PROCEDURE albuns_do_artista (IN nome_artista VARCHAR(45))
BEGIN
SELECT a.artista, ab.album 
FROM artistas a 
INNER JOIN albuns ab 
ON a.id_artista = ab.id_artista
WHERE a.artista = nome_artista
ORDER BY ab.album;
END$$

DELIMITER ;
