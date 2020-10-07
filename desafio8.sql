USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM historico_reproducoes WHERE usuario_id = OLD.usuario_id;
DELETE FROM seguindo_artistas WHERE usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
