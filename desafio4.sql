CREATE VIEW top_3_artistas AS
    SELECT 
        ar.name AS artista, COUNT(ar.name) AS seguidores
    FROM
        SpotifyClone.artist AS ar
            JOIN
        SpotifyClone.follow AS f ON f.id_artist = ar.id
    GROUP BY artista
    ORDER BY seguidores DESC , artista
    LIMIT 3;
