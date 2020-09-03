USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(userID INT)
RETURNS INT READS SQL DATA
BEGIN
SELECT COUNT(song_id) AS quantidade_musicas_no_historico FROM Songs_History
WHERE user_id = userID;
END $$

DELIMITER ;
