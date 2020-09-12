CREATE VIEW top_3_artistas AS
SELECT
artista AS artista,
(
SELECT COUNT(*)
FROM SpotifyClone.usuarios_artista
WHERE artista_id = a.artista_id
) AS seguidores
FROM SpotifyClone.artistas AS a
ORDER BY seguidores DESC, artista;
