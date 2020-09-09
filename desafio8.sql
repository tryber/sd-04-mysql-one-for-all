USE SpotifyClone;

DELIMITER $ $ DROP TRIGGER IF EXISTS trigger_usuario_delete;

CREATE TRIGGER trigger_usuario_delete BEFORE DELETE ON SpotifyClone.usuarios FOR EACH ROW BEGIN
DELETE FROM
    SpotifyClone.artistas_seguidos 
WHERE
    usuario_id = OLD.usuario_id;

DELETE FROM
    SpotifyClone.musicas_escutadas 
WHERE
    usuario_id = OLD.usuario_id;

END $ $ DELIMITER;
