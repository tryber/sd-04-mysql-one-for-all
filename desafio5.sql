CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        (SELECT 
                nome
            FROM
                cancao
            WHERE
                id = cancao_id) AS cancao,
        COUNT(usuario_id) reproducoes
    FROM
        SpotifyClone.historico_reproducao
    GROUP BY cancao_id
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
