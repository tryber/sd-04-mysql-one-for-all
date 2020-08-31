USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE retorno INT;
SELECT COUNT(musica_id) FROM SpotifyClone.historico_reproducoes
WHERE usuario_id = id
INTO retorno;
RETURN retorno;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3
