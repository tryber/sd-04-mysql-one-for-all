CREATE VIEW cancoes_premium AS
    SELECT 
        cancoes.cancao AS nome, COUNT(*) AS reproducoes
    FROM
        SpotifyClone.historico_reprod AS historico
            LEFT JOIN
        SpotifyClone.cancoes AS cancoes ON historico.cancao_id = cancoes.cancao_id
            LEFT JOIN
        SpotifyClone.usuarios AS usuarios ON historico.usuario_id = usuarios.usuario_id
    WHERE
        usuarios.plano_id <> 1
    GROUP BY 1
    ORDER BY 1;
