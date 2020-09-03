DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON users
FOR EACH ROW
BEGIN
    DELETE FROM history AS h WHERE h.user_id = users.id;
    DELETE FROM following AS f WHERE f.user_id = users.id;
END; $$
