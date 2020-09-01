USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuario
    FOR EACH ROW
    
BEGIN
    DELETE FROM historico_reproducoes WHERE usuario_id = OLD.id;
    DELETE FROM seguindo_artistas WHERE usuario_id = OLD.id;
END;

$$ DELIMITER ;

-- DELETE FROM usuario WHERE id = 4;
-- SELECT * FROM usuario;
