CREATE VIEW top_3_artistas AS
SELECT
    a.nome AS artista,
    COUNT(asg.usuario_id) AS seguidores
FROM
    SpotifyClone.artistas_seguidos asg
    INNER JOIN SpotifyClone.artistas a ON a.artista_id = asg.artista_id
GROUP BY
    a.nome
ORDER BY
    seguidores DESC
LIMIT
    3;
