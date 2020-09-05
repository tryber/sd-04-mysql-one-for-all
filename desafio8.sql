DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE on usuario
FOR EACH ROW
BEGIN
DELETE FROM historico_de_reproducao WHERE usuario_id = OLD.id;
DELETE FROM seguindo_artista WHERE usuario_id = OLD.id;
END;
$$ DELIMITER ;
