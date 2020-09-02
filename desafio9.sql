DELIMITER $$
CREATE PROCEDURE albuns_do_artista(nome_artista VARCHAR(50))
BEGIN
SELECT AR.nome AS `artista`,
AL.nome AS `album`
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.albuns AS AL
ON AR.id = AL.artista_id
WHERE AR.nome = nome_artista
ORDER BY AL.nome;
END $$

DELIMITER ;

-- DROP PROCEDURE albuns_do_artista;
-- CALL albuns_do_artista('Walter Phoenix');
