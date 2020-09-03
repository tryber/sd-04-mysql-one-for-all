USE SpotifyClone;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(50))
BEGIN
SELECT a.name, b.name FROM Artists AS a
JOIN Albums as b ON a.id = b.artist_id
WHERE a.name = artistName
ORDER BY b.name;
END $$

DELIMITER ;
