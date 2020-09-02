DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
	BEFORE DELETE ON usuario FOR EACH ROW
BEGIN
	DELETE FROM historico_reproducao 
WHERE
    usuario_id = OLD.id;
DELETE FROM artista_seguido 
WHERE
    usuario_id = OLD.id;
    END; $$
    DELIMITER ;
    SET SQL_SAFE_UPDATES = 0;
