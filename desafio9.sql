DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100))
BEGIN
SELECT artista, albuns.nome as album FROM albuns
INNER JOIN artistas as art ON (art.id = albuns.artista_id)
WHERE artista = art.nome
ORDER BY album;
END
$$ DELIMITER ;
