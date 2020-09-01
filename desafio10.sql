CREATE FUNCTION quantidade_musicas_no_historico(user_code INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE quantidade INT;
  SELECT
    COUNT(*)
  FROM SpotifyClone.historico_reproducoes AS hr
  INNER JOIN SpotifyClone.usuario AS usr
  ON hr.usuario_id = usr.usuario_id
  WHERE usr.usuario_id = user_code
  INTO quantidade;
  RETURN quantidade;
END $$
