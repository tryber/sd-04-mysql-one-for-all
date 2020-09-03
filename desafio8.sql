DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.user
FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.song_history
    WHERE SpotifyClone.song_history.user_id = OLD.id
  DELETE FROM SpotifyClone.followed_artist
    WHERE SpotifyClone.followed_artist.user_id = OLD.id
END; $$
DELIMITER ;
