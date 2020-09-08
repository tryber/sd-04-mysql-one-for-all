USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON usuarios
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.seguindo_artistas WHERE OLD.id = usuario_id; 
  DELETE FROM SpotifyClone.historico_reproducoes WHERE OLD.id = usuario_id; 
END; $$
DELIMITER ;
