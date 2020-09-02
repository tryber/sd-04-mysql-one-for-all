USE SpotifyClone;

DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.user
    FOR EACH ROW

BEGIN
    DELETE FROM playback_history WHERE id_user = OLD.id;
    DELETE FROM follow WHERE id_user = OLD.id;
END;

$$ DELIMITER ;
-- ========================================================================================
-- OBRIGADO JUNIO <3
-- ========================================================================================
