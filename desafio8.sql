DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM historico_reprod WHERE usuario_id = OLD.usuario_id;
    DELETE FROM seguidores_artistas WHERE usuario_id = OLD.usuario_id;
END; $$
DELIMITER ;
