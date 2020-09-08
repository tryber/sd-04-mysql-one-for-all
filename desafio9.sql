DELIMITER $

CREATE PROCEDURE albuns_do_artista (IN artist_name VARCHAR(100))
BEGIN
  SELECT ar.name AS artista,
    al.name AS album
  FROM SpotifyClone.artists AS ar
  INNER JOIN SpotifyClone.albuns AS al ON al.artist = ar.artist_id
  AND ar.name = artist_name;
END $

DELIMITER ;
