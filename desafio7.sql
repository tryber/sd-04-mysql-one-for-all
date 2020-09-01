-- DROP VIEW perfil_artistas;

CREATE VIEW perfil_artistas AS
SELECT
art.nome AS artista,
alb.nome AS album,
COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.artista AS art,
SpotifyClone.album AS alb,
SpotifyClone.seguindo_artistas AS sa
WHERE alb.artista_id = art.id
AND sa.artista_id = art.id
GROUP BY alb.id
ORDER BY seguidores DESC, artista, album;

-- SELECT * FROM perfil_artistas;
