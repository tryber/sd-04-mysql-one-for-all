USE SpotifyClone;
DELIMITER $$ CREATE TRIGGER trigger_usuario_delete BEFORE DELETE ON usuarios FOR EACH ROW BEGIN
DELETE FROM SpotifyClone.historico_reproducoes
WHERE usuario_id = OLD.id;
DELETE FROM SpotifyClone.seguindo_artistas
WHERE usuario_id = OLD.id;
END;
$$ DELIMITER;
