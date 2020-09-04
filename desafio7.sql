CREATE VIEW perfil_artistas AS
SELECT 
    artistas.artista,
    albuns.album,
    COUNT(seguidores.usuario_id) AS seguidores
FROM
    SpotifyClone.albuns AS albuns
        LEFT JOIN
    SpotifyClone.artistas AS artistas ON albuns.artista_id = artistas.artista_id
        LEFT JOIN
    SpotifyClone.seguidores_artistas AS seguidores ON albuns.artista_id = seguidores.artista_id
GROUP BY 1 , 2
ORDER BY 3 DESC, 1, 2;
