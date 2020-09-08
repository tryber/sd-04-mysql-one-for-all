DELIMITER $$
CREATE PROCEDURE albuns_do_artista(artista VARCHAR(255))
BEGIN
SELECT
AR.name AS artista, AL.album_name AS album
FROM SpotifyClone.artista AS AR
INNER JOIN SpotifyClone.album AS AL
ON AR.artista_id = AL.artista_id
WHERE artista = AR.name
ORDER BY album;
END $$
DELIMITER ;
