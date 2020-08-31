USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.artista_seguindo WHERE usuario_id = OLD.id;
DELETE FROM SpotifyClone.historico_reproducoes WHERE usuario_id = OLD.id;
END; $$
DELIMITER ;
