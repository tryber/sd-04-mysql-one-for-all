USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.usuarios
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.users_reproduction_history WHERE usuario_id = OLD.usuario_id;
    DELETE FROM SpotifyClone.artists_followed_by_users WHERE usuario_id = OLD.usuario_id;
END; $$
DELIMITER ;
