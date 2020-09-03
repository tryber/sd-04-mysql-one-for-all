DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(nome_usuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
DECLARE reproducoes INT;
SELECT 
    COUNT(cancao_id)
INTO reproducoes FROM
    historico_reproducao
WHERE
    (SELECT 
            nome
        FROM
            usuario
        WHERE
            id = usuario_id) = nome_usuario
GROUP BY usuario_id;
RETURN reproducoes;

END;$$
DELIMITER ;
