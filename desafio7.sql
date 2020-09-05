CREATE VIEW perfil_artistas AS
SELECT 
(
SELECT artista AS artista
FROM SpotifyClone.artista AS art
WHERE art.id = alb.artista_id
) AS artista,
album,
(
SELECT COUNT(artista_id)
FROM SpotifyClone.seguindo_artista AS sa
WHERE sa.artista_id = alb.artista_id
) AS seguidores
FROM SpotifyClone.album AS alb
ORDER BY seguidores DESC, artista ASC, album ASC;
