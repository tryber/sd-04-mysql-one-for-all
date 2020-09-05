DELIMITER $$
CREATE function quantidade_musicas_no_historico(usuario_id int)
RETURNS INT READS SQL DATA

BEGIN
DECLARE TOTAL_HIST INT;
SELECT 
    COUNT(hist.idcancao)
FROM
    historico hist
WHERE
    hist.idusuario = usuario_id
GROUP BY hist.idusuario INTO TOTAL_HIST;
RETURN TOTAL_HIST; 
END $$

DELIMITER ;
