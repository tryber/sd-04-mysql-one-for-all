USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(nome_usuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE qnt_musicas INT;
SELECT COUNT(*) FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_reproducao AS h ON u.id = h.usuario_id
WHERE nome = nome_usuario INTO qnt_musicas;
RETURN qnt_musicas;
END $$

DELIMITER ;
