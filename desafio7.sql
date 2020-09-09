CREATE VIEW perfil_artistas AS
SELECT artistas.artista AS artista,
albuns.album AS album,
COUNT(seguidos.artista_id) AS seguidores
FROM SpotifyClone.artistas
JOIN SpotifyClone.albuns AS albuns
ON albuns.artista_id = artistas.artista_id
JOIN SpotifyClone.artistas_seguidos AS seguidos
ON artistas.artista_id = seguidos.artista_id
GROUP BY albuns.album, artistas.artista
ORDER BY seguidores DESC, artista, album;
