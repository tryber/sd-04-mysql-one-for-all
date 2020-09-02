USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(50))
BEGIN
	SELECT artists.name AS artista, albums.name AS album FROM albums
    INNER JOIN artists
    ON albums.artist_id = artists.artist_id
    WHERE artists.name = artist_name
    ORDER BY album;
END $$

DELIMITER ;
