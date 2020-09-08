-- Check bumbe rof songs played by user
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (userId INT)
RETURNS INT
BEGIN
    DECLARE result INT;

    SELECT COUNT(song) FROM songs_history WHERE user = userId INTO result;

    RETURN result;
END $$

DELIMITER ;
