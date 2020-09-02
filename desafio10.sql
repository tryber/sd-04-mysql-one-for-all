USE SpotifyClone;

DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(userID INT)

RETURNS INT READS SQL DATA

BEGIN
    DECLARE total INTEGER;
    SELECT COUNT(*) FROM SpotifyClone.playback_history AS h
    WHERE h.id_user = userID
    INTO total;
    RETURN total;
END $$

DELIMITER ;
