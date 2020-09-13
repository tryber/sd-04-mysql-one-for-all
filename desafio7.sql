CREATE VIEW perfil_artistas AS
SELECT
ar.artista AS artista,
al.album AS album,
COUNT(ua.usuario_id) AS seguidores
FROM SpotifyClone.albuns AS al
JOIN SpotifyClone.artistas AS ar ON ar.artista_id = al.artista_id
JOIN SpotifyClone.usuarios_artista AS ua ON ua.artista_id = al.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;
