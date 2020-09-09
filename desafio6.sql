CREATE VIEW faturamento_atual AS
SELECT
    ROUND(MIN(p.valor_plano), 2) faturamento_minimo,
    ROUND(MAX(p.valor_plano), 2) faturamento_maximo,
    ROUND(AVG(p.valor_plano), 2) faturamento_medio,
    ROUND(SUM(p.valor_plano), 2) faturamento_total
FROM
    SpotifyClone.usuarios u
    INNER JOIN SpotifyClone.planos p ON p.plano_id = u.plano_id;
