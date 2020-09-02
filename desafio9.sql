USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT nome AS 'artista', titulo AS 'album'
FROM SpotifyClone.albuns AS AL
INNER JOIN SpotifyClone.artistas AS A
ON AL.artista_id = A.id
WHERE nome = nome_artista;
END $$
DELIMITER ;
