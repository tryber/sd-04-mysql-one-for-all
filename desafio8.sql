-- USE SpotifyClone;

-- DROP TRIGGER IF EXISTS trigger_usuario_delete;
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON usuarios 
FOR EACH ROW 
BEGIN  
DELETE FROM usuarios_artistas 
where usuario_id = old.id;
DELETE FROM usuarios_cancoes 
WHERE
  usuario_id = old.id;
  END;
$$ DELIMITER ;
