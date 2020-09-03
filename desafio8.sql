USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM historico WHERE id_usuario = OLD.usuario_id;
DELETE FROM seguindo_artistas WHERE id_usuario = OLD.usuario_id;
END; $$
DELIMITER ;
