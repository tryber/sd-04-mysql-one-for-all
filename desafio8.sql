DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN

DELETE FROM artistas_seguidores
WHERE usuario_id = OLD.usuario_id;

DELETE FROM cancoes_reproduzidas
WHERE usuario_id = OLD.usuario_id;  

END; $$
DELIMITER ;

DELETE FROM usuarios WHERE usuario_id = 1;
