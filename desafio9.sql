DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50)) BEGIN
SELECT
a.nome artista,
al.titulo album
FROM
artista a
INNER JOIN
album al ON
a.artista_id = al.artista_id AND
a.nome = nome_artista
ORDER BY
album;
END
$$ DELIMITER ;
