CREATE VIEW top_3_artistas AS
    SELECT 
        artistas.artista, COUNT(seguidores.usuario_id) AS seguidores
    FROM
        SpotifyClone.seguidores_artistas AS seguidores
            LEFT JOIN
        SpotifyClone.artistas AS artistas ON artistas.artista_id = seguidores.artista_id
    GROUP BY artista
    ORDER BY 2 DESC , 1
    LIMIT 3;
