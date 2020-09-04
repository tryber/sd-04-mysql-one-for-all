DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    DELETE FROM history WHERE user_id = OLD.id;
    DELETE FROM following WHERE user_id = OLD.id;
END; $$

DELETE FROM users WHERE user = "Thati";
