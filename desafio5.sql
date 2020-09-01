CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.name AS cancao, COUNT(h.id_song) AS reproducoes
    FROM
        SpotifyClone.song AS s
            JOIN
        SpotifyClone.playback_history AS h ON h.id_song = s.id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
