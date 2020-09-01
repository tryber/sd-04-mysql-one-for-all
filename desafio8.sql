USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
BEGIN
    DELETE FROM followers WHERE followers.user_id = OLD.user_id;
    DELETE FROM playback_history WHERE playback_history.user_id = OLD.user_id;
END; $$
DELIMITER ;
