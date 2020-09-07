DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE
DELETE
ON SpotifyClone.user
FOR EACH ROW
BEGIN
DELETE FROM following_artist WHERE user_id = OLD.user_id;
DELETE FROM track_history WHERE user_id = OLD.user_id;
END; $$
DELIMITER ;
