CREATE VIEW top_3_artistas AS
SELECT name AS artista ,
(SELECT COUNT(artista_id) FROM SpotifyClone.seguindo WHERE artista_id = artista.artista_id ) AS seguidores
FROM SpotifyClone.artista
WHERE artista_id = SpotifyClone.artista.artista_id
ORDER BY seguidores DESC, artista ASC
LIMIT 3;
