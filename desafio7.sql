CREATE VIEW perfil_artistas AS
    SELECT 
        a.nome AS artista,
        ab.nome AS album,
        (SELECT 
                COUNT(usuario_id)
            FROM
                SpotifyClone.artista_seguido ats
            WHERE
                ab.artista_id = ats.artista_id
            GROUP BY artista_id) AS seguidores
    FROM
        SpotifyClone.album ab
            JOIN
        artista a ON a.id = ab.artista_id
    ORDER BY seguidores DESC , artista , album;
