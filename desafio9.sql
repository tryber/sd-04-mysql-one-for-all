DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artistaVar VARCHAR(50))
BEGIN
SELECT
art.artista, alb.album
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.id = alb.artista_id
WHERE art.artista = artistaVar;
END $$
DELIMITER ;
