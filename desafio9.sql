DROP PROCEDURE IF EXISTS albuns_do_artista;

USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(25))
BEGIN

SELECT ar.artista AS `artista`, al.album AS `album`
FROM artistas AS ar
INNER JOIN albuns AS al
ON ar.artista_id = al.artista_id AND nome_artista = ar.artista
ORDER BY album;

END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
