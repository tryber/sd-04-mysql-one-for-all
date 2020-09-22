CREATE VIEW cancoes_premium AS
    SELECT 
        msc.nome AS 'nome', COUNT(hist.musica_id) AS 'reproducoes'
    FROM
        SpotifyClone.Musica AS msc
            INNER JOIN
        SpotifyClone.Historico_Reproducao AS hist ON msc.id = hist.musica_id
    WHERE
        hist.usuario_id NOT IN (1 , 4)
    GROUP BY nome
    ORDER BY nome;
