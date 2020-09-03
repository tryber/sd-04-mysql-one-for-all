DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id_usuario int)
RETURNS INT READS SQL DATA
BEGIN
RETURN (
SELECT 
    COUNT(cancao_id)
FROM
    historico_reproducao
WHERE
    usuario_id = id_usuario
GROUP BY usuario_id);

END;$$
DELIMITER ;
