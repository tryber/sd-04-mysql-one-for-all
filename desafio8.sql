DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.usuarios
  FOR EACH ROW
  BEGIN
    DELETE FROM SpotifyClone.usuarios_seguindo_artistas WHERE usuarios_id = OLD.id;
    DELETE FROM SpotifyClone.historico_reproducoes WHERE usuarios_id = OLD.id;
  END; $$
DELIMITER ;
