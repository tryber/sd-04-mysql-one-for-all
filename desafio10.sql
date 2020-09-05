DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(usuario_id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtde_musicas INT;
SELECT COUNT(cancao_id)
FROM SpotifyClone.historico_de_reproducao AS hr
WHERE hr.usuario_id = usuario_id INTO qtde_musicas;
RETURN qtde_musicas;
END $$
DELIMITER ;
