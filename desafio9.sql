DELIMITER $$
CREATE PROCEDURE albuns_do_artista(musico VARCHAR(20))
BEGIN
SELECT
a.artistas_name AS artista, al.album_name AS album
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.album AS al
ON a.artistas_id = al.id_artistas
WHERE musico = a.artistas_name
ORDER BY album;
END $$
DELIMITER ;
