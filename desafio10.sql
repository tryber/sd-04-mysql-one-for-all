USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (ID INT)
RETURNS INT READS SQL DATA
BEGIN
  DECLARE reproducoes INT;
  SELECT COUNT(cancao_id) AS 'quantidade_musicas_no_historico ' INTO reproducoes
  FROM usuarios u
  INNER JOIN historico_reproducoes hr ON hr.usuario_id = u.id_usuario
  WHERE u.id_usuario = ID;
  
  RETURN reproducoes;
END $$;

DELIMITER $$ ;
