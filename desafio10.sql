USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(artist_name VARCHAR(100))
RETURNS INT READS SQL DATA
BEGIN
    DECLARE plays_total INT;
    SELECT COUNT(*)
    FROM playback_history AS ph, users AS u
    WHERE ph.user = u.id AND u.name = artist_name INTO plays_total;
    RETURN plays_total;
END $$

DELIMITER ;
