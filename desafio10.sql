-- USE SpotifyClone;
-- DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT) RETURNS INT
READS SQL DATA
BEGIN
DECLARE quantidade INT;
SELECT 
  COUNT(*)
INTO quantidade FROM
  usuarios_cancoes
WHERE
  usuario_id = id;
RETURN quantidade;
END;
$$ DELIMITER ;
