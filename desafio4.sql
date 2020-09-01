CREATE VIEW top_3_artistas AS
    SELECT 
        (SELECT 
                nome
            FROM
                artista
            WHERE
                id = artista_id) AS artista,
        COUNT(usuario_id) AS seguidores
    FROM
        SpotifyClone.artista_seguido
    GROUP BY artista_id
    ORDER BY seguidores DESC
    LIMIT 3;
