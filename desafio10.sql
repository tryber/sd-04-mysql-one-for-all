USE SpotifyClone;
DELIMITER //

CREATE FUNCTION quantidade_musicas_no_historico(usuarioId INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantMusica INT;
SELECT COUNT(cancoes_id) FROM SpotifyClone.historico_reproducoes WHERE usuario_id = usuarioId INTO quantMusica;
RETURN quantMusica;
END //

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
