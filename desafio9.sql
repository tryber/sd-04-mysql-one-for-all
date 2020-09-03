USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(50))
BEGIN
SELECT a.name AS artista , b.name AS album FROM Artists AS a
JOIN Albums AS b ON a.id = b.artist_id
WHERE a.name = artistName
ORDER BY b.name;
END $$

DELIMITER ;
