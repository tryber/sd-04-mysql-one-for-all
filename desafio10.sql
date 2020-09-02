USE SpotifyClone;

DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(usuario_id INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE quantidade INT;
  SELECT COUNT(*) AS quantidade_musicas_no_historico FROM SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.historico_reproducoes AS hr
  ON u.id = hr.usuario_id
  WHERE hr.usuario_id = usuario_id INTO quantidade;
  RETURN quantidade;
END $$

DELIMITER ;
