CREATE VIEW cancoes_premium AS
    SELECT 
        nome, COUNT(*) AS reproducoes
    FROM
        SpotifyClone.historico_reproducao
            JOIN
        cancao ON id = cancao_id
    WHERE
        usuario_id IN (SELECT 
                id
            FROM
                usuario
            WHERE
                plano_id <> 1)
    GROUP BY cancao_id
    ORDER BY nome;
