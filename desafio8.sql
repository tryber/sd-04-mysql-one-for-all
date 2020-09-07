DELIMITER $$
CREATE TRIGGER trigger_usuario_delete 
BEFORE
DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.usuarios_artistas 
WHERE usuario_id = old.id;
  DELETE FROM SpotifyClone.usuarios_cancoes 
WHERE usuario_id= old.id;
END;
$$ DELIMITER ;
