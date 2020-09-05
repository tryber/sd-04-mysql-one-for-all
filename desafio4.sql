CREATE VIEW top_3_artistas AS
SELECT artista AS artista,
(
SELECT COUNT(artista_id)
FROM SpotifyClone.seguindo_artista AS sa
WHERE sa.artista_id = a.id
) AS seguidores
FROM SpotifyClone.artista AS a
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
