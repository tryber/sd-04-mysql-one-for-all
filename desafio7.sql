-- Create perfil_artistas view
CREATE VIEW perfil_artistas AS (
    SELECT a.name AS artista,
        al.name AS album,
        COUNT(f.follow_id) AS seguidores
    FROM artists AS a
        INNER JOIN albuns AS al ON al.artist = a.artist_id
        INNER JOIN followers AS f ON f.artist = a.artist_id
    GROUP BY a.name,
        al.name
    ORDER BY seguidores DESC,
        a.name ASC,
        al.name ASC
);
