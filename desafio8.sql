-- Delete user trigger
DELIMITER $

CREATE TRIGGER trigger_usuario_delete BEFORE DELETE 
ON users 
FOR EACH ROW
BEGIN
    DELETE FROM followers WHERE user = OLD.user_id;
    DELETE FROM songs_history WHERE user = OLD.user_id;
END $

DELIMITER ;
