DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(user_id_input INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE songs_played INT;

SELECT COUNT(sh.song_id)
INTO songs_played
FROM SpotifyClone.song_history AS sh
INNER JOIN SpotifyClone.users AS u
ON user_id_input = u.user_id AND u.user_id = sh.user_id;

RETURN songs_played;

END $$

DELIMITER ;
