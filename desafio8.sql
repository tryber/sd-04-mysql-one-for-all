USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON users
    FOR EACH ROW
BEGIN
    DELETE FROM favorite_artists
    WHERE favorite_artists.user = OLD.id;
    DELETE FROM playback_history
    WHERE playback_history.user = OLD.id;
END; $$
DELIMITER ;
