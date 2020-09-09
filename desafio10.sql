DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE plays_total INT;
    SELECT COUNT(*)
    FROM playback_history AS ph
    WHERE ph.user = user_id INTO plays_total;
    RETURN plays_total;
END $$

DELIMITER ;
