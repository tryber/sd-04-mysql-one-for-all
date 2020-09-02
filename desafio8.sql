USE SpotifyClone;


DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico_reproducao WHERE usuario_id = OLD.id;
DELETE FROM SpotifyClone.usuario_artista WHERE usuario_id = OLD.id;
END; $$
DELIMITER ;

-- DELETAR USUARIO THATI
-- DELETE FROM SpotifyClone.usuarios WHERE id = 1; 
