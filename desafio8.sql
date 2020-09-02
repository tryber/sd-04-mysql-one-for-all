DELIMITER $$
CREATE TRIGGER trigger_usuario_delete 
BEFORE DELETE ON usuarios 
FOR EACH ROW 
BEGIN 
DELETE FROM usuarios_artistas 
WHERE usuario_id = old.id; 
DELETE FROM usuarios_cancoes 
WHERE usuario_id= old.id; 
END;
$$ DELIMITER ;
