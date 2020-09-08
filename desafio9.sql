-- albuns_do_artista procedure
DELIMITER $

CREATE PROCEDURE albuns_do_artista (IN artist_name VARCHAR(100))
BEGIN
    SELECT a.name AS artista,
        al.name AS album
    FROM artists AS a
    INNER JOIN albuns AS al ON al.artist = a.artist_id
    AND a.name = artist_name;
END $

DELIMITER ;
