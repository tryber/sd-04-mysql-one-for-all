DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.musica_usuario WHERE usuario.id_usuario = musica_usuario.id_usuario;
DELETE FROM SpotifyClone.artista_usuario WHERE usuario.id_usuario = artista_usuario.id_usuario;
END; $$
DELIMITER ;
