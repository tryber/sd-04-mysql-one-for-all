CREATE VIEW faturamento_atual AS
    SELECT 
        MIN(pl.valor) AS 'faturamento_minimo',
        MAX(pl.valor) AS 'faturamento_maximo',
        ROUND(AVG(pl.valor), 2) AS 'faturamento_medio',
        SUM(pl.valor) AS 'faturamento_total'
    FROM
        SpotifyClone.Usuario AS usr
            INNER JOIN
        SpotifyClone.Plano AS pl ON usr.plano = pl.id;
