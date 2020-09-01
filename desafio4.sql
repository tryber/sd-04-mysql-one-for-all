CREATE VIEW top_3_artistas AS
    SELECT 
        (SELECT name FROM SpotifyClone.artists WHERE artists.artist_id = followers.artist_id) AS artista,
        COUNT(*) AS seguidores
    FROM SpotifyClone.followers
    GROUP BY artist_id
    ORDER BY seguidores DESC, artista LIMIT 3;
