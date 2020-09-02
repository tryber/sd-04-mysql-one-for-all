USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qnt_musicas INT;
SELECT COUNT(*) FROM SpotifyClone.historico_reproducao
WHERE usuario_id = id_usuario INTO qnt_musicas;
RETURN qnt_musicas;
END $$

DELIMITER ;
