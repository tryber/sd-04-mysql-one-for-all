USE SpotifyClone;
DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
AFTER DELETE ON SpotifyClone.usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico_reproducao WHERE usuario_id = OLD.id;
DELETE FROM SpotifyClone.artistas_seguidos WHERE usuario_id = OLD.id;
END $$

DELIMITER ;
