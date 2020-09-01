CREATE VIEW top_3_artistas AS
SELECT art.artista AS artista, COUNT(DISTINCT usr.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS seg
INNER JOIN SpotifyClone.artistas AS art ON art.artista_id = seg.artista_id
INNER JOIN SpotifyClone.usuarios AS usr ON usr.usuario_id = seg.usuario_id
GROUP BY art.artista_id
ORDER BY seguidores DESC, artista
LIMIT 3;
