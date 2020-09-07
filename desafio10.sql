DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (id INT)
RETURNS INT
BEGIN
RETURN (SELECT COUNT(user_id) FROM SpotifyClone.track_history
WHERE user_id = id);
END; $$
DELIMITER ;
