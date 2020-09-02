DELIMITER $$

DROP TRIGGER IF EXISTS trigger_usuario_delete$$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE 
ON usuarios FOR EACH ROW
BEGIN
    DELETE FROM usuarios_artista WHERE id_usuario = OLD.id_usuario;
    DELETE FROM usuarios_cancoes WHERE id_usuario = OLD.id_usuario;
END$$

DELIMITER ;
