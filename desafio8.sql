DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON user
FOR EACH ROW 
BEGIN
DELETE FROM song_history
WHERE song_history.user_id = OLD.user_id;
DELETE FROM followed_artist
WHERE followed_artist.user_id = OLD.user_id;
END
$$ DELIMITER ;
