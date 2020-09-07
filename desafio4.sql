-- Create historico_reproducao_usuarios view
CREATE VIEW top_3_artistas AS (
    SELECT a.name AS artista,
        COUNT(f.user) AS seguidores
    FROM followers AS f
        INNER JOIN artists AS a ON a.artist_id = f.artist
    GROUP BY f.artist
    ORDER BY seguidores DESC,
        a.name ASC
);
