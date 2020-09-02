-- DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT) RETURNS INT
READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT 
    COUNT(*)
INTO quantidade_musicas_no_historico FROM
    usuarios_cancoes
WHERE
    usuarios_cancoes.usuario_id = id;
return quantidade_musicas_no_historico;
END;
$$ DELIMITER ;
