DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuarioId INT)
RETURNS INT READS SQL DATA 
BEGIN
DECLARE musicasTotais INT;
SELECT COUNT(cancoes_id)
FROM SpotifyClone.historico_reproducoes hr
WHERE hr.usuarios_id = usuarioId
INTO musicasTotais;
RETURN musicasTotais;
END
$$ DELIMITER ;
