DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(100))
BEGIN
SELECT
ar.name AS artista,
al.name AS album
FROM SpotifyClone.album AS al
JOIN SpotifyClone.artist AS ar ON ar.id = al.artist_id AND artistName = ar.name
ORDER BY album;
END $$

DELIMITER ;
