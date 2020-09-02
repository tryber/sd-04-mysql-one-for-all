CREATE VIEW top_3_artistas AS
SELECT a.artistas_name artista, COUNT(s.id_usuario) seguidores
FROM SpotifyClone.artistas a
INNER JOIN SpotifyClone.seguindo_artistas s
ON a.artistas_id = s.id_artistas
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;
