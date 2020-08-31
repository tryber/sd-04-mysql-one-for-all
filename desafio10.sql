USE `SpotifyClone`;
DROP FUNCTION IF EXISTS `quantidade_musicas_no_historico`;
DELIMITER $$
USE `SpotifyClone`$$
CREATE FUNCTION `quantidade_musicas_no_historico`(pesquisa varchar(10)) RETURNS INT BEGIN
DECLARE quantidade INT;
SELECT 
    COUNT(*)
INTO quantidade FROM
    SpotifyClone.historico_de_reproducoes as hr
    INNER JOIN SpotifyClone.usuarios as u ON u.usuario_id = hr.usuario_id
WHERE

u.nome
  = pesquisa;
  RETURN quantidade;

END $$

DELIMITER ;
