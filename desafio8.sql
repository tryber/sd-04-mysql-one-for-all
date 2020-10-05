DELIMITER $$
CREATE TRIGGER trigger_perfil_delete
BEFORE DELETE ON SpotifyClone.user
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.reproduction_history WHERE OLD.user_id = reproduction_history.user_id;
DELETE FROM SpotifyClone.follow_artist WHERE OLD.user_id = follow_artist.user_id;
END; $$
DELIMITER ;
