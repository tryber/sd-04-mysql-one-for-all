CREATE TRIGGER trigger_usuario_delete
  BEFORE DELETE ON SpotifyClone.usuario
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.artista_usuario AS au
  WHERE au.usuario_id = OLD.usuario_id;
  DELETE FROM SpotifyClone.historico_reproducoes AS hr
  WHERE hr.usuario_id = OLD.usuario_id;
END $$
