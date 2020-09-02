-- DROP PROCEDURE IF EXISTS albuns_do_artista;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100)) BEGIN
SELECT
  artista,
  albuns.nome AS album
FROM
  albuns
  INNER JOIN artistas AS a ON (a.id = albuns.artista_id)
  WHERE artista = a.nome
  ORDER BY album;
END $$ DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
