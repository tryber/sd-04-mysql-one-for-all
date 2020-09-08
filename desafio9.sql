DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(100))
BEGIN
SELECT
ar.artist_name AS `artista`,
al.album_name AS `album`
FROM album AS al
JOIN artist AS ar
ON ar.artist_id = al.artist_id AND artistName = ar.artist_name
ORDER BY album;
END $$
DELIMITER ;
