-- Create view for premium songs
CREATE VIEW cancoes_premium AS (
    SELECT s.name AS nome,
        COUNT(sh.song) AS reproducoes
    FROM songs_history AS sh
        INNER JOIN users AS u ON u.user_id = sh.user
        AND u.subscription IN (2, 3)
        INNER JOIN songs AS s ON s.song_id = sh.song
    GROUP BY sh.song
    ORDER BY s.name
);
