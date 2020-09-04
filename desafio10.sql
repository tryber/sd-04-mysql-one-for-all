DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE listened_songs INT;
SELECT COUNT(song_id) FROM history WHERE user_id = id 
INTO listened_songs;
RETURN listened_songs;
END; $$

SELECT quantidade_musicas_no_historico(3);
