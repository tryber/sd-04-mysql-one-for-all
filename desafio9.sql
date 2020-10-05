DELIMITER $$
CREATE PROCEDURE albuns_do_artista(artist VARCHAR(200))
BEGIN
SELECT
art.name AS artista, alb.albuns AS album
FROM SpotifyClone.artist AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artist_id = alb.artist_id
WHERE artist = art.name
ORDER BY album;
END $$
DELIMITER ;
