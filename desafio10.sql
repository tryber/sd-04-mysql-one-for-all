USE SpotifyClone;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (id int)
RETURNS INT READS SQL DATA
BEGIN
DECLARE qtd INT;
SELECT COUNT(0) FROM SpotifyClone.reproduction_history WHERE user_id = id INTO qtd;
RETURN qtd;
END $$
DELIMITER ;
