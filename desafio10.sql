DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (userID INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE repeticoes INT;
SELECT 
    COUNT(*)
FROM
    SpotifyClone.Historico_Reproducao
WHERE
    usuario_id = userID INTO repeticoes;
RETURN repeticoes;
END;

$$ DELIMITER ;
