USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
DELETE FROM Songs_History WHERE user_id = OLD.id;
DELETE FROM Users_Following WHERE user_id = OLD.id;
END $$

DELIMITER ;
