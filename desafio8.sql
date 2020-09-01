-- Baseado nos exemplos do link https://www.mysqltutorial.org/mysql-triggers/mysql-before-delete-trigger/#:~:text=In%20this%20syntax%3A,with%20after%20the%20ON%20keyword
-- Para o uso do "Before Delete" e "old.value";

USE SpotifyClone;

DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.usuarios
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.seguindo_artistas WHERE usuario_id = OLD.usuario_id;
DELETE FROM SpotifyClone.historico_de_reproducoes WHERE usuario_id = OLD.usuario_id;
END; $$
DELIMITER ;

-- DELETE FROM SpotifyClone.usuarios WHERE usuario_id = 1;
-- DROP TRIGGER trigger_usuario_delete;
