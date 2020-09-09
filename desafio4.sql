CREATE VIEW top_3_artistas AS
SELECT
a.nome artista,
COUNT(*) seguidores
FROM
artista a,
usuario_segue_artista usa
WHERE
a.artista_id = usa.artista_id
GROUP BY
artista
ORDER BY
seguidores DESC,
artista
LIMIT
3;
