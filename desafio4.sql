CREATE VIEW top_3_artistas AS
SELECT a.artista AS `artista`, COUNT(s.usuario_id) AS `seguidores`
FROM artistas AS a
INNER JOIN artistas_seguidores AS s
ON a.artista_id = s.artista_id
GROUP BY artista
HAVING seguidores > 1
ORDER BY seguidores DESC, artista;
