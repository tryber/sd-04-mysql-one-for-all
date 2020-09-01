CREATE VIEW perfil_artistas AS
    SELECT 
        ar.name AS artista,
        al.name AS album,
        COUNT(f.id_artist) AS seguidores
    FROM
        SpotifyClone.album AS al
            JOIN
        SpotifyClone.artist AS ar ON ar.id = al.id_artist
            JOIN
        SpotifyClone.follow AS f ON f.id_artist = ar.id
    GROUP BY artista, album
    ORDER BY seguidores DESC, artista, album;
