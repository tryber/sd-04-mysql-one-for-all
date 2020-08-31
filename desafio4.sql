-- DROP VIEW top_3_artistas;

CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista,
COUNT(sa.artista_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS sa
JOIN SpotifyClone.artista AS a
ON a.id = sa.artista_id
GROUP BY (sa.artista_id)
ORDER BY seguidores DESC, artista
LIMIT 3;

-- SELECT * FROM top_3_artistas;
