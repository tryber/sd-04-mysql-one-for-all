USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
DELETE FROM songs_history WHERE user_id = OLD.id;
DELETE FROM users_following WHERE user_id = OLD.id;
END $$

DELIMITER ;
