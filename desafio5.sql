-- Create historico_reproducao_usuarios view
CREATE VIEW top_2_hits_do_momento AS (
    SELECT s.name AS cancao,
        COUNT(sh.song) AS reproducoes
    FROM songs_history AS sh
        INNER JOIN songs AS s ON s.song_id = sh.song
    GROUP BY sh.song
    ORDER BY reproducoes DESC,
        s.name ASC
);
