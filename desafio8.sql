DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM usuario_segue_artista WHERE usuario_id = OLD.usuario_id;
DELETE FROM historico_de_reproducoes WHERE usuario_id = OLD.usuario_id;
END; $$
DELIMITER ;
