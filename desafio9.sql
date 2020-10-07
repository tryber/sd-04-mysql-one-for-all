USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN nome_do_artista VARCHAR(50))
BEGIN
SELECT 
  art.nome_artista AS 'artista', alb.titulo_album AS 'album'
FROM SpotifyClone.artistas AS art
  INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id 
AND art.nome_artista = nome_do_artista
ORDER BY `album`;
END $$

DELIMITER ;
CALL albuns_do_artista('Walter Phoenix');
