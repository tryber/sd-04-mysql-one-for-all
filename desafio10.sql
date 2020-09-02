DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(person_id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(musica_id) FROM SpotifyClone.historico_reproducao
WHERE usuario_id = person_id INTO total;
RETURN total;
END $$
DELIMITER ;

-- DROP FUNCTION quantidade_musicas_no_historico;
-- SELECT quantidade_musicas_no_historico(3);
