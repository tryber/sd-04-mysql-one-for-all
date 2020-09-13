USE SpotifyClone
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(45))
BEGIN
SELECT
ar.artista AS artista,
al.album AS album
FROM SpotifyClone.artistas AS ar
JOIN SpotifyClone.albuns AS al
ON al.artista_id = ar.artista_id
WHERE artista LIKE CONCAT('%', nome_artista, '%')
ORDER BY album;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
