DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuarios
    FOR EACH ROW
BEGIN
DELETE FROM seguindo_artista where idusuario = OLD.idusuario;
DELETE FROM historico where idusuario = OLD.idusuario;
END; $$
DELIMITER ;
