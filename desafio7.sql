CREATE VIEW perfil_artistas AS
SELECT
    a.nome AS artista,
    ab.titulo album,
    COUNT(asg.usuario_id) AS seguidores
FROM
    SpotifyClone.artistas_seguidos asg
    INNER JOIN SpotifyClone.artistas a ON a.artista_id = asg.artista_id
    INNER JOIN SpotifyClone.albuns ab ON ab.artista_id = asg.artista_id
GROUP BY
    ab.album_id
ORDER BY
    seguidores DESC,
    artista,
    album;
