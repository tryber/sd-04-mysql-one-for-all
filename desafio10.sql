USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (id_parametros INT)
  RETURNS INT READS SQL DATA
    BEGIN
DECLARE quantidade INT;
  SELECT COUNT(*)FROM SpotifyClone.historico_reproducoes
  WHERE usuario_id = id_parametros INTO quantidade;
RETURN quantidade;
END $$

DELIMITER ;
