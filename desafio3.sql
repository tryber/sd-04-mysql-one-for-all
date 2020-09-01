CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.name AS usuario, s.name AS nome
    FROM
        SpotifyClone.user AS u
            JOIN
        SpotifyClone.playback_history AS h ON h.id_user = u.id
            JOIN
        SpotifyClone.song AS s ON h.id_song = s.id
    ORDER BY usuario , nome;
