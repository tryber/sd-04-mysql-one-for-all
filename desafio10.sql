USE SpotifyClone;
DROP function IF EXISTS quantidade_musicas_no_historico;

DELIMITER $$
USE SpotifyClone$$
CREATE FUNCTION quantidade_musicas_no_historico(id INT) RETURNS int
    READS SQL DATA
BEGIN
DECLARE quantidade_musicas INT;
SELECT COUNT(*) INTO quantidade_musicas
FROM usuarios u 
INNER JOIN usuarios_cancoes uc 
ON uc.id_usuario = u.id_usuario 
WHERE u.id_usuario = id; 
RETURN quantidade_musicas;
END$$

DELIMITER ;
