USE SpotifyClone;

DROP TRIGGER IF EXISTS trigger_usuario_delete;

CREATE TRIGGER trigger_usuario_delete BEFORE DELETE ON usuarios FOR each ROW
