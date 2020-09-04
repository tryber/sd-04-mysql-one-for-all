DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;

DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qnt_musicas INT;
SELECT count(cancao_id) FROM historico_reprod
GROUP BY usuario_id
HAVING usuario_id = id INTO qnt_musicas;
RETURN qnt_musicas;
END $$
DELIMITER ;
