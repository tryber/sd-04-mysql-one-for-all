CREATE VIEW top_3_artistas AS
SELECT artistas.artista AS artista,
COUNT(seguidos.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
JOIN SpotifyClone.artistas_seguidos AS seguidos
ON artistas.artista_id = seguidos.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
