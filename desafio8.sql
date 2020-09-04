DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    DELETE FROM history AS h WHERE h.user_id = OLD.id;
    DELETE FROM following AS f WHERE f.user_id = OLD.id;
END; $$

DELETE FROM users WHERE user = "Thati";
