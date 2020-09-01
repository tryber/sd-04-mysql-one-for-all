USE SpotifyClone;
DELIMITER $$

-- DROP FUNCTION quantidade_musicas_no_historico;

CREATE FUNCTION quantidade_musicas_no_historico(cod_usuario INT)
RETURNS INT READS SQL DATA

BEGIN

DECLARE quantidade_musicas INT;
SELECT COUNT(*)
FROM historico_reproducoes
WHERE usuario_id = cod_usuario INTO quantidade_musicas;
RETURN quantidade_musicas;

END $$

DELIMITER ;

-- "Bill" id = 3
-- SELECT quantidade_musicas_no_historico(3);
