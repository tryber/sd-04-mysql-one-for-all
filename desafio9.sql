USE SpotifyClone;
DELIMITER $$

-- DROP PROCEDURE albuns_do_artista;

CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))

BEGIN

SELECT
art.nome AS artista,
alb.nome AS album
FROM
SpotifyClone.artista AS art
JOIN SpotifyClone.album AS alb
ON art.id = alb.artista_id
WHERE art.nome = nome_artista
ORDER BY album;

END $$

DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
