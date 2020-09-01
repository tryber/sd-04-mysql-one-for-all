USE SpotifyClone;

DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(username VARCHAR(100))

RETURNS INT READS SQL DATA

BEGIN
    DECLARE total INTEGER;
    SELECT COUNT(h.id_user) FROM SpotifyClone.playback_history AS h
    JOIN SpotifyClone.user AS u ON u.id = h.id_user AND u.name = username
    INTO total;
    RETURN total;
END $$

DELIMITER ;

-- Chamando Function:

SELECT quantidade_musicas_no_historico('Bill') AS quantidade_musicas_no_historico;
