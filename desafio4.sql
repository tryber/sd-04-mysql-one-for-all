CREATE VIEW top_3_artistas AS
SELECT a.artistas_name AS artista, COUNT(s.id_usuario) AS seguidores
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.seguindo_artistas AS s
ON a.artistas_id = s.id_artistas
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

SELECT * FROM top_3_artistas;
