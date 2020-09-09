DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(100))
BEGIN
    SELECT art.name, alb.title
    FROM SpotifyClone.album AS alb, SpotifyClone.artists AS art
    WHERE art.id = alb.artist AND art.name = artist_name;
END $$
DELIMITER ;
