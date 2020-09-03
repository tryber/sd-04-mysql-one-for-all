DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON usuarios
  FOR EACH ROW
  BEGIN
    DELETE FROM SpotifyClone.usuarios_seguindo_artistas WHERE usuarios_id = OLD.usuarios.id;
    DELETE FROM SpotifyClone.historico_reproducoes WHERE usuarios_id = OLD.usuarios.id;
  END; $$
DELIMITER ;
