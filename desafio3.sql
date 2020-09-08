CREATE VIEW historico_reproducao_usuarios AS (
    SELECT s.name AS nome, u.username AS usuario
    FROM SpotifyClone.users AS u
    INNER JOIN songs_history AS sh ON sh.user = u.user_id
    INNER JOIN songs AS s ON s.song_id = sh.song
    ORDER BY u.username ASC,s.name ASC
);
