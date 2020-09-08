
DELIMITER $$
CREATE TRIGGER trigger_perfil_delete
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.historico WHERE OLD.usuario_id = historico.usuario_id;
DELETE FROM SpotifyClone.seguindo WHERE OLD.usuario_id = seguindo.usuario_id;
END; $$
DELIMITER ;
