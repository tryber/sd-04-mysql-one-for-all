USE SpotifyClone
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE quantidade_cancoes INT;
SELECT COUNT(*)
FROM usuarios_cancoes
WHERE usuario_id = id
INTO quantidade_cancoes;
RETURN quantidade_cancoes;
END $$

DELIMITER ;

SELECT quantidade_musicas_no_historico(3);
